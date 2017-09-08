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
import com.thinkgem.jeesite.modules.cms.dao.CmsMegaProjectIntroduce1Dao;
import com.thinkgem.jeesite.modules.cms.entity.CmsMegaProjectIntroduce1;

/**
 * 大型项目简介详情Service
 *
 * @author lsm
 * @version 2016-08-11
 */
@Service
@Transactional(readOnly = true)
public class CmsMegaProjectIntroduce1Service extends CrudService<CmsMegaProjectIntroduce1Dao, CmsMegaProjectIntroduce1> {

    @Autowired
    private CmsMegaProjectIntroduce1Dao cmsMegaProjectIntroduce1Dao;

    public CmsMegaProjectIntroduce1 get(String id) {
        return super.get(id);
    }

    public List<CmsMegaProjectIntroduce1> findList(CmsMegaProjectIntroduce1 cmsMegaProjectIntroduce1) {
        return super.findList(cmsMegaProjectIntroduce1);
    }

    public Page<CmsMegaProjectIntroduce1> findPage(Page<CmsMegaProjectIntroduce1> page, CmsMegaProjectIntroduce1 cmsMegaProjectIntroduce1) {
        return super.findPage(page, cmsMegaProjectIntroduce1);
    }

    @Transactional(readOnly = false)
    public void save(CmsMegaProjectIntroduce1 cmsMegaProjectIntroduce1) {
        super.save(cmsMegaProjectIntroduce1);
    }

    @Transactional(readOnly = false)
    public void delete(CmsMegaProjectIntroduce1 cmsMegaProjectIntroduce1) {
        super.delete(cmsMegaProjectIntroduce1);
    }

    @Transactional(readOnly = false)
    public List<CmsMegaProjectIntroduce1> selectCurrentMegaProjectDetail(String id) {
        return cmsMegaProjectIntroduce1Dao.selectCurrentMegaProjectDetail(id);

    }
}