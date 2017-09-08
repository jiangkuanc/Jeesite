package com.thinkgem.jeesite.modules.cms.service;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.cms.entity.CmsCreditactivity;

/**
 * 生成用户报名信息Service
 *
 * @author summer
 * @version 2016-11-15
 */
public interface CmsCreditactivityService {

    public CmsCreditactivity get(String id);

    public List<CmsCreditactivity> findList(CmsCreditactivity cmsCreditactivity);

    public Page<CmsCreditactivity> findPage(Page<CmsCreditactivity> page, CmsCreditactivity cmsCreditactivity);

    public void save(CmsCreditactivity cmsCreditactivity);

    public void delete(CmsCreditactivity cmsCreditactivity);

    public void commite(CmsCreditactivity cmsCreditactivity);

}