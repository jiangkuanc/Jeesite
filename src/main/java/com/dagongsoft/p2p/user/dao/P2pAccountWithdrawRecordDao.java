package com.dagongsoft.p2p.user.dao;

import java.util.List;

import com.dagongsoft.p2p.user.entity.P2pAccountWithdrawRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 提现记录DAO接口
 *
 * @author Chace
 * @version 2016-11-21
 */
@MyBatisDao
public interface P2pAccountWithdrawRecordDao extends CrudDao<P2pAccountWithdrawRecord> {
    /**
     * 根据userId查询提现记录
     *
     * @param P2pAccountWithdrawRecord
     * @return list
     * @author Chace
     */
    public List<P2pAccountWithdrawRecord> getByUserId(P2pAccountWithdrawRecord p2pAccountWithdrawRecord);

}