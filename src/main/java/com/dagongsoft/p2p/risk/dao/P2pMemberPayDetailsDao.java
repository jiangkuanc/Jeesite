package com.dagongsoft.p2p.risk.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.risk.entity.P2pMemberPayDetails;

/**
 * 会员付费详情表DAO接口
 *
 * @author Joe
 * @version 2016-12-02
 */
@MyBatisDao
public interface P2pMemberPayDetailsDao extends CrudDao<P2pMemberPayDetails> {

}