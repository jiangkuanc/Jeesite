package com.dagongsoft.p2p.user.dao;

import com.dagongsoft.p2p.user.entity.P2pAccountMoneyRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 账户金额记录表DAO接口
 *
 * @author Joe
 * @version 2016-11-04
 */
@MyBatisDao
public interface P2pAccountMoneyRecordDao extends CrudDao<P2pAccountMoneyRecord> {

}