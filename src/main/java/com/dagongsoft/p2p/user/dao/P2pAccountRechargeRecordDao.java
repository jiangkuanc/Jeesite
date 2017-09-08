package com.dagongsoft.p2p.user.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.user.entity.P2pAccountRechargeRecord;

/**
 * 充值记录DAO接口
 *
 * @author Chace
 * @version 2016-11-21
 */
@MyBatisDao
public interface P2pAccountRechargeRecordDao extends CrudDao<P2pAccountRechargeRecord> {
    /**
     * 根据userId查询充值记录
     *
     * @param p2pAccountRechargeRecord
     * @return list
     * @author Chace
     */
    public List<P2pAccountRechargeRecord> getByUserId(P2pAccountRechargeRecord p2pAccountRechargeRecord);
}