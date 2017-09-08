package com.dagongsoft.p2p.repayment.entity;


import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 还款计划表Entity
 *
 * @author Quincy
 * @version 2016-11-03
 */
public class P2pRepaymentPlan extends DataEntity<P2pRepaymentPlan> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息id
    private String phase;        // 账期
    private Date planRepaymentDate;        // 计划还款日期
    private Double planRepaymentPrincipal;        // 计划还款本金
    private Double planRepaymentInterest;        // 计划还款利息
    private Integer overdueDays;        // 逾期天数
    private String overdueLevel;        // 逾期级别（overdue_level）
    private Double fine;        // 罚金
    private String repaymentState;        // 还款状态(repayment_state)

    private P2pRepaymentRecord p2pRepaymentRecord;
    private P2pFinancingInformation p2pFinancingInformation;

    private Date beginTime;
    private Date endTime;

    public P2pRepaymentPlan() {
        super();
    }

    public P2pRepaymentPlan(String id) {
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

    public Date getPlanRepaymentDate() {
        return planRepaymentDate;
    }

    public void setPlanRepaymentDate(Date planRepaymentDate) {
        this.planRepaymentDate = planRepaymentDate;
    }

    public Double getPlanRepaymentPrincipal() {
        return planRepaymentPrincipal;
    }

    public void setPlanRepaymentPrincipal(Double planRepaymentPrincipal) {
        this.planRepaymentPrincipal = planRepaymentPrincipal;
    }

    public Double getPlanRepaymentInterest() {
        return planRepaymentInterest;
    }

    public void setPlanRepaymentInterest(Double planRepaymentInterest) {
        this.planRepaymentInterest = planRepaymentInterest;
    }

    public Integer getOverdueDays() {
        return overdueDays;
    }

    public void setOverdueDays(Integer overdueDays) {
        this.overdueDays = overdueDays;
    }

    @Length(min = 0, max = 64, message = "逾期级别（overdue_level）长度必须介于 0 和 64 之间")
    public String getOverdueLevel() {
        return overdueLevel;
    }

    public void setOverdueLevel(String overdueLevel) {
        this.overdueLevel = overdueLevel;
    }

    public Double getFine() {
        return fine;
    }

    public void setFine(Double fine) {
        this.fine = fine;
    }

    @Length(min = 0, max = 64, message = "还款状态(repayment_state)长度必须介于 0 和 64 之间")
    public String getRepaymentState() {
        return repaymentState;
    }

    public void setRepaymentState(String repaymentState) {
        this.repaymentState = repaymentState;
    }

    public P2pRepaymentRecord getP2pRepaymentRecord() {
        return p2pRepaymentRecord;
    }

    public void setP2pRepaymentRecord(P2pRepaymentRecord p2pRepaymentRecord) {
        this.p2pRepaymentRecord = p2pRepaymentRecord;
    }

    public P2pFinancingInformation getP2pFinancingInformation() {
        return p2pFinancingInformation;
    }

    public void setP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation) {
        this.p2pFinancingInformation = p2pFinancingInformation;
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

}