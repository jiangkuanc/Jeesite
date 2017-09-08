/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 认证审核记录，包含个人身份认证、企业身份认证Entity
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
public class P2pAuditRecord extends DataEntity<P2pAuditRecord> {

    private static final long serialVersionUID = 1L;
    private Integer auditType;        // 认证类别：身份认证、企业认证
    private String referenceId;        // 认证ID，即用户身份认证表或企业认证表ID
    private String auditPersonId;        // 审核人员ID
    private Date auditTime;        // 审核时间
    private String auditResult;        // 审核结论
    private String auditOpinion;        // 审核意见
    private User user;
    private String idCardInhand;        //手持身份证照片，相对路径
    private Integer inhandIsReject;    //手持身份证照片是否驳回（yes_no）
    private String inhandRejectReason;    //手持身份证驳回意见
    private String idCardFront;        //身份证正面照片，相对路径
    private Integer frontIsReject;    //正面身份证照片是否驳回（yes_no）
    private String frontRejectReason;    //正面身份证驳回意见
    private String idCardBack;        //身份证背面照片，相对路径
    private Integer backIsReject;        //背面身份证照片是否驳回（yes_no）
    private String backRejectReason;    //背面身份证驳回意见
    private Integer licenseIsReject;    //营业执照是否驳回(yes_no)
    private String licenseRejectReason;//驳回原因
    private String powerOfAttorney;        //企业委托书扫描件，相对路径
    private Integer attorneyIsReject;    //企业委托书是否通过（yes_no）
    private String attorneyRejectReason;//企业委托书驳回意见
    private Date submitTime;            //材料提交时间
    private String businessLicense;    //营业执照扫描件
    private Integer isEntLegalRep;    //代理人是否为法人（yes_no）

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public P2pAuditRecord() {
        super();
    }

    public P2pAuditRecord(String id) {
        super(id);
    }

    public Integer getAuditType() {
        return auditType;
    }

    public void setAuditType(Integer auditType) {
        this.auditType = auditType;
    }

    @Length(min = 0, max = 200, message = "认证ID，即用户身份认证表或企业认证表ID长度必须介于 0 和 200 之间")
    public String getReferenceId() {
        return referenceId;
    }

    public void setReferenceId(String referenceId) {
        this.referenceId = referenceId;
    }

    @Length(min = 0, max = 64, message = "审核人员ID长度必须介于 0 和 64 之间")
    public String getAuditPersonId() {
        return auditPersonId;
    }

    public void setAuditPersonId(String auditPersonId) {
        this.auditPersonId = auditPersonId;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    @Length(min = 0, max = 64, message = "审核结论长度必须介于 0 和 64 之间")
    public String getAuditResult() {
        return auditResult;
    }

    public void setAuditResult(String auditResult) {
        this.auditResult = auditResult;
    }

    @Length(min = 0, max = 64, message = "审核意见长度必须介于 0 和 64 之间")
    public String getAuditOpinion() {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion) {
        this.auditOpinion = auditOpinion;
    }

    public String getIdCardInhand() {
        return idCardInhand;
    }

    public void setIdCardInhand(String idCardInhand) {
        this.idCardInhand = idCardInhand;
    }

    public Integer getInhandIsReject() {
        return inhandIsReject;
    }

    public void setInhandIsReject(Integer inhandIsReject) {
        this.inhandIsReject = inhandIsReject;
    }


    public String getInhandRejectReason() {
        return inhandRejectReason;
    }

    public void setInhandRejectReason(String inhandRejectReason) {
        this.inhandRejectReason = inhandRejectReason;
    }

    public String getIdCardFront() {
        return idCardFront;
    }

    public void setIdCardFront(String idCardFront) {
        this.idCardFront = idCardFront;
    }

    public Integer getFrontIsReject() {
        return frontIsReject;
    }

    public void setFrontIsReject(Integer frontIsReject) {
        this.frontIsReject = frontIsReject;
    }

    public String getFrontRejectReason() {
        return frontRejectReason;
    }

    public void setFrontRejectReason(String frontRejectReason) {
        this.frontRejectReason = frontRejectReason;
    }

    public String getIdCardBack() {
        return idCardBack;
    }

    public void setIdCardBack(String idCardBack) {
        this.idCardBack = idCardBack;
    }

    public Integer getBackIsReject() {
        return backIsReject;
    }

    public void setBackIsReject(Integer backIsReject) {
        this.backIsReject = backIsReject;
    }

    public String getBackRejectReason() {
        return backRejectReason;
    }

    public void setBackRejectReason(String backRejectReason) {
        this.backRejectReason = backRejectReason;
    }

    public Integer getLicenseIsReject() {
        return licenseIsReject;
    }

    public void setLicenseIsReject(Integer licenseIsReject) {
        this.licenseIsReject = licenseIsReject;
    }

    public String getLicenseRejectReason() {
        return licenseRejectReason;
    }

    public void setLicenseRejectReason(String licenseRejectReason) {
        this.licenseRejectReason = licenseRejectReason;
    }

    public String getPowerOfAttorney() {
        return powerOfAttorney;
    }

    public void setPowerOfAttorney(String powerOfAttorney) {
        this.powerOfAttorney = powerOfAttorney;
    }

    public Integer getAttorneyIsReject() {
        return attorneyIsReject;
    }

    public void setAttorneyIsReject(Integer attorneyIsReject) {
        this.attorneyIsReject = attorneyIsReject;
    }

    public String getAttorneyRejectReason() {
        return attorneyRejectReason;
    }

    public void setAttorneyRejectReason(String attorneyRejectReason) {
        this.attorneyRejectReason = attorneyRejectReason;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }

    public String getBusinessLicense() {
        return businessLicense;
    }

    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense;
    }

    public Integer getIsEntLegalRep() {
        return isEntLegalRep;
    }

    public void setIsEntLegalRep(Integer isEntLegalRep) {
        this.isEntLegalRep = isEntLegalRep;
    }

}