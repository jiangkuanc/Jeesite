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
 * 用户信息表Entity
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
public class P2pUserInformation extends DataEntity<P2pUserInformation> {

    private static final long serialVersionUID = 1L;
    private User user;        // 用户id
    private Integer userBodyType;        // 主体类型
    private String userpic;        // 头像
    private Date regTime;        // 注册时间
    private Integer certificateState;        // 用户认证状态
    private Integer lockState;        // 用户账号锁定状态
    private Date lockTime;        // 用户账号锁定时间
    private Integer isBindBankCard;//是否绑定银行卡(yes_no)
    private String companyAddress;//公司详细地址（机构专属字段）
    private String cooperationPlan;//战略合作方案扫描件（机构专属字段）
    private String businessLicense;//营业执照扫描件（机构专属字段）
    private String legalPersonIdcard;//法人身份证扫描件（机构专属字段）
    private String dockingSex;//对接人性别（机构专属字段）(sex)
    private String dockingDepartment;//对接人部门（机构专属字段）
    private String dockingJob;//对接人职位（机构专属字段）
    private String dockingIdscanning;//对接人身份证扫描件（机构专属字段）
    private String userFrom; //用户来源（机构专属字段）
    private String bankname;        // 机构名称
    private String bankaddress;        // 机构地址
    private String contactName;        //联系人姓名
    private String contactPhone;    //联系人电话
    private String contactPost;        //联系人邮编
    private String contactAddress;    //联系人地址
    private P2pRegUserCertify p2pRegUserCertify;

    public P2pRegUserCertify getP2pRegUserCertify() {
        return p2pRegUserCertify;
    }

    public void setP2pRegUserCertify(P2pRegUserCertify p2pRegUserCertify) {
        this.p2pRegUserCertify = p2pRegUserCertify;
    }

    public P2pUserInformation() {
        super();
    }

    public P2pUserInformation(String id) {
        super(id);
    }

    @NotNull(message = "用户id不能为空")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @NotNull(message = "主体类型不能为空")
    public Integer getUserBodyType() {
        return userBodyType;
    }

    public void setUserBodyType(Integer userBodyType) {
        this.userBodyType = userBodyType;
    }

    @Length(min = 0, max = 64, message = "头像长度必须介于 0 和 64 之间")
    public String getUserpic() {
        return userpic;
    }

    public void setUserpic(String userpic) {
        this.userpic = userpic;
    }

    @NotNull(message = "注册时间不能为空")
    public Date getRegTime() {
        return regTime;
    }

    public void setRegTime(Date regTime) {
        this.regTime = regTime;
    }

    public Integer getCertificateState() {
        return certificateState;
    }

    public void setCertificateState(Integer certificateState) {
        this.certificateState = certificateState;
    }

    @NotNull(message = "用户账号锁定状态不能为空")
    public Integer getLockState() {
        return lockState;
    }

    public void setLockState(Integer lockState) {
        this.lockState = lockState;
    }

    public Date getLockTime() {
        return lockTime;
    }

    public void setLockTime(Date lockTime) {
        this.lockTime = lockTime;
    }

    @Length(min = 0, max = 64, message = "bankname长度必须介于 0 和 64 之间")
    public String getBankname() {
        return bankname;
    }

    public void setBankname(String bankname) {
        this.bankname = bankname;
    }

    @Length(min = 0, max = 200, message = "bankaddress长度必须介于 0 和 200 之间")
    public String getBankaddress() {
        return bankaddress;
    }

    public void setBankaddress(String bankaddress) {
        this.bankaddress = bankaddress;
    }

    public Integer getIsBindBankCard() {
        return isBindBankCard;
    }

    public void setIsBindBankCard(Integer isBindBankCard) {
        this.isBindBankCard = isBindBankCard;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getCooperationPlan() {
        return cooperationPlan;
    }

    public void setCooperationPlan(String cooperationPlan) {
        this.cooperationPlan = cooperationPlan;
    }

    public String getBusinessLicense() {
        return businessLicense;
    }

    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense;
    }

    public String getLegalPersonIdcard() {
        return legalPersonIdcard;
    }

    public void setLegalPersonIdcard(String legalPersonIdcard) {
        this.legalPersonIdcard = legalPersonIdcard;
    }

    public String getDockingSex() {
        return dockingSex;
    }

    public void setDockingSex(String dockingSex) {
        this.dockingSex = dockingSex;
    }

    public String getDockingDepartment() {
        return dockingDepartment;
    }

    public void setDockingDepartment(String dockingDepartment) {
        this.dockingDepartment = dockingDepartment;
    }

    public String getDockingJob() {
        return dockingJob;
    }

    public void setDockingJob(String dockingJob) {
        this.dockingJob = dockingJob;
    }

    public String getDockingIdscanning() {
        return dockingIdscanning;
    }

    public void setDockingIdscanning(String dockingIdscanning) {
        this.dockingIdscanning = dockingIdscanning;
    }

    public String getUserFrom() {
        return userFrom;
    }

    public void setUserFrom(String userFrom) {
        this.userFrom = userFrom;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getContactPost() {
        return contactPost;
    }

    public void setContactPost(String contactPost) {
        this.contactPost = contactPost;
    }

    public String getContactAddress() {
        return contactAddress;
    }

    public void setContactAddress(String contactAddress) {
        this.contactAddress = contactAddress;
    }


}