package com.dagongsoft.p2p.repayment.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 投资人收款计划表Entity
 *
 * @author Zeus
 * @version 2016-11-08
 */
public class P2pReceivePlan extends DataEntity<P2pReceivePlan> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息id
    private String userId;        // 投资人id
    private String phase;        // 账期
    private Date planReceiveDate;        // 应收款日期
    private Double planReceivePrincipal;        // 应收款本金
    private Double planReceiveInterest;        // 应收款利息
    private Double planReceiveFine;        // 应收罚金
    private String receiveState; //收款状态

    private P2pReceiveRecord p2pReceiveRecord;
    private User user;
    private P2pUserInformation p2pUserInformation;
    private P2pRegUserCertify p2pRegUserCertify;
    private double sumInterest;//投资总收益
    private Date maturityTime;//到期时间

    public double getSumInterest() {
        return sumInterest;
    }

    public void setSumInterest(double sumInterest) {
        this.sumInterest = sumInterest;
    }

    public Date getMaturityTime() {
        return maturityTime;
    }

    public void setMaturityTime(Date maturityTime) {
        this.maturityTime = maturityTime;
    }

    public String getReceiveState() {
        return receiveState;
    }

    public void setReceiveState(String receiveState) {
        this.receiveState = receiveState;
    }

    public P2pReceiveRecord getP2pReceiveRecord() {
        return p2pReceiveRecord;
    }

    public void setP2pReceiveRecord(P2pReceiveRecord p2pReceiveRecord) {
        this.p2pReceiveRecord = p2pReceiveRecord;
    }

    public P2pReceivePlan() {
        super();
    }

    public P2pReceivePlan(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "融资信息id长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 64, message = "账期长度必须介于 0 和 64 之间")
    public String getPhase() {
        return phase;
    }

    public void setPhase(String phase) {
        this.phase = phase;
    }

    public Date getPlanReceiveDate() {
        return planReceiveDate;
    }

    public void setPlanReceiveDate(Date planReceiveDate) {
        this.planReceiveDate = planReceiveDate;
    }

    public Double getPlanReceivePrincipal() {
        return planReceivePrincipal;
    }

    public void setPlanReceivePrincipal(Double planReceivePrincipal) {
        this.planReceivePrincipal = planReceivePrincipal;
    }

    public Double getPlanReceiveInterest() {
        return planReceiveInterest;
    }

    public void setPlanReceiveInterest(Double planReceiveInterest) {
        this.planReceiveInterest = planReceiveInterest;
    }

    public Double getPlanReceiveFine() {
        return planReceiveFine;
    }

    public void setPlanReceiveFine(Double planReceiveFine) {
        this.planReceiveFine = planReceiveFine;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public P2pUserInformation getP2pUserInformation() {
        return p2pUserInformation;
    }

    public void setP2pUserInformation(P2pUserInformation p2pUserInformation) {
        this.p2pUserInformation = p2pUserInformation;
    }

    public P2pRegUserCertify getP2pRegUserCertify() {
        return p2pRegUserCertify;
    }

    public void setP2pRegUserCertify(P2pRegUserCertify p2pRegUserCertify) {
        this.p2pRegUserCertify = p2pRegUserCertify;
    }

}