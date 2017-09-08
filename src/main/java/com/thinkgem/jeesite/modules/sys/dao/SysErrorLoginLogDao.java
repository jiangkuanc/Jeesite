/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.SysErrorLoginLog;

/**
 * 错误信息DAO接口
 *
 * @author 王柄崎
 * @version 2017-5-9
 */
@MyBatisDao
public interface SysErrorLoginLogDao extends CrudDao<SysErrorLoginLog> {

}
