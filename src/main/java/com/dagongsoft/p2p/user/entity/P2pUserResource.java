/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户权限控制表，配置用户能访问的功能Entity
 *
 * @author qichao
 * @version 2016-07-06
 */
public class P2pUserResource extends DataEntity<P2pUserResource> {

    private static final long serialVersionUID = 1L;
    private User user;        // 注册用户ID
    private Integer userType;        // 用户类别：1-投资者、2-融资者，可同时存在
    private String resourceName;        // 资源名称，即模块名称，通过Static变量控制
    private String resourceExplain;        // 资源描述

    public P2pUserResource() {
        super();
    }

    public P2pUserResource(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    @Length(min = 0, max = 64, message = "资源名称，即模块名称，通过Static变量控制长度必须介于 0 和 64 之间")
    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    @Length(min = 0, max = 255, message = "资源描述长度必须介于 0 和 255 之间")
    public String getResourceExplain() {
        return resourceExplain;
    }

    public void setResourceExplain(String resourceExplain) {
        this.resourceExplain = resourceExplain;
    }

}