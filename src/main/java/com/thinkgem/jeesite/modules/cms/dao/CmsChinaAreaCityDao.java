/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsChinaArea;
import com.thinkgem.jeesite.modules.cms.entity.CmsChinaAreaCity;

/**
 * cms_caDAO接口
 *
 * @author duan
 * @version 2016-08-15
 */
@MyBatisDao
public interface CmsChinaAreaCityDao extends CrudDao<CmsChinaAreaCity> {
    public List<CmsChinaAreaCity> findCityNames();

    /**
     * 根据区域id查城市
     */
    public List<CmsChinaAreaCity> seletCtityNamesAccAid(CmsChinaArea cmsChinaArea);


    /**
     * 根据城市id查询城市概况、介绍等信息
     *
     * @param id
     * @return
     */
    public CmsChinaAreaCity seletCtityInfoAccCid(String id);

}