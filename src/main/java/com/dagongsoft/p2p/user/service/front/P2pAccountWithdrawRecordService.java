package com.dagongsoft.p2p.user.service.front;

import java.util.List;


import com.dagongsoft.p2p.user.entity.P2pAccountWithdrawRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 提现记录Service
 *
 * @author Chace
 * @version 2016-11-21
 */
public interface P2pAccountWithdrawRecordService {

    public P2pAccountWithdrawRecord get(String id);

    public List<P2pAccountWithdrawRecord> findList(P2pAccountWithdrawRecord p2pAccountWithdrawRecord);

    public Page<P2pAccountWithdrawRecord> findPage(Page<P2pAccountWithdrawRecord> page, P2pAccountWithdrawRecord p2pAccountWithdrawRecord);

    public void save(P2pAccountWithdrawRecord p2pAccountWithdrawRecord);

    public void delete(P2pAccountWithdrawRecord p2pAccountWithdrawRecord);

    /**
     * 提现更新
     */
    public void update(P2pAccountWithdrawRecord p2pAccountWithdrawRecord);

    /**
     * 根据userId查询提现记录
     *
     * @param P2pAccountWithdrawRecord
     * @return list
     * @author Chace
     */
    public List<P2pAccountWithdrawRecord> getByUserId(P2pAccountWithdrawRecord p2pAccountWithdrawRecord);

}