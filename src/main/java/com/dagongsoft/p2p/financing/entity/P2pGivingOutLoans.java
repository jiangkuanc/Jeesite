/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 贷款发放记录Entity
 *
 * @author zhengshuo
 * @version 2016-07-12
 */
public class P2pGivingOutLoans extends DataEntity<P2pGivingOutLoans> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息ID
    private String investmentInformationId;        // 投资信息ID
    private String investorAccount;        // 投资人账户
    private String givingOutPerson;        // 投资人用户ID
    private Integer givingOutAmount;        // 放款金额
    private Date givingOutTime;        // 放款时间
    private String financierAccount;        // 融资人账户
    private String receiveAmoutPerson;        // 融资人用户ID
    private Integer receiveAmount;        // 收款金额
    private Date receiveAmountTime;        // 收款时间
    private String tripartiteAgreement;        // tripartite_agreement
    private Date contractSignTime;        // contract_sign_time
    private P2pFinancingInformation p2pFinancingInformation;

    public P2pGivingOutLoans() {
        super();
    }

    public P2pGivingOutLoans(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "融资信息ID长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 64, message = "投资信息ID长度必须介于 0 和 64 之间")
    public String getInvestmentInformationId() {
        return investmentInformationId;
    }

    public void setInvestmentInformationId(String investmentInformationId) {
        this.investmentInformationId = investmentInformationId;
    }

    @Length(min = 0, max = 64, message = "投资人账户长度必须介于 0 和 64 之间")
    public String getInvestorAccount() {
        return investorAccount;
    }

    public void setInvestorAccount(String investorAccount) {
        this.investorAccount = investorAccount;
    }

    @Length(min = 0, max = 64, message = "投资人用户ID长度必须介于 0 和 64 之间")
    public String getGivingOutPerson() {
        return givingOutPerson;
    }

    public void setGivingOutPerson(String givingOutPerson) {
        this.givingOutPerson = givingOutPerson;
    }

    public Integer getGivingOutAmount() {
        return givingOutAmount;
    }

    public void setGivingOutAmount(Integer givingOutAmount) {
        this.givingOutAmount = givingOutAmount;
    }

    public Date getGivingOutTime() {
        return givingOutTime;
    }

    public void setGivingOutTime(Date givingOutTime) {
        this.givingOutTime = givingOutTime;
    }

    @Length(min = 0, max = 64, message = "融资人账户长度必须介于 0 和 64 之间")
    public String getFinancierAccount() {
        return financierAccount;
    }

    public void setFinancierAccount(String financierAccount) {
        this.financierAccount = financierAccount;
    }

    @Length(min = 0, max = 64, message = "融资人用户ID长度必须介于 0 和 64 之间")
    public String getReceiveAmoutPerson() {
        return receiveAmoutPerson;
    }

    public void setReceiveAmoutPerson(String receiveAmoutPerson) {
        this.receiveAmoutPerson = receiveAmoutPerson;
    }

    public Integer getReceiveAmount() {
        return receiveAmount;
    }

    public void setReceiveAmount(Integer receiveAmount) {
        this.receiveAmount = receiveAmount;
    }

    public Date getReceiveAmountTime() {
        return receiveAmountTime;
    }

    public void setReceiveAmountTime(Date receiveAmountTime) {
        this.receiveAmountTime = receiveAmountTime;
    }

    @Length(min = 0, max = 200, message = "tripartite_agreement长度必须介于 0 和 200 之间")
    public String getTripartiteAgreement() {
        return tripartiteAgreement;
    }

    public void setTripartiteAgreement(String tripartiteAgreement) {
        this.tripartiteAgreement = tripartiteAgreement;
    }

    public Date getContractSignTime() {
        return contractSignTime;
    }

    public void setContractSignTime(Date contractSignTime) {
        this.contractSignTime = contractSignTime;
    }

    public P2pFinancingInformation getP2pFinancingInformation() {
        return p2pFinancingInformation;
    }

    public void setP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation) {
        this.p2pFinancingInformation = p2pFinancingInformation;
    }

}