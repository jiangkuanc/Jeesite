package com.dagongsoft.p2p.risk.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.risk.entity.P2pMember;

/**
 * 会员表DAO接口
 *
 * @author Joe
 * @version 2016-12-02
 */
@MyBatisDao
public interface P2pMemberDao extends CrudDao<P2pMember> {

    /**
     * 根据userid查询会员
     *
     * @param uid
     * @return
     */
    public P2pMember getMemberByUserId(String uid);
}