/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.TreeDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.Area;

/**
 * 区域DAO接口
 *
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface AreaDao extends TreeDao<Area> {

    /**
     * 加载省级区域
     *
     * @return
     */
    public List<Area> loadProvincialArea();

    /**
     * 加载市级区域
     *
     * @param parentId
     * @return
     */
    public List<Area> loadMunicipalArea(String parentId);

    public List<Area> findArea(Map<String, Object> paramMap);

    public Area findById(String id);
}
