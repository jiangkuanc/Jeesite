package com.dagongsoft.p2p.risk.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.risk.entity.P2pRiskPaper;
import com.dagongsoft.p2p.risk.dao.P2pRiskPaperDao;
import com.dagongsoft.p2p.risk.service.P2pRiskPaperService;

/**
 * 风险测评问卷表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Transactional(readOnly = true)
@Service("p2pRiskPaperService")
public class P2pRiskPaperServiceImpl extends CrudService<P2pRiskPaperDao, P2pRiskPaper> implements P2pRiskPaperService {

    @Autowired
    private P2pRiskPaperDao p2pRiskPaperDao;

    public P2pRiskPaper get(String id) {
        return super.get(id);
    }

    public List<P2pRiskPaper> findList(P2pRiskPaper p2pRiskPaper) {
        return super.findList(p2pRiskPaper);
    }

    public Page<P2pRiskPaper> findPage(Page<P2pRiskPaper> page, P2pRiskPaper p2pRiskPaper) {
        return super.findPage(page, p2pRiskPaper);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRiskPaper p2pRiskPaper) {
        super.save(p2pRiskPaper);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRiskPaper p2pRiskPaper) {
        super.delete(p2pRiskPaper);
    }

    @Override
    public P2pRiskPaper getByUserId(String id) {
        return p2pRiskPaperDao.getByUserId(id);
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void updateXg(P2pRiskPaper p2pRiskPaper) {
        p2pRiskPaperDao.updateXg(p2pRiskPaper);
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void updatePaperState(P2pRiskPaper p2pRiskPaper) {
        p2pRiskPaperDao.updatePaperState(p2pRiskPaper);
    }

}