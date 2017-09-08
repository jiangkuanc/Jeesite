/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsDemandInformation;

/**
 * 生成需求详细信息DAO接口
 *
 * @author lsm
 * @version 2016-08-12
 */
@MyBatisDao
public interface CmsDemandInformationDao extends CrudDao<CmsDemandInformation> {

    public CmsDemandInformation selsectDemandInformation(String id);


}