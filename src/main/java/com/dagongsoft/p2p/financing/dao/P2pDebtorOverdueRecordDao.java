package com.dagongsoft.p2p.financing.dao;

import java.util.List;

import com.dagongsoft.p2p.financing.entity.P2pDebtorOverdueRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 债务人逾期记录表DAO接口
 *
 * @author Zeus
 * @version 2016-11-11
 */
@MyBatisDao
public interface P2pDebtorOverdueRecordDao extends CrudDao<P2pDebtorOverdueRecord> {

    /**
     * 债务人逾期记录表
     *
     * @param P2pDebtorOverdueRecord
     * @author Zeus
     */
    public List<P2pDebtorOverdueRecord> getDebtorOverdueList(P2pDebtorOverdueRecord p2pDebtorOverdueRecord);

    //根据userId计算当前债务人逾期数据
    public P2pDebtorOverdueRecord calcByUserId(String userId);

    //根据userId查询当前债务人逾期记录
    public P2pDebtorOverdueRecord getByUserId(String userId);

}