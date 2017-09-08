/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.entity;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.dagongsoft.p2p.creditmanage.entity.CreditOverdueInfo;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 注册用户绑定企业，需进行企业认证Entity
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
public class P2pEnterpriseCertify extends DataEntity<P2pEnterpriseCertify> {

    private static final long serialVersionUID = 1L;
    private User user;        // 注册用户ID
    private String userId;
    private String unitType;        // 单位类型：个体工商户、企业
    private Integer certificateType;        // 证件类型：0-普通营业执照、1-多证合一营业执照
    private String unifiedSocialCreditCode;        // 统一社会信用代码(营业执照注册号)
    private Date companyFoundDate;    //公司成立日期
    private String organizationCode;        // 组织机构代码
    private String taxRegistrationNum;        // 税务登记证号
    private String enterpriseName;        // 企业名称
    private String certificateLocation;        // 证照所在地，字典，省级区域
    private Date operationPeriod;        // 营业期限，(年月日)，如为(长期)，此字段为空
    private String isLongTerm;        // 营业期限是否为长期
    private String registeredAddress;        // 注册地址
    private String registeredCapital;        // 注册资金
    private String telephoneNum;        // 联系电话
    private String businessScope;        // 营业范围
    private String businessLicense;        // 营业执照副本扫描件，相对路径
    private Integer licenseIsReject;    //营业执照扫描件是否驳回
    private String licenseRejectReason;    //营业执照扫描件驳回原因
    private String faxNum;        //传真号码
    private Integer isEntLegalRep;        // 代理人是否为法人，如不是，则需提供代理人身份信息
    private String nameOf;        // 企业法人姓名
    private String idNumberOf;        // 企业法人身份证号码
    private String idCardFront;        // 企业法人身份证正面，路径
    private Integer frontIsReject;    //企业法人身份证正面是否驳回
    private String frontRejectReason;    //企业法人身份证正面驳回原因
    private String idCardBack;        // 企业法人身份证背面，路径
    private Integer backIsReject;    //企业法人身份证背面是否驳回
    private String backRejectReason;    //企业法人身份证背面驳回原因
    private String telephoneNumOf;        // 企业法人联系电话
    private Date submitTime;        // 材料提交时间
    private Integer auditState;        // 认证审核状态
    private String auditExplain;        // 状态说明
    private Date auditTime;        // 材料提交时间
    private String auditPersonId;        // 审核人员编号

    private String enterpriseScale;        // 企业规模，字典项，以员工数量为维度，如：50人以下、50人-100人
    private String enterpriseNature;        // 企业性质，字典项，如：合资企业、独资企业、国有企业、私营企业等
    private String industryCode;        // 所属行业代码，使用标准国民经济行业分类
    private String govAreaCode;        // 所属地区代码，使用国家行政区域代码
    private String provincialArea;        // 所在地--省级
    private String municipalArea;        // 所在地--市级
    private String countyArea;        // 所在地--县级
    private String realCapital;            //实缴资本
    private String businessArea;            //经营区域

    private String registrationAuthority;    //营业执照登记机关0209
    private Integer registrationState;        //营业执照登记状态0209
    private Date quasiNuclearDate;            //营业执照准核日期0209
    private Integer isOffshoreTransaction;    //是否存在境外交易0209

    private List<CreditOverdueInfo> dagongList; //大公一带一路平台信用记录
    private List<CreditOverdueInfo> bankList;  //银行信贷信息信用记录
    private List<CreditOverdueInfo> otherList;  //其他借款平台信用记录

    private P2pUserInformation p2pUserInformation;
    private P2pFinancingInformation p2pFinancingInformation;
    private P2pRegUserCertify p2pRegUserCertify;
    private P2pIndustryclassi p2pIndustryclassi;
    private P2pRatingServiceInfo p2pRatingServiceInfo;
    private P2pFinancingRatingInfo p2pFinancingRatingInfo;

    private String unifiedSocialCreditCode2;//统一社会信用代码（用于修改校验）
    private String organizationCode2;        // 组织机构代码（用于修改校验）
    private String taxRegistrationNum2;        // 税务登记证号（用于修改校验）

    private String businessLicenseView;        // 营业执照副本扫描件，相对路径
    private String idCardFrontView;        // 企业法人身份证正面，路径
    private String idCardBackView;        // 企业法人身份证背面，路径

    private String phoneNumber;

    public List<CreditOverdueInfo> getBankList() {
        return bankList;
    }

    public void setBankList(List<CreditOverdueInfo> bankList) {
        this.bankList = bankList;
    }

    public List<CreditOverdueInfo> getDagongList() {
        return dagongList;
    }

    public void setDagongList(List<CreditOverdueInfo> dagongList) {
        this.dagongList = dagongList;
    }

    public List<CreditOverdueInfo> getOtherList() {
        return otherList;
    }

    public void setOtherList(List<CreditOverdueInfo> otherList) {
        this.otherList = otherList;
    }

    public P2pFinancingRatingInfo getP2pFinancingRatingInfo() {
        return p2pFinancingRatingInfo;
    }

    public void setP2pFinancingRatingInfo(
            P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        this.p2pFinancingRatingInfo = p2pFinancingRatingInfo;
    }

    public P2pRatingServiceInfo getP2pRatingServiceInfo() {
        return p2pRatingServiceInfo;
    }

    public void setP2pRatingServiceInfo(P2pRatingServiceInfo p2pRatingServiceInfo) {
        this.p2pRatingServiceInfo = p2pRatingServiceInfo;
    }

    public String getRealCapital() {
        return realCapital;
    }

    public void setRealCapital(String realCapital) {
        this.realCapital = realCapital;
    }

    public String getBusinessArea() {
        return businessArea;
    }

    public void setBusinessArea(String businessArea) {
        this.businessArea = businessArea;
    }

    public String getEnterpriseScale() {
        return enterpriseScale;
    }

    public void setEnterpriseScale(String enterpriseScale) {
        this.enterpriseScale = enterpriseScale;
    }

    public String getEnterpriseNature() {
        return enterpriseNature;
    }

    public void setEnterpriseNature(String enterpriseNature) {
        this.enterpriseNature = enterpriseNature;
    }

    public String getIndustryCode() {
        return industryCode;
    }

    public void setIndustryCode(String industryCode) {
        this.industryCode = industryCode;
    }

    public String getGovAreaCode() {
        return govAreaCode;
    }

    public void setGovAreaCode(String govAreaCode) {
        this.govAreaCode = govAreaCode;
    }

    public String getProvincialArea() {
        return provincialArea;
    }

    public void setProvincialArea(String provincialArea) {
        this.provincialArea = provincialArea;
    }

    public String getMunicipalArea() {
        return municipalArea;
    }

    public void setMunicipalArea(String municipalArea) {
        this.municipalArea = municipalArea;
    }

    public String getCountyArea() {
        return countyArea;
    }

    public void setCountyArea(String countyArea) {
        this.countyArea = countyArea;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public P2pRegUserCertify getP2pRegUserCertify() {
        return p2pRegUserCertify;
    }

    public void setP2pRegUserCertify(P2pRegUserCertify p2pRegUserCertify) {
        this.p2pRegUserCertify = p2pRegUserCertify;
    }

    public P2pUserInformation getP2pUserInformation() {
        return p2pUserInformation;
    }

    public void setP2pUserInformation(P2pUserInformation p2pUserInformation) {
        this.p2pUserInformation = p2pUserInformation;
    }

    public P2pFinancingInformation getP2pFinancingInformation() {
        return p2pFinancingInformation;
    }

    public void setP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation) {
        this.p2pFinancingInformation = p2pFinancingInformation;
    }

    public P2pEnterpriseCertify() {
        super();
    }

    public P2pEnterpriseCertify(String id) {
        super(id);
    }

    @NotNull(message = "注册用户ID不能为空")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 0, max = 32, message = "单位类型：个体工商户、企业长度必须介于 0 和 32 之间")
    public String getUnitType() {
        return unitType;
    }

    public void setUnitType(String unitType) {
        this.unitType = unitType;
    }

    public Integer getCertificateType() {
        return certificateType;
    }

    public void setCertificateType(Integer certificateType) {
        this.certificateType = certificateType;
    }

    @Length(min = 0, max = 32, message = "统一社会信用代码(营业执照注册号)长度必须介于 0 和 32 之间")
    public String getUnifiedSocialCreditCode() {
        return unifiedSocialCreditCode;
    }

    public void setUnifiedSocialCreditCode(String unifiedSocialCreditCode) {
        this.unifiedSocialCreditCode = unifiedSocialCreditCode;
    }

    @Length(min = 0, max = 32, message = "组织机构代码长度必须介于 0 和 32 之间")
    public String getOrganizationCode() {
        return organizationCode;
    }

    public void setOrganizationCode(String organizationCode) {
        this.organizationCode = organizationCode;
    }

    @Length(min = 0, max = 32, message = "税务登记证号长度必须介于 0 和 32 之间")
    public String getTaxRegistrationNum() {
        return taxRegistrationNum;
    }

    public void setTaxRegistrationNum(String taxRegistrationNum) {
        this.taxRegistrationNum = taxRegistrationNum;
    }

    @Length(min = 0, max = 64, message = "企业名称长度必须介于 0 和 64 之间")
    public String getEnterpriseName() {
        return enterpriseName;
    }

    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    @Length(min = 0, max = 32, message = "证照所在地，字典，省级区域长度必须介于 0 和 32 之间")
    public String getCertificateLocation() {
        return certificateLocation;
    }

    public void setCertificateLocation(String certificateLocation) {
        this.certificateLocation = certificateLocation;
    }

    public Date getOperationPeriod() {
        return operationPeriod;
    }

    public void setOperationPeriod(Date operationPeriod) {
        this.operationPeriod = operationPeriod;
    }

    public String getIsLongTerm() {
        return isLongTerm;
    }

    public void setIsLongTerm(String isLongTerm) {
        this.isLongTerm = isLongTerm;
    }

    @Length(min = 0, max = 128, message = "注册地址长度必须介于 0 和 128 之间")
    public String getRegisteredAddress() {
        return registeredAddress;
    }

    public void setRegisteredAddress(String registeredAddress) {
        this.registeredAddress = registeredAddress;
    }

    @Length(min = 0, max = 64, message = "注册资金长度必须介于 0 和 64 之间")
    public String getRegisteredCapital() {
        return registeredCapital;
    }

    public void setRegisteredCapital(String registeredCapital) {
        this.registeredCapital = registeredCapital;
    }

    @Length(min = 0, max = 32, message = "联系电话长度必须介于 0 和 32 之间")
    public String getTelephoneNum() {
        return telephoneNum;
    }

    public void setTelephoneNum(String telephoneNum) {
        this.telephoneNum = telephoneNum;
    }

    public String getBusinessScope() {
        return businessScope;
    }

    public void setBusinessScope(String businessScope) {
        this.businessScope = businessScope;
    }

    @Length(min = 0, max = 64, message = "营业执照副本扫描件，相对路径长度必须介于 0 和 64 之间")
    public String getBusinessLicense() {
        return businessLicense;
    }

    public String getFaxNum() {
        return faxNum;
    }

    public void setFaxNum(String faxNum) {
        this.faxNum = faxNum;
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

    @Length(min = 0, max = 64, message = "企业法人姓名长度必须介于 0 和 64 之间")
    public String getNameOf() {
        return nameOf;
    }

    public void setNameOf(String nameOf) {
        this.nameOf = nameOf;
    }

    @Length(min = 0, max = 18, message = "企业法人身份证号码长度必须介于 0 和 18 之间")
    public String getIdNumberOf() {
        return idNumberOf;
    }

    public void setIdNumberOf(String idNumberOf) {
        this.idNumberOf = idNumberOf;
    }

    @Length(min = 0, max = 64, message = "企业法人身份证正面，路径长度必须介于 0 和 64 之间")
    public String getIdCardFront() {
        return idCardFront;
    }

    public void setIdCardFront(String idCardFront) {
        this.idCardFront = idCardFront;
    }

    @Length(min = 0, max = 64, message = "企业法人身份证背面，路径长度必须介于 0 和 64 之间")
    public String getIdCardBack() {
        return idCardBack;
    }

    public void setIdCardBack(String idCardBack) {
        this.idCardBack = idCardBack;
    }

    @Length(min = 0, max = 64, message = "企业法人联系电话长度必须介于 0 和 64 之间")
    public String getTelephoneNumOf() {
        return telephoneNumOf;
    }

    public void setTelephoneNumOf(String telephoneNumOf) {
        this.telephoneNumOf = telephoneNumOf;
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

    @Length(min = 0, max = 255, message = "状态说明长度必须介于 0 和 255 之间")
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

    @Length(min = 0, max = 64, message = "审核人员编号长度必须介于 0 和 64 之间")
    public String getAuditPersonId() {
        return auditPersonId;
    }

    public void setAuditPersonId(String auditPersonId) {
        this.auditPersonId = auditPersonId;
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

    public Date getCompanyFoundDate() {
        return companyFoundDate;
    }

    public void setCompanyFoundDate(Date companyFoundDate) {
        this.companyFoundDate = companyFoundDate;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public P2pIndustryclassi getP2pIndustryclassi() {
        return p2pIndustryclassi;
    }

    public void setP2pIndustryclassi(P2pIndustryclassi p2pIndustryclassi) {
        this.p2pIndustryclassi = p2pIndustryclassi;
    }

    public String getRegistrationAuthority() {
        return registrationAuthority;
    }

    public void setRegistrationAuthority(String registrationAuthority) {
        this.registrationAuthority = registrationAuthority;
    }

    public Integer getRegistrationState() {
        return registrationState;
    }

    public void setRegistrationState(Integer registrationState) {
        this.registrationState = registrationState;
    }

    public Date getQuasiNuclearDate() {
        return quasiNuclearDate;
    }

    public void setQuasiNuclearDate(Date quasiNuclearDate) {
        this.quasiNuclearDate = quasiNuclearDate;
    }

    public Integer getIsOffshoreTransaction() {
        return isOffshoreTransaction;
    }

    public void setIsOffshoreTransaction(Integer isOffshoreTransaction) {
        this.isOffshoreTransaction = isOffshoreTransaction;
    }

    public String getOrganizationCode2() {
        return organizationCode2;
    }

    public void setOrganizationCode2(String organizationCode2) {
        this.organizationCode2 = organizationCode2;
    }

    public String getTaxRegistrationNum2() {
        return taxRegistrationNum2;
    }

    public void setTaxRegistrationNum2(String taxRegistrationNum2) {
        this.taxRegistrationNum2 = taxRegistrationNum2;
    }

    public String getUnifiedSocialCreditCode2() {
        return unifiedSocialCreditCode2;
    }

    public void setUnifiedSocialCreditCode2(String unifiedSocialCreditCode2) {
        this.unifiedSocialCreditCode2 = unifiedSocialCreditCode2;
    }

    public String getBusinessLicenseView() {
        return businessLicenseView;
    }

    public void setBusinessLicenseView(String businessLicenseView) {
        this.businessLicenseView = businessLicenseView;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }


}