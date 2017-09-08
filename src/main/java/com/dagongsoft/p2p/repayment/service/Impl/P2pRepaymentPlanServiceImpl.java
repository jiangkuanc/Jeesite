package com.dagongsoft.p2p.repayment.service.Impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.repayment.dao.P2pRepaymentPlanDao;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentPlanService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 还款计划表ServiceImpl
 *
 * @author Quincy
 * @version 2016-11-03
 */
@Transactional(readOnly = true)
@Service("p2pRepaymentPlanService")
public class P2pRepaymentPlanServiceImpl extends CrudService<P2pRepaymentPlanDao, P2pRepaymentPlan> implements P2pRepaymentPlanService {
    @Resource
    private P2pRepaymentPlanDao p2pRepaymentPlanDao;

    public P2pRepaymentPlan get(String id) {
        return super.get(id);
    }

    public List<P2pRepaymentPlan> findList(P2pRepaymentPlan p2pRepaymentPlan) {
        return super.findList(p2pRepaymentPlan);
    }

    public Page<P2pRepaymentPlan> findPage(Page<P2pRepaymentPlan> page, P2pRepaymentPlan p2pRepaymentPlan) {
        return super.findPage(page, p2pRepaymentPlan);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRepaymentPlan p2pRepaymentPlan) {
        super.save(p2pRepaymentPlan);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRepaymentPlan p2pRepaymentPlan) {
        super.delete(p2pRepaymentPlan);
    }

    @Override
    public BigDecimal findAllPlanRepaymentPrincipal() {
        return p2pRepaymentPlanDao.findAllPlanRepaymentPrincipal();
    }

    @Override
    public Integer findAllCountDistinctFid() {
        return p2pRepaymentPlanDao.findAllCountDistinctFid();
    }

    @Override
    public Integer findFiNumber() {
        return p2pRepaymentPlanDao.findFiNumber();
    }

    @Override
    public BigDecimal SumPlanRepaymentPrincipal() {
        return p2pRepaymentPlanDao.SumPlanRepaymentPrincipal();
    }

    @Override
    public BigDecimal OverDueTotal() {
        return p2pRepaymentPlanDao.OverDueTotal();
    }

    @Override
    public BigDecimal findDaichangHuan() {
        return p2pRepaymentPlanDao.findDaichangHuan();
    }

    public BigDecimal findDaichangHuanTopTen() {
        return p2pRepaymentPlanDao.findDaichangHuanTopTen();
    }
}