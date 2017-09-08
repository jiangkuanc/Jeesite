/**
 *
 */
package com.dagongsoft.p2p.financing.service;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.cxf.phase.Phase;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pDebtOverdueRecordDao;
import com.dagongsoft.p2p.financing.dao.P2pDebtorOverdueRecordDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pDebtOverdueRecord;
import com.dagongsoft.p2p.financing.entity.P2pDebtorOverdueRecord;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.repayment.dao.P2pOverdueDetailsDao;
import com.dagongsoft.p2p.repayment.dao.P2pReceivePlanDao;
import com.dagongsoft.p2p.repayment.dao.P2pReceiveRecordDao;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentPlanDao;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentRecordDao;
import com.dagongsoft.p2p.repayment.entity.P2pOverdueDetails;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.utils.ZDateUtils;
import com.dagongsoft.p2p.utils.ZMath;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * 逾期Service
 *
 * @author Zeus
 * @2016-11-16
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class OverduesService {
    @Resource
    private P2pRepaymentPlanDao p2pRepaymentPlanDao;
    @Resource
    private P2pFinancingInformationDao p2pFinancingInformationDao;
    @Resource
    private P2pOverdueDetailsDao p2pOverdueDetailsDao;
    @Resource
    private P2pReceivePlanDao p2pReceivePlanDao;
    @Resource
    private P2pDebtOverdueRecordDao p2pDebtOverdueRecordDao;
    @Resource
    private P2pDebtorOverdueRecordDao p2pDebtorOverdueRecordDao;
    @Resource
    private P2pReceiveRecordDao p2pReceiveRecordDao;
    @Resource
    private P2pRepaymentRecordDao p2pRepaymentRecordDao;

    /**
     * 逾期统计（每天24:00定时进行逾期统计）
     *
     * @throws Exception
     * @author Zeus
     */
    @Scheduled(cron = "0 0 0 * * ?  ")
    @Transactional(readOnly = false)
    public void overdueStatistics() {
        //获得每一期未还完债项集合
        List<P2pRepaymentPlan> list = p2pRepaymentPlanDao.getNotRepaymentDebt();
        //获取当前日期
        Date currentDate = ZDateUtils.getCurrentDate();

        for (P2pRepaymentPlan p : list) {
            //判断当前日期每一期未还完债项是否逾期,逾期则进入if
            Date planRepaymentDate = p.getPlanRepaymentDate();

            //计算该期到期天数
            int day = ZDateUtils.daysBetween(currentDate, planRepaymentDate);


            //获取债项信息
            P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationDao.getById(p.getFinancingInformationId());
            String userId = p2pFinancingInformation.getApplicantsId();


            if (currentDate.compareTo(planRepaymentDate) > 0) {
                //1、更新还款计划表里的逾期天数、逾期级别、罚金

                Double yearRate = p2pFinancingInformation.getRecommendedRate();
                //计算该期逾期天数
                int days = ZDateUtils.daysBetween(currentDate, planRepaymentDate);
                //当期未按时还贷款数（本金+利息）
                Double amount = ZMath.add(p.getPlanRepaymentPrincipal(), p.getPlanRepaymentInterest());

                //债项当期逾期罚金
                Double debtCurrentPhaseFine = 0.00;
                //债项当天逾期罚金
                Double debtCurrentDayFine = 0.00;


                //2、更新收款计划表里的罚金和收款状态
                //获得当前债项当期收款计划表集合
                List<P2pReceivePlan> receiveList = p2pReceivePlanDao.getCurrentPhaseReceivePlan(p.getFinancingInformationId(), p.getPhase());
                for (P2pReceivePlan receive : receiveList) {
                    //投资人当期应收金额（本金+利息）
                    Double receiveAmount = ZMath.add(receive.getPlanReceivePrincipal(), receive.getPlanReceiveInterest());
                    //投资人当期应收逾期金额/罚金
                    Double receiveFine = calculateOverdueFine(receiveAmount, days, yearRate);
                    debtCurrentPhaseFine = ZMath.add(debtCurrentPhaseFine, receiveFine);
                    //投资人当天应收逾期金额/罚金
                    Double receiveDayFine = calculateOverdueFine(receiveAmount, 1, yearRate);
                    debtCurrentDayFine = ZMath.add(debtCurrentDayFine, receiveDayFine);

                    receive.setPlanReceiveFine(receiveFine);
                    receive.setReceiveState("2");
                    p2pReceivePlanDao.update(receive);
                }

                //计算逾期级别（未实现）
                String overdueLevel = null;
                //更新还款计划表里的逾期天数、逾期级别、罚金
                p.setOverdueDays(days);
                p.setFine(debtCurrentPhaseFine);
                p.setOverdueLevel(overdueLevel);
                p.setRepaymentState("2");//设置状态为已逾期
                p2pRepaymentPlanDao.update(p);

                //3、逾期明细表插入数据
                P2pOverdueDetails p2pOverdueDetails = new P2pOverdueDetails();
                p2pOverdueDetails.setId(IdGen.uuid());
                p2pOverdueDetails.setRepaymentPlanId(p.getId());
                //逾期金额
                p2pOverdueDetails.setOverdueAmount(amount);
                //逾期日 期（统计日期前一天）
                p2pOverdueDetails.setOverdueDate(ZDateUtils.calcDate(currentDate, -1));
                //当天罚金
                p2pOverdueDetails.setFineDay(debtCurrentDayFine);
                p2pOverdueDetailsDao.insert(p2pOverdueDetails);

                //4、更新债项逾期记录表
                //根据债项id计算当前债项逾期数据
                P2pDebtOverdueRecord debt1 = p2pDebtOverdueRecordDao.calculateDebt(p.getFinancingInformationId());
                //根据债项id查询当前债项逾期记录
                P2pDebtOverdueRecord debt2 = p2pDebtOverdueRecordDao.getByFid(p.getFinancingInformationId());
                //修改债项逾期记录
                if (debt2 == null) {
                    debt2 = new P2pDebtOverdueRecord();
                }
                debt2.setUserId(userId);
                debt2.setFinancingInformationId(debt1.getFinancingInformationId());
                debt2.setTotalOverdueNumber(debt1.getTotalOverdueNumber());
                debt2.setTotalOverdueAmount(debt1.getTotalOverdueAmount());
                debt2.setTotalOverdueDays(debt1.getTotalOverdueDays());
                debt2.setContinueOverdueDays(debt1.getContinueOverdueDays());
                debt2.setLastOverdueTime(currentDate);
                debt2.setRepayAmount(debt1.getRepayAmount());
                if (debt1.getRepayAmount() == null) {
                    debt1.setRepayAmount(0.0);
                }
                debt2.setStayOverdueAmount(ZMath.sub(debt1.getTotalOverdueAmount(), debt1.getRepayAmount()));
                debt2.setOverdueFaxi(debt1.getOverdueFaxi());
                debt2.setFaxiRepayAmount(debt1.getFaxiRepayAmount());
                //担保代偿状态功能暂无
                if (debt2.getId() == null) {
                    //插入逾期记录
                    debt2.setId(IdGen.uuid());
                    p2pDebtOverdueRecordDao.insert(debt2);
                } else {
                    //更新逾期记录
                    p2pDebtOverdueRecordDao.update(debt2);
                }
                //5、更新债务人逾期记录表
                //根据userId计算当前债务人逾期数据
                P2pDebtorOverdueRecord debtor1 = p2pDebtorOverdueRecordDao.calcByUserId(userId);
                //根据userId查询当前债务人逾期记录
                P2pDebtorOverdueRecord debtor2 = p2pDebtorOverdueRecordDao.getByUserId(userId);
                //修改债务人逾期记录
                if (debtor2 == null) {
                    debtor2 = new P2pDebtorOverdueRecord();
                }
                debtor2.setUserId(userId);
                debtor2.setTotalOverdueNumber(debtor1.getTotalOverdueNumber());
                debtor2.setTotalOverdueAmount(debtor1.getTotalOverdueAmount());
                debtor2.setTotalOverdueDays(debtor1.getTotalOverdueDays());
                debtor2.setContinueOverdueDays(debtor1.getContinueOverdueDays());
                debtor2.setLastOverdueTime(debtor1.getLastOverdueTime());
                debtor2.setRepayAmount(debtor1.getRepayAmount());
                debtor2.setStayOverdueAmount(debtor1.getStayOverdueAmount());
                debtor2.setOverdueFaxi(debtor1.getOverdueFaxi());
                debtor2.setFaxiRepayAmount(debtor1.getFaxiRepayAmount());
                //逾期级别、是否对接事务所功能暂无
                if (debtor2.getId() == null) {
                    //插入逾期记录
                    debtor2.setId(IdGen.uuid());
                    p2pDebtorOverdueRecordDao.insert(debtor2);
                } else {
                    //更新逾期记录
                    p2pDebtorOverdueRecordDao.update(debtor2);
                }
                //逾期通知
                p.getFinancingInformationId();
                MsgUtils.sendLetter(userId, MsgLetterTemplate.getYqtz(p2pFinancingInformation.getFinacingName(), currentDate, days, amount, p.getPlanRepaymentPrincipal(), p.getPlanRepaymentInterest(), debtCurrentPhaseFine, debtCurrentPhaseFine + amount));
                MsgUtils.sendSMS(userId, MsgSmsTemplate.getYqtz(currentDate, days, amount, debtCurrentPhaseFine + amount));
            }
            //还款倒计时3天通知
            if (day == -3) {
                p.getFinancingInformationId();
                MsgUtils.sendLetter(userId, MsgLetterTemplate.getHkrstdq(p2pFinancingInformation.getFinacingName(), planRepaymentDate, p.getPlanRepaymentInterest() + p.getPlanRepaymentPrincipal(), p.getPlanRepaymentPrincipal(), p.getPlanRepaymentInterest()));
                MsgUtils.sendSMS(userId, MsgSmsTemplate.getHkrstdq(planRepaymentDate, p.getPlanRepaymentInterest() + p.getPlanRepaymentPrincipal()));
                //还款倒计时1天通知
            } else if (day == 0) {
                p.getFinancingInformationId();
                MsgUtils.sendLetter(userId, MsgLetterTemplate.getHkrzhyt(p2pFinancingInformation.getFinacingName(), p.getPlanRepaymentInterest() + p.getPlanRepaymentPrincipal(), p.getPlanRepaymentPrincipal(), p.getPlanRepaymentInterest()));
                MsgUtils.sendSMS(userId, MsgSmsTemplate.getHkrzhyt(p.getPlanRepaymentInterest() + p.getPlanRepaymentPrincipal()));
            }
        }

    }

    /**
     * 计算逾期罚金（逾期罚金=未按时还贷款数*逾期天数*日逾期利率；日逾期利率=债项利率*(1+50%)/360）
     *
     * @param amount   未按时还贷款数额
     * @param days     逾期天数
     * @param yearRate 年利率
     * @return
     */
    public Double calculateOverdueFine(Double amount, int days, Double yearRate) {
        Double dayRate = ZMath.div(ZMath.mul(yearRate, ZMath.add(1, 0.5)), 360);
        return ZMath.round(ZMath.mul(ZMath.mul(amount, days), dayRate), 2);
    }

    /**
     * 手动逾期统计
     *
     * @author Zeus
     */
    @Transactional(readOnly = false)
    public void handOverdueStatistics(Date date) {
        //获得每一期未还完债项集合
        List<P2pRepaymentPlan> list = p2pRepaymentPlanDao.getNotRepaymentDebt();
        //获取当前日期
        Date currentDate = date;

        for (P2pRepaymentPlan p : list) {
            //判断当前日期每一期未还完债项是否逾期,逾期则进入if
            Date planRepaymentDate = p.getPlanRepaymentDate();
            if (currentDate.compareTo(planRepaymentDate) > 0) {
                //1、更新还款计划表里的逾期天数、逾期级别、罚金
                //获取债项信息
                P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationDao.getById(p.getFinancingInformationId());
                String userId = p2pFinancingInformation.getApplicantsId();
                Double yearRate = p2pFinancingInformation.getRecommendedRate();
                //计算该期逾期天数
                int days = ZDateUtils.daysBetween(currentDate, planRepaymentDate);
                //当期未按时还贷款数（本金+利息）
                Double amount = ZMath.add(p.getPlanRepaymentPrincipal(), p.getPlanRepaymentInterest());

                //债项当期逾期罚金
                Double debtCurrentPhaseFine = 0.00;
                //债项当天逾期罚金
                Double debtCurrentDayFine = 0.00;


                //2、更新收款计划表里的罚金和收款状态
                //获得当前债项当期收款计划表集合
                List<P2pReceivePlan> receiveList = p2pReceivePlanDao.getCurrentPhaseReceivePlan(p.getFinancingInformationId(), p.getPhase());
                for (P2pReceivePlan receive : receiveList) {
                    //投资人当期应收金额（本金+利息）
                    Double receiveAmount = ZMath.add(receive.getPlanReceivePrincipal(), receive.getPlanReceiveInterest());
                    //投资人当期应收逾期金额/罚金
                    Double receiveFine = calculateOverdueFine(receiveAmount, days, yearRate);
                    debtCurrentPhaseFine = ZMath.add(debtCurrentPhaseFine, receiveFine);
                    //投资人当天应收逾期金额/罚金
                    Double receiveDayFine = calculateOverdueFine(receiveAmount, 1, yearRate);
                    debtCurrentDayFine = ZMath.add(debtCurrentDayFine, receiveDayFine);

                    receive.setPlanReceiveFine(receiveFine);
                    receive.setReceiveState("2");
                    p2pReceivePlanDao.update(receive);
                }

                //计算逾期级别（未实现）
                String overdueLevel = null;
                //更新还款计划表里的逾期天数、逾期级别、罚金
                p.setOverdueDays(days);
                p.setFine(debtCurrentPhaseFine);
                p.setOverdueLevel(overdueLevel);
                p.setRepaymentState("2");//设置状态为已逾期
                p2pRepaymentPlanDao.update(p);

                //3、逾期明细表插入数据
                P2pOverdueDetails p2pOverdueDetails = new P2pOverdueDetails();
                p2pOverdueDetails.setId(IdGen.uuid());
                p2pOverdueDetails.setRepaymentPlanId(p.getId());
                //逾期金额
                p2pOverdueDetails.setOverdueAmount(amount);
                //逾期日期
                p2pOverdueDetails.setOverdueDate(currentDate);
                //当天罚金
                p2pOverdueDetails.setFineDay(debtCurrentDayFine);
                p2pOverdueDetailsDao.insert(p2pOverdueDetails);

                //4、更新债项逾期记录表
                //根据债项id计算当前债项逾期数据
                P2pDebtOverdueRecord debt1 = p2pDebtOverdueRecordDao.calculateDebt(p.getFinancingInformationId());
                //根据债项id查询当前债项逾期记录
                P2pDebtOverdueRecord debt2 = p2pDebtOverdueRecordDao.getByFid(p.getFinancingInformationId());
                //修改债项逾期记录
                if (debt2 == null) {
                    debt2 = new P2pDebtOverdueRecord();
                }
                debt2.setUserId(userId);
                debt2.setFinancingInformationId(debt1.getFinancingInformationId());
                debt2.setTotalOverdueNumber(debt1.getTotalOverdueNumber());
                debt2.setTotalOverdueAmount(debt1.getTotalOverdueAmount());
                debt2.setTotalOverdueDays(debt1.getTotalOverdueDays());
                debt2.setContinueOverdueDays(debt1.getContinueOverdueDays());
                debt2.setLastOverdueTime(currentDate);
                debt2.setRepayAmount(debt1.getRepayAmount());
                if (debt1.getRepayAmount() == null) {
                    debt1.setRepayAmount(0.0);
                }
                debt2.setStayOverdueAmount(ZMath.sub(debt1.getTotalOverdueAmount(), debt1.getRepayAmount()));
                debt2.setOverdueFaxi(debt1.getOverdueFaxi());
                debt2.setFaxiRepayAmount(debt1.getFaxiRepayAmount());
                //担保代偿状态功能暂无
                if (debt2.getId() == null) {
                    //插入逾期记录
                    debt2.setId(IdGen.uuid());
                    p2pDebtOverdueRecordDao.insert(debt2);
                } else {
                    //更新逾期记录
                    p2pDebtOverdueRecordDao.update(debt2);
                }
                //5、更新债务人逾期记录表
                //根据userId计算当前债务人逾期数据
                P2pDebtorOverdueRecord debtor1 = p2pDebtorOverdueRecordDao.calcByUserId(userId);
                //根据userId查询当前债务人逾期记录
                P2pDebtorOverdueRecord debtor2 = p2pDebtorOverdueRecordDao.getByUserId(userId);
                //修改债务人逾期记录
                if (debtor2 == null) {
                    debtor2 = new P2pDebtorOverdueRecord();
                }
                debtor2.setUserId(userId);
                debtor2.setTotalOverdueNumber(debtor1.getTotalOverdueNumber());
                debtor2.setTotalOverdueAmount(debtor1.getTotalOverdueAmount());
                debtor2.setTotalOverdueDays(debtor1.getTotalOverdueDays());
                debtor2.setContinueOverdueDays(debtor1.getContinueOverdueDays());
                debtor2.setLastOverdueTime(debtor1.getLastOverdueTime());
                debtor2.setRepayAmount(debtor1.getRepayAmount());
                debtor2.setStayOverdueAmount(debtor1.getStayOverdueAmount());
                debtor2.setOverdueFaxi(debtor1.getOverdueFaxi());
                debtor2.setFaxiRepayAmount(debtor1.getFaxiRepayAmount());
                //逾期级别、是否对接事务所功能暂无
                if (debtor2.getId() == null) {
                    //插入逾期记录
                    debtor2.setId(IdGen.uuid());
                    p2pDebtorOverdueRecordDao.insert(debtor2);
                } else {
                    //更新逾期记录
                    p2pDebtorOverdueRecordDao.update(debtor2);
                }
            }
        }
    }

    /**
     * 逾期回滚（按实际还款日期进行逾期统计）
     *
     * @param financingInformationId 借贷产品id
     * @param phase                  期数
     * @param planRepaymentDate      计划还款日期
     * @param realRepaymentDate      实际还款日期
     */
    @Transactional(readOnly = false)
    public void overdueRollBack(String financingInformationId, String phase, Date realRepaymentDate, Date planRepaymentDate) {

        //获取债项信息
        P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationDao.getById(financingInformationId);
        //用户id
        String userId = p2pFinancingInformation.getApplicantsId();
        //年利率
        Double yearRate = p2pFinancingInformation.getRecommendedRate();
        //逾期天数
        int days = ZDateUtils.daysBetween(realRepaymentDate, planRepaymentDate);


        P2pRepaymentPlan p2pRepaymentPlan = p2pRepaymentPlanDao.getCurrentPhaseRepaymentPlan(financingInformationId, phase);
        List<P2pReceivePlan> receiveList = p2pReceivePlanDao.getCurrentPhaseReceivePlan(financingInformationId, phase);

        if (days > 0) {
            //债项当期逾期罚金
            Double debtCurrentPhaseFine = 0.00;
            //债项当天逾期罚金
            Double debtCurrentDayFine = 0.00;
            //计算逾期级别（未实现）
            String overdueLevel = null;

            for (P2pReceivePlan receive : receiveList) {
                //投资人当期应收金额（本金+利息）
                Double receiveAmount = ZMath.add(receive.getPlanReceivePrincipal(), receive.getPlanReceiveInterest());
                //投资人当期应收逾期金额/罚金
                Double receiveFine = calculateOverdueFine(receiveAmount, days, yearRate);
                debtCurrentPhaseFine = ZMath.add(debtCurrentPhaseFine, receiveFine);
                //投资人当天应收逾期金额/罚金
                Double receiveDayFine = calculateOverdueFine(receiveAmount, 1, yearRate);
                debtCurrentDayFine = ZMath.add(debtCurrentDayFine, receiveDayFine);

                receive.setPlanReceiveFine(receiveFine);
                receive.setReceiveState("3");//设置状态为已还款
                //1、修改投资人收款计划表
                p2pReceivePlanDao.update(receive);

                //2、修改投资人收款记录表
                p2pReceiveRecordDao.updateFineByReceivePlanId(receive.getId(), receiveFine);
            }
            //3、修改还款计划表里的逾期天数、逾期级别、罚金、状态
            p2pRepaymentPlan.setOverdueDays(days);
            p2pRepaymentPlan.setFine(debtCurrentPhaseFine);
            p2pRepaymentPlan.setOverdueLevel(overdueLevel);
            p2pRepaymentPlan.setRepaymentState("3");//设置状态为已还款
            p2pRepaymentPlanDao.update(p2pRepaymentPlan);

            //4、修改还款记录表罚金
            p2pRepaymentRecordDao.updateFineByRepaymentPlanId(p2pRepaymentPlan.getId(), debtCurrentPhaseFine);
        } else {
            //获得当前债项当期收款计划表集合
            for (P2pReceivePlan receive : receiveList) {
                receive.setPlanReceiveFine(0.0);
                receive.setReceiveState("3");
                //1、修改投资人收款计划表
                p2pReceivePlanDao.update(receive);

                //2、修改投资人收款记录表
                p2pReceiveRecordDao.updateFineByReceivePlanId(receive.getId(), 0.0);
            }
            //3、修改还款计划表里的逾期天数、逾期级别、罚金、状态
            p2pRepaymentPlan.setOverdueDays(null);
            p2pRepaymentPlan.setFine(0.0);
            p2pRepaymentPlan.setOverdueLevel(null);
            p2pRepaymentPlan.setRepaymentState("3");//设置状态为已还款
            p2pRepaymentPlanDao.update(p2pRepaymentPlan);

            //4、修改还款记录表罚金
            p2pRepaymentRecordDao.updateFineByRepaymentPlanId(p2pRepaymentPlan.getId(), 0.0);
        }
        //5、修改逾期明细表
        //删除逾期明细表中该期逾期日期超过实际还款日期的记录
        p2pOverdueDetailsDao.deleteLessRealRepaymentDate(p2pRepaymentPlan.getId(), realRepaymentDate);
        //6、更新债项逾期记录表
        //根据债项id计算当前债项逾期数据
        P2pDebtOverdueRecord debt1 = p2pDebtOverdueRecordDao.calculateDebt(financingInformationId);
        //根据债项id查询当前债项逾期记录
        P2pDebtOverdueRecord debt2 = p2pDebtOverdueRecordDao.getByFid(financingInformationId);
        //修改债项逾期记录
        if (debt2 == null) {
            debt2 = new P2pDebtOverdueRecord();
        }
        debt2.setUserId(userId);
        debt2.setFinancingInformationId(debt1.getFinancingInformationId());
        debt2.setTotalOverdueNumber(debt1.getTotalOverdueNumber());
        debt2.setTotalOverdueAmount(debt1.getTotalOverdueAmount());
        debt2.setTotalOverdueDays(debt1.getTotalOverdueDays());
        debt2.setContinueOverdueDays(debt1.getContinueOverdueDays());
        debt2.setLastOverdueTime(realRepaymentDate);
        debt2.setRepayAmount(debt1.getRepayAmount());
        if (debt1.getRepayAmount() == null) {
            debt1.setRepayAmount(0.0);
        }
        if (debt1.getTotalOverdueAmount() == null) {
            debt1.setTotalOverdueAmount(0.0);
        }
        debt2.setStayOverdueAmount(ZMath.sub(debt1.getTotalOverdueAmount(), debt1.getRepayAmount()));
        debt2.setOverdueFaxi(debt1.getOverdueFaxi());
        debt2.setFaxiRepayAmount(debt1.getFaxiRepayAmount());
        //担保代偿状态功能暂无

        if (debt2.getTotalOverdueDays() == null || debt2.getTotalOverdueDays() == 0) {
            //删除债项逾期记录表
            p2pDebtOverdueRecordDao.delete(debt2);
        } else {
            if (debt2.getId() == null) {
                //插入逾期记录
                debt2.setId(IdGen.uuid());
                p2pDebtOverdueRecordDao.insert(debt2);
            } else {
                //更新逾期记录
                p2pDebtOverdueRecordDao.update(debt2);
            }
        }

        //7、更新债务人逾期记录表
        //根据userId计算当前债务人逾期数据
        P2pDebtorOverdueRecord debtor1 = p2pDebtorOverdueRecordDao.calcByUserId(userId);
        //根据userId查询当前债务人逾期记录
        P2pDebtorOverdueRecord debtor2 = p2pDebtorOverdueRecordDao.getByUserId(userId);
        //修改债务人逾期记录
        if (debtor1 == null) {
            debtor1 = new P2pDebtorOverdueRecord();
        }
        if (debtor2 == null) {
            debtor2 = new P2pDebtorOverdueRecord();
        }
        debtor2.setUserId(userId);
        debtor2.setTotalOverdueNumber(debtor1.getTotalOverdueNumber());
        debtor2.setTotalOverdueAmount(debtor1.getTotalOverdueAmount());
        debtor2.setTotalOverdueDays(debtor1.getTotalOverdueDays());
        debtor2.setContinueOverdueDays(debtor1.getContinueOverdueDays());
        debtor2.setLastOverdueTime(debtor1.getLastOverdueTime());
        debtor2.setRepayAmount(debtor1.getRepayAmount());
        debtor2.setStayOverdueAmount(debtor1.getStayOverdueAmount());
        debtor2.setOverdueFaxi(debtor1.getOverdueFaxi());
        debtor2.setFaxiRepayAmount(debtor1.getFaxiRepayAmount());
        //逾期级别、是否对接事务所功能暂无
        if (debtor2.getTotalOverdueDays() == null || debtor2.getTotalOverdueDays() == 0) {
            //删除债务人逾期记录表
            p2pDebtorOverdueRecordDao.delete(debtor2);
        } else {
            if (debtor2.getId() == null) {
                //插入逾期记录
                debtor2.setId(IdGen.uuid());
                p2pDebtorOverdueRecordDao.insert(debtor2);
            } else {
                //更新逾期记录
                p2pDebtorOverdueRecordDao.update(debtor2);
            }
        }
    }
}
