/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsChinaArea;

/**
 * cms_caDAO接口
 *
 * @author duan
 * @version 2016-08-15
 */
@MyBatisDao
public interface CmsChinaAreaDao extends CrudDao<CmsChinaArea> {
    public List<CmsChinaArea> findAllChinaAreaList();

}