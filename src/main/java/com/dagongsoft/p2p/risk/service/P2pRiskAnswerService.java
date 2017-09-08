package com.dagongsoft.p2p.risk.service;

import java.util.List;

import com.dagongsoft.p2p.risk.entity.P2pRiskAnswer;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 风险测评答案表Service
 *
 * @author Zeus
 * @version 2016-11-14
 */
public interface P2pRiskAnswerService {

    public P2pRiskAnswer get(String id);

    public List<P2pRiskAnswer> findList(P2pRiskAnswer p2pRiskAnswer);

    public Page<P2pRiskAnswer> findPage(Page<P2pRiskAnswer> page, P2pRiskAnswer p2pRiskAnswer);

    public void save(P2pRiskAnswer p2pRiskAnswer);

    public void delete(P2pRiskAnswer p2pRiskAnswer);

    public List<P2pRiskAnswer> getRiskQuestionId(String id);

}