package com.dagongsoft.p2p.feedback.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 评级结果意见表Entity
 *
 * @author Quincy
 * @version 2016-11-10
 */
public class P2pRatingResultView extends DataEntity<P2pRatingResultView> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息ID
    private String viewType;        // 意见类型(view_type)内容/级别/无意见
    private String viewExplain;        // 意见说明
    private Date viewTime;        // 意见反馈时间
    private String auditState;        // 审核状态
    private String auditReason;        // 审核意见
    private Date auditTime;        // 审核时间

    public P2pRatingResultView() {
        super();
    }

    public P2pRatingResultView(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "融资信息ID长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 64, message = "意见类型(view_type)内容/级别/无意见长度必须介于 0 和 64 之间")
    public String getViewType() {
        return viewType;
    }

    public void setViewType(String viewType) {
        this.viewType = viewType;
    }

    @Length(min = 0, max = 2000, message = "意见说明长度必须介于 0 和 2000 之间")
    public String getViewExplain() {
        return viewExplain;
    }

    public void setViewExplain(String viewExplain) {
        this.viewExplain = viewExplain;
    }

    public Date getViewTime() {
        return viewTime;
    }

    public void setViewTime(Date viewTime) {
        this.viewTime = viewTime;
    }

    @Length(min = 0, max = 64, message = "审核状态长度必须介于 0 和 64 之间")
    public String getAuditState() {
        return auditState;
    }

    public void setAuditState(String auditState) {
        this.auditState = auditState;
    }

    @Length(min = 0, max = 200, message = "审核意见长度必须介于 0 和 200 之间")
    public String getAuditReason() {
        return auditReason;
    }

    public void setAuditReason(String auditReason) {
        this.auditReason = auditReason;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

}