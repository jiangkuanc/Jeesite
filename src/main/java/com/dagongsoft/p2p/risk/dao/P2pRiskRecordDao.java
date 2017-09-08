package com.dagongsoft.p2p.risk.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.risk.entity.P2pRiskRecord;

/**
 * 风险测评记录表DAO接口
 *
 * @author Zeus
 * @version 2016-11-14
 */
@MyBatisDao
public interface P2pRiskRecordDao extends CrudDao<P2pRiskRecord> {

}