/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 账户策略管理Entity
 *
 * @author system
 * @version 2016-06-30
 */
public class AccountStrategic extends DataEntity<AccountStrategic> {

    private static final long serialVersionUID = 1L;
    private String pwdLength;        // 密码最小长度
    private String pwdEncryMode;        // 密码加密方式
    private String pwdMinimumAge;        // 密码最短使用期限
    private String pwdMaximumAge;        // 密码最长使用期限
    private String pwdStrength;        // 密码强度

    public AccountStrategic() {
        super();
    }

    public AccountStrategic(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "密码最小长度长度必须介于 0 和 64 之间")
    public String getPwdLength() {
        return pwdLength;
    }

    public void setPwdLength(String pwdLength) {
        this.pwdLength = pwdLength;
    }

    @Length(min = 0, max = 64, message = "密码加密方式长度必须介于 0 和 64 之间")
    public String getPwdEncryMode() {
        return pwdEncryMode;
    }

    public void setPwdEncryMode(String pwdEncryMode) {
        this.pwdEncryMode = pwdEncryMode;
    }

    @Length(min = 0, max = 64, message = "密码最短使用期限长度必须介于 0 和 64 之间")
    public String getPwdMinimumAge() {
        return pwdMinimumAge;
    }

    public void setPwdMinimumAge(String pwdMinimumAge) {
        this.pwdMinimumAge = pwdMinimumAge;
    }

    @Length(min = 0, max = 64, message = "密码最长使用期限长度必须介于 0 和 64 之间")
    public String getPwdMaximumAge() {
        return pwdMaximumAge;
    }

    public void setPwdMaximumAge(String pwdMaximumAge) {
        this.pwdMaximumAge = pwdMaximumAge;
    }

    @Length(min = 0, max = 64, message = "密码强度长度必须介于 0 和 64 之间")
    public String getPwdStrength() {
        return pwdStrength;
    }

    public void setPwdStrength(String pwdStrength) {
        this.pwdStrength = pwdStrength;
    }

}