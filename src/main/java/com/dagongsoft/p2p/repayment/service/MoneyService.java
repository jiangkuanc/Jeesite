/**
 *
 */
package com.dagongsoft.p2p.repayment.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * @author Zeus
 * @2016-11-8
 */
public interface MoneyService {

    /**
     * 计算总收益（利息）
     *
     * @param amount        本金
     * @param rate          利率
     * @param repaymentMode 还款方式
     * @param phase         还款期数
     * @return
     */
    public Double calculateIncome(Double amount, Double rate, String repaymentMode, int phase);

    /**
     * 计算应还总额（本金+利息）
     *
     * @param amount        本金
     * @param rate          利率
     * @param repaymentMode 还款方式
     * @param phase         还款期数
     * @return
     */
    public Double calculateRepaymentTotal(Double amount, Double rate, String repaymentMode, int phase);

    /**
     * 债项预计收益（利息）
     *
     * @param financingInformationId
     * @return
     */
    public Double expectIncome(String financingInformationId);

    public Double expectIncome(P2pFinancingInformation p2pFinancingInformation);


    /**
     * 投资人累计收益/实际总收益(利息+罚金)
     *
     * @param userId
     * @return
     */
    public Double accumulativeIncome(String userId);

    public Double accumulativeIncome(User user);

    /**
     * 投资人预计总(已经放款债项的利息+罚金)（不包括未放款债项）
     *
     * @param user
     * @return
     */
    public Double planSumIncome(String userId);

    public Double planSumIncome(User user);


    /**
     * 投资人最近一笔收益金额
     *
     * @param userId
     * @return
     */
    public Double latelyIncome(String userId);

    public Double latelyIncome(User user);

    /**
     * 投资人累计投资总数
     *
     * @param userId
     * @return
     */
    public Integer accumulativeAmount(String userId);

    public Integer accumulativeAmount(User user);

    /**
     * 投资人投资的债项所获得的实际总收益
     *
     * @param userId
     * @param financingInformationId
     * @return
     */
    public Double userDebtIncome(String userId, String financingInformationId);

    /**
     * 债项逾期次数
     *
     * @param financingInformationId
     * @return
     */
    public Integer DebtOverdueNum(String financingInformationId);

    /**
     * 债项逾期总金额(罚金)
     *
     * @param financingInformationId
     * @return
     */
    public Double DebtOverdueAmount(String financingInformationId);

    /**
     * 当期还款计划（期数，还款时间，本金，利息）
     *
     * @param financingInformationId
     * @return
     */
    public P2pRepaymentPlan currentRepaymentPlan(String financingInformationId);

    /**
     * 债项已还总金额
     *
     * @param financingInformationId
     * @return
     */
    public Double DebtHasRepayment(String financingInformationId);

    /**
     * 生成还款计划
     *
     * @param date          放款日期
     * @param amount        本金
     * @param rate          利率
     * @param repaymentMode 还款方式
     * @param phase         还款期数
     * @return phase(期数) time(还款时间) interest(利息) principal(本金)
     */
    public List<Map<String, Object>> getRepaymentPlan(Date date, Double amount, Double yearRate, String repaymentMode, int phase);
}
