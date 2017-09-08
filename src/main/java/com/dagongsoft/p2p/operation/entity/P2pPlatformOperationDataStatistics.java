package com.dagongsoft.p2p.operation.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 平台数据统计Entity
 *
 * @author Sora
 * @version 2016-11-22
 */
public class P2pPlatformOperationDataStatistics extends DataEntity<P2pPlatformOperationDataStatistics> {

    private static final long serialVersionUID = 1L;
    private Date historyDate;        // 日期
    private String tradeTotalAmount;        // 交易总额
    private String tradeTotalNumber;        // 交易总笔数
    private String financingTotalPeople;        // 融资人总数
    private String investmentTotalPeople;        // 投资人总数
    private String compensatoryAmount;        // 代偿金额
    private String overdueAmount;        // 逾期金额
    private String projectOverdueRate;        // 项目逾期率
    private String amountOverdueRate;        // 金额逾期率
    private String overdueProjectNumber;        // 逾期项目数
    private String renjunFinancingAmount;        // 人均累计融资金额
    private String renjunInvestmentAmount;        // 人均累计投资金额
    private String bijunFinancingAmount;        // 笔均融资金额
    private String maxSingleRzye;        // 最大单户融资余额
    private String maxTenRzye;        // 最大十户融资余额
    private String maxSingleRzyezb;        // 最大单户融资余额占比
    private String maxTenRzyezb;        // 最大十户融资余额占比
    private Date beginTime;                //开始时间
    private Date endTime;                //结束时间
    private String classifiedQuery;        //分类查询

    public P2pPlatformOperationDataStatistics() {
        super();
    }

    public P2pPlatformOperationDataStatistics(String id) {
        super(id);
    }

    public Date getHistoryDate() {
        return historyDate;
    }

    public void setHistoryDate(Date historyDate) {
        this.historyDate = historyDate;
    }

    public String getTradeTotalAmount() {
        return tradeTotalAmount;
    }

    public void setTradeTotalAmount(String tradeTotalAmount) {
        this.tradeTotalAmount = tradeTotalAmount;
    }

    @Length(min = 0, max = 11, message = "交易总笔数长度必须介于 0 和 11 之间")
    public String getTradeTotalNumber() {
        return tradeTotalNumber;
    }

    public void setTradeTotalNumber(String tradeTotalNumber) {
        this.tradeTotalNumber = tradeTotalNumber;
    }

    @Length(min = 0, max = 11, message = "融资人总数长度必须介于 0 和 11 之间")
    public String getFinancingTotalPeople() {
        return financingTotalPeople;
    }

    public void setFinancingTotalPeople(String financingTotalPeople) {
        this.financingTotalPeople = financingTotalPeople;
    }

    @Length(min = 0, max = 11, message = "投资人总数长度必须介于 0 和 11 之间")
    public String getInvestmentTotalPeople() {
        return investmentTotalPeople;
    }

    public void setInvestmentTotalPeople(String investmentTotalPeople) {
        this.investmentTotalPeople = investmentTotalPeople;
    }

    public String getCompensatoryAmount() {
        return compensatoryAmount;
    }

    public void setCompensatoryAmount(String compensatoryAmount) {
        this.compensatoryAmount = compensatoryAmount;
    }

    public String getOverdueAmount() {
        return overdueAmount;
    }

    public void setOverdueAmount(String overdueAmount) {
        this.overdueAmount = overdueAmount;
    }

    public String getProjectOverdueRate() {
        return projectOverdueRate;
    }

    public void setProjectOverdueRate(String projectOverdueRate) {
        this.projectOverdueRate = projectOverdueRate;
    }

    public String getAmountOverdueRate() {
        return amountOverdueRate;
    }

    public void setAmountOverdueRate(String amountOverdueRate) {
        this.amountOverdueRate = amountOverdueRate;
    }

    @Length(min = 0, max = 11, message = "逾期项目数长度必须介于 0 和 11 之间")
    public String getOverdueProjectNumber() {
        return overdueProjectNumber;
    }

    public void setOverdueProjectNumber(String overdueProjectNumber) {
        this.overdueProjectNumber = overdueProjectNumber;
    }

    public String getRenjunFinancingAmount() {
        return renjunFinancingAmount;
    }

    public void setRenjunFinancingAmount(String renjunFinancingAmount) {
        this.renjunFinancingAmount = renjunFinancingAmount;
    }

    public String getRenjunInvestmentAmount() {
        return renjunInvestmentAmount;
    }

    public void setRenjunInvestmentAmount(String renjunInvestmentAmount) {
        this.renjunInvestmentAmount = renjunInvestmentAmount;
    }

    public String getBijunFinancingAmount() {
        return bijunFinancingAmount;
    }

    public void setBijunFinancingAmount(String bijunFinancingAmount) {
        this.bijunFinancingAmount = bijunFinancingAmount;
    }

    public String getMaxSingleRzye() {
        return maxSingleRzye;
    }

    public void setMaxSingleRzye(String maxSingleRzye) {
        this.maxSingleRzye = maxSingleRzye;
    }

    public String getMaxTenRzye() {
        return maxTenRzye;
    }

    public void setMaxTenRzye(String maxTenRzye) {
        this.maxTenRzye = maxTenRzye;
    }

    public String getMaxSingleRzyezb() {
        return maxSingleRzyezb;
    }

    public void setMaxSingleRzyezb(String maxSingleRzyezb) {
        this.maxSingleRzyezb = maxSingleRzyezb;
    }

    public String getMaxTenRzyezb() {
        return maxTenRzyezb;
    }

    public void setMaxTenRzyezb(String maxTenRzyezb) {
        this.maxTenRzyezb = maxTenRzyezb;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getClassifiedQuery() {
        return classifiedQuery;
    }

    public void setClassifiedQuery(String classifiedQuery) {
        this.classifiedQuery = classifiedQuery;
    }


}