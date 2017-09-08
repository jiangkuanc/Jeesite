/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.user.dao.P2pCertificationDatabaseDao;
import com.dagongsoft.p2p.user.entity.P2pCertificationDatabase;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 个人身份认证数据库Service
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Service
@Transactional(readOnly = true)
public class P2pCertificationDatabaseService extends CrudService<P2pCertificationDatabaseDao, P2pCertificationDatabase> {

    @Autowired
    private P2pCertificationDatabaseDao p2pCertificationDatabaseDao;

    public P2pCertificationDatabase get(String id) {
        return super.get(id);
    }

    public List<P2pCertificationDatabase> findList(P2pCertificationDatabase p2pCertificationDatabase) {
        return super.findList(p2pCertificationDatabase);
    }

    public Page<P2pCertificationDatabase> findPage(Page<P2pCertificationDatabase> page, P2pCertificationDatabase p2pCertificationDatabase) {
        return super.findPage(page, p2pCertificationDatabase);
    }

    @Transactional(readOnly = false)
    public void save(P2pCertificationDatabase p2pCertificationDatabase) {
        super.save(p2pCertificationDatabase);
    }

    @Transactional(readOnly = false)
    public void delete(P2pCertificationDatabase p2pCertificationDatabase) {
        super.delete(p2pCertificationDatabase);
    }

    /**
     * 通过身份证号和姓名查询数据
     *
     * @param p2pCertificationDatabase
     * @return
     * @author Quincy
     */
    public P2pCertificationDatabase findByIdNumber(P2pCertificationDatabase p2pCertificationDatabase) {
        return p2pCertificationDatabaseDao.findByIdNumber(p2pCertificationDatabase);
    }

    /**
     * 添加身份信息
     *
     * @param p2pCertificationDatabase
     * @author Quincy
     */
    public void insertNewInfo(P2pCertificationDatabase p2pCertificationDatabase) {
        p2pCertificationDatabaseDao.insertNewInfo(p2pCertificationDatabase);
    }
}