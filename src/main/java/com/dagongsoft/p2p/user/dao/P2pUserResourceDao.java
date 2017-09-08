/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.dao;

import com.dagongsoft.p2p.user.entity.P2pUserResource;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 用户权限控制表，配置用户能访问的功能DAO接口
 *
 * @author qichao
 * @version 2016-07-06
 */
@MyBatisDao
public interface P2pUserResourceDao extends CrudDao<P2pUserResource> {

}