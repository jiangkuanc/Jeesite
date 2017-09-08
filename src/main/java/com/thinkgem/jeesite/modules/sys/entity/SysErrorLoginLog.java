/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 错误日志Entity
 *
 * @author 王柄崎
 * @version 2017-5-9
 */
public class SysErrorLoginLog extends DataEntity<SysErrorLoginLog> {

    private static final long serialVersionUID = 1L;
    private String loginName;        // 登录名
    private String errorPwd;        // 输入的错误密码
    private String logIp;    // 记录登录ip地址
    private String pcMac;    // 登录错误的物理机
    private Date loginTime;        // 登录错误的时间
    private Integer userRole;    // 1为前台用户2为后台用户


    public SysErrorLoginLog() {
        super();
    }

    public SysErrorLoginLog(String id) {
        super(id);
    }


    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getErrorPwd() {
        return errorPwd;
    }

    public void setErrorPwd(String errorPwd) {
        this.errorPwd = errorPwd;
    }

    public String getLogIp() {
        return logIp;
    }

    public void setLogIp(String logIp) {
        this.logIp = logIp;
    }

    public String getPcMac() {
        return pcMac;
    }

    public void setPcMac(String pcMac) {
        this.pcMac = pcMac;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public Integer getUserRole() {
        return userRole;
    }

    public void setUserRole(Integer userRole) {
        this.userRole = userRole;
    }


}