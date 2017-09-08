package com.dagongsoft.p2p.repayment.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 还款记录表Entity
 *
 * @author Quincy
 * @version 2016-11-03
 */
public class P2pRepaymentRecord extends DataEntity<P2pRepaymentRecord> {

    private static final long serialVersionUID = 1L;
    private String repaymentPlanId;        // 还款计划表id
    private Date realRepaymentDate;        // 实际还款日期
    private Double realRepaymentPrincipal;        // 实际还款本金
    private Double realRepaymentInterest;        // 实际还款利息
    private Double realRepaymentFine;        // 实际还款罚金
    private String repaymentAccount;        // 还款账户
    private String repaymentVoucher;        // 还款凭证
    private String repaymentAuditState;        // 还款凭证审核状态
    private Date repaymentAuditTime;        // 还款凭证审核时间
    private String repaymentAuditPerson;    // 还款凭证审核人
    private String repaymentAuditReason;    // 还款凭证不通过原因


    private P2pRepaymentPlan p2pRepaymentPlan;


    private Date beginTime;        //开始时间
    private Date endTime;        //结束时间

    public P2pRepaymentPlan getP2pRepaymentPlan() {
        return p2pRepaymentPlan;
    }

    public void setP2pRepaymentPlan(P2pRepaymentPlan p2pRepaymentPlan) {
        this.p2pRepaymentPlan = p2pRepaymentPlan;
    }

    public P2pRepaymentRecord() {
        super();
    }

    public P2pRepaymentRecord(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "还款计划表id长度必须介于 0 和 64 之间")
    public String getRepaymentPlanId() {
        return repaymentPlanId;
    }

    public void setRepaymentPlanId(String repaymentPlanId) {
        this.repaymentPlanId = repaymentPlanId;
    }

    public Date getRealRepaymentDate() {
        return realRepaymentDate;
    }

    public void setRealRepaymentDate(Date realRepaymentDate) {
        this.realRepaymentDate = realRepaymentDate;
    }

    public Double getRealRepaymentPrincipal() {
        return realRepaymentPrincipal;
    }

    public void setRealRepaymentPrincipal(Double realRepaymentPrincipal) {
        this.realRepaymentPrincipal = realRepaymentPrincipal;
    }

    public Double getRealRepaymentInterest() {
        return realRepaymentInterest;
    }

    public void setRealRepaymentInterest(Double realRepaymentInterest) {
        this.realRepaymentInterest = realRepaymentInterest;
    }

    public Double getRealRepaymentFine() {
        return realRepaymentFine;
    }

    public void setRealRepaymentFine(Double realRepaymentFine) {
        this.realRepaymentFine = realRepaymentFine;
    }

    @Length(min = 0, max = 64, message = "还款账户长度必须介于 0 和 64 之间")
    public String getRepaymentAccount() {
        return repaymentAccount;
    }

    public void setRepaymentAccount(String repaymentAccount) {
        this.repaymentAccount = repaymentAccount;
    }

    @Length(min = 0, max = 255, message = "还款凭证长度必须介于 0 和 255 之间")
    public String getRepaymentVoucher() {
        return repaymentVoucher;
    }

    public void setRepaymentVoucher(String repaymentVoucher) {
        this.repaymentVoucher = repaymentVoucher;
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

    public String getRepaymentAuditState() {
        return repaymentAuditState;
    }

    public void setRepaymentAuditState(String repaymentAuditState) {
        this.repaymentAuditState = repaymentAuditState;
    }

    public Date getRepaymentAuditTime() {
        return repaymentAuditTime;
    }

    public void setRepaymentAuditTime(Date repaymentAuditTime) {
        this.repaymentAuditTime = repaymentAuditTime;
    }

    public String getRepaymentAuditPerson() {
        return repaymentAuditPerson;
    }

    public void setRepaymentAuditPerson(String repaymentAuditPerson) {
        this.repaymentAuditPerson = repaymentAuditPerson;
    }

    public String getRepaymentAuditReason() {
        return repaymentAuditReason;
    }

    public void setRepaymentAuditReason(String repaymentAuditReason) {
        this.repaymentAuditReason = repaymentAuditReason;
    }

}