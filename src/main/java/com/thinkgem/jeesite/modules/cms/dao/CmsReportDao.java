/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsReport;

/**
 * 生成产品详情DAO接口
 *
 * @author lsm
 * @version 2016-08-15
 */
@MyBatisDao
public interface CmsReportDao extends CrudDao<CmsReport> {

    public List<CmsReport> selectCurrentInvestmentGuide(String id);

    public List<CmsReport> selectCurrentReport(String id);

    public List<CmsReport> selectCurrentstrategicResearch(String id);

}