package com.dagongsoft.p2p.investment.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 投资明细表Entity
 *
 * @author Chace
 * @version 2016-11-08
 */
public class P2pInvestmentDetails extends DataEntity<P2pInvestmentDetails> {

    private static final long serialVersionUID = 1L;
    private String investmentInformationId;        // 投资信息表id
    private double investmentAmount;        // 投资金额
    private Date investmentTime;        // 投资时间
    private String investmentAgreementId;        // 投资协议id

    public P2pInvestmentDetails() {
        super();
    }

    public P2pInvestmentDetails(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "投资信息表id长度必须介于 0 和 64 之间")
    public String getInvestmentInformationId() {
        return investmentInformationId;
    }

    public void setInvestmentInformationId(String investmentInformationId) {
        this.investmentInformationId = investmentInformationId;
    }

    public double getInvestmentAmount() {
        return investmentAmount;
    }

    public void setInvestmentAmount(double investmentAmount) {
        this.investmentAmount = investmentAmount;
    }

    public Date getInvestmentTime() {
        return investmentTime;
    }

    public void setInvestmentTime(Date investmentTime) {
        this.investmentTime = investmentTime;
    }

    @Length(min = 0, max = 64, message = "投资协议id长度必须介于 0 和 64 之间")
    public String getInvestmentAgreementId() {
        return investmentAgreementId;
    }

    public void setInvestmentAgreementId(String investmentAgreementId) {
        this.investmentAgreementId = investmentAgreementId;
    }

}