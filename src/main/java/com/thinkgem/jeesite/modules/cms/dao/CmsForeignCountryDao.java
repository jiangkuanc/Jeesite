/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsForeignCountry;

/**
 * 国外信息表DAO接口
 *
 * @author duan
 * @version 2016-08-17
 */
@MyBatisDao
public interface CmsForeignCountryDao extends CrudDao<CmsForeignCountry> {

    /**
     * 查询国外前5个国家
     */
    public List<CmsForeignCountry> selectFrontForejgnCountry();

    /**
     * 根据区域id查询区域国家
     */
    public List<CmsForeignCountry> selectCountrysAccAid(String id);

}