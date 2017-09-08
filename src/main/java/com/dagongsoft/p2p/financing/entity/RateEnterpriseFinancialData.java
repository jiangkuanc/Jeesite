package com.dagongsoft.p2p.financing.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 企业财报（4张表）Entity
 *
 * @author Zach
 * @version 2016-10-26
 */
public class RateEnterpriseFinancialData extends DataEntity<RateEnterpriseFinancialData> {

    private static final long serialVersionUID = 1L;
    private String enterpriseFinancialDataId;        // 企业财务数据编号
    private String projectId;        // 企业编号
    private String accoutingStandard;        // 会计准则
    private String reportingTime;        // 报表时间
    private String whetherAudit;        // 是否审计
    private String auditUnit;        // 审计单位
    private String auditOpinion;        // 审计意见
    private String creater;        // 创建人
    private Date createTime;        // 创建时间
    private String status;        // 状态

    public RateEnterpriseFinancialData() {
        super();
    }

    public RateEnterpriseFinancialData(String id) {
        super(id);
    }

    @Length(min = 1, max = 36, message = "企业财务数据编号长度必须介于 1 和 36 之间")
    public String getEnterpriseFinancialDataId() {
        return enterpriseFinancialDataId;
    }

    public void setEnterpriseFinancialDataId(String enterpriseFinancialDataId) {
        this.enterpriseFinancialDataId = enterpriseFinancialDataId;
    }

    @Length(min = 0, max = 36, message = "项目编号长度必须介于 0 和 36 之间")
    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    @Length(min = 0, max = 11, message = "会计准则长度必须介于 0 和 11 之间")
    public String getAccoutingStandard() {
        return accoutingStandard;
    }


    public void setAccoutingStandard(String accoutingStandard) {
        this.accoutingStandard = accoutingStandard;
    }

    @Length(min = 0, max = 10, message = "是否审计长度必须介于 0 和 10 之间")
    public String getReportingTime() {
        return reportingTime;
    }

    public void setReportingTime(String reportingTime) {
        this.reportingTime = reportingTime;
    }

    @Length(min = 0, max = 11, message = "是否审计长度必须介于 0 和 11 之间")
    public String getWhetherAudit() {
        return whetherAudit;
    }

    public void setWhetherAudit(String whetherAudit) {
        this.whetherAudit = whetherAudit;
    }

    @Length(min = 0, max = 50, message = "审计单位长度必须介于 0 和 50 之间")
    public String getAuditUnit() {
        return auditUnit;
    }

    public void setAuditUnit(String auditUnit) {
        this.auditUnit = auditUnit;
    }

    @Length(min = 0, max = 2000, message = "审计意见长度必须介于 0 和 2000 之间")
    public String getAuditOpinion() {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion) {
        this.auditOpinion = auditOpinion;
    }

    @Length(min = 0, max = 36, message = "创建人长度必须介于 0 和 36 之间")
    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Length(min = 0, max = 11, message = "状态长度必须介于 0 和 11 之间")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}