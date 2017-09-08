/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.entity;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 个人身份认证数据库Entity
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
public class P2pCertificationDatabase extends DataEntity<P2pCertificationDatabase> {

    private static final long serialVersionUID = 1L;
    private String realName;        // 真实姓名
    private String idNumber;        // 身份证号
    private Date updatetime;        // 更新时间

    public P2pCertificationDatabase() {
        super();
    }

    public P2pCertificationDatabase(String id) {
        super(id);
    }

    @Length(min = 1, max = 64, message = "真实姓名长度必须介于 1 和 64 之间")
    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    @Length(min = 1, max = 18, message = "身份证号长度必须介于 1 和 18 之间")
    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    @NotNull(message = "更新时间不能为空")
    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

}