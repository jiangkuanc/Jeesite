package com.dagongsoft.p2p.financing.dao;

import com.dagongsoft.p2p.financing.entity.P2pMarketConfirmRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 市场人员审核记录DAO接口
 *
 * @author Sora
 * @version 2016-11-07
 */
@MyBatisDao
public interface P2pMarketConfirmRecordDao extends CrudDao<P2pMarketConfirmRecord> {
    public P2pMarketConfirmRecord findById(String id);

    public P2pMarketConfirmRecord findByIdTwo(String id);
}