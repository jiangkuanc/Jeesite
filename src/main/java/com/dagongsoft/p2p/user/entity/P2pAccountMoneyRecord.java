package com.dagongsoft.p2p.user.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 账户金额记录表Entity
 *
 * @author Joe
 * @version 2016-11-04
 */
public class P2pAccountMoneyRecord extends DataEntity<P2pAccountMoneyRecord> {

    private static final long serialVersionUID = 1L;
    private String userid;                                    // userid
    private String amount;                                    // 金额
    private Date operateTime;                                // 时间
    private String zjAccount;                                // 账户
    private String accountMoneyType;                        // 类别（account_money_type 收入、支出）
    private String purpose;                                    // 用途（purpose 充值、提现、放款、缴费）
    private String income;                                    // 收入来源
    private String spending;                                // 支出去向
    private String tradeState;                                // 交易状态（trade_state 成功失败）

    private Date beginTime;                                    //开始时间
    private Date endTime;                                    //结束时间

    public P2pAccountMoneyRecord() {
        super();
    }

    public P2pAccountMoneyRecord(String id) {
        super(id);
    }

    @Length(min = 1, max = 64, message = "userid长度必须介于 1 和 64 之间")
    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    @Length(min = 0, max = 64, message = "账户长度必须介于 0 和 64 之间")
    public String getZjAccount() {
        return zjAccount;
    }

    public void setZjAccount(String zjAccount) {
        this.zjAccount = zjAccount;
    }

    @Length(min = 0, max = 100, message = "类别（account_money_type 收入、支出）长度必须介于 0 和 100 之间")
    public String getAccountMoneyType() {
        return accountMoneyType;
    }

    public void setAccountMoneyType(String accountMoneyType) {
        this.accountMoneyType = accountMoneyType;
    }

    @Length(min = 0, max = 100, message = "用途（purpose 充值、提现、放款、缴费）长度必须介于 0 和 100 之间")
    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    @Length(min = 0, max = 64, message = "收入来源长度必须介于 0 和 64 之间")
    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    @Length(min = 0, max = 64, message = "支出去向长度必须介于 0 和 64 之间")
    public String getSpending() {
        return spending;
    }

    public void setSpending(String spending) {
        this.spending = spending;
    }

    @Length(min = 0, max = 10, message = "交易状态（trade_state 成功失败）长度必须介于 0 和 10 之间")
    public String getTradeState() {
        return tradeState;
    }

    public void setTradeState(String tradeState) {
        this.tradeState = tradeState;
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