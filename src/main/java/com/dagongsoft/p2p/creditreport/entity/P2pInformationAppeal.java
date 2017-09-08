package com.dagongsoft.p2p.creditreport.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 企业信息申诉表Entity
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
public class P2pInformationAppeal extends DataEntity<P2pInformationAppeal> {

    private static final long serialVersionUID = 1L;
    private User user;        // 企业用户编号
    private String userId;
    private String creditReportId;        // 信用报告编号
    private String creditInfoType;        // 信用信息类型(credit_info_type)
    private String indexId;        // 指标编号
    private String appealCategory;        // 申诉类型(appeal_category)
    private String appealReason;        // 申诉理由
    private Date appealTime; //申诉时间
    private String uploadFile;        // 上传附件
    private String firstReviewOpinion;        // 初审意见(success_failure)
    private String firstReviewStaff;        // 初审员
    private String firstReviewExplain;        // 初审说明
    private Date firstReviewTime;        // 初审时间
    private String reviewOpinion;        // 复审意见(success_failure)
    private String reviewOfficer;        // 复审员
    private String reviewExplain;        // 复审说明
    private Date reviewTime;        // 复审时间
    private String appealAuditState;        // 申诉审核状态（complaint_state）

    private P2pCreditReport p2pCreditReport;


    public P2pCreditReport getP2pCreditReport() {
        return p2pCreditReport;
    }

    public void setP2pCreditReport(P2pCreditReport p2pCreditReport) {
        this.p2pCreditReport = p2pCreditReport;
    }

    public Date getAppealTime() {
        return appealTime;
    }

    public void setAppealTime(Date appealTime) {
        this.appealTime = appealTime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public P2pInformationAppeal() {
        super();
    }

    public P2pInformationAppeal(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 0, max = 64, message = "信用报告编号长度必须介于 0 和 64 之间")
    public String getCreditReportId() {
        return creditReportId;
    }

    public void setCreditReportId(String creditReportId) {
        this.creditReportId = creditReportId;
    }

    @Length(min = 0, max = 64, message = "信用信息类型(credit_info_type)长度必须介于 0 和 64 之间")
    public String getCreditInfoType() {
        return creditInfoType;
    }

    public void setCreditInfoType(String creditInfoType) {
        this.creditInfoType = creditInfoType;
    }

    @Length(min = 0, max = 64, message = "指标编号长度必须介于 0 和 64 之间")
    public String getIndexId() {
        return indexId;
    }

    public void setIndexId(String indexId) {
        this.indexId = indexId;
    }

    @Length(min = 0, max = 64, message = "申诉类型(appeal_category)长度必须介于 0 和 64 之间")
    public String getAppealCategory() {
        return appealCategory;
    }

    public void setAppealCategory(String appealCategory) {
        this.appealCategory = appealCategory;
    }

    public String getAppealReason() {
        return appealReason;
    }

    public void setAppealReason(String appealReason) {
        this.appealReason = appealReason;
    }

    @Length(min = 0, max = 64, message = "上传附件长度必须介于 0 和 64 之间")
    public String getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(String uploadFile) {
        this.uploadFile = uploadFile;
    }

    @Length(min = 0, max = 64, message = "初审意见(success_failure)长度必须介于 0 和 64 之间")
    public String getFirstReviewOpinion() {
        return firstReviewOpinion;
    }

    public void setFirstReviewOpinion(String firstReviewOpinion) {
        this.firstReviewOpinion = firstReviewOpinion;
    }

    @Length(min = 0, max = 64, message = "初审员长度必须介于 0 和 64 之间")
    public String getFirstReviewStaff() {
        return firstReviewStaff;
    }

    public void setFirstReviewStaff(String firstReviewStaff) {
        this.firstReviewStaff = firstReviewStaff;
    }

    @Length(min = 0, max = 200, message = "初审说明长度必须介于 0 和 200 之间")
    public String getFirstReviewExplain() {
        return firstReviewExplain;
    }

    public void setFirstReviewExplain(String firstReviewExplain) {
        this.firstReviewExplain = firstReviewExplain;
    }


    public Date getFirstReviewTime() {
        return firstReviewTime;
    }

    public void setFirstReviewTime(Date firstReviewTime) {
        this.firstReviewTime = firstReviewTime;
    }

    @Length(min = 0, max = 64, message = "复审意见(success_failure)长度必须介于 0 和 64 之间")
    public String getReviewOpinion() {
        return reviewOpinion;
    }

    public void setReviewOpinion(String reviewOpinion) {
        this.reviewOpinion = reviewOpinion;
    }

    @Length(min = 0, max = 64, message = "复审员长度必须介于 0 和 64 之间")
    public String getReviewOfficer() {
        return reviewOfficer;
    }

    public void setReviewOfficer(String reviewOfficer) {
        this.reviewOfficer = reviewOfficer;
    }

    @Length(min = 0, max = 200, message = "复审说明长度必须介于 0 和 200 之间")
    public String getReviewExplain() {
        return reviewExplain;
    }

    public void setReviewExplain(String reviewExplain) {
        this.reviewExplain = reviewExplain;
    }

    public Date getReviewTime() {
        return reviewTime;
    }

    public void setReviewTime(Date reviewTime) {
        this.reviewTime = reviewTime;
    }

    @Length(min = 0, max = 64, message = "申诉审核状态（complaint_state）长度必须介于 0 和 64 之间")
    public String getAppealAuditState() {
        return appealAuditState;
    }

    public void setAppealAuditState(String appealAuditState) {
        this.appealAuditState = appealAuditState;
    }

}