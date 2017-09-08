/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.cms.dao.CmsReportDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsReport;

/**
 * 生成产品详情Service
 *
 * @author lsm
 * @version 2016-08-15
 */
@Service
@Transactional(readOnly = true)
public class CmsReportService extends CrudService<CmsReportDao, CmsReport> {

    @Autowired
    private CmsReportDao cmsReportDao;

    public CmsReport get(String id) {
        return super.get(id);
    }

    public List<CmsReport> findList(CmsReport cmsReport) {
        return super.findList(cmsReport);
    }

    public Page<CmsReport> findPage(Page<CmsReport> page, CmsReport cmsReport) {
        return super.findPage(page, cmsReport);
    }

    @Transactional(readOnly = false)
    public void save(CmsReport cmsReport) {
        super.save(cmsReport);
    }

    @Transactional(readOnly = false)
    public void delete(CmsReport cmsReport) {
        super.delete(cmsReport);
    }

    @Transactional(readOnly = false)
    public List<CmsReport> selectCurrentReport(String id) {
        // TODO Auto-generated method stub
        return cmsReportDao.selectCurrentReport(id);
    }

    @Transactional(readOnly = false)
    public List<CmsReport> selectCurrentInvestmentGuide(String id) {
        // TODO Auto-generated method stub
        return cmsReportDao.selectCurrentInvestmentGuide(id);
    }

    @Transactional(readOnly = false)
    public List<CmsReport> selectCurrentstrategicResearch(String id) {
        // TODO Auto-generated method stub
        return cmsReportDao.selectCurrentstrategicResearch(id);
    }

}