package com.dagongsoft.p2p.creditmanage.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 信用记录申诉管理Entity
 *
 * @author Zazh
 * @version 2017-02-20
 */
public class CreditAppealInfo extends DataEntity<CreditAppealInfo> {

    private static final long serialVersionUID = 1L;
    private String appealId;        // 申诉人id
    private String appeaInfoType;        // 信息类型
    private String appealReason;        // 申诉原因
    private String appealExplain;        // 申诉描述
    private String attachment;        // 申诉附件
    private String attachmentName;        // 附件名
    private Date appealTime;        // 申诉时间
    private Date appealTime2;
    private String auditStatus;        // 审核状态
    private String checkId;        // 初审人
    private String checkOpinion;        // 初审意见
    private String recheckId;        // 复审人
    private String recheckOpinion;        // 复审意见

    private User user;        // 注册用户ID

    public CreditAppealInfo() {
        super();
    }

    public CreditAppealInfo(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "申诉人id长度必须介于 0 和 64 之间")
    public String getAppealId() {
        return appealId;
    }

    public void setAppealId(String appealId) {
        this.appealId = appealId;
    }

    @Length(min = 0, max = 16, message = "信息类型长度必须介于 0 和 16 之间")
    public String getAppeaInfoType() {
        return appeaInfoType;
    }

    public void setAppeaInfoType(String appeaInfoType) {
        this.appeaInfoType = appeaInfoType;
    }

    @Length(min = 0, max = 16, message = "申诉原因长度必须介于 0 和 16 之间")
    public String getAppealReason() {
        return appealReason;
    }

    public void setAppealReason(String appealReason) {
        this.appealReason = appealReason;
    }

    @Length(min = 0, max = 64, message = "申诉描述长度必须介于 0 和 64 之间")
    public String getAppealExplain() {
        return appealExplain;
    }

    public void setAppealExplain(String appealExplain) {
        this.appealExplain = appealExplain;
    }

    @Length(min = 0, max = 64, message = "申诉附件长度必须介于 0 和 64 之间")
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
    public Date getAppealTime() {
        return appealTime;
    }

    public void setAppealTime(Date appealTime) {
        this.appealTime = appealTime;
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

    public Date getAppealTime2() {
        return appealTime2;
    }

    public void setAppealTime2(Date appealTime2) {
        this.appealTime2 = appealTime2;
    }


}