package com.dagongsoft.p2p.operation.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 平台运营数据披露表Entity
 *
 * @author Zeus
 * @version 2016-11-25
 */
public class P2pPlatformOperationDataShow extends DataEntity<P2pPlatformOperationDataShow> {

    private static final long serialVersionUID = 1L;
    private Date historyDate;        // 日期
    private BigDecimal tradeTotalAmount;        // 交易总额
    private Integer tradeTotalNumber;        // 交易总笔数
    private Integer financingTotalPeople;        // 融资人总数
    private Integer investmentTotalPeople;        // 投资人总数
    private BigDecimal compensatoryAmount;        // 代偿金额
    private BigDecimal overdueAmount;        // 逾期金额
    private Integer projectTotalNumber;        // 总项目个数
    private BigDecimal projectOverdueRate;        // 项目逾期率
    private BigDecimal amountOverdueRate;        // 金额逾期率
    private Integer overdueProjectNumber;        // 逾期项目数
    private BigDecimal renjunFinancingAmount;        // 人均累计融资金额
    private BigDecimal renjunInvestmentAmount;        // 人均累计投资金额
    private BigDecimal bijunFinancingAmount;        // 笔均融资金额
    private BigDecimal maxSingleRzye;        // 最大单户融资余额
    private BigDecimal maxTenRzye;        // 最大十户融资余额
    private BigDecimal maxSingleRzyezb;        // 最大单户融资余额占比
    private BigDecimal maxTenRzyezb;        // 最大十户融资余额占比
    private BigDecimal financingEarn;        // 投资收益
    private BigDecimal historicalAnnualYield;        // 历史年化收益率
    private Integer registerCount;        // 外网注册总人数

    public P2pPlatformOperationDataShow() {
        super();
    }

    public P2pPlatformOperationDataShow(String id) {
        super(id);
    }

    public Date getHistoryDate() {
        return historyDate;
    }

    public void setHistoryDate(Date historyDate) {
        this.historyDate = historyDate;
    }


    public Integer getTradeTotalNumber() {
        return tradeTotalNumber;
    }

    public void setTradeTotalNumber(Integer tradeTotalNumber) {
        this.tradeTotalNumber = tradeTotalNumber;
    }

    public Integer getFinancingTotalPeople() {
        return financingTotalPeople;
    }

    public void setFinancingTotalPeople(Integer financingTotalPeople) {
        this.financingTotalPeople = financingTotalPeople;
    }

    public Integer getInvestmentTotalPeople() {
        return investmentTotalPeople;
    }

    public void setInvestmentTotalPeople(Integer investmentTotalPeople) {
        this.investmentTotalPeople = investmentTotalPeople;
    }


    public Integer getProjectTotalNumber() {
        return projectTotalNumber;
    }

    public void setProjectTotalNumber(Integer projectTotalNumber) {
        this.projectTotalNumber = projectTotalNumber;
    }


    public Integer getOverdueProjectNumber() {
        return overdueProjectNumber;
    }

    public void setOverdueProjectNumber(Integer overdueProjectNumber) {
        this.overdueProjectNumber = overdueProjectNumber;
    }

    public Integer getRegisterCount() {
        return registerCount;
    }

    public void setRegisterCount(Integer registerCount) {
        this.registerCount = registerCount;
    }

    public BigDecimal getTradeTotalAmount() {
        return tradeTotalAmount;
    }

    public void setTradeTotalAmount(BigDecimal tradeTotalAmount) {
        this.tradeTotalAmount = tradeTotalAmount;
    }

    public BigDecimal getCompensatoryAmount() {
        return compensatoryAmount;
    }

    public void setCompensatoryAmount(BigDecimal compensatoryAmount) {
        this.compensatoryAmount = compensatoryAmount;
    }

    public BigDecimal getOverdueAmount() {
        return overdueAmount;
    }

    public void setOverdueAmount(BigDecimal overdueAmount) {
        this.overdueAmount = overdueAmount;
    }

    public BigDecimal getProjectOverdueRate() {
        return projectOverdueRate;
    }

    public void setProjectOverdueRate(BigDecimal projectOverdueRate) {
        this.projectOverdueRate = projectOverdueRate;
    }

    public BigDecimal getAmountOverdueRate() {
        return amountOverdueRate;
    }

    public void setAmountOverdueRate(BigDecimal amountOverdueRate) {
        this.amountOverdueRate = amountOverdueRate;
    }

    public BigDecimal getRenjunFinancingAmount() {
        return renjunFinancingAmount;
    }

    public void setRenjunFinancingAmount(BigDecimal renjunFinancingAmount) {
        this.renjunFinancingAmount = renjunFinancingAmount;
    }

    public BigDecimal getRenjunInvestmentAmount() {
        return renjunInvestmentAmount;
    }

    public void setRenjunInvestmentAmount(BigDecimal renjunInvestmentAmount) {
        this.renjunInvestmentAmount = renjunInvestmentAmount;
    }

    public BigDecimal getBijunFinancingAmount() {
        return bijunFinancingAmount;
    }

    public void setBijunFinancingAmount(BigDecimal bijunFinancingAmount) {
        this.bijunFinancingAmount = bijunFinancingAmount;
    }

    public BigDecimal getMaxSingleRzye() {
        return maxSingleRzye;
    }

    public void setMaxSingleRzye(BigDecimal maxSingleRzye) {
        this.maxSingleRzye = maxSingleRzye;
    }

    public BigDecimal getMaxTenRzye() {
        return maxTenRzye;
    }

    public void setMaxTenRzye(BigDecimal maxTenRzye) {
        this.maxTenRzye = maxTenRzye;
    }

    public BigDecimal getMaxSingleRzyezb() {
        return maxSingleRzyezb;
    }

    public void setMaxSingleRzyezb(BigDecimal maxSingleRzyezb) {
        this.maxSingleRzyezb = maxSingleRzyezb;
    }

    public BigDecimal getMaxTenRzyezb() {
        return maxTenRzyezb;
    }

    public void setMaxTenRzyezb(BigDecimal maxTenRzyezb) {
        this.maxTenRzyezb = maxTenRzyezb;
    }

    public BigDecimal getFinancingEarn() {
        return financingEarn;
    }

    public void setFinancingEarn(BigDecimal financingEarn) {
        this.financingEarn = financingEarn;
    }

    public BigDecimal getHistoricalAnnualYield() {
        return historicalAnnualYield;
    }

    public void setHistoricalAnnualYield(BigDecimal historicalAnnualYield) {
        this.historicalAnnualYield = historicalAnnualYield;
    }

}