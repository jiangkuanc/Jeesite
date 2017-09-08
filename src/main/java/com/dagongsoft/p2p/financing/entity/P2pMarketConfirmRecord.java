package com.dagongsoft.p2p.financing.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 市场人员审核记录Entity
 *
 * @author Sora
 * @version 2016-11-07
 */
public class P2pMarketConfirmRecord extends DataEntity<P2pMarketConfirmRecord> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息id
    private String confirmStage;        // 确认阶段(confirm_stage)//2市场人员确认发布阶段//1市场人员确认立项阶段
    private String isPass;        // 确认结论/是否通过（yes_no）
    private String operateExplain;        // 确认意见
    private String operateId;        // 操作人编号
    private Date operateTime;        // 操作时间

    public P2pMarketConfirmRecord() {
        super();
    }

    public P2pMarketConfirmRecord(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "融资信息id长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 64, message = "确认阶段(confirm_stage)长度必须介于 0 和 64 之间")
    public String getConfirmStage() {
        return confirmStage;
    }

    public void setConfirmStage(String confirmStage) {
        this.confirmStage = confirmStage;
    }

    @Length(min = 0, max = 64, message = "确认结论/是否通过（yes_no）长度必须介于 0 和 64 之间")
    public String getIsPass() {
        return isPass;
    }

    public void setIsPass(String isPass) {
        this.isPass = isPass;
    }

    @Length(min = 0, max = 64, message = "确认意见长度必须介于 0 和 64 之间")
    public String getOperateExplain() {
        return operateExplain;
    }

    public void setOperateExplain(String operateExplain) {
        this.operateExplain = operateExplain;
    }

    @Length(min = 0, max = 64, message = "操作人编号长度必须介于 0 和 64 之间")
    public String getOperateId() {
        return operateId;
    }

    public void setOperateId(String operateId) {
        this.operateId = operateId;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

}