package com.dagongsoft.p2p.repayment.service;

import java.math.BigDecimal;
import java.util.List;

import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 还款计划表Service
 *
 * @author Quincy
 * @version 2016-11-03
 */
public interface P2pRepaymentPlanService {

    public P2pRepaymentPlan get(String id);

    public List<P2pRepaymentPlan> findList(P2pRepaymentPlan p2pRepaymentPlan);

    public Page<P2pRepaymentPlan> findPage(Page<P2pRepaymentPlan> page, P2pRepaymentPlan p2pRepaymentPlan);

    public void save(P2pRepaymentPlan p2pRepaymentPlan);

    public void delete(P2pRepaymentPlan p2pRepaymentPlan);

    public BigDecimal findAllPlanRepaymentPrincipal();

    public Integer findAllCountDistinctFid();

    public Integer findFiNumber();

    public BigDecimal SumPlanRepaymentPrincipal();

    public BigDecimal OverDueTotal();

    public BigDecimal findDaichangHuan();

    public BigDecimal findDaichangHuanTopTen();


}