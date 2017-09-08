/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.entity;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 注册用户的身份认证状态及材料Entity
 *
 * @author zhenghsuo
 * @version 2016-07-06
 */
public class P2pRegUserCertify extends DataEntity<P2pRegUserCertify> {

    private static final long serialVersionUID = 1L;
    private User user;        // 注册用户ID
    private String userId;
    private String realName;                // 真实姓名
    private String idNumber;                // 身份证号，仅支持大陆身份证
    private Integer autoCertifyState;        // 自动认证状态，姓名与身份证号是否匹配
    private String idCardInhand;            // 手持身份证照片，相对路径
    private Integer inhandIsReject;            //手持身份证照片是否驳回
    private String inhandRejectReason;        //手持身份证驳回意见
    private String idCardFront;                // 身份证正面照片，相对路径
    private Integer frontIsReject;            //正面身份证照片是否驳回
    private String frontRejectReason;        //正面身份证驳回意见
    private String idCardBack;                //身份证背面照片，相对路径
    private Integer backIsReject;            //背面身份证照片是否驳回
    private String backRejectReason;        //背面身份证驳回意见
    //private Integer isEntLegalRep;		// 是否为企业法人
    private String powerOfAttorney;            // 企业委托书扫描件，相对路径
    private Integer attorneyIsReject;        //企业委托书是否驳回
    private String attorneyRejectReason;    //企业委托书驳回意见
    private Date submitTime;                // 材料提交时间
    private Integer auditState;                // 身份认证审核状态：认证通过，认证不通过
    private String auditExplain;            // 认证状态审核说明
    private Date auditTime;                    // 审核时间
    private String auditPersonId;        // 审核人员ID
    /*private String enterpriseName;		// 企业名称
    private Integer isZhongjinReg;	//中金身份认证结果
	*/

    private String idCardInhandView;            // 手持身份证照片，相对路径
    private String idCardFrontView;                // 身份证正面照片，相对路径
    private String idCardBackView;                //身份证背面照片，相对路径
    private String powerOfAttorneyView;            // 企业委托书扫描件，相对路径

    public P2pRegUserCertify() {
        super();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public P2pRegUserCertify(String id) {
        super(id);
    }

    @NotNull(message = "注册用户ID不能为空")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 0, max = 64, message = "真实姓名长度必须介于 0 和 64 之间")
    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    @Length(min = 0, max = 18, message = "身份证号，仅支持大陆身份证长度必须介于 0 和 18 之间")
    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public Integer getAutoCertifyState() {
        return autoCertifyState;
    }

    public void setAutoCertifyState(Integer autoCertifyState) {
        this.autoCertifyState = autoCertifyState;
    }

    @Length(min = 0, max = 64, message = "手持身份证照片，相对路径长度必须介于 0 和 64 之间")
    public String getIdCardInhand() {
        return idCardInhand;
    }

    public void setIdCardInhand(String idCardInhand) {
        this.idCardInhand = idCardInhand;
    }

    @Length(min = 0, max = 64, message = "身份证正面照片，相对路径长度必须介于 0 和 64 之间")
    public String getIdCardFront() {
        return idCardFront;
    }

    public void setIdCardFront(String idCardFront) {
        this.idCardFront = idCardFront;
    }

    @Length(min = 0, max = 64, message = "身份证背面照片，相对路径长度必须介于 0 和 64 之间")
    public String getIdCardBack() {
        return idCardBack;
    }

    public void setIdCardBack(String idCardBack) {
        this.idCardBack = idCardBack;
    }

    @Length(min = 0, max = 64, message = "企业委托书扫描件，相对路径长度必须介于 0 和 64 之间")
    public String getPowerOfAttorney() {
        return powerOfAttorney;
    }

    public void setPowerOfAttorney(String powerOfAttorney) {
        this.powerOfAttorney = powerOfAttorney;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }

    public Integer getAuditState() {
        return auditState;
    }

    public void setAuditState(Integer auditState) {
        this.auditState = auditState;
    }

    @Length(min = 0, max = 255, message = "认证状态审核说明长度必须介于 0 和 255 之间")
    public String getAuditExplain() {
        return auditExplain;
    }

    public void setAuditExplain(String auditExplain) {
        this.auditExplain = auditExplain;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    @Length(min = 0, max = 64, message = "审核人员ID长度必须介于 0 和 64 之间")
    public String getAuditPersonId() {
        return auditPersonId;
    }

    public void setAuditPersonId(String auditPersonId) {
        this.auditPersonId = auditPersonId;
    }

	/*public String getEnterpriseName() {
		return enterpriseName;
	}

	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}*/

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

    public String getIdCardInhandView() {
        return idCardInhandView;
    }

    public void setIdCardInhandView(String idCardInhandView) {
        this.idCardInhandView = idCardInhandView;
    }

    public String getIdCardFrontView() {
        return idCardFrontView;
    }

    public void setIdCardFrontView(String idCardFrontView) {
        this.idCardFrontView = idCardFrontView;
    }

    public String getIdCardBackView() {
        return idCardBackView;
    }

    public void setIdCardBackView(String idCardBackView) {
        this.idCardBackView = idCardBackView;
    }

    public String getPowerOfAttorneyView() {
        return powerOfAttorneyView;
    }

    public void setPowerOfAttorneyView(String powerOfAttorneyView) {
        this.powerOfAttorneyView = powerOfAttorneyView;
    }

	/*public Integer getIsZhongjinReg() {
		return isZhongjinReg;
	}

	public void setIsZhongjinReg(Integer isZhongjinReg) {
		this.isZhongjinReg = isZhongjinReg;
	}*/

}