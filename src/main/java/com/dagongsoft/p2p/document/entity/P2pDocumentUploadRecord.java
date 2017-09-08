/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 材料上传记录Entity
 *
 * @author Quincy
 * @version 2016-10-25
 */
public class P2pDocumentUploadRecord extends DataEntity<P2pDocumentUploadRecord> {

    private static final long serialVersionUID = 1L;
    private String rateDocumentUploadId;        // 上传材料ID
    private String fileName;        // 文件名称
    private String fileAddress;        // 文件地址
    private String isExpired;        //是否废弃数据
    private P2pRateDocumentUpload p2pRateDocumentUpload;

    private String fileId;        //文件ID


    public P2pRateDocumentUpload getP2pRateDocumentUpload() {
        return p2pRateDocumentUpload;
    }

    public void setP2pRateDocumentUpload(P2pRateDocumentUpload p2pRateDocumentUpload) {
        this.p2pRateDocumentUpload = p2pRateDocumentUpload;
    }

    public P2pDocumentUploadRecord() {
        super();
    }

    public P2pDocumentUploadRecord(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "上传材料ID长度必须介于 0 和 64 之间")
    public String getRateDocumentUploadId() {
        return rateDocumentUploadId;
    }

    public void setRateDocumentUploadId(String rateDocumentUploadId) {
        this.rateDocumentUploadId = rateDocumentUploadId;
    }

    @Length(min = 0, max = 32, message = "文件名称长度必须介于 0 和 32 之间")
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Length(min = 0, max = 64, message = "文件地址长度必须介于 0 和 64 之间")
    public String getFileAddress() {
        return fileAddress;
    }

    public void setFileAddress(String fileAddress) {
        this.fileAddress = fileAddress;
    }

    public String getIsExpired() {
        return isExpired;
    }

    public void setIsExpired(String isExpired) {
        this.isExpired = isExpired;
    }

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId;
    }

}