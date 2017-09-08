/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.entity;

import java.util.Date;
import java.util.List;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 评级材料上传Entity
 *
 * @author qichao
 * @version 2016-09-27
 */
public class P2pRateDocumentUpload extends DataEntity<P2pRateDocumentUpload> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 债项ID
    private String rateDocumentTempId;        // 评级材料模板表id
    private Date uploadTime;        // 上传时间
    private String isReject;        // 是否驳回
    private String rejectReason;        // 驳回原因
    private String auditPerson;        //审核人
    private Date auditTime;        //审核时间
    private List<P2pDocumentUploadRecord> p2pDocumentUploadRecordList;
    private P2pRateDocumentTemplate p2pRateDocumentTemplate;
    private P2pFinancingInformation p2pFinancingInformation;

    public P2pRateDocumentUpload() {
        super();
    }

    public P2pRateDocumentUpload(String id) {
        super(id);
    }

    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }


    public String getRateDocumentTempId() {
        return rateDocumentTempId;
    }

    public void setRateDocumentTempId(String rateDocumentTempId) {
        this.rateDocumentTempId = rateDocumentTempId;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public String getIsReject() {
        return isReject;
    }

    public void setIsReject(String isReject) {
        this.isReject = isReject;
    }

    public String getRejectReason() {
        return rejectReason;
    }

    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason;
    }

    public List<P2pDocumentUploadRecord> getP2pDocumentUploadRecordList() {
        return p2pDocumentUploadRecordList;
    }

    public void setP2pDocumentUploadRecordList(
            List<P2pDocumentUploadRecord> p2pDocumentUploadRecordList) {
        this.p2pDocumentUploadRecordList = p2pDocumentUploadRecordList;
    }

    public P2pRateDocumentTemplate getP2pRateDocumentTemplate() {
        return p2pRateDocumentTemplate;
    }

    public void setP2pRateDocumentTemplate(
            P2pRateDocumentTemplate p2pRateDocumentTemplate) {
        this.p2pRateDocumentTemplate = p2pRateDocumentTemplate;
    }

    public P2pFinancingInformation getP2pFinancingInformation() {
        return p2pFinancingInformation;
    }

    public void setP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation) {
        this.p2pFinancingInformation = p2pFinancingInformation;
    }

    public String getAuditPerson() {
        return auditPerson;
    }

    public void setAuditPerson(String auditPerson) {
        this.auditPerson = auditPerson;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    @Override
    public String toString() {
        return "P2pRateDocumentUpload [financingInformationId="
                + financingInformationId + ", rateDocumentTempId="
                + rateDocumentTempId + ", uploadTime=" + uploadTime
                + ", isReject=" + isReject + ", rejectReason=" + rejectReason
                + ", p2pDocumentUploadRecordList="
                + p2pDocumentUploadRecordList + ", p2pRateDocumentTemplate="
                + p2pRateDocumentTemplate + "]";
    }


}