/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.investment.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.entity.P2pGivingOutLoans;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 投资信息Entity
 *
 * @author qichao
 * @version 2016-07-06
 */
public class P2pInvestmentInformation extends DataEntity<P2pInvestmentInformation> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息ID
    private User user;        // 投资人，即投资人用户ID
    private Double investmentSumAmount;    //投资金额
    private Date lastInvestmentTime;    //投资时间
    private String investmentDebtState;        //投资债项状态
    private Double expectEarn; //预计收益
    private P2pInvestmentDetails p2pInvestmentDetails;//投资明细
    private P2pGivingOutLoans p2pGivingOutLoans; //放款信息
    private P2pFinancingInformation p2pFinancingInformation;
    private P2pUserInformation p2pUserInformation;
    private P2pFinancingRatingInfo p2pFinancingRatingInfo;
    private P2pBeforeMatchDebtState p2pBeforeMatchDebtState;
    private P2pRegUserCertify p2pRegUserCertify;
    private String userId;

    private Integer count;//累计投资债项数
    private Double accumulativeIncome;//实际总收益(累计收益)
    private Double latelyIncome;//最近一笔收益金额
    /*
     * 前台时间查询
     */
    private Date beginTime;    // 开始时间
    private Date endTime;    // 结束时间


    public P2pInvestmentDetails getP2pInvestmentDetails() {
        return p2pInvestmentDetails;
    }


    public void setP2pInvestmentDetails(P2pInvestmentDetails p2pInvestmentDetails) {
        this.p2pInvestmentDetails = p2pInvestmentDetails;
    }


    public Double getAccumulativeIncome() {
        return accumulativeIncome;
    }


    public void setAccumulativeIncome(Double accumulativeIncome) {
        this.accumulativeIncome = accumulativeIncome;
    }


    public Double getLatelyIncome() {
        return latelyIncome;
    }


    public void setLatelyIncome(Double latelyIncome) {
        this.latelyIncome = latelyIncome;
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


    public Integer getCount() {
        return count;
    }


    public void setCount(Integer count) {
        this.count = count;
    }


    public String getUserId() {
        return userId;
    }


    public void setUserId(String userId) {
        this.userId = userId;
    }


    public P2pUserInformation getP2pUserInformation() {
        return p2pUserInformation;
    }


    public void setP2pUserInformation(P2pUserInformation p2pUserInformation) {
        this.p2pUserInformation = p2pUserInformation;
    }


    public P2pFinancingRatingInfo getP2pFinancingRatingInfo() {
        return p2pFinancingRatingInfo;
    }


    public void setP2pFinancingRatingInfo(
            P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        this.p2pFinancingRatingInfo = p2pFinancingRatingInfo;
    }


    public P2pFinancingInformation getP2pFinancingInformation() {
        return p2pFinancingInformation;
    }


    public void setP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation) {
        this.p2pFinancingInformation = p2pFinancingInformation;
    }


    public P2pGivingOutLoans getP2pGivingOutLoans() {
        return p2pGivingOutLoans;
    }


    public void setP2pGivingOutLoans(P2pGivingOutLoans p2pGivingOutLoans) {
        this.p2pGivingOutLoans = p2pGivingOutLoans;
    }

    public P2pInvestmentInformation() {
        super();
    }

    public P2pInvestmentInformation(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "融资信息ID长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public Double getInvestmentSumAmount() {
        return investmentSumAmount;
    }


    public void setInvestmentSumAmount(Double investmentSumAmount) {
        this.investmentSumAmount = investmentSumAmount;
    }

    @JsonFormat(pattern = "yyyy-MM-dd")
    public Date getLastInvestmentTime() {
        return lastInvestmentTime;
    }


    public void setLastInvestmentTime(Date lastInvestmentTime) {
        this.lastInvestmentTime = lastInvestmentTime;
    }


    public String getInvestmentDebtState() {
        return investmentDebtState;
    }


    public void setInvestmentDebtState(String investmentDebtState) {
        this.investmentDebtState = investmentDebtState;
    }


    public Double getExpectEarn() {
        return expectEarn;
    }


    public void setExpectEarn(Double expectEarn) {
        this.expectEarn = expectEarn;
    }


    public P2pBeforeMatchDebtState getP2pBeforeMatchDebtState() {
        return p2pBeforeMatchDebtState;
    }


    public void setP2pBeforeMatchDebtState(
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        this.p2pBeforeMatchDebtState = p2pBeforeMatchDebtState;
    }


    public P2pRegUserCertify getP2pRegUserCertify() {
        return p2pRegUserCertify;
    }


    public void setP2pRegUserCertify(P2pRegUserCertify p2pRegUserCertify) {
        this.p2pRegUserCertify = p2pRegUserCertify;
    }


}