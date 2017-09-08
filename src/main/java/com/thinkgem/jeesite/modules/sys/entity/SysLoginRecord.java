package com.thinkgem.jeesite.modules.sys.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户登录记录表Entity
 *
 * @author thinkgem
 * @version 2017-05-09
 */
public class SysLoginRecord extends DataEntity<SysLoginRecord> {

    private static final long serialVersionUID = 1L;
    private User user;        // 用户实体类
    private String loginName;        // 登录名称
    private Integer errorPwdCount;        // 密码输错次数
    private String frozenState;        // 账号冻结状态（1-已冻结；0-未冻结）
    private String lastLoginIp;        // 最后登录IP地址
    private Date lastLoginTime;        // 最后登录时间
    private Date frozenStartTime;        // 账户冻结开始时间
    private Date frozenEndTime;        // 账户冻结结束时间
    private String userId;        //用户编号

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public SysLoginRecord() {
        super();
    }

    public SysLoginRecord(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 0, max = 255, message = "登录名称长度必须介于 0 和 255 之间")
    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    @Length(min = 0, max = 10, message = "密码输错次数长度必须介于 0 和 10 之间")
    public Integer getErrorPwdCount() {
        return errorPwdCount;
    }

    public void setErrorPwdCount(Integer errorPwdCount) {
        this.errorPwdCount = errorPwdCount;
    }

    @Length(min = 0, max = 6, message = "账号冻结状态（1-已冻结；0-未冻结）长度必须介于 0 和 6 之间")
    public String getFrozenState() {
        return frozenState;
    }

    public void setFrozenState(String frozenState) {
        this.frozenState = frozenState;
    }

    @Length(min = 0, max = 64, message = "最后登录IP地址长度必须介于 0 和 64 之间")
    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getFrozenStartTime() {
        return frozenStartTime;
    }

    public void setFrozenStartTime(Date frozenStartTime) {
        this.frozenStartTime = frozenStartTime;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getFrozenEndTime() {
        return frozenEndTime;
    }

    public void setFrozenEndTime(Date frozenEndTime) {
        this.frozenEndTime = frozenEndTime;
    }

}