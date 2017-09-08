package com.thinkgem.jeesite.modules.sys.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户修改密码记录表Entity
 *
 * @author thinkgem
 * @version 2017-05-10
 */
public class SysModifyPwdRecord extends DataEntity<SysModifyPwdRecord> {

    private static final long serialVersionUID = 1L;
    private User user;        // 用户编号
    private String password;        // 加密后的密码
    private Date modifyTime;        // 修改时间

    public SysModifyPwdRecord() {
        super();
    }

    public SysModifyPwdRecord(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 0, max = 100, message = "加密后的密码长度必须介于 0 和 100 之间")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

}