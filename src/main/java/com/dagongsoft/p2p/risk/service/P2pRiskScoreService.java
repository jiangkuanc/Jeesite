package com.dagongsoft.p2p.risk.service;

import java.util.List;


import com.dagongsoft.p2p.risk.entity.P2pRiskScore;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 测评分数表Service
 *
 * @author Zeus
 * @version 2016-11-14
 */
public interface P2pRiskScoreService {

    public P2pRiskScore get(String id);

    public List<P2pRiskScore> findList(P2pRiskScore p2pRiskScore);

    public Page<P2pRiskScore> findPage(Page<P2pRiskScore> page, P2pRiskScore p2pRiskScore);

    public void save(P2pRiskScore p2pRiskScore);

    public void delete(P2pRiskScore p2pRiskScore);

}