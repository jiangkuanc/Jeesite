package com.dagongsoft.p2p.user.dao;

import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 账户表DAO接口
 *
 * @author Joe
 * @version 2016-11-07
 */
@MyBatisDao
public interface P2pAccountDao extends CrudDao<P2pAccount> {

    /**
     * 根据userid获取账户表信息
     *
     * @param userId
     * @return
     * @author Zeus
     */
    public P2pAccount getAccountByUserId(String userId);
}