package com.dagongsoft.p2p.risk.service;

import java.util.List;


import com.dagongsoft.p2p.risk.entity.P2pRiskQuestion;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 风险测评问题表Service
 *
 * @author Zeus
 * @version 2016-11-14
 */
public interface P2pRiskQuestionService {

    public P2pRiskQuestion get(String id);

    public List<P2pRiskQuestion> findList(P2pRiskQuestion p2pRiskQuestion);

    public Page<P2pRiskQuestion> findPage(Page<P2pRiskQuestion> page, P2pRiskQuestion p2pRiskQuestion);

    public void save(P2pRiskQuestion p2pRiskQuestion);

    public void delete(P2pRiskQuestion p2pRiskQuestion);

    public List<P2pRiskQuestion> getPaperId(String id);

}