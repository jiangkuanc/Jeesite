/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsForeignArea;

/**
 * 国外区域表DAO接口
 *
 * @author duan
 * @version 2016-08-17
 */
@MyBatisDao
public interface CmsForeignAreaDao extends CrudDao<CmsForeignArea> {
    /**
     * 查询国外区域名称及ID
     *
     * @return
     */
    public List<CmsForeignArea> selecForeignArea();

    /**
     * 查询前5个区域
     *
     * @return
     */
    public List<CmsForeignArea> selectFrontForeignArea();


}