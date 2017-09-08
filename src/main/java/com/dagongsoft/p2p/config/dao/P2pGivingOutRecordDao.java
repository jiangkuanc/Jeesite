package com.dagongsoft.p2p.config.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.config.entity.P2pGivingOutRecord;

/**
 * 放款审核记录DAO接口
 *
 * @author Chace
 * @version 2017-02-17
 */
@MyBatisDao
public interface P2pGivingOutRecordDao extends CrudDao<P2pGivingOutRecord> {

}