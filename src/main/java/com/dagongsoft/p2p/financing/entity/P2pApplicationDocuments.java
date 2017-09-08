/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 融资申请材料Entity
 *
 * @author zhengshuo
 * @version 2016-07-18
 */
public class P2pApplicationDocuments extends DataEntity<P2pApplicationDocuments> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息ID
    private String applicationDocuments;        // 申请材料(打包上传)，相对路径
    private String documentsExplain;        // 材料说明
    private Date commitTime;        // 材料提交时间
    private Date auditTime;        // 审核时间
    private String auditOpinion;        // 审核意见
    private String auditReason;        // 原因
    private String auditPersonId;        // 审核人，是某为运营人员的ID
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public P2pApplicationDocuments() {
        super();
    }

    public P2pApplicationDocuments(String id) {
        super(id);
    }

    @Length(min = 1, max = 64, message = "融资信息ID长度必须介于 1 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 64, message = "申请材料(打包上传)，相对路径长度必须介于 0 和 64 之间")
    public String getApplicationDocuments() {
        return applicationDocuments;
    }

    public void setApplicationDocuments(String applicationDocuments) {
        this.applicationDocuments = applicationDocuments;
    }

    public String getDocumentsExplain() {
        return documentsExplain;
    }

    public void setDocumentsExplain(String documentsExplain) {
        this.documentsExplain = documentsExplain;
    }

    public Date getCommitTime() {
        return commitTime;
    }

    public void setCommitTime(Date commitTime) {
        this.commitTime = commitTime;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    @Length(min = 0, max = 64, message = "审核意见长度必须介于 0 和 64 之间")
    public String getAuditOpinion() {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion) {
        this.auditOpinion = auditOpinion;
    }

    public String getAuditReason() {
        return auditReason;
    }

    public void setAuditReason(String auditReason) {
        this.auditReason = auditReason;
    }

    @Length(min = 0, max = 64, message = "审核人，是某为运营人员的ID长度必须介于 0 和 64 之间")
    public String getAuditPersonId() {
        return auditPersonId;
    }

    public void setAuditPersonId(String auditPersonId) {
        this.auditPersonId = auditPersonId;
    }

}