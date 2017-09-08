package com.dagongsoft.p2p.repayment.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 投资人收款记录表Entity
 *
 * @author Zeus
 * @version 2016-11-08
 */
public class P2pReceiveRecord extends DataEntity<P2pReceiveRecord> {

    private static final long serialVersionUID = 1L;
    private String receivePlanId;        // 收款计划表id
    private Date realReceiveDate;        // 实际收款日期
    private Double realReceivePrincipal;        // 实际收款本金
    private Double realReceiveInterest;        // 实际收款利息
    private Double realReceiveFine;        // 实际收款罚金
    private String receiveAccount;        // 收款账户

    public P2pReceiveRecord() {
        super();
    }

    public P2pReceiveRecord(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "收款计划表id长度必须介于 0 和 64 之间")
    public String getReceivePlanId() {
        return receivePlanId;
    }

    public void setReceivePlanId(String receivePlanId) {
        this.receivePlanId = receivePlanId;
    }

    public Date getRealReceiveDate() {
        return realReceiveDate;
    }

    public void setRealReceiveDate(Date realReceiveDate) {
        this.realReceiveDate = realReceiveDate;
    }

    public Double getRealReceivePrincipal() {
        return realReceivePrincipal;
    }

    public void setRealReceivePrincipal(Double realReceivePrincipal) {
        this.realReceivePrincipal = realReceivePrincipal;
    }

    public Double getRealReceiveInterest() {
        return realReceiveInterest;
    }

    public void setRealReceiveInterest(Double realReceiveInterest) {
        this.realReceiveInterest = realReceiveInterest;
    }

    public Double getRealReceiveFine() {
        return realReceiveFine;
    }

    public void setRealReceiveFine(Double realReceiveFine) {
        this.realReceiveFine = realReceiveFine;
    }

    @Length(min = 0, max = 64, message = "收款账户长度必须介于 0 和 64 之间")
    public String getReceiveAccount() {
        return receiveAccount;
    }

    public void setReceiveAccount(String receiveAccount) {
        this.receiveAccount = receiveAccount;
    }

}