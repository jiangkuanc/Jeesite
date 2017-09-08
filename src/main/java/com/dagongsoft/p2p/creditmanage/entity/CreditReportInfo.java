package com.dagongsoft.p2p.creditmanage.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 信用记录举报管理Entity
 *
 * @author Zazh
 * @version 2017-02-20
 */
public class CreditReportInfo extends DataEntity<CreditReportInfo> {

    private static final long serialVersionUID = 1L;
    private String reportId;        // 举报人id
    private String beReportedId;        // 被举报人id
    private String reportInfoType;        // 信息类型
    private String reportReason;        // 举报原因
    private String reportExplain;        // 举报描述
    private String attachment;        // 举报附件
    private String attachmentName;        // 附件名
    private Date reportTime;        // 举报时间
    private Date reportTime2;        //
    private String auditStatus;        // 审核状态
    private String checkId;        // 初审人
    private String checkOpinion;        // 初审意见
    private String recheckId;        // 复审人
    private String recheckOpinion;        // 复审意见

    private P2pEnterpriseCertify p2pEnterpriseCertify;
    private P2pIndustryclassi p2pIndustryclassi;
    private Role role;
    private CreditAppealInfo creditAppealInfo;
    private User user;

    public CreditReportInfo() {
        super();
    }

    public CreditReportInfo(String id) {
        super(id);
    }


    public Date getReportTime2() {
        return reportTime2;
    }

    public void setReportTime2(Date reportTime2) {
        this.reportTime2 = reportTime2;
    }

    public P2pEnterpriseCertify getP2pEnterpriseCertify() {
        return p2pEnterpriseCertify;
    }

    public void setP2pEnterpriseCertify(P2pEnterpriseCertify p2pEnterpriseCertify) {
        this.p2pEnterpriseCertify = p2pEnterpriseCertify;
    }

    public P2pIndustryclassi getP2pIndustryclassi() {
        return p2pIndustryclassi;
    }

    public void setP2pIndustryclassi(P2pIndustryclassi p2pIndustryclassi) {
        this.p2pIndustryclassi = p2pIndustryclassi;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public CreditAppealInfo getCreditAppealInfo() {
        return creditAppealInfo;
    }

    public void setCreditAppealInfo(CreditAppealInfo creditAppealInfo) {
        this.creditAppealInfo = creditAppealInfo;
    }

    @Length(min = 0, max = 64, message = "举报人id长度必须介于 0 和 64 之间")
    public String getReportId() {
        return reportId;
    }

    public void setReportId(String reportId) {
        this.reportId = reportId;
    }

    @Length(min = 0, max = 64, message = "被举报人id长度必须介于 0 和 64 之间")
    public String getBeReportedId() {
        return beReportedId;
    }

    public void setBeReportedId(String beReportedId) {
        this.beReportedId = beReportedId;
    }

    @Length(min = 0, max = 16, message = "信息类型长度必须介于 0 和 16 之间")
    public String getReportInfoType() {
        return reportInfoType;
    }

    public void setReportInfoType(String reportInfoType) {
        this.reportInfoType = reportInfoType;
    }

    @Length(min = 0, max = 16, message = "举报原因长度必须介于 0 和 16 之间")
    public String getReportReason() {
        return reportReason;
    }

    public void setReportReason(String reportReason) {
        this.reportReason = reportReason;
    }

    @Length(min = 0, max = 64, message = "举报描述长度必须介于 0 和 64 之间")
    public String getReportExplain() {
        return reportExplain;
    }

    public void setReportExplain(String reportExplain) {
        this.reportExplain = reportExplain;
    }

    @Length(min = 0, max = 64, message = "举报附件长度必须介于 0 和 64 之间")
    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    @Length(min = 0, max = 64, message = "附件名长度必须介于 0 和 64 之间")
    public String getAttachmentName() {
        return attachmentName;
    }

    public void setAttachmentName(String attachmentName) {
        this.attachmentName = attachmentName;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    @Length(min = 0, max = 16, message = "审核状态长度必须介于 0 和 16 之间")
    public String getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(String auditStatus) {
        this.auditStatus = auditStatus;
    }

    @Length(min = 0, max = 64, message = "初审人长度必须介于 0 和 64 之间")
    public String getCheckId() {
        return checkId;
    }

    public void setCheckId(String checkId) {
        this.checkId = checkId;
    }

    @Length(min = 0, max = 64, message = "初审意见长度必须介于 0 和 64 之间")
    public String getCheckOpinion() {
        return checkOpinion;
    }

    public void setCheckOpinion(String checkOpinion) {
        this.checkOpinion = checkOpinion;
    }

    @Length(min = 0, max = 64, message = "复审人长度必须介于 0 和 64 之间")
    public String getRecheckId() {
        return recheckId;
    }

    public void setRecheckId(String recheckId) {
        this.recheckId = recheckId;
    }

    @Length(min = 0, max = 64, message = "复审意见长度必须介于 0 和 64 之间")
    public String getRecheckOpinion() {
        return recheckOpinion;
    }

    public void setRecheckOpinion(String recheckOpinion) {
        this.recheckOpinion = recheckOpinion;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}