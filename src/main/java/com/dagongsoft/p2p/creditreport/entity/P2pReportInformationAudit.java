package com.dagongsoft.p2p.creditreport.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 举报信息审核表Entity
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
public class P2pReportInformationAudit extends DataEntity<P2pReportInformationAudit> {

    private static final long serialVersionUID = 1L;
    private User user;        // 举报人编号
    private String userId;
    private String creditReportId;        // 信用报告编号
    private String creditInfoType;        // 信用信息类型(credit_info_type)
    private String indexId;        // 指标编号
    private String reportCategory;        // 举报类别(report_category)
    private String reportCategoryDetails;        // 举报类别明细
    private String reportContent;        // 举报内容
    private Date reportTime;        // 举报时间
    private String uploadFile;        // 上传附件
    private String firstOpinion;        // 初审意见(success_failure)
    private String firstStaff;        // 初审员
    private String firstExplain;        // 初审说明
    private Date firstTime;        // 初审时间
    private String reviewOpinion;        // 复审意见(success_failure)
    private String reviewOfficer;        // 复审员
    private String reviewExplain;        // 复审说明
    private Date reviewTime;        // 复审时间
    private String reportAuditState;        // 举报审核状态(report_audit_state)待初审、待复审、举报成功、举报失败
    private String isNoticeReported;        // 是否通知被举报人(yes_no)
    private Date beginReportTime;        // 开始 举报时间
    private Date endReportTime;        // 结束 举报时间

    private P2pCreditReport p2pCreditReport;


    public P2pCreditReport getP2pCreditReport() {
        return p2pCreditReport;
    }

    public void setP2pCreditReport(P2pCreditReport p2pCreditReport) {
        this.p2pCreditReport = p2pCreditReport;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public P2pReportInformationAudit() {
        super();
    }

    public P2pReportInformationAudit(String id) {
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

    @Length(min = 0, max = 128, message = "指标编号长度必须介于 0 和 128 之间")
    public String getIndexId() {
        return indexId;
    }

    public void setIndexId(String indexId) {
        this.indexId = indexId;
    }

    @Length(min = 0, max = 64, message = "举报类别(report_category)长度必须介于 0 和 64 之间")
    public String getReportCategory() {
        return reportCategory;
    }

    public void setReportCategory(String reportCategory) {
        this.reportCategory = reportCategory;
    }

    @Length(min = 0, max = 255, message = "举报类别明细长度必须介于 0 和 255 之间")
    public String getReportCategoryDetails() {
        return reportCategoryDetails;
    }

    public void setReportCategoryDetails(String reportCategoryDetails) {
        this.reportCategoryDetails = reportCategoryDetails;
    }

    @Length(min = 0, max = 500, message = "举报内容长度必须介于 0 和 500 之间")
    public String getReportContent() {
        return reportContent;
    }

    public void setReportContent(String reportContent) {
        this.reportContent = reportContent;
    }

    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    @Length(min = 0, max = 64, message = "上传附件长度必须介于 0 和 64 之间")
    public String getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(String uploadFile) {
        this.uploadFile = uploadFile;
    }

    @Length(min = 0, max = 64, message = "初审意见(success_failure)长度必须介于 0 和 64 之间")
    public String getFirstOpinion() {
        return firstOpinion;
    }

    public void setFirstOpinion(String firstOpinion) {
        this.firstOpinion = firstOpinion;
    }

    @Length(min = 0, max = 64, message = "初审员长度必须介于 0 和 64 之间")
    public String getFirstStaff() {
        return firstStaff;
    }

    public void setFirstStaff(String firstStaff) {
        this.firstStaff = firstStaff;
    }

    @Length(min = 0, max = 200, message = "初审说明长度必须介于 0 和 200 之间")
    public String getFirstExplain() {
        return firstExplain;
    }

    public void setFirstExplain(String firstExplain) {
        this.firstExplain = firstExplain;
    }

    public Date getFirstTime() {
        return firstTime;
    }

    public void setFirstTime(Date firstTime) {
        this.firstTime = firstTime;
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

    @Length(min = 0, max = 64, message = "举报审核状态(report_audit_state)待初审、待复审、举报成功、举报失败长度必须介于 0 和 64 之间")
    public String getReportAuditState() {
        return reportAuditState;
    }

    public void setReportAuditState(String reportAuditState) {
        this.reportAuditState = reportAuditState;
    }

    @Length(min = 0, max = 64, message = "是否通知被举报人(yes_no)长度必须介于 0 和 64 之间")
    public String getIsNoticeReported() {
        return isNoticeReported;
    }

    public void setIsNoticeReported(String isNoticeReported) {
        this.isNoticeReported = isNoticeReported;
    }

    public Date getBeginReportTime() {
        return beginReportTime;
    }

    public void setBeginReportTime(Date beginReportTime) {
        this.beginReportTime = beginReportTime;
    }

    public Date getEndReportTime() {
        return endReportTime;
    }

    public void setEndReportTime(Date endReportTime) {
        this.endReportTime = endReportTime;
    }

}