package com.dagongsoft.p2p.repayment.service;

import java.util.List;

import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 投资人收款计划表Service
 *
 * @author Zeus
 * @version 2016-11-08
 */
public interface P2pReceivePlanService {

    public P2pReceivePlan get(String id);

    public List<P2pReceivePlan> findList(P2pReceivePlan p2pReceivePlan);

    public Page<P2pReceivePlan> findPage(Page<P2pReceivePlan> page, P2pReceivePlan p2pReceivePlan);

    public void save(P2pReceivePlan p2pReceivePlan);

    public void delete(P2pReceivePlan p2pReceivePlan);

    /**
     * 根据投资人id查询收款计划
     *
     * @param p2pReceivePlan
     * @return P2pReceivePlan
     * @author Chace
     */
    public List<P2pReceivePlan> findPlanByUserId(P2pReceivePlan p2pReceivePlan);

    public Integer findAllCountDistinctUserId();

    /**
     * 根据债项id查询个人标每期所有人应收利息的和
     *
     * @param p2pReceivePlan
     * @return sumInterest
     * @author Chace
     */
    public List<Double> getSumByfinancingId(String financingInformationId);
}