/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsRequirementInformation;

/**
 * 生成产品需求信息DAO接口
 *
 * @author lsm
 * @version 2016-08-12
 */
@MyBatisDao
public interface CmsRequirementInformationDao extends CrudDao<CmsRequirementInformation> {
    public List<CmsRequirementInformation> selectRequirementInformation();

    public List<CmsRequirementInformation> findArticleDemandName();

    public List<CmsRequirementInformation> findFromList();
}
