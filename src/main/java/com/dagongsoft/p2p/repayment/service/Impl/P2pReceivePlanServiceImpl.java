package com.dagongsoft.p2p.repayment.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.dagongsoft.p2p.repayment.dao.P2pReceivePlanDao;
import com.dagongsoft.p2p.repayment.service.P2pReceivePlanService;

/**
 * 投资人收款计划表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-08
 */
@Transactional(readOnly = true)
@Service("p2pReceivePlanService")
public class P2pReceivePlanServiceImpl extends CrudService<P2pReceivePlanDao, P2pReceivePlan> implements P2pReceivePlanService {
    @Resource
    private P2pReceivePlanDao p2pReceivePlanDao;

    public P2pReceivePlan get(String id) {
        return super.get(id);
    }

    public List<P2pReceivePlan> findList(P2pReceivePlan p2pReceivePlan) {
        return super.findList(p2pReceivePlan);
    }

    public Page<P2pReceivePlan> findPage(Page<P2pReceivePlan> page, P2pReceivePlan p2pReceivePlan) {
        return super.findPage(page, p2pReceivePlan);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pReceivePlan p2pReceivePlan) {
        super.save(p2pReceivePlan);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pReceivePlan p2pReceivePlan) {
        super.delete(p2pReceivePlan);
    }

    /**
     * 根据投资人id查询收款计划
     *
     * @param p2pReceivePlan
     * @return P2pReceivePlan
     * @author Chace
     */
    @Override
    public List<P2pReceivePlan> findPlanByUserId(P2pReceivePlan p2pReceivePlan) {
        return p2pReceivePlanDao.findPlanByUserId(p2pReceivePlan);
    }

    public Integer findAllCountDistinctUserId() {
        return p2pReceivePlanDao.findAllCountDistinctUserId();
    }

    ;

    /**
     * 根据债项id查询个人标每期所有人应收利息的和
     *
     * @param p2pReceivePlan
     * @return sumInterest
     * @author Chace
     */
    public List<Double> getSumByfinancingId(String financingInformationId) {
        return p2pReceivePlanDao.getSumByfinancingId(financingInformationId);
    }
}