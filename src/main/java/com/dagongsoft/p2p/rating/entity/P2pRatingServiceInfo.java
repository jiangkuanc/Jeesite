package com.dagongsoft.p2p.rating.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 评级服务信息实体Entity
 *
 * @author Quincy
 * @version 2017-02-27
 */
public class P2pRatingServiceInfo extends DataEntity<P2pRatingServiceInfo> {

    private static final long serialVersionUID = 1L;
    private String ratingName;            //评级项目名称
    private String applicantsId;        // 申请人id
    private Date applyTime;           //申请时间
    private String currentStage;        // 当前状态
    private Date publishTime;        // 发布时间
    private String publishId;        //发布人
    private Integer isSupply;        //是否可以提交补充材料
    private Integer isHandRateCost; //是否缴纳评级费

    private P2pBeforeMatchDebtState p2pBeforeMatchDebtState;
    private P2pFinancingRatingInfo p2pFinancingRatingInfo;
    private P2pEnterpriseCertify p2pEnterpriseCertify;
    private P2pRatingResultView p2pRatingResultView;

    public P2pRatingServiceInfo() {
        super();
    }

    public P2pRatingServiceInfo(String id) {
        super(id);
    }

    public P2pEnterpriseCertify getP2pEnterpriseCertify() {
        return p2pEnterpriseCertify;
    }

    public void setP2pEnterpriseCertify(P2pEnterpriseCertify p2pEnterpriseCertify) {
        this.p2pEnterpriseCertify = p2pEnterpriseCertify;
    }

    public String getPublishId() {
        return publishId;
    }

    public void setPublishId(String publishId) {
        this.publishId = publishId;
    }

    @Length(min = 0, max = 32, message = "申请人id长度必须介于 0 和 32 之间")
    public String getApplicantsId() {
        return applicantsId;
    }

    public void setApplicantsId(String applicantsId) {
        this.applicantsId = applicantsId;
    }

    @Length(min = 0, max = 32, message = "当前状态长度必须介于 0 和 32 之间")
    public String getCurrentStage() {
        return currentStage;
    }

    public void setCurrentStage(String currentStage) {
        this.currentStage = currentStage;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    public String getRatingName() {
        return ratingName;
    }

    public void setRatingName(String ratingName) {
        this.ratingName = ratingName;
    }

    public Integer getIsSupply() {
        return isSupply;
    }

    public void setIsSupply(Integer isSupply) {
        this.isSupply = isSupply;
    }

    public Integer getIsHandRateCost() {
        return isHandRateCost;
    }

    public void setIsHandRateCost(Integer isHandRateCost) {
        this.isHandRateCost = isHandRateCost;
    }

    public P2pBeforeMatchDebtState getP2pBeforeMatchDebtState() {
        return p2pBeforeMatchDebtState;
    }

    public void setP2pBeforeMatchDebtState(
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        this.p2pBeforeMatchDebtState = p2pBeforeMatchDebtState;
    }

    public P2pFinancingRatingInfo getP2pFinancingRatingInfo() {
        return p2pFinancingRatingInfo;
    }

    public void setP2pFinancingRatingInfo(
            P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        this.p2pFinancingRatingInfo = p2pFinancingRatingInfo;
    }

    public P2pRatingResultView getP2pRatingResultView() {
        return p2pRatingResultView;
    }

    public void setP2pRatingResultView(P2pRatingResultView p2pRatingResultView) {
        this.p2pRatingResultView = p2pRatingResultView;
    }

}