package com.dagongsoft.p2p.repayment.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 逾期明细表Entity
 *
 * @author Zeus
 * @version 2016-11-16
 */
public class P2pOverdueDetails extends DataEntity<P2pOverdueDetails> {

    private static final long serialVersionUID = 1L;
    private String repaymentPlanId;        // 还款计划id
    private Double overdueAmount;        // 逾期金额
    private Date overdueDate;        // 逾期日期
    private Double fineDay;        // 当天罚金

    public P2pOverdueDetails() {
        super();
    }

    public P2pOverdueDetails(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "还款计划id长度必须介于 0 和 64 之间")
    public String getRepaymentPlanId() {
        return repaymentPlanId;
    }

    public void setRepaymentPlanId(String repaymentPlanId) {
        this.repaymentPlanId = repaymentPlanId;
    }

    public Double getOverdueAmount() {
        return overdueAmount;
    }

    public void setOverdueAmount(Double overdueAmount) {
        this.overdueAmount = overdueAmount;
    }

    public Date getOverdueDate() {
        return overdueDate;
    }

    public void setOverdueDate(Date overdueDate) {
        this.overdueDate = overdueDate;
    }

    public Double getFineDay() {
        return fineDay;
    }

    public void setFineDay(Double fineDay) {
        this.fineDay = fineDay;
    }

}