package com.dagongsoft.p2p.feedback.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 复评材料表Entity
 *
 * @author Quincy
 * @version 2016-11-10
 */
public class P2pReviewDocument extends DataEntity<P2pReviewDocument> {

    private static final long serialVersionUID = 1L;
    private String rateResultViewId;        // 评级结果意见表id
    private String fileName;        // 文件名
    private String fileAddress;        // 地址

    public P2pReviewDocument() {
        super();
    }

    public P2pReviewDocument(String id) {
        super(id);
    }


    public String getRateResultViewId() {
        return rateResultViewId;
    }

    public void setRateResultViewId(String rateResultViewId) {
        this.rateResultViewId = rateResultViewId;
    }

    @Length(min = 0, max = 64, message = "文件名长度必须介于 0 和 64 之间")
    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Length(min = 0, max = 128, message = "地址长度必须介于 0 和 128 之间")
    public String getFileAddress() {
        return fileAddress;
    }

    public void setFileAddress(String fileAddress) {
        this.fileAddress = fileAddress;
    }

}