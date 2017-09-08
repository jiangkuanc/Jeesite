package com.dagongsoft.p2p.user.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 充值记录Entity
 *
 * @author Chace
 * @version 2016-11-21
 */
public class P2pAccountRechargeRecord extends DataEntity<P2pAccountRechargeRecord> {

    private static final long serialVersionUID = 1L;
    private User user;                        // 用户编号
    private Double rechargeAmount;            // 充值金额
    private Date rechargeTime;                // 充值时间
    private String rechargeState;            // 充值状态(recharge_state)
    private Date rechargeSuccessTime;        // 充值成功时间
    private String userId;                    //用户编号
    private P2pAccount p2pAccount;


    public P2pAccount getP2pAccount() {
        return p2pAccount;
    }

    public void setP2pAccount(P2pAccount p2pAccount) {
        this.p2pAccount = p2pAccount;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public P2pAccountRechargeRecord() {
        super();
    }

    public P2pAccountRechargeRecord(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Double getRechargeAmount() {
        return rechargeAmount;
    }

    public void setRechargeAmount(Double rechargeAmount) {
        this.rechargeAmount = rechargeAmount;
    }

    public Date getRechargeTime() {
        return rechargeTime;
    }

    public void setRechargeTime(Date rechargeTime) {
        this.rechargeTime = rechargeTime;
    }

    @Length(min = 0, max = 64, message = "充值状态(recharge_state)长度必须介于 0 和 64 之间")
    public String getRechargeState() {
        return rechargeState;
    }

    public void setRechargeState(String rechargeState) {
        this.rechargeState = rechargeState;
    }

    public Date getRechargeSuccessTime() {
        return rechargeSuccessTime;
    }

    public void setRechargeSuccessTime(Date rechargeSuccessTime) {
        this.rechargeSuccessTime = rechargeSuccessTime;
    }

}