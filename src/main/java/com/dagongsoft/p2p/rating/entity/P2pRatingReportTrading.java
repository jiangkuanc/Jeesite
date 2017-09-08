package com.dagongsoft.p2p.rating.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 评级报告交易记录Entity
 *
 * @author Chace
 * @version 2017-03-06
 */
public class P2pRatingReportTrading extends DataEntity<P2pRatingReportTrading> {

    private static final long serialVersionUID = 1L;
    private String userId;        // 用户ID
    private String reportId;        // 评级报告ID
    private Date tradingTime;        // 交易时间
    private Integer reportType;        // 报告类型

    private P2pRatingServiceInfo p2pRatingServiceInfo;
    private P2pFinancingRatingInfo p2pFinancingRatingInfo;
    private P2pFinancingInformation p2pFinancingInformation;
    private Date beginTime;
    private Date endTime;


    public P2pFinancingInformation getP2pFinancingInformation() {
        return p2pFinancingInformation;
    }

    public void setP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation) {
        this.p2pFinancingInformation = p2pFinancingInformation;
    }

    public P2pRatingReportTrading() {
        super();
    }

    public P2pRatingReportTrading(String id) {
        super(id);
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Length(min = 0, max = 32, message = "评级报告ID长度必须介于 0 和 32 之间")
    public String getReportId() {
        return reportId;
    }

    public void setReportId(String reportId) {
        this.reportId = reportId;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getTradingTime() {
        return tradingTime;
    }

    public void setTradingTime(Date tradingTime) {
        this.tradingTime = tradingTime;
    }

    public Integer getReportType() {
        return reportType;
    }

    public void setReportType(Integer reportType) {
        this.reportType = reportType;
    }

    public P2pRatingServiceInfo getP2pRatingServiceInfo() {
        return p2pRatingServiceInfo;
    }

    public void setP2pRatingServiceInfo(P2pRatingServiceInfo p2pRatingServiceInfo) {
        this.p2pRatingServiceInfo = p2pRatingServiceInfo;
    }

    public P2pFinancingRatingInfo getP2pFinancingRatingInfo() {
        return p2pFinancingRatingInfo;
    }

    public void setP2pFinancingRatingInfo(
            P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        this.p2pFinancingRatingInfo = p2pFinancingRatingInfo;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

}