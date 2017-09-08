/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.dao;

import com.dagongsoft.p2p.user.entity.P2pCertificationDatabase;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 个人身份认证数据库DAO接口
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@MyBatisDao
public interface P2pCertificationDatabaseDao extends CrudDao<P2pCertificationDatabase> {

    /**
     * 通过身份证号和姓名查询数据
     *
     * @param p2pCertificationDatabase
     * @return
     */
    public P2pCertificationDatabase findByIdNumber(P2pCertificationDatabase p2pCertificationDatabase);

    /**
     * 添加身份信息
     *
     * @param p2pCertificationDatabase
     */
    public void insertNewInfo(P2pCertificationDatabase p2pCertificationDatabase);
}