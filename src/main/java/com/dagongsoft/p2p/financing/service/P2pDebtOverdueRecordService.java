package com.dagongsoft.p2p.financing.service;

import java.util.List;


import com.dagongsoft.p2p.financing.entity.P2pDebtOverdueRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 债项逾期记录表Service
 *
 * @author Zeus
 * @version 2016-11-11
 */
public interface P2pDebtOverdueRecordService {

    public P2pDebtOverdueRecord get(String id);

    public List<P2pDebtOverdueRecord> findList(P2pDebtOverdueRecord p2pDebtOverdueRecord);

    public Page<P2pDebtOverdueRecord> findPage(Page<P2pDebtOverdueRecord> page, P2pDebtOverdueRecord p2pDebtOverdueRecord);

    public void save(P2pDebtOverdueRecord p2pDebtOverdueRecord);

    public void delete(P2pDebtOverdueRecord p2pDebtOverdueRecord);

    public Integer numberProjectsLimit();

}