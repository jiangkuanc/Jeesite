package com.dagongsoft.p2p.document.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 补充材料上传记录Entity
 *
 * @author Quincy
 * @version 2017-02-17
 */
public class P2pSupplyDocumentUpload extends DataEntity<P2pSupplyDocumentUpload> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // financing_information_id
    private String rateDocumentTempId;        // rate_document_temp_id
    private String uploadId;        // upload_id
    private Date uploadDate;        // upload_date
    private Integer uploadFlag;        //上传标记，判断是否为当前上传次数

    private List<P2pDocumentUploadRecord> p2pDocumentUploadRecordList;

    public P2pSupplyDocumentUpload() {
        super();
    }

    public P2pSupplyDocumentUpload(String id) {
        super(id);
    }

    @Length(min = 0, max = 32, message = "financing_information_id长度必须介于 0 和 32 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 32, message = "rate_document_temp_id长度必须介于 0 和 32 之间")
    public String getRateDocumentTempId() {
        return rateDocumentTempId;
    }

    public void setRateDocumentTempId(String rateDocumentTempId) {
        this.rateDocumentTempId = rateDocumentTempId;
    }

    @Length(min = 0, max = 32, message = "upload_id长度必须介于 0 和 32 之间")
    public String getUploadId() {
        return uploadId;
    }

    public void setUploadId(String uploadId) {
        this.uploadId = uploadId;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public Integer getUploadFlag() {
        return uploadFlag;
    }

    public void setUploadFlag(Integer uploadFlag) {
        this.uploadFlag = uploadFlag;
    }

    public List<P2pDocumentUploadRecord> getP2pDocumentUploadRecordList() {
        return p2pDocumentUploadRecordList;
    }

    public void setP2pDocumentUploadRecordList(
            List<P2pDocumentUploadRecord> p2pDocumentUploadRecordList) {
        this.p2pDocumentUploadRecordList = p2pDocumentUploadRecordList;
    }

}