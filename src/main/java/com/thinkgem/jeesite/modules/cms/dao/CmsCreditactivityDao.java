package com.thinkgem.jeesite.modules.cms.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsCreditactivity;

/**
 * 生成用户报名信息DAO接口
 *
 * @author summer
 * @version 2016-11-15
 */
@MyBatisDao
public interface CmsCreditactivityDao extends CrudDao<CmsCreditactivity> {
    //保存用户报名信息
    public void commite(CmsCreditactivity cmsCreditactivity);
}