/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsProjectDetils;

/**
 * 添加项目信息详情DAO接口
 *
 * @author lsm
 * @version 2016-08-10
 */
@MyBatisDao
public interface CmsProjectDetilsDao extends CrudDao<CmsProjectDetils> {

    public List<CmsProjectDetils> selectCurrentDetail(String id);

}