package com.dagongsoft.p2p.user.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 提现记录Entity
 *
 * @author Chace
 * @version 2016-11-21
 */
public class P2pAccountWithdrawRecord extends DataEntity<P2pAccountWithdrawRecord> {

    private static final long serialVersionUID = 1L;
    private User user;        // 用户编号
    private Double withdrawAmount;        // 提现金额//withdrawAmount
    private Date withdrawTime;        // 提现时间
    private String withdrawState;        // 提现状态(withdraw_state)
    private Date withdrawSuccessTime;        // 提现成功时间
    private Double withdrawFee;        // 提现手续费
    private String userId;//用户编号
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

    public P2pAccountWithdrawRecord() {
        super();
    }

    public P2pAccountWithdrawRecord(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Double getWithdrawAmount() {
        return withdrawAmount;
    }

    public void setWithdrawAmount(Double withdrawAmount) {
        this.withdrawAmount = withdrawAmount;
    }

    public Date getWithdrawTime() {
        return withdrawTime;
    }

    public void setWithdrawTime(Date withdrawTime) {
        this.withdrawTime = withdrawTime;
    }

    @Length(min = 0, max = 64, message = "提现状态(withdraw_state)长度必须介于 0 和 64 之间")
    public String getWithdrawState() {
        return withdrawState;
    }

    public void setWithdrawState(String withdrawState) {
        this.withdrawState = withdrawState;
    }

    public Date getWithdrawSuccessTime() {
        return withdrawSuccessTime;
    }

    public void setWithdrawSuccessTime(Date withdrawSuccessTime) {
        this.withdrawSuccessTime = withdrawSuccessTime;
    }

    public Double getWithdrawFee() {
        return withdrawFee;
    }

    public void setWithdrawFee(Double withdrawFee) {
        this.withdrawFee = withdrawFee;
    }

}