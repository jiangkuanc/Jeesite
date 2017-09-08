/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 支付管理Entity
 *
 * @author qichao
 * @version 2016-07-27
 */
public class P2pPaymentOfRatingCost extends DataEntity<P2pPaymentOfRatingCost> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息ID
    private String orderNo;        //订单编号
    private Date orderTime;        //订单生成时间
    private Integer paymentStatus;        // 付款状态，0-未付款，1-已付款
    private Double paymentAmount;        // 付款金额
    private String paymentId; //(待)付款用户id
    private Date timeOfPayment;        // 付款时间
    private String operatorId;        // 操作人
    private Date operatorTime;
    private String batchNo;//交易流水号
    private String chargingItem;//收费项目，1-支付评级费，2-购买评级报告
    private String reportName;  //报告名称


    private P2pFinancingInformation p2pFinancingInformation;
    private P2pEnterpriseCertify p2pEnterpriseCertify;
    private P2pRatingServiceInfo p2pRatingServiceInfo;
    private P2pFinancingRatingInfo p2pFinancingRatingInfo;
    private String paymentStatusStr;  //用于按照支付状态查询
    private Date beginTime; //用于按时间查询
    private Date endTime;  //用于按时间查询

    private String orderTimeView;        //订单时间(调用接口参数)

    public String getReportName() {
        return reportName;
    }

    public void setReportName(String reportName) {
        this.reportName = reportName;
    }

    public P2pRatingServiceInfo getP2pRatingServiceInfo() {
        return p2pRatingServiceInfo;
    }

    public void setP2pRatingServiceInfo(P2pRatingServiceInfo p2pRatingServiceInfo) {
        this.p2pRatingServiceInfo = p2pRatingServiceInfo;
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

    public String getPaymentStatusStr() {
        return paymentStatusStr;
    }

    public void setPaymentStatusStr(String paymentStatusStr) {
        this.paymentStatusStr = paymentStatusStr;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }

    public P2pFinancingInformation getP2pFinancingInformation() {
        return p2pFinancingInformation;
    }

    public void setP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation) {
        this.p2pFinancingInformation = p2pFinancingInformation;
    }

    public P2pEnterpriseCertify getP2pEnterpriseCertify() {
        return p2pEnterpriseCertify;
    }

    public void setP2pEnterpriseCertify(P2pEnterpriseCertify p2pEnterpriseCertify) {
        this.p2pEnterpriseCertify = p2pEnterpriseCertify;
    }

    public String getBatchNo() {
        return batchNo;
    }

    public void setBatchNo(String batchNo) {
        this.batchNo = batchNo;
    }

    public String getChargingItem() {
        return chargingItem;
    }

    public void setChargingItem(String chargingItem) {
        this.chargingItem = chargingItem;
    }

    public P2pPaymentOfRatingCost() {
        super();
    }

    public P2pPaymentOfRatingCost(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "融资信息ID长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    public Integer getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(Integer paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Double getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(Double paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public Date getTimeOfPayment() {
        return timeOfPayment;
    }

    public void setTimeOfPayment(Date timeOfPayment) {
        this.timeOfPayment = timeOfPayment;
    }

    @Length(min = 0, max = 64, message = "操作人长度必须介于 0 和 64 之间")
    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Date getOperatorTime() {
        return operatorTime;
    }

    public void setOperatorTime(Date operatorTime) {
        this.operatorTime = operatorTime;
    }

    public String getOrderTimeView() {
        return orderTimeView;
    }

    public void setOrderTimeView(String orderTimeView) {
        this.orderTimeView = orderTimeView;
    }

    public P2pFinancingRatingInfo getP2pFinancingRatingInfo() {
        return p2pFinancingRatingInfo;
    }

    public void setP2pFinancingRatingInfo(
            P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        this.p2pFinancingRatingInfo = p2pFinancingRatingInfo;
    }


}