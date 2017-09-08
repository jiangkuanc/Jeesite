package com.dagongsoft.p2p.user.entity;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 账户表Entity
 *
 * @author Joe
 * @version 2016-11-07
 */
public class P2pAccount extends DataEntity<P2pAccount> {

    private static final long serialVersionUID = 1L;
    private User user;                    // user_id
    private String zjAccount;            // 账户
    private String openAccountName;        // 开户名
    private String bankName;            // 开户行(bank_name)
    private String branchBankName;        // 支行名称
    private String bankAccount;            // 银行账户（卡号）
    private String certificateStatus;    // 认证状态(success_failure)
    private Date bindTime;                // 绑定时间
    private String userId;
    //银行预留手机号 bankPhone
    //银行卡类型 bankType
    //账户类型 accountType


    public P2pAccount() {
        super();
    }

    public P2pAccount(String id) {
        super(id);
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }


    @NotNull(message = "user_id不能为空")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 0, max = 64, message = "账户长度必须介于 0 和 64 之间")
    public String getZjAccount() {
        return zjAccount;
    }

    public void setZjAccount(String zjAccount) {
        this.zjAccount = zjAccount;
    }

    @Length(min = 0, max = 64, message = "开户名长度必须介于 0 和 64 之间")
    public String getOpenAccountName() {
        return openAccountName;
    }

    public void setOpenAccountName(String openAccountName) {
        this.openAccountName = openAccountName;
    }

    @Length(min = 0, max = 100, message = "开户行(bank_name)长度必须介于 0 和 100 之间")
    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    @Length(min = 0, max = 64, message = "支行名称长度必须介于 0 和 64 之间")
    public String getBranchBankName() {
        return branchBankName;
    }

    public void setBranchBankName(String branchBankName) {
        this.branchBankName = branchBankName;
    }

    @Length(min = 0, max = 64, message = "银行账户长度必须介于 0 和 64 之间")
    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    @Length(min = 0, max = 100, message = "认证状态(success_failure)长度必须介于 0 和 100 之间")
    public String getCertificateStatus() {
        return certificateStatus;
    }

    public void setCertificateStatus(String certificateStatus) {
        this.certificateStatus = certificateStatus;
    }

    public Date getBindTime() {
        return bindTime;
    }

    public void setBindTime(Date bindTime) {
        this.bindTime = bindTime;
    }

}