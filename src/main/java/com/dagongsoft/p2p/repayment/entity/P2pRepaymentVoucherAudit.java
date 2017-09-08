package com.dagongsoft.p2p.repayment.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 还款凭证审核记录Entity
 *
 * @author zeus
 * @version 2017-02-16
 */
public class P2pRepaymentVoucherAudit extends DataEntity<P2pRepaymentVoucherAudit> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息id
    private String phase;        // 期数
    private String repaymentRecordId;        // 还款记录表id
    private String repaymentVoucher;        // 还款凭证
    private String repaymentAuditState;        // 还款凭证审核状态
    private Date repaymentAuditTime;        // 还款凭证审核时间
    private String repaymentAuditPerson;        // 还款凭证审核人
    private String repaymentAuditReason;        // 还款凭证不通过原因

    public P2pRepaymentVoucherAudit() {
        super();
    }

    public P2pRepaymentVoucherAudit(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "融资信息id长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 10, message = "期数长度必须介于 0 和 10 之间")
    public String getPhase() {
        return phase;
    }

    public void setPhase(String phase) {
        this.phase = phase;
    }

    @Length(min = 0, max = 64, message = "还款记录表id长度必须介于 0 和 64 之间")
    public String getRepaymentRecordId() {
        return repaymentRecordId;
    }

    public void setRepaymentRecordId(String repaymentRecordId) {
        this.repaymentRecordId = repaymentRecordId;
    }

    @Length(min = 0, max = 255, message = "还款凭证长度必须介于 0 和 255 之间")
    public String getRepaymentVoucher() {
        return repaymentVoucher;
    }

    public void setRepaymentVoucher(String repaymentVoucher) {
        this.repaymentVoucher = repaymentVoucher;
    }

    @Length(min = 0, max = 64, message = "还款凭证审核状态长度必须介于 0 和 64 之间")
    public String getRepaymentAuditState() {
        return repaymentAuditState;
    }

    public void setRepaymentAuditState(String repaymentAuditState) {
        this.repaymentAuditState = repaymentAuditState;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getRepaymentAuditTime() {
        return repaymentAuditTime;
    }

    public void setRepaymentAuditTime(Date repaymentAuditTime) {
        this.repaymentAuditTime = repaymentAuditTime;
    }

    @Length(min = 0, max = 64, message = "还款凭证审核人长度必须介于 0 和 64 之间")
    public String getRepaymentAuditPerson() {
        return repaymentAuditPerson;
    }

    public void setRepaymentAuditPerson(String repaymentAuditPerson) {
        this.repaymentAuditPerson = repaymentAuditPerson;
    }

    @Length(min = 0, max = 255, message = "还款凭证不通过原因长度必须介于 0 和 255 之间")
    public String getRepaymentAuditReason() {
        return repaymentAuditReason;
    }

    public void setRepaymentAuditReason(String repaymentAuditReason) {
        this.repaymentAuditReason = repaymentAuditReason;
    }

}