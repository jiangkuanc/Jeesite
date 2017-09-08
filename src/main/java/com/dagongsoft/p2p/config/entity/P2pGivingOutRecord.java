package com.dagongsoft.p2p.config.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 放款审核记录Entity
 *
 * @author Chace
 * @version 2017-02-17
 */
public class P2pGivingOutRecord extends DataEntity<P2pGivingOutRecord> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 债项id
    private String givingOutState;        // 审核状态
    private String auditor;        // 审核人id
    private Date auditingTime;        // 审核时间
    private String auditingOpinion;        // 审核说明
    private String givingOutVoucher; //放款凭证


    public String getGivingOutVoucher() {
        return givingOutVoucher;
    }

    public void setGivingOutVoucher(String givingOutVoucher) {
        this.givingOutVoucher = givingOutVoucher;
    }

    public P2pGivingOutRecord() {
        super();
    }

    public P2pGivingOutRecord(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "债项id长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 2, message = "审核状态长度必须介于 0 和 2 之间")
    public String getGivingOutState() {
        return givingOutState;
    }

    public void setGivingOutState(String givingOutState) {
        this.givingOutState = givingOutState;
    }

    @Length(min = 0, max = 64, message = "审核人id长度必须介于 0 和 64 之间")
    public String getAuditor() {
        return auditor;
    }

    public void setAuditor(String auditor) {
        this.auditor = auditor;
    }

    public Date getAuditingTime() {
        return auditingTime;
    }

    public void setAuditingTime(Date auditingTime) {
        this.auditingTime = auditingTime;
    }

    @Length(min = 0, max = 100, message = "审核说明长度必须介于 0 和 100 之间")
    public String getAuditingOpinion() {
        return auditingOpinion;
    }

    public void setAuditingOpinion(String auditingOpinion) {
        this.auditingOpinion = auditingOpinion;
    }

}