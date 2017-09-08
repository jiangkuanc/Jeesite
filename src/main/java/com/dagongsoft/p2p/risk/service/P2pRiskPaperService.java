package com.dagongsoft.p2p.risk.service;

import java.util.List;

import com.dagongsoft.p2p.risk.entity.P2pRiskPaper;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 风险测评问卷表Service
 *
 * @author Zeus
 * @version 2016-11-14
 */
public interface P2pRiskPaperService {

    public P2pRiskPaper get(String id);

    public List<P2pRiskPaper> findList(P2pRiskPaper p2pRiskPaper);

    public Page<P2pRiskPaper> findPage(Page<P2pRiskPaper> page, P2pRiskPaper p2pRiskPaper);

    public void save(P2pRiskPaper p2pRiskPaper);

    public void delete(P2pRiskPaper p2pRiskPaper);

    public P2pRiskPaper getByUserId(String id);

    public void updateXg(P2pRiskPaper p2pRiskPaper);

    public void updatePaperState(P2pRiskPaper p2pRiskPaper);
}