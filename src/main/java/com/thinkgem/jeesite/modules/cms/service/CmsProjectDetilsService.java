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
import com.thinkgem.jeesite.modules.cms.dao.CmsProjectDetilsDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsProjectDetils;

/**
 * 添加项目信息详情Service
 *
 * @author lsm
 * @version 2016-08-10
 */
@Service
@Transactional(readOnly = true)
public class CmsProjectDetilsService extends CrudService<CmsProjectDetilsDao, CmsProjectDetils> {
    @Autowired
    private CmsProjectDetilsDao cmsProjectDetilsDao;

    public CmsProjectDetils get(String id) {
        return super.get(id);
    }

    public List<CmsProjectDetils> findList(CmsProjectDetils cmsProjectDetils) {
        return super.findList(cmsProjectDetils);
    }

    public Page<CmsProjectDetils> findPage(Page<CmsProjectDetils> page,
                                           CmsProjectDetils cmsProjectDetils) {
        return super.findPage(page, cmsProjectDetils);
    }

    @Transactional(readOnly = false)
    public void save(CmsProjectDetils cmsProjectDetils) {
        super.save(cmsProjectDetils);
    }

    @Transactional(readOnly = false)
    public void delete(CmsProjectDetils cmsProjectDetils) {
        super.delete(cmsProjectDetils);
    }

    @Transactional(readOnly = false)
    public List<CmsProjectDetils> selectCurrentDetail(String id) {
        return cmsProjectDetilsDao.selectCurrentDetail(id);
    }

}