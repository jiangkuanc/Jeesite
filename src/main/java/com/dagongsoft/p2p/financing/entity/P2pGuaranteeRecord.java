package com.dagongsoft.p2p.financing.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.entity.P2pGuarantee;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 担保记录表Entity
 *
 * @author Sora
 * @version 2016-11-08
 */
public class P2pGuaranteeRecord extends DataEntity<P2pGuaranteeRecord> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息ID
    private String guaranteeCompanyId;        // 担保公司编号
    private String letterIntent;        // 担保意向书
    private String letterIntentName;        // 担保意向书名
    private String guaranteeContract;        // 担保合同
    private String guaranteeContractName;        // 担保合同名
    private Date commitTime;        // 提交时间
    private String isReject;        // 是否通过（yes_no）
    private String rejectPerson;        // 操作人
    private String rejectReason;        // 原因
    private Date rejectTime;        // 操作时间

    private User user;
    private P2pEnterpriseCertify p2pEnterpriseCertify;
    private P2pBeforeMatchDebtState p2pBeforeMatchDebtState;
    private P2pFinancingInformation p2pFinancingInformation;
    private P2pGuarantee p2pGuarantee;

    public P2pGuarantee getP2pGuarantee() {
        return p2pGuarantee;
    }

    public void setP2pGuarantee(P2pGuarantee p2pGuarantee) {
        this.p2pGuarantee = p2pGuarantee;
    }

    public P2pGuaranteeRecord() {
        super();
    }

    public P2pGuaranteeRecord(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "融资信息ID长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 64, message = "担保公司编号长度必须介于 0 和 64 之间")
    public String getGuaranteeCompanyId() {
        return guaranteeCompanyId;
    }

    public void setGuaranteeCompanyNum(String guaranteeCompanyId) {
        this.guaranteeCompanyId = guaranteeCompanyId;
    }


    @Length(min = 0, max = 64, message = "担保意向书长度必须介于 0 和 64 之间")
    public String getLetterIntent() {
        return letterIntent;
    }

    public void setLetterIntent(String letterIntent) {
        this.letterIntent = letterIntent;
    }

    @Length(min = 0, max = 64, message = "担保意向书名长度必须介于 0 和 64 之间")
    public String getLetterIntentName() {
        return letterIntentName;
    }

    public void setLetterIntentName(String letterIntentName) {
        this.letterIntentName = letterIntentName;
    }

    @Length(min = 0, max = 64, message = "担保合同长度必须介于 0 和 64 之间")
    public String getGuaranteeContract() {
        return guaranteeContract;
    }

    public void setGuaranteeContract(String guaranteeContract) {
        this.guaranteeContract = guaranteeContract;
    }

    @Length(min = 0, max = 64, message = "担保合同名长度必须介于 0 和 64 之间")
    public String getGuaranteeContractName() {
        return guaranteeContractName;
    }

    public void setGuaranteeContractName(String guaranteeContractName) {
        this.guaranteeContractName = guaranteeContractName;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public P2pEnterpriseCertify getP2pEnterpriseCertify() {
        return p2pEnterpriseCertify;
    }

    public void setP2pEnterpriseCertify(P2pEnterpriseCertify p2pEnterpriseCertify) {
        this.p2pEnterpriseCertify = p2pEnterpriseCertify;
    }

    public P2pBeforeMatchDebtState getP2pBeforeMatchDebtState() {
        return p2pBeforeMatchDebtState;
    }

    public void setP2pBeforeMatchDebtState(
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        this.p2pBeforeMatchDebtState = p2pBeforeMatchDebtState;
    }

    public void setGuaranteeCompanyId(String guaranteeCompanyId) {
        this.guaranteeCompanyId = guaranteeCompanyId;
    }

    public P2pFinancingInformation getP2pFinancingInformation() {
        return p2pFinancingInformation;
    }

    public void setP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation) {
        this.p2pFinancingInformation = p2pFinancingInformation;
    }

}