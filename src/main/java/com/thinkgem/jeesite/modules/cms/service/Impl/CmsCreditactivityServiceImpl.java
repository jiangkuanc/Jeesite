package com.thinkgem.jeesite.modules.cms.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.cms.dao.CmsCreditactivityDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsCreditactivity;
import com.thinkgem.jeesite.modules.cms.service.CmsCreditactivityService;

/**
 * 生成用户报名信息ServiceImpl
 *
 * @author summer
 * @version 2016-11-15
 */
@Transactional(readOnly = true)
@Service("cmsCreditactivityService")
public class CmsCreditactivityServiceImpl extends CrudService<CmsCreditactivityDao, CmsCreditactivity> implements CmsCreditactivityService {
    @Autowired
    private CmsCreditactivityDao cmsCreditactivityDao;

    public CmsCreditactivity get(String id) {
        return super.get(id);
    }

    public List<CmsCreditactivity> findList(CmsCreditactivity cmsCreditactivity) {
        return super.findList(cmsCreditactivity);
    }

    public Page<CmsCreditactivity> findPage(Page<CmsCreditactivity> page, CmsCreditactivity cmsCreditactivity) {
        return super.findPage(page, cmsCreditactivity);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(CmsCreditactivity cmsCreditactivity) {
        super.save(cmsCreditactivity);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(CmsCreditactivity cmsCreditactivity) {
        super.delete(cmsCreditactivity);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void commite(CmsCreditactivity cmsCreditactivity) {
        cmsCreditactivityDao.commite(cmsCreditactivity);
    }

}