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
import com.thinkgem.jeesite.modules.cms.dao.CmsRequirementInformationDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsRequirementInformation;

/**
 * 生成产品需求信息Service
 *
 * @author lsm
 * @version 2016-08-12
 */
@Service
@Transactional(readOnly = true)
public class CmsRequirementInformationService extends CrudService<CmsRequirementInformationDao, CmsRequirementInformation> {
    @Autowired
    private CmsRequirementInformationDao cmsRequirementInformationDao;

    public CmsRequirementInformation get(String id) {
        return super.get(id);
    }

    public List<CmsRequirementInformation> findList(CmsRequirementInformation cmsRequirementInformation) {
        return super.findList(cmsRequirementInformation);
    }

    public Page<CmsRequirementInformation> findPage(Page<CmsRequirementInformation> page, CmsRequirementInformation cmsRequirementInformation) {
        return super.findPage(page, cmsRequirementInformation);
    }

    @Transactional(readOnly = false)
    public void save(CmsRequirementInformation cmsRequirementInformation) {
        super.save(cmsRequirementInformation);
    }

    @Transactional(readOnly = false)
    public void delete(CmsRequirementInformation cmsRequirementInformation) {
        super.delete(cmsRequirementInformation);
    }

    @Transactional(readOnly = false)
    public List<CmsRequirementInformation> selectRequirementInformation() {
        return cmsRequirementInformationDao.selectRequirementInformation();
    }

    ;

    @Transactional(readOnly = false)
    public List<CmsRequirementInformation> selectRequirementInformationList(CmsRequirementInformation cmsRequirementInformation) {
        return super.findList(cmsRequirementInformation);
    }

    ;

    public List<CmsRequirementInformation> findArticleDemandName() {
        return cmsRequirementInformationDao.findArticleDemandName();
    }

    public List<CmsRequirementInformation> findFromList(
            CmsRequirementInformation cmsRequirementInformation) {
        // TODO Auto-generated method stub
        return cmsRequirementInformationDao.findFromList();
    }
}