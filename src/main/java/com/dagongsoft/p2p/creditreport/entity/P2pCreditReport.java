package com.dagongsoft.p2p.creditreport.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 企业信用报告表Entity
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
public class P2pCreditReport extends DataEntity<P2pCreditReport> {

    private static final long serialVersionUID = 1L;
    private User user;        // 注册用户ID
    private String userId;
    private String enterpriseName;        // 企业名称
    private String enterpriseType;        // 企业类型(enterprise_type)（融资、投资、担保）
    private String industryCode;        // 所属行业
    private String enterpriseIntroduce;        // 企业介绍
    private String isDelete;        // 是否删除(yes_no)
    private Date reportTime;        // 报告时间
    private String ratingLevel;        // 评级等级(rating_level)
    private Date ratingTime;        // 评级时间
    private String ratingDefinition;        // 评级释义
    private String unifiedSocialCreditCode;        // 统一社会信用代码
    private String usccIsCommit;        // 统一社会信用代码是否提交(yes_no)
    private String organizationCode;        // 组织机构代码
    private String ocIsCommit;        // 组织机构代码是否提交（yes_no）
    private String gongshangRegistNum;        // 工商注册号
    private String grnIsCommit;        // 工商注册号是否提交(yes_no)
    private String taxRegistrationNum;        // 税务登记代码
    private String trnIsCommit;        // 税务登记代码是否提交(yes_no)
    private String legalName;    //法人姓名
    private String legalIsChange;        // 法人是否有变更(yes_no)
    private String registeredCapital;    //注册资本
    private String registeredCapitalIsChange;        // 注册资本是否有变更(yes_no)
    private String enterpriseBaseInfoComment;        // 企业基本信息注释
    private String governmentRegulationInfoComment;        // 政府监管信息注释
    private String financialCreditInfoComment;        // 金融信贷信息注释
    private String industryEvaluationInfoComment;        // 行业评价信息注释
    private String mediaEvaluationInfoComment;        // 媒体评价信息注释
    private String enterpriseOperationInfoComment;        // 企业运营信息注释
    private String marketFeedbackInfoComment;        // 市场反馈信息注释

    private P2pIndustryclassi p2pIndustryclassi;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public P2pCreditReport() {
        super();
    }

    public P2pCreditReport(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 0, max = 64, message = "企业名称长度必须介于 0 和 64 之间")
    public String getEnterpriseName() {
        return enterpriseName;
    }

    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    @Length(min = 0, max = 64, message = "企业类型(enterprise_type)（融资、投资、担保）长度必须介于 0 和 64 之间")
    public String getEnterpriseType() {
        return enterpriseType;
    }

    public void setEnterpriseType(String enterpriseType) {
        this.enterpriseType = enterpriseType;
    }

    @Length(min = 0, max = 64, message = "所属行业长度必须介于 0 和 64 之间")
    public String getIndustryCode() {
        return industryCode;
    }

    public void setIndustryCode(String industryCode) {
        this.industryCode = industryCode;
    }

    public String getEnterpriseIntroduce() {
        return enterpriseIntroduce;
    }

    public void setEnterpriseIntroduce(String enterpriseIntroduce) {
        this.enterpriseIntroduce = enterpriseIntroduce;
    }

    @Length(min = 0, max = 64, message = "是否删除(yes_no)长度必须介于 0 和 64 之间")
    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    @Length(min = 0, max = 64, message = "评级等级(rating_level)长度必须介于 0 和 64 之间")
    public String getRatingLevel() {
        return ratingLevel;
    }

    public void setRatingLevel(String ratingLevel) {
        this.ratingLevel = ratingLevel;
    }

    public Date getRatingTime() {
        return ratingTime;
    }

    public void setRatingTime(Date ratingTime) {
        this.ratingTime = ratingTime;
    }

    public String getRatingDefinition() {
        return ratingDefinition;
    }

    public void setRatingDefinition(String ratingDefinition) {
        this.ratingDefinition = ratingDefinition;
    }

    @Length(min = 0, max = 32, message = "统一社会信用代码长度必须介于 0 和 32 之间")
    public String getUnifiedSocialCreditCode() {
        return unifiedSocialCreditCode;
    }

    public void setUnifiedSocialCreditCode(String unifiedSocialCreditCode) {
        this.unifiedSocialCreditCode = unifiedSocialCreditCode;
    }

    @Length(min = 0, max = 64, message = "统一社会信用代码是否提交(yes_no)长度必须介于 0 和 64 之间")
    public String getUsccIsCommit() {
        return usccIsCommit;
    }

    public void setUsccIsCommit(String usccIsCommit) {
        this.usccIsCommit = usccIsCommit;
    }

    @Length(min = 0, max = 32, message = "组织机构代码长度必须介于 0 和 32 之间")
    public String getOrganizationCode() {
        return organizationCode;
    }

    public void setOrganizationCode(String organizationCode) {
        this.organizationCode = organizationCode;
    }

    @Length(min = 0, max = 64, message = "组织机构代码是否提交（yes_no）长度必须介于 0 和 64 之间")
    public String getOcIsCommit() {
        return ocIsCommit;
    }

    public void setOcIsCommit(String ocIsCommit) {
        this.ocIsCommit = ocIsCommit;
    }

    @Length(min = 0, max = 32, message = "工商注册号长度必须介于 0 和 32 之间")
    public String getGongshangRegistNum() {
        return gongshangRegistNum;
    }

    public void setGongshangRegistNum(String gongshangRegistNum) {
        this.gongshangRegistNum = gongshangRegistNum;
    }

    @Length(min = 0, max = 64, message = "工商注册号是否提交(yes_no)长度必须介于 0 和 64 之间")
    public String getGrnIsCommit() {
        return grnIsCommit;
    }

    public void setGrnIsCommit(String grnIsCommit) {
        this.grnIsCommit = grnIsCommit;
    }

    @Length(min = 0, max = 32, message = "税务登记代码长度必须介于 0 和 32 之间")
    public String getTaxRegistrationNum() {
        return taxRegistrationNum;
    }

    public void setTaxRegistrationNum(String taxRegistrationNum) {
        this.taxRegistrationNum = taxRegistrationNum;
    }

    @Length(min = 0, max = 64, message = "税务登记代码是否提交(yes_no)长度必须介于 0 和 64 之间")
    public String getTrnIsCommit() {
        return trnIsCommit;
    }

    public void setTrnIsCommit(String trnIsCommit) {
        this.trnIsCommit = trnIsCommit;
    }

    @Length(min = 0, max = 64, message = "法人是否有变更(yes_no)长度必须介于 0 和 64 之间")
    public String getLegalIsChange() {
        return legalIsChange;
    }

    public void setLegalIsChange(String legalIsChange) {
        this.legalIsChange = legalIsChange;
    }

    @Length(min = 0, max = 64, message = "注册资本是否有变更(yes_no)长度必须介于 0 和 64 之间")
    public String getRegisteredCapitalIsChange() {
        return registeredCapitalIsChange;
    }

    public void setRegisteredCapitalIsChange(String registeredCapitalIsChange) {
        this.registeredCapitalIsChange = registeredCapitalIsChange;
    }

    @Length(min = 0, max = 200, message = "企业基本信息注释长度必须介于 0 和 200 之间")
    public String getEnterpriseBaseInfoComment() {
        return enterpriseBaseInfoComment;
    }

    public void setEnterpriseBaseInfoComment(String enterpriseBaseInfoComment) {
        this.enterpriseBaseInfoComment = enterpriseBaseInfoComment;
    }

    @Length(min = 0, max = 200, message = "政府监管信息注释长度必须介于 0 和 200 之间")
    public String getGovernmentRegulationInfoComment() {
        return governmentRegulationInfoComment;
    }

    public void setGovernmentRegulationInfoComment(String governmentRegulationInfoComment) {
        this.governmentRegulationInfoComment = governmentRegulationInfoComment;
    }

    @Length(min = 0, max = 200, message = "金融信贷信息注释长度必须介于 0 和 200 之间")
    public String getFinancialCreditInfoComment() {
        return financialCreditInfoComment;
    }

    public void setFinancialCreditInfoComment(String financialCreditInfoComment) {
        this.financialCreditInfoComment = financialCreditInfoComment;
    }

    @Length(min = 0, max = 200, message = "行业评价信息注释长度必须介于 0 和 200 之间")
    public String getIndustryEvaluationInfoComment() {
        return industryEvaluationInfoComment;
    }

    public void setIndustryEvaluationInfoComment(String industryEvaluationInfoComment) {
        this.industryEvaluationInfoComment = industryEvaluationInfoComment;
    }

    @Length(min = 0, max = 200, message = "媒体评价信息注释长度必须介于 0 和 200 之间")
    public String getMediaEvaluationInfoComment() {
        return mediaEvaluationInfoComment;
    }

    public void setMediaEvaluationInfoComment(String mediaEvaluationInfoComment) {
        this.mediaEvaluationInfoComment = mediaEvaluationInfoComment;
    }

    @Length(min = 0, max = 200, message = "企业运营信息注释长度必须介于 0 和 200 之间")
    public String getEnterpriseOperationInfoComment() {
        return enterpriseOperationInfoComment;
    }

    public void setEnterpriseOperationInfoComment(String enterpriseOperationInfoComment) {
        this.enterpriseOperationInfoComment = enterpriseOperationInfoComment;
    }

    @Length(min = 0, max = 200, message = "市场反馈信息注释长度必须介于 0 和 200 之间")
    public String getMarketFeedbackInfoComment() {
        return marketFeedbackInfoComment;
    }

    public void setMarketFeedbackInfoComment(String marketFeedbackInfoComment) {
        this.marketFeedbackInfoComment = marketFeedbackInfoComment;
    }

    public String getLegalName() {
        return legalName;
    }

    public void setLegalName(String legalName) {
        this.legalName = legalName;
    }

    public String getRegisteredCapital() {
        return registeredCapital;
    }

    public void setRegisteredCapital(String registeredCapital) {
        this.registeredCapital = registeredCapital;
    }

    public P2pIndustryclassi getP2pIndustryclassi() {
        return p2pIndustryclassi;
    }

    public void setP2pIndustryclassi(P2pIndustryclassi p2pIndustryclassi) {
        this.p2pIndustryclassi = p2pIndustryclassi;
    }


}