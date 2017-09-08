package com.dagongsoft.p2p.financing.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.financing.entity.P2pRiskControlRecord;

/**
 * 募集期风控记录表DAO接口
 *
 * @author Zeus
 * @version 2016-11-14
 */
@MyBatisDao
public interface P2pRiskControlRecordDao extends CrudDao<P2pRiskControlRecord> {
    /**
     * 根据债项id查询
     *
     * @param p2pRiskControlRecord
     * @return p2pRiskControlRecord
     * @author Chace
     */
    public P2pRiskControlRecord getByFid(P2pRiskControlRecord p2pRiskControlRecord);
}