package com.dagongsoft.p2p.risk.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.risk.entity.P2pRiskScore;
import com.dagongsoft.p2p.risk.dao.P2pRiskScoreDao;
import com.dagongsoft.p2p.risk.service.P2pRiskScoreService;

/**
 * 测评分数表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Transactional(readOnly = true)
@Service("p2pRiskScoreService")
public class P2pRiskScoreServiceImpl extends CrudService<P2pRiskScoreDao, P2pRiskScore> implements P2pRiskScoreService {

    public P2pRiskScore get(String id) {
        return super.get(id);
    }

    public List<P2pRiskScore> findList(P2pRiskScore p2pRiskScore) {
        return super.findList(p2pRiskScore);
    }

    public Page<P2pRiskScore> findPage(Page<P2pRiskScore> page, P2pRiskScore p2pRiskScore) {
        return super.findPage(page, p2pRiskScore);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRiskScore p2pRiskScore) {
        super.save(p2pRiskScore);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRiskScore p2pRiskScore) {
        super.delete(p2pRiskScore);
    }

}