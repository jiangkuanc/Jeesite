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
import com.thinkgem.jeesite.modules.cms.dao.CmsChinaAreaDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsChinaArea;

/**
 * cms_caService
 *
 * @author duan
 * @version 2016-08-15
 */
@Service
@Transactional(readOnly = true)
public class CmsChinaAreaService extends CrudService<CmsChinaAreaDao, CmsChinaArea> {
    @Autowired
    private CmsChinaAreaDao cmsChinaAreaDao;

    public CmsChinaArea get(String id) {
        return super.get(id);
    }

    public List<CmsChinaArea> findList(CmsChinaArea cmsChinaArea) {
        return super.findList(cmsChinaArea);
    }

    public Page<CmsChinaArea> findPage(Page<CmsChinaArea> page, CmsChinaArea cmsChinaArea) {
        return super.findPage(page, cmsChinaArea);
    }

    @Transactional(readOnly = false)
    public void save(CmsChinaArea cmsChinaArea) {
        super.save(cmsChinaArea);
    }

    @Transactional(readOnly = false)
    public void delete(CmsChinaArea cmsChinaArea) {
        super.delete(cmsChinaArea);
    }

    @Transactional(readOnly = false)
    public List<CmsChinaArea> findAllChinaAreaList() {
        return cmsChinaAreaDao.findAllChinaAreaList();
    }


}