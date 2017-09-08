package com.dagongsoft.p2p.financing.service;

import java.util.List;


import com.dagongsoft.p2p.financing.entity.P2pRiskControlRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 募集期风控记录表Service
 *
 * @author Zeus
 * @version 2016-11-14
 */
public interface P2pRiskControlRecordService {

    public P2pRiskControlRecord get(String id);

    public List<P2pRiskControlRecord> findList(P2pRiskControlRecord p2pRiskControlRecord);

    public Page<P2pRiskControlRecord> findPage(Page<P2pRiskControlRecord> page, P2pRiskControlRecord p2pRiskControlRecord);

    public void save(P2pRiskControlRecord p2pRiskControlRecord);

    public void delete(P2pRiskControlRecord p2pRiskControlRecord);

    /**
     * 根据债项id查询
     *
     * @param p2pRiskControlRecord
     * @return p2pRiskControlRecord
     * @author Chace
     */
    public P2pRiskControlRecord getByFid(P2pRiskControlRecord p2pRiskControlRecord);

}