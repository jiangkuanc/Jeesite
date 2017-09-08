package com.dagongsoft.p2p.risk.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 会员表Entity
 *
 * @author Joe
 * @version 2016-12-02
 */
public class P2pMember extends DataEntity<P2pMember> {

    private static final long serialVersionUID = 1L;
    private User user;        // user_id
    private Date joinMemberTime;        // 加入会员时间
    private Date endTime;        // 结束日期
    private Date lastRenewalTime;        // 最后一次续费时间
    private String memberState;        // 会员状态
    private String memberType;        // 会员类型

    public P2pMember() {
        super();
    }

    public P2pMember(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getJoinMemberTime() {
        return joinMemberTime;
    }

    public void setJoinMemberTime(Date joinMemberTime) {
        this.joinMemberTime = joinMemberTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getLastRenewalTime() {
        return lastRenewalTime;
    }

    public void setLastRenewalTime(Date lastRenewalTime) {
        this.lastRenewalTime = lastRenewalTime;
    }

    @Length(min = 0, max = 64, message = "会员状态长度必须介于 0 和 64 之间")
    public String getMemberState() {
        return memberState;
    }

    public void setMemberState(String memberState) {
        this.memberState = memberState;
    }

    @Length(min = 0, max = 64, message = "会员类型长度必须介于 0 和 64 之间")
    public String getMemberType() {
        return memberType;
    }

    public void setMemberType(String memberType) {
        this.memberType = memberType;
    }

}