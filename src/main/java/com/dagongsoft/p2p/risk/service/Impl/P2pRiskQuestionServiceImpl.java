package com.dagongsoft.p2p.risk.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.risk.entity.P2pRiskQuestion;
import com.dagongsoft.p2p.risk.dao.P2pRiskQuestionDao;
import com.dagongsoft.p2p.risk.service.P2pRiskQuestionService;

/**
 * 风险测评问题表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Transactional(readOnly = true)
@Service("p2pRiskQuestionService")
public class P2pRiskQuestionServiceImpl extends CrudService<P2pRiskQuestionDao, P2pRiskQuestion> implements P2pRiskQuestionService {

    @Autowired
    private P2pRiskQuestionDao p2pRiskQuestionDao;

    public P2pRiskQuestion get(String id) {
        return super.get(id);
    }

    public List<P2pRiskQuestion> findList(P2pRiskQuestion p2pRiskQuestion) {
        return super.findList(p2pRiskQuestion);
    }

    public Page<P2pRiskQuestion> findPage(Page<P2pRiskQuestion> page, P2pRiskQuestion p2pRiskQuestion) {
        return super.findPage(page, p2pRiskQuestion);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRiskQuestion p2pRiskQuestion) {
        super.save(p2pRiskQuestion);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRiskQuestion p2pRiskQuestion) {
        super.delete(p2pRiskQuestion);
    }

    @Override
    public List<P2pRiskQuestion> getPaperId(String id) {
        return p2pRiskQuestionDao.getPaperId(id);
    }


}