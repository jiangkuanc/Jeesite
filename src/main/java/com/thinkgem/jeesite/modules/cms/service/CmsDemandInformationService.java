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
import com.thinkgem.jeesite.modules.cms.dao.CmsDemandInformationDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsDemandInformation;

/**
 * 生成需求详细信息Service
 *
 * @author lsm
 * @version 2016-08-12
 */
@Service
@Transactional(readOnly = true)
public class CmsDemandInformationService extends CrudService<CmsDemandInformationDao, CmsDemandInformation> {
    @Autowired
    private CmsDemandInformationDao cmsDemandInformationDao;

    public CmsDemandInformation get(String id) {
        return super.get(id);
    }

    public List<CmsDemandInformation> findList(CmsDemandInformation cmsDemandInformation) {
        return super.findList(cmsDemandInformation);
    }

    public Page<CmsDemandInformation> findPage(Page<CmsDemandInformation> page, CmsDemandInformation cmsDemandInformation) {
        return super.findPage(page, cmsDemandInformation);
    }

    @Transactional(readOnly = false)
    public void save(CmsDemandInformation cmsDemandInformation) {
        super.save(cmsDemandInformation);
    }

    @Transactional(readOnly = false)
    public void delete(CmsDemandInformation cmsDemandInformation) {
        super.delete(cmsDemandInformation);
    }

    @Transactional(readOnly = false)
    public CmsDemandInformation selsectDemandInformation(String id) {
        // TODO Auto-generated method stub
        return cmsDemandInformationDao.selsectDemandInformation(id);
    }


}