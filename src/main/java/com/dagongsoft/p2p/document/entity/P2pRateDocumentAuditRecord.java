package com.dagongsoft.p2p.document.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 评级材料历史审核记录Entity
 *
 * @author Sora
 * @version 2016-11-01
 */
public class P2pRateDocumentAuditRecord extends DataEntity<P2pRateDocumentAuditRecord> {

    private static final long serialVersionUID = 1L;
    private String rateDocumentUploadId;        // 评级材料记录ID
    private Date handleTime;        // 处理时间
    private String isReject;        // 是否通过(yes_no)
    private String rejectReason;        // 驳回原因
    private String auditPerson;        //审核人

    public P2pRateDocumentAuditRecord() {
        super();
    }

    public P2pRateDocumentAuditRecord(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "评级材料记录ID长度必须介于 0 和 64 之间")
    public String getRateDocumentUploadId() {
        return rateDocumentUploadId;
    }

    public void setRateDocumentUploadId(String rateDocumentUploadId) {
        this.rateDocumentUploadId = rateDocumentUploadId;
    }

    public Date getHandleTime() {
        return handleTime;
    }

    public void setHandleTime(Date handleTime) {
        this.handleTime = handleTime;
    }

    @Length(min = 0, max = 64, message = "是否通过(yes_no)长度必须介于 0 和 64 之间")
    public String getIsReject() {
        return isReject;
    }

    public void setIsReject(String isReject) {
        this.isReject = isReject;
    }

    @Length(min = 0, max = 200, message = "驳回原因长度必须介于 0 和 200 之间")
    public String getRejectReason() {
        return rejectReason;
    }

    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason;
    }

    public String getAuditPerson() {
        return auditPerson;
    }

    public void setAuditPerson(String auditPerson) {
        this.auditPerson = auditPerson;
    }


}