package com.dagongsoft.p2p.financing.service;

import java.util.List;


import com.dagongsoft.p2p.financing.entity.P2pDebtorOverdueRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 债务人逾期记录表Service
 *
 * @author Zeus
 * @version 2016-11-11
 */
public interface P2pDebtorOverdueRecordService {

    public P2pDebtorOverdueRecord get(String id);

    public List<P2pDebtorOverdueRecord> findList(P2pDebtorOverdueRecord p2pDebtorOverdueRecord);

    public Page<P2pDebtorOverdueRecord> findPage(Page<P2pDebtorOverdueRecord> page, P2pDebtorOverdueRecord p2pDebtorOverdueRecord);

    public void save(P2pDebtorOverdueRecord p2pDebtorOverdueRecord);

    public void delete(P2pDebtorOverdueRecord p2pDebtorOverdueRecord);

}