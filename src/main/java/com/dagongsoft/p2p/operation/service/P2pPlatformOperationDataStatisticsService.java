package com.dagongsoft.p2p.operation.service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.service.P2pDebtOverdueRecordService;
import com.dagongsoft.p2p.operation.dao.P2pPlatformOperationDataStatisticsDao;
import com.dagongsoft.p2p.operation.entity.P2pPlatformOperationDataStatistics;
import com.dagongsoft.p2p.repayment.service.P2pReceivePlanService;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentPlanService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 平台数据统计ServiceImpl
 *
 * @author Sora
 * @version 2016-11-22
 */
@Service("p2pPlatformOperationDataStatisticsService")
@Transactional(readOnly = true)
@Lazy(false)
public class P2pPlatformOperationDataStatisticsService extends CrudService<P2pPlatformOperationDataStatisticsDao, P2pPlatformOperationDataStatistics> {
    @Resource
    private P2pRepaymentPlanService p2pRepaymentPlanService;
    @Resource
    private P2pReceivePlanService p2pReceivePlanService;
    @Resource
    private P2pDebtOverdueRecordService p2pDebtOverdueRecordService;
    @Resource
    private P2pPlatformOperationDataStatisticsDao p2pPlatformOperationDataStatisticsDao;

    public P2pPlatformOperationDataStatistics get(String id) {
        return super.get(id);
    }

    public List<P2pPlatformOperationDataStatistics> findList(P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics) {
        return super.findList(p2pPlatformOperationDataStatistics);
    }

    public Page<P2pPlatformOperationDataStatistics> findPage(Page<P2pPlatformOperationDataStatistics> page, P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics) {
        return super.findPage(page, p2pPlatformOperationDataStatistics);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics) {
        super.save(p2pPlatformOperationDataStatistics);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics) {
        super.delete(p2pPlatformOperationDataStatistics);
    }

    @Scheduled(cron = "0 0 0 * * ?")
    @Transactional(readOnly = false)
    public void insertInformationRegularly() {
        try {
            //1、交易总额--->还款计划表中计划还款本金累加
            BigDecimal findAllPlanRepaymentPrincipal = p2pRepaymentPlanService.findAllPlanRepaymentPrincipal() == null ? new BigDecimal(0) : p2pRepaymentPlanService.findAllPlanRepaymentPrincipal();
            //2、交易总笔数--->还款计划表中所有条数，去重债项ID
            Integer findAllCountDistinctFid = p2pRepaymentPlanService.findAllCountDistinctFid() == null ? 0 : p2pRepaymentPlanService.findAllCountDistinctFid();
            //3、融资人总数
            Integer findFiNumber = p2pRepaymentPlanService.findFiNumber() == null ? 0 : p2pRepaymentPlanService.findFiNumber();
            //4、投资总人数
            Integer findAllCountDistinctUserId = p2pReceivePlanService.findAllCountDistinctUserId() == null ? 0 : p2pReceivePlanService.findAllCountDistinctUserId();
            //5、代偿金额
            BigDecimal sumPlanRepaymentPrincipal = p2pRepaymentPlanService.SumPlanRepaymentPrincipal() == null ? new BigDecimal(0) : p2pRepaymentPlanService.SumPlanRepaymentPrincipal();
            //6、逾期金额
            BigDecimal overDueTotal = p2pRepaymentPlanService.OverDueTotal() == null ? new BigDecimal(0) : p2pRepaymentPlanService.OverDueTotal();
            //7、项目逾期率
            Integer numberProjectsLimit = p2pDebtOverdueRecordService.numberProjectsLimit() == null ? 0 : p2pDebtOverdueRecordService.numberProjectsLimit();
            Double xmyql = findAllCountDistinctFid.intValue() == 0 ? 0.00 : (double) numberProjectsLimit.intValue() / findAllCountDistinctFid.intValue();
            xmyql = Double.parseDouble(new DecimalFormat("#.00").format(xmyql));
            //8、金额逾期率  6/1
            BigDecimal setScale = findAllPlanRepaymentPrincipal.compareTo(new BigDecimal(0)) == 0 ? new BigDecimal(0) : overDueTotal.divide(findAllPlanRepaymentPrincipal, 2, BigDecimal.ROUND_HALF_UP);
            //9、逾期项目数
            Integer numberProjectsLimits = numberProjectsLimit;
            //10、人均累计融资金额 1/3
            BigDecimal rjljrongzi = findFiNumber == 0 ? new BigDecimal(0) : findAllPlanRepaymentPrincipal.divide(new BigDecimal(findFiNumber), 2, BigDecimal.ROUND_HALF_UP);
            //11、人均累计投资金额1/4
            BigDecimal rjljtouzi = findAllCountDistinctUserId == 0 ? new BigDecimal(0) : findAllPlanRepaymentPrincipal.divide(new BigDecimal(findAllCountDistinctUserId), 2, BigDecimal.ROUND_HALF_UP);
            //12、笔均融资金额1/2
            BigDecimal bjAmount = findAllCountDistinctFid == 0 ? new BigDecimal(0) : findAllPlanRepaymentPrincipal.divide(new BigDecimal(findAllCountDistinctFid), 2, BigDecimal.ROUND_HALF_UP);
            //13、最大单户融资余额占比
            BigDecimal findDaichangHuan = p2pRepaymentPlanService.findDaichangHuan();
            BigDecimal maxRongziZhanbi = sumPlanRepaymentPrincipal.compareTo(new BigDecimal(0)) == 0 ? new BigDecimal(0) : findDaichangHuan.divide(sumPlanRepaymentPrincipal, 2, BigDecimal.ROUND_HALF_UP);
            maxRongziZhanbi = maxRongziZhanbi.multiply(new BigDecimal(100.00));
            maxRongziZhanbi = maxRongziZhanbi.divide(new BigDecimal(1), 2, BigDecimal.ROUND_HALF_UP);
            //14、最大十户融资余额占比
            BigDecimal findDaichangHuanTopTen = p2pRepaymentPlanService.findDaichangHuanTopTen();
            BigDecimal findDaichangHuanTopTenzb = sumPlanRepaymentPrincipal.compareTo(new BigDecimal(0)) == 0 ? new BigDecimal(0) : findDaichangHuanTopTen.divide(sumPlanRepaymentPrincipal, 2, BigDecimal.ROUND_HALF_UP);
            P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics = new P2pPlatformOperationDataStatistics();
            p2pPlatformOperationDataStatistics.setId(UUID.randomUUID().toString());
            p2pPlatformOperationDataStatistics.setHistoryDate((new Date()));
            p2pPlatformOperationDataStatistics.setTradeTotalAmount(findAllPlanRepaymentPrincipal.toString());
            p2pPlatformOperationDataStatistics.setTradeTotalNumber(findAllCountDistinctFid.toString());
            p2pPlatformOperationDataStatistics.setFinancingTotalPeople(findFiNumber.toString());
            p2pPlatformOperationDataStatistics.setInvestmentTotalPeople(findAllCountDistinctUserId.toString());
            p2pPlatformOperationDataStatistics.setCompensatoryAmount(sumPlanRepaymentPrincipal.toString());
            p2pPlatformOperationDataStatistics.setOverdueAmount(overDueTotal.toString());
            p2pPlatformOperationDataStatistics.setProjectOverdueRate(xmyql.toString());
            p2pPlatformOperationDataStatistics.setAmountOverdueRate(setScale.toString());
            p2pPlatformOperationDataStatistics.setOverdueProjectNumber(numberProjectsLimits.toString());
            p2pPlatformOperationDataStatistics.setRenjunFinancingAmount(rjljrongzi.toString());
            p2pPlatformOperationDataStatistics.setRenjunInvestmentAmount(rjljtouzi.toString());
            p2pPlatformOperationDataStatistics.setBijunFinancingAmount(bjAmount.toString());
            p2pPlatformOperationDataStatistics.setMaxSingleRzyezb(maxRongziZhanbi.toString());
            p2pPlatformOperationDataStatistics.setMaxTenRzyezb(findDaichangHuanTopTenzb.toString());
            p2pPlatformOperationDataStatistics.setIsNewRecord(true);
            save(p2pPlatformOperationDataStatistics);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public String[][] getEcharts(P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics) {
        String[][] arrAll = new String[15][];
        try {
            List<P2pPlatformOperationDataStatistics> findAllList = p2pPlatformOperationDataStatisticsDao.findByTimes(p2pPlatformOperationDataStatistics);
            //交易总额
            String[] tradeTotalAmountArr = new String[findAllList.size()];
            //代偿金额
            String[] compensatoryAmountArr = new String[findAllList.size()];
            //逾期金额
            String[] overdueAmountArr = new String[findAllList.size()];
            //交易总笔数
            String[] tradeTotalNumberArr = new String[findAllList.size()];
            //逾期项目数
            String[] overdueProjectNumberArr = new String[findAllList.size()];
            //融资人总数
            String[] financingTotalPeopleArr = new String[findAllList.size()];
            //投资人总数
            String[] investmentTotalPeopleArr = new String[findAllList.size()];
            //项目逾期率
            String[] projectOverdueRateArr = new String[findAllList.size()];
            //金额逾期率
            String[] amountOverdueRateArr = new String[findAllList.size()];
            //最大单户融资余额占比
            String[] maxSingleRzyezbArr = new String[findAllList.size()];
            //最大十户融资余额占比
            String[] maxTenRzyezbArr = new String[findAllList.size()];
            //人均累计融资金额
            String[] renjunFinancingAmountArr = new String[findAllList.size()];
            //人均累计投资金额
            String[] renjunInvestmentAmountArr = new String[findAllList.size()];
            //笔均融资金额
            String[] bijunFinancingAmountArr = new String[findAllList.size()];
            //日期
            String[] historyDateArr = new String[findAllList.size()];
            for (int i = 0; i < findAllList.size(); i++) {
                tradeTotalAmountArr[i] = findAllList.get(i).getTradeTotalAmount();
                compensatoryAmountArr[i] = findAllList.get(i).getCompensatoryAmount();
                overdueAmountArr[i] = findAllList.get(i).getOverdueAmount();
                tradeTotalNumberArr[i] = findAllList.get(i).getTradeTotalNumber();
                overdueProjectNumberArr[i] = findAllList.get(i).getOverdueProjectNumber();
                financingTotalPeopleArr[i] = findAllList.get(i).getFinancingTotalPeople();
                investmentTotalPeopleArr[i] = findAllList.get(i).getInvestmentTotalPeople();
                projectOverdueRateArr[i] = findAllList.get(i).getProjectOverdueRate();
                amountOverdueRateArr[i] = findAllList.get(i).getAmountOverdueRate();
                maxSingleRzyezbArr[i] = findAllList.get(i).getMaxSingleRzyezb();
                maxTenRzyezbArr[i] = findAllList.get(i).getMaxTenRzyezb();
                renjunFinancingAmountArr[i] = findAllList.get(i).getRenjunFinancingAmount();
                renjunInvestmentAmountArr[i] = findAllList.get(i).getRenjunInvestmentAmount();
                bijunFinancingAmountArr[i] = findAllList.get(i).getBijunFinancingAmount();
                historyDateArr[i] = new SimpleDateFormat("yyyy-MM-dd").format(findAllList.get(i).getHistoryDate());
            }
            arrAll[0] = tradeTotalAmountArr;
            arrAll[1] = compensatoryAmountArr;
            arrAll[2] = overdueAmountArr;
            arrAll[3] = tradeTotalNumberArr;
            arrAll[4] = overdueProjectNumberArr;
            arrAll[5] = financingTotalPeopleArr;
            arrAll[6] = investmentTotalPeopleArr;
            arrAll[7] = projectOverdueRateArr;
            arrAll[8] = amountOverdueRateArr;
            arrAll[9] = maxSingleRzyezbArr;
            arrAll[10] = maxTenRzyezbArr;
            arrAll[11] = renjunFinancingAmountArr;
            arrAll[12] = renjunInvestmentAmountArr;
            arrAll[13] = bijunFinancingAmountArr;
            arrAll[14] = historyDateArr;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arrAll;
    }

/*	@Test
    public void test(){
		this.insertInformationRegularly();
	}*/
}