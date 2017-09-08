package com.dagongsoft.p2p.risk.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 会员付费详情表Entity
 *
 * @author Joe
 * @version 2016-12-02
 */
public class P2pMemberPayDetails extends DataEntity<P2pMemberPayDetails> {

    private static final long serialVersionUID = 1L;
    private User user;        // user_id
    private String memberType;        // 会员类型
    private Date renewalTime;        // 续费时间
    private Date startTime;        // 开始日期
    private Date endTime;        // 结束日期
    private String payCost;        // 支付费用
    private String payStyle;        // 支付方式

    public P2pMemberPayDetails() {
        super();
    }

    public P2pMemberPayDetails(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 0, max = 64, message = "会员类型长度必须介于 0 和 64 之间")
    public String getMemberType() {
        return memberType;
    }

    public void setMemberType(String memberType) {
        this.memberType = memberType;
    }

    public Date getRenewalTime() {
        return renewalTime;
    }

    public void setRenewalTime(Date renewalTime) {
        this.renewalTime = renewalTime;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Length(min = 0, max = 64, message = "支付费用长度必须介于 0 和 64 之间")
    public String getPayCost() {
        return payCost;
    }

    public void setPayCost(String payCost) {
        this.payCost = payCost;
    }

    @Length(min = 0, max = 64, message = "支付方式长度必须介于 0 和 64 之间")
    public String getPayStyle() {
        return payStyle;
    }

    public void setPayStyle(String payStyle) {
        this.payStyle = payStyle;
    }

}