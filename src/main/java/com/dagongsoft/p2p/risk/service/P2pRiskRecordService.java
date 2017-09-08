package com.dagongsoft.p2p.risk.service;

import java.util.List;


import com.dagongsoft.p2p.risk.entity.P2pRiskRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 风险测评记录表Service
 *
 * @author Zeus
 * @version 2016-11-14
 */
public interface P2pRiskRecordService {

    public P2pRiskRecord get(String id);

    public List<P2pRiskRecord> findList(P2pRiskRecord p2pRiskRecord);

    public Page<P2pRiskRecord> findPage(Page<P2pRiskRecord> page, P2pRiskRecord p2pRiskRecord);

    public void save(P2pRiskRecord p2pRiskRecord);

    public void delete(P2pRiskRecord p2pRiskRecord);

}