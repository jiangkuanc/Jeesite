/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsMegaProjectIntroduce1;

/**
 * 大型项目简介详情DAO接口
 *
 * @author lsm
 * @version 2016-08-11
 */
@MyBatisDao
public interface CmsMegaProjectIntroduce1Dao extends CrudDao<CmsMegaProjectIntroduce1> {
    public List<CmsMegaProjectIntroduce1> selectCurrentMegaProjectDetail(String id);
}