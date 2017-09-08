package com.dagongsoft.p2p.user.service.front;

import java.util.List;


import com.dagongsoft.p2p.user.entity.P2pAccountRechargeRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 充值记录Service
 *
 * @author Chace
 * @version 2016-11-21
 */
public interface P2pAccountRechargeRecordService {

    public P2pAccountRechargeRecord get(String id);

    public List<P2pAccountRechargeRecord> findList(P2pAccountRechargeRecord p2pAccountRechargeRecord);

    public Page<P2pAccountRechargeRecord> findPage(Page<P2pAccountRechargeRecord> page, P2pAccountRechargeRecord p2pAccountRechargeRecord);

    public void save(P2pAccountRechargeRecord p2pAccountRechargeRecord);

    public void delete(P2pAccountRechargeRecord p2pAccountRechargeRecord);

    /**
     * 根据userId查询充值记录
     *
     * @param p2pAccountRechargeRecord
     * @return list
     * @author Chace
     */
    public List<P2pAccountRechargeRecord> getByUserId(P2pAccountRechargeRecord p2pAccountRechargeRecord);

}