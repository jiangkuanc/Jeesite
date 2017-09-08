package com.dagongsoft.p2p.financing.entity;

import java.math.BigDecimal;
import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.user.entity.P2pAssetValuation;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 资产评估记录Entity
 *
 * @author Sora
 * @version 2016-11-08
 */
public class P2pAssetValuationRecord extends DataEntity<P2pAssetValuationRecord> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息id
    private String assetCompanyId;        // 评估公司编号
    private BigDecimal assetValuation;        // 资产评估额
    private String assessmentReport;        // 评估报告
    private String assessmentReportName;        // 评估报告名
    private String evaluationContract;        // 评估合同
    private String evaluationContractName;        // 评估合同名
    private Date commitTime;        // 提交时间
    private String isReject;        // 是否通过（yes_no）
    private String rejectPerson;        // 操作人
    private String rejectReason;        // 原因
    private Date rejectTime;        // 操作时间

    private P2pBeforeMatchDebtState p2pBeforeMatchDebtState;
    private P2pEnterpriseCertify p2pEnterpriseCertify;
    private P2pAssetValuation p2pAssetValuation;
    private P2pFinancingInformation p2pFinancingInformation;

    public P2pAssetValuationRecord() {
        super();
    }

    public P2pAssetValuationRecord(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "融资信息id长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 10, message = "评估公司编号长度必须介于 0 和 10 之间")
    public String getAssetCompanyId() {
        return assetCompanyId;
    }

    public void setAssetCompanyNum(String assetCompanyId) {
        this.assetCompanyId = assetCompanyId;
    }

    public BigDecimal getAssetValuation() {
        return assetValuation;
    }

    public void setAssetValuation(BigDecimal assetValuation) {
        this.assetValuation = assetValuation;
    }

    @Length(min = 0, max = 64, message = "评估报告长度必须介于 0 和 64 之间")
    public String getAssessmentReport() {
        return assessmentReport;
    }

    public void setAssessmentReport(String assessmentReport) {
        this.assessmentReport = assessmentReport;
    }

    @Length(min = 0, max = 64, message = "评估报告名长度必须介于 0 和 64 之间")
    public String getAssessmentReportName() {
        return assessmentReportName;
    }

    public void setAssessmentReportName(String assessmentReportName) {
        this.assessmentReportName = assessmentReportName;
    }

    @Length(min = 0, max = 64, message = "评估合同长度必须介于 0 和 64 之间")
    public String getEvaluationContract() {
        return evaluationContract;
    }

    public void setEvaluationContract(String evaluationContract) {
        this.evaluationContract = evaluationContract;
    }

    @Length(min = 0, max = 64, message = "评估合同名长度必须介于 0 和 64 之间")
    public String getEvaluationContractName() {
        return evaluationContractName;
    }

    public void setEvaluationContractName(String evaluationContractName) {
        this.evaluationContractName = evaluationContractName;
    }

    public Date getCommitTime() {
        return commitTime;
    }

    public void setCommitTime(Date commitTime) {
        this.commitTime = commitTime;
    }

    @Length(min = 0, max = 64, message = "是否通过（yes_no）长度必须介于 0 和 64 之间")
    public String getIsReject() {
        return isReject;
    }

    public void setIsReject(String isReject) {
        this.isReject = isReject;
    }

    @Length(min = 0, max = 64, message = "操作人长度必须介于 0 和 64 之间")
    public String getRejectPerson() {
        return rejectPerson;
    }

    public void setRejectPerson(String rejectPerson) {
        this.rejectPerson = rejectPerson;
    }

    @Length(min = 0, max = 200, message = "原因长度必须介于 0 和 200 之间")
    public String getRejectReason() {
        return rejectReason;
    }

    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason;
    }

    public Date getRejectTime() {
        return rejectTime;
    }

    public void setRejectTime(Date rejectTime) {
        this.rejectTime = rejectTime;
    }

    public P2pBeforeMatchDebtState getP2pBeforeMatchDebtState() {
        return p2pBeforeMatchDebtState;
    }

    public void setP2pBeforeMatchDebtState(
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        this.p2pBeforeMatchDebtState = p2pBeforeMatchDebtState;
    }

    public P2pEnterpriseCertify getP2pEnterpriseCertify() {
        return p2pEnterpriseCertify;
    }

    public void setP2pEnterpriseCertify(P2pEnterpriseCertify p2pEnterpriseCertify) {
        this.p2pEnterpriseCertify = p2pEnterpriseCertify;
    }

    public void setAssetCompanyId(String assetCompanyId) {
        this.assetCompanyId = assetCompanyId;
    }

    public P2pAssetValuation getP2pAssetValuation() {
        return p2pAssetValuation;
    }

    public void setP2pAssetValuation(P2pAssetValuation p2pAssetValuation) {
        this.p2pAssetValuation = p2pAssetValuation;
    }

    public P2pFinancingInformation getP2pFinancingInformation() {
        return p2pFinancingInformation;
    }

    public void setP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation) {
        this.p2pFinancingInformation = p2pFinancingInformation;
    }

}