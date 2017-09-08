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
import com.thinkgem.jeesite.modules.cms.dao.CmsSupplyInformationDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsSupplyInformation;

/**
 * 供给信息详情Service
 *
 * @author lsm
 * @version 2016-08-11
 */
@Service
@Transactional(readOnly = true)
public class CmsSupplyInformationService extends CrudService<CmsSupplyInformationDao, CmsSupplyInformation> {

    @Autowired
    private CmsSupplyInformationDao cmsSupplyInformationDao;

    public CmsSupplyInformation get(String id) {
        return super.get(id);
    }

    public List<CmsSupplyInformation> findList(CmsSupplyInformation cmsSupplyInformation) {
        return super.findList(cmsSupplyInformation);
    }

    public Page<CmsSupplyInformation> findPage(Page<CmsSupplyInformation> page, CmsSupplyInformation cmsSupplyInformation) {
        return super.findPage(page, cmsSupplyInformation);
    }

    @Transactional(readOnly = false)
    public void save(CmsSupplyInformation cmsSupplyInformation) {
        super.save(cmsSupplyInformation);
    }

    @Transactional(readOnly = false)
    public void delete(CmsSupplyInformation cmsSupplyInformation) {
        super.delete(cmsSupplyInformation);
    }

    @Transactional(readOnly = false)
    public List<CmsSupplyInformation> selectCurrentSupplyInformation(String id) {
        return cmsSupplyInformationDao.selectCurrentSupplyInformation(id);

    }
}