package com.dagongsoft.p2p.risk.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.risk.entity.P2pRiskAnswer;
import com.dagongsoft.p2p.risk.dao.P2pRiskAnswerDao;
import com.dagongsoft.p2p.risk.service.P2pRiskAnswerService;

/**
 * 风险测评答案表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Transactional(readOnly = true)
@Service("p2pRiskAnswerService")
public class P2pRiskAnswerServiceImpl extends CrudService<P2pRiskAnswerDao, P2pRiskAnswer> implements P2pRiskAnswerService {

    @Autowired
    private P2pRiskAnswerDao p2pRiskAnswerDao;

    public P2pRiskAnswer get(String id) {
        return super.get(id);
    }

    public List<P2pRiskAnswer> findList(P2pRiskAnswer p2pRiskAnswer) {
        return super.findList(p2pRiskAnswer);
    }

    public Page<P2pRiskAnswer> findPage(Page<P2pRiskAnswer> page, P2pRiskAnswer p2pRiskAnswer) {
        return super.findPage(page, p2pRiskAnswer);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRiskAnswer p2pRiskAnswer) {
        super.save(p2pRiskAnswer);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRiskAnswer p2pRiskAnswer) {
        super.delete(p2pRiskAnswer);
    }

    @Override
    public List<P2pRiskAnswer> getRiskQuestionId(String id) {
        return p2pRiskAnswerDao.getRiskQuestionId(id);
    }

}