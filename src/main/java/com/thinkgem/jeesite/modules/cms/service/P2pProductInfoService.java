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
import com.thinkgem.jeesite.modules.cms.dao.P2pProductInfoDao;
import com.thinkgem.jeesite.modules.cms.entity.P2pProductInfo;

/**
 * 产品供给信息Service
 *
 * @author lsm
 * @version 2016-08-06
 */
@Service
@Transactional(readOnly = true)
public class P2pProductInfoService extends CrudService<P2pProductInfoDao, P2pProductInfo> {
    @Autowired
    private P2pProductInfoDao p2pProductInfoDao;

    public P2pProductInfo get(String id) {
        return super.get(id);
    }

    public List<P2pProductInfo> findList(P2pProductInfo p2pProductInfo) {
        return super.findList(p2pProductInfo);
    }

    public Page<P2pProductInfo> findPage(Page<P2pProductInfo> page, P2pProductInfo p2pProductInfo) {
        return super.findPage(page, p2pProductInfo);
    }

    @Transactional(readOnly = false)
    public void save(P2pProductInfo p2pProductInfo) {
        super.save(p2pProductInfo);
    }

    @Transactional(readOnly = false)
    public void delete(P2pProductInfo p2pProductInfo) {
        super.delete(p2pProductInfo);
    }

    @Transactional(readOnly = false)
    public List<P2pProductInfo> selectProductInfo() {
        return p2pProductInfoDao.selectProductInfo();
    }

    public List<P2pProductInfo> findFromList(P2pProductInfo p2pProductInfo) {
        // TODO Auto-generated method stub
        return p2pProductInfoDao.findFromList();
    }

    public List<P2pProductInfo> findProductList() {
        return p2pProductInfoDao.findProductList();
    }

}