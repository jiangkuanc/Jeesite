package com.dagongsoft.p2p.user.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 担保公司表Entity
 *
 * @author Zeus
 * @version 2016-12-21
 */
public class P2pGuarantee extends DataEntity<P2pGuarantee> {

    private static final long serialVersionUID = 1L;
    private String userId;        // user_id
    private String isCertify;        // 是否认证(yes_no)
    private String name;        // 公司名称
    private String phone;        // 公司电话
    private String address;        // 注册地址
    private String addressDetail;        // 公司详细地址
    private String businessScope;        // 业务范围
    private Double guaranteeLimit;        // 担保限额
    private Double guaranteeAmount;        // 可担保额度
    private Double guaranteeProportion;        // 可担保债项比例
    private String introduce;        // 公司简介
    private String webSite;        // 公司网址
    private String cooperationPlan;        // 战略合作协议
    private String businessLicense;        // 营业执照（扫描件）
    private String legalPersonIdcard;        // 法人身份证（扫描件）
    private String dockingSex;        // 对接人性别
    private String dockingDepartment;        // 对接人部门
    private String dockingJob;        // 对接人职位
    private String dockingIdscanning;        // 对接人身份证（扫描件）

    private User user;

    public P2pGuarantee() {
        super();
    }

    public P2pGuarantee(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "user_id长度必须介于 0 和 64 之间")
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Length(min = 0, max = 64, message = "是否认证(yes_no)长度必须介于 0 和 64 之间")
    public String getIsCertify() {
        return isCertify;
    }

    public void setIsCertify(String isCertify) {
        this.isCertify = isCertify;
    }

    @Length(min = 0, max = 64, message = "公司名称长度必须介于 0 和 64 之间")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Length(min = 0, max = 64, message = "公司电话长度必须介于 0 和 64 之间")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Length(min = 0, max = 200, message = "注册地址长度必须介于 0 和 200 之间")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Length(min = 0, max = 200, message = "公司详细地址长度必须介于 0 和 200 之间")
    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    @Length(min = 0, max = 200, message = "业务范围长度必须介于 0 和 200 之间")
    public String getBusinessScope() {
        return businessScope;
    }

    public void setBusinessScope(String businessScope) {
        this.businessScope = businessScope;
    }

    public Double getGuaranteeLimit() {
        return guaranteeLimit;
    }

    public void setGuaranteeLimit(Double guaranteeLimit) {
        this.guaranteeLimit = guaranteeLimit;
    }

    public Double getGuaranteeAmount() {
        return guaranteeAmount;
    }

    public void setGuaranteeAmount(Double guaranteeAmount) {
        this.guaranteeAmount = guaranteeAmount;
    }

    public Double getGuaranteeProportion() {
        return guaranteeProportion;
    }

    public void setGuaranteeProportion(Double guaranteeProportion) {
        this.guaranteeProportion = guaranteeProportion;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    @Length(min = 0, max = 64, message = "公司网址长度必须介于 0 和 64 之间")
    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }

    @Length(min = 0, max = 128, message = "战略合作协议长度必须介于 0 和 128 之间")
    public String getCooperationPlan() {
        return cooperationPlan;
    }

    public void setCooperationPlan(String cooperationPlan) {
        this.cooperationPlan = cooperationPlan;
    }

    @Length(min = 0, max = 128, message = "营业执照（扫描件）长度必须介于 0 和 128 之间")
    public String getBusinessLicense() {
        return businessLicense;
    }

    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense;
    }

    @Length(min = 0, max = 128, message = "法人身份证（扫描件）长度必须介于 0 和 128 之间")
    public String getLegalPersonIdcard() {
        return legalPersonIdcard;
    }

    public void setLegalPersonIdcard(String legalPersonIdcard) {
        this.legalPersonIdcard = legalPersonIdcard;
    }

    @Length(min = 0, max = 64, message = "对接人性别长度必须介于 0 和 64 之间")
    public String getDockingSex() {
        return dockingSex;
    }

    public void setDockingSex(String dockingSex) {
        this.dockingSex = dockingSex;
    }

    @Length(min = 0, max = 64, message = "对接人部门长度必须介于 0 和 64 之间")
    public String getDockingDepartment() {
        return dockingDepartment;
    }

    public void setDockingDepartment(String dockingDepartment) {
        this.dockingDepartment = dockingDepartment;
    }

    @Length(min = 0, max = 64, message = "对接人职位长度必须介于 0 和 64 之间")
    public String getDockingJob() {
        return dockingJob;
    }

    public void setDockingJob(String dockingJob) {
        this.dockingJob = dockingJob;
    }

    @Length(min = 0, max = 128, message = "对接人身份证（扫描件）长度必须介于 0 和 128 之间")
    public String getDockingIdscanning() {
        return dockingIdscanning;
    }

    public void setDockingIdscanning(String dockingIdscanning) {
        this.dockingIdscanning = dockingIdscanning;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}