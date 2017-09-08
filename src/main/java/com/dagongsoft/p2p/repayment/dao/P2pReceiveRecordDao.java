package com.dagongsoft.p2p.repayment.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.repayment.entity.P2pReceiveRecord;

/**
 * 投资人收款记录表DAO接口
 *
 * @author Zeus
 * @version 2016-11-08
 */
@MyBatisDao
public interface P2pReceiveRecordDao extends CrudDao<P2pReceiveRecord> {

    /**
     * 查询累计收益
     */
    public Double queryAccIncome(@Param("userId") String userId);

    /**
     * 根据receivePlanId修改实际收款罚金
     *
     * @param receivePlanId
     * @param realReceiveFine
     */
    public void updateFineByReceivePlanId(@Param("receivePlanId") String receivePlanId, @Param("realReceiveFine") Double realReceiveFine);
}