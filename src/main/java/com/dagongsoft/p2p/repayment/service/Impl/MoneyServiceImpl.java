/**
 *
 */
package com.dagongsoft.p2p.repayment.service.Impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.investment.dao.P2pInvestmentInformationDao;
import com.dagongsoft.p2p.repayment.dao.P2pReceivePlanDao;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentPlanDao;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.dagongsoft.p2p.utils.ZMath;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * @author Zeus
 * @2016-11-8
 */
@Service("moneyService")
@Transactional(readOnly = true)
public class MoneyServiceImpl implements MoneyService {

    //	private static P2pFinancingInformationDao p2pFinancingInformationDao = SpringContextHolder.getBean(P2pFinancingInformationDao.class);
//	private static P2pReceivePlanDao p2pReceivePlanDao = SpringContextHolder.getBean(P2pReceivePlanDao.class);
//	private static P2pReceiveRecordDao p2pReceiveRecordDao = SpringContextHolder.getBean(P2pReceiveRecordDao.class);
    @Resource
    private P2pFinancingInformationDao p2pFinancingInformationDao;
    @Resource
    private P2pReceivePlanDao p2pReceivePlanDao;
    @Resource
    private P2pInvestmentInformationDao p2pInvestmentInformationDao;
    @Resource
    private P2pRepaymentPlanDao p2pRepaymentPlanDao;


    //计算总收益
    @Override
    public Double calculateIncome(Double amount, Double yearRate, String repaymentMode, int phase) {
        //总利息
        Double interest = 0.0;
        if (yearRate == 0 || phase == 0) {
            return ZMath.round(interest, 2);
        }
        Double monthRate = ZMath.div(yearRate, 12);
        //按月付息，到期还本
        if ("1".equals(repaymentMode)) {
            interest = ZMath.mul(amount, ZMath.mul(monthRate, phase));
        }
        //等额本息
        if ("2".equals(repaymentMode)) {
            for (int m = 1; m <= phase; m++) {
                //每月利息
                Double i = ZMath.mul(ZMath.div(ZMath.sub(ZMath.pow(ZMath.add(1, monthRate), phase), ZMath.pow(ZMath.add(1, monthRate), m - 1)), ZMath.sub(ZMath.pow(ZMath.add(1, monthRate), phase), 1)), ZMath.mul(monthRate, amount));
                interest = ZMath.add(interest, i);
            }
        }
        //一次性还本付息
        if ("3".equals(repaymentMode)) {
            interest = ZMath.mul(amount, ZMath.mul(monthRate, phase));
        }
        return ZMath.round(interest, 2);
    }

    //计算应还总额（本金+利息）
    @Override
    public Double calculateRepaymentTotal(Double amount, Double rate,
                                          String repaymentMode, int phase) {
        return ZMath.add(calculateIncome(amount, rate, repaymentMode, phase), amount);
    }


    //债项预计收益
    @Override
    public Double expectIncome(String financingInformationId) {
        Double result = 0.0;
        if (financingInformationId != null && !"".equals(financingInformationId)) {
            P2pFinancingInformation p = p2pFinancingInformationDao.getById(financingInformationId);
            if (p == null) {
                return result;
            }
            Double amount = Double.valueOf(p.getFinancingAmount());
            Double rate = p.getRecommendedRate();
            String repamentMode = p.getRepaymentMode();
            Integer phase = p.getFinancingMaturity();
            result = calculateIncome(amount, rate, repamentMode, phase);
        }
        return ZMath.isNull(result);
    }

    //债项预计收益
    @Override
    public Double expectIncome(P2pFinancingInformation p2pFinancingInformation) {
        return expectIncome(p2pFinancingInformation.getId());
    }

    //投资人累计收益/实际总收益(利息+罚金)
    @Override
    public Double accumulativeIncome(String userId) {
        Double result = 0.0;
        try {
            if (userId != null && !"".equals(userId)) {
                P2pReceivePlan p2pReceivePlan = p2pReceivePlanDao.getUserSumAmount(userId);
                if (p2pReceivePlan != null && p2pReceivePlan.getP2pReceiveRecord() != null) {
                    Double interest = p2pReceivePlan.getP2pReceiveRecord().getRealReceiveInterest();
                    Double fine = 0.0;
                    if (p2pReceivePlan.getP2pReceiveRecord().getRealReceiveFine() != null) {
                        fine = p2pReceivePlan.getP2pReceiveRecord().getRealReceiveFine();
                    }
                    result = ZMath.round(ZMath.add(interest, fine), 2);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ZMath.isNull(result);
    }

    //投资人累计收益/实际总收益(利息+罚金)
    @Override
    public Double accumulativeIncome(User user) {
        return accumulativeIncome(user.getId());
    }

    //最近一笔收益金额
    @Override
    public Double latelyIncome(String userId) {
        Double result = 0.0;
        try {
            if (userId != null && !"".equals(userId)) {
                P2pReceivePlan p2pReceivePlan = p2pReceivePlanDao.getUserLatelyAmount(userId);
                if (p2pReceivePlan != null && p2pReceivePlan.getP2pReceiveRecord() != null) {

                    Double interest = p2pReceivePlan.getP2pReceiveRecord().getRealReceiveInterest();
                    Double fine = 0.0;
                    if (p2pReceivePlan.getP2pReceiveRecord().getRealReceiveFine() != null) {
                        fine = p2pReceivePlan.getP2pReceiveRecord().getRealReceiveFine();
                    }

                    result = ZMath.round(ZMath.add(interest, fine), 2);
                }
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return ZMath.isNull(result);

    }

    //最近一笔收益金额
    @Override
    public Double latelyIncome(User user) {
        return latelyIncome(user.getId());
    }

    //投资人累计投资总数
    @Override
    public Integer accumulativeAmount(String userId) {
        Integer result = 0;
        if (userId != null && !"".equals(userId)) {
            result = p2pInvestmentInformationDao.getUserAccumulativeAmount(userId);
        }
        return result;
    }

    //投资人累计投资总数
    @Override
    public Integer accumulativeAmount(User user) {
        return accumulativeAmount(user.getId());
    }

    //投资人预计总(利息+罚金)
    @Override
    public Double planSumIncome(String userId) {
        Double result = 0.0;
        if (userId != null && !"".equals(userId)) {
            P2pReceivePlan p2pReceivePlan = p2pReceivePlanDao.getUserSumAmount(userId);
            if (p2pReceivePlan != null && p2pReceivePlan.getP2pReceiveRecord() != null) {
                Double interest = p2pReceivePlan.getPlanReceiveInterest();
                Double fine = p2pReceivePlan.getPlanReceiveFine();
                if (interest == null) {
                    interest = 0.0;
                }
                if (fine == null) {
                    fine = 0.0;
                }
                result = ZMath.round(ZMath.add(interest, fine), 2);
            }
        }
        return ZMath.isNull(result);

    }

    //投资人预计总收益(利息+罚金)
    @Override
    public Double planSumIncome(User user) {
        return planSumIncome(user.getId());
    }

    //投资人投资的债项所获得的实际总收益(利息+罚金)
    @Override
    public Double userDebtIncome(String userId, String financingInformationId) {
        Double result = 0.0;
        try {
            if (userId != null && !"".equals(userId) && financingInformationId != null && !"".equals(financingInformationId)) {
                P2pReceivePlan p2pReceivePlan = p2pReceivePlanDao.getUserDebtSumAmount(userId, financingInformationId);
                if (p2pReceivePlan != null && p2pReceivePlan.getP2pReceiveRecord() != null) {
                    Double interest = 0.0;
                    Double fine = 0.0;
                    if (p2pReceivePlan.getP2pReceiveRecord().getRealReceiveInterest() != null) {
                        interest = p2pReceivePlan.getP2pReceiveRecord().getRealReceiveInterest();
                    }
                    if (p2pReceivePlan.getP2pReceiveRecord().getRealReceiveFine() != null) {
                        fine = p2pReceivePlan.getP2pReceiveRecord().getRealReceiveFine();
                    }
                    result = ZMath.round(ZMath.add(interest, fine), 2);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ZMath.isNull(result);

    }

    // 生成还款计划
    @Override
    public List<Map<String, Object>> getRepaymentPlan(Date date, Double amount,
                                                      Double yearRate, String repaymentMode, int phase) {

        if (phase == 0 || repaymentMode == null || "".equals(repaymentMode)
                || amount == 0) {
            return null;
        }

        // 月利率
        Double monthRate = yearRate / 12;

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        // 按月付息，到期还本
        if ("1".equals(repaymentMode)) {
            for (int i = 1; i <= phase; i++) {
                Map<String, Object> map = new HashMap<String, Object>();
                Double principal = null;
                Double interest = null;
                // 应还利息
                interest = ZMath.mul(amount, monthRate);
                map.put("interest", ZMath.round(interest, 2));
                // 应还本金0
                if (i == phase) {
                    map.put("principal", ZMath.round(amount, 2));
                } else {
                    map.put("principal", ZMath.round(0, 2));
                }
                // 期数
                map.put("phase", i + "/" + phase);

                // 还款时间

                if (date != null) {
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(date);
                    cal.add(Calendar.MONTH, i);
                    Date time = cal.getTime();
                    map.put("time", time);
                }

                list.add(map);
            }
        }
        // 等额本息
        if ("2".equals(repaymentMode)) {
            // 等额本息 前n-1个月应还本金
            Double sump = 0.0;
            // 等额本息 每月应还本金+利息
            Double pi = ZMath.round(ZMath.mul(ZMath.div(
                    ZMath.pow(ZMath.add(1, monthRate), phase),
                    ZMath.sub(ZMath.pow(ZMath.add(1, monthRate), phase), 1)),
                    ZMath.mul(monthRate, amount)), 2);
            for (int i = 1; i <= phase; i++) {
                Map<String, Object> map = new HashMap<String, Object>();
                Double principal = null;
                Double interest = null;
                // 应还利息
                interest = ZMath.round(ZMath.mul(ZMath.div(ZMath.sub(
                        ZMath.pow(ZMath.add(1, monthRate), phase),
                        ZMath.pow(ZMath.add(1, monthRate), i - 1)), ZMath.sub(
                        ZMath.pow(ZMath.add(1, monthRate), phase), 1)), ZMath
                        .mul(monthRate, amount)), 2);
                map.put("interest", ZMath.round(interest, 2));
                // 应还本金
                if (i != phase) {
                    principal = ZMath.sub(pi, interest);
                    map.put("principal", ZMath.round(principal, 2));
                    sump = ZMath.add(principal, sump);
                } else {
                    principal = ZMath.sub(amount, sump);
                    map.put("principal", ZMath.round(principal, 2));
                }

                // 期数
                map.put("phase", i + "/" + phase);

                // 还款时间

                if (date != null) {
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(date);
                    cal.add(Calendar.MONTH, i);
                    Date time = cal.getTime();
                    map.put("time", time);
                }

                list.add(map);
            }
        }
        // 一次性还本付息(只有最后一期)
        if ("3".equals(repaymentMode)) {
            for (int i = 1; i <= phase; i++) {
                Map<String, Object> map = new HashMap<String, Object>();
                Double interest = null;
                if (i == phase) {
                    // 应还利息
                    interest = ZMath.mul(ZMath.mul(amount, monthRate), phase);
                    map.put("interest", ZMath.round(interest, 2));
                    // 应还本金
                    map.put("principal", ZMath.round(amount, 2));

                    // 期数
                    map.put("phase", "1/1");

                    // 还款时间
                    if (date != null) {
                        Calendar cal = Calendar.getInstance();
                        cal.setTime(date);
                        cal.add(Calendar.MONTH, i);
                        Date time = cal.getTime();
                        map.put("time", time);
                    }
                    list.add(map);
                }
            }
        }
        return list;
    }

    //债项逾期次数
    @Override
    public Integer DebtOverdueNum(String financingInformationId) {
        Integer result = 0;
        if (financingInformationId != null && !"".equals(financingInformationId)) {
            result = p2pRepaymentPlanDao.getDebtOverdueNum(financingInformationId);
        }
        return result;
    }

    //债项逾期累计金额
    @Override
    public Double DebtOverdueAmount(String financingInformationId) {
        Double result = 0.0;
        if (financingInformationId != null && !"".equals(financingInformationId)) {
            result = p2pRepaymentPlanDao.getDebtOverdueAmount(financingInformationId);
        }
        return ZMath.isNull(result);

    }

    //当期还款计划（期数，还款时间，本金，利息）
    @Override
    public P2pRepaymentPlan currentRepaymentPlan(
            String financingInformationId) {
        if (financingInformationId != null && !"".equals(financingInformationId)) {
            Integer num1 = p2pRepaymentPlanDao.getDebtRepaymentPhaseNum(financingInformationId) + 1;
            Integer num2 = p2pFinancingInformationDao.getById(financingInformationId).getFinancingMaturity();

            if (num1 != null && num2 != null) {
                String phase = null;
                if (num1 >= num2) {
                    phase = num2 + "/" + num2;
                } else {
                    phase = num1 + "/" + num2;
                }
                return p2pRepaymentPlanDao.getCurrentPhaseRepaymentPlan(financingInformationId, phase);
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    //债项已还总金额
    @Override
    public Double DebtHasRepayment(String financingInformationId) {
        Double result = 0.0;
        if (financingInformationId != null && !"".equals(financingInformationId)) {
            result = p2pRepaymentPlanDao.findHasPaidAmountByFid(financingInformationId);
        }
        return ZMath.isNull(result);

    }

}
