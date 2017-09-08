/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.P2pProductInfo;

/**
 * 产品供给信息DAO接口
 *
 * @author lsm
 * @version 2016-08-06
 */
@MyBatisDao
public interface P2pProductInfoDao extends CrudDao<P2pProductInfo> {

    public List<P2pProductInfo> selectProductInfo();

    public List<P2pProductInfo> findFromList();

    public List<P2pProductInfo> findProductList();

}