/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.AccountStrategic;

/**
 * 账户策略管理DAO接口
 *
 * @author system
 * @version 2016-06-30
 */
@MyBatisDao
public interface AccountStrategicDao extends CrudDao<AccountStrategic> {

}