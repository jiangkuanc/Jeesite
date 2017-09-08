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
import com.thinkgem.jeesite.modules.cms.dao.CmsForeignAreaDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsForeignArea;

/**
 * 国外区域表Service
 *
 * @author duan
 * @version 2016-08-17
 */
@Service
@Transactional(readOnly = true)
public class CmsForeignAreaService extends CrudService<CmsForeignAreaDao, CmsForeignArea> {
    @Autowired
    private CmsForeignAreaDao cmsForeignAreaDao;

    public CmsForeignArea get(String id) {
        return super.get(id);
    }

    public List<CmsForeignArea> findList(CmsForeignArea cmsForeignArea) {
        return super.findList(cmsForeignArea);
    }

    public Page<CmsForeignArea> findPage(Page<CmsForeignArea> page, CmsForeignArea cmsForeignArea) {
        return super.findPage(page, cmsForeignArea);
    }

    @Transactional(readOnly = false)
    public void save(CmsForeignArea cmsForeignArea) {
        super.save(cmsForeignArea);
    }

    @Transactional(readOnly = false)
    public void delete(CmsForeignArea cmsForeignArea) {
        super.delete(cmsForeignArea);
    }

    public List<CmsForeignArea> selecForeignArea() {
        return cmsForeignAreaDao.selecForeignArea();

    }

    /**
     * 查询前5个区域
     */

    public List<CmsForeignArea> selectFrontForeignArea() {
        return cmsForeignAreaDao.selectFrontForeignArea();
    }

}