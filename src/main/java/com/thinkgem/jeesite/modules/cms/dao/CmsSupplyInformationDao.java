/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsSupplyInformation;

/**
 * 供给信息详情DAO接口
 *
 * @author lsm
 * @version 2016-08-11
 */
@MyBatisDao
public interface CmsSupplyInformationDao extends CrudDao<CmsSupplyInformation> {
    public List<CmsSupplyInformation> selectCurrentSupplyInformation(String id);
}