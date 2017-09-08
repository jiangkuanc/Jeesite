package com.dagongsoft.p2p.repayment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;

/**
 * 投资人收款计划表DAO接口
 *
 * @author Zeus
 * @version 2016-11-08
 */
@MyBatisDao
public interface P2pReceivePlanDao extends CrudDao<P2pReceivePlan> {

    /**
     * 获得用户计划（实际） 收款 利息（本金/罚金） 总和
     *
     * @param userId
     * @return
     * @author Zeus
     */
    public P2pReceivePlan getUserSumAmount(String userId);

    /**
     * 获得用户计划（实际） 收款 利息（本金/罚金） 总和
     *
     * @param userId
     * @return
     * @author Zeus
     */
    public P2pReceivePlan getUserDebtSumAmount(@Param("userId") String userId, @Param("financingInformationId") String financingInformationId);

    /**
     * 用户最近一笔实际收款和计划收款记录
     *
     * @param userId
     * @return
     * @author Zeus
     */
    public P2pReceivePlan getUserLatelyAmount(String userId);

    /**
     * 根据还款期数查询收款人明细列表
     *
     * @param p2pReceivePlan
     * @return
     * @author Quincy
     */
    public List<P2pReceivePlan> findIncomeDetails(P2pReceivePlan p2pReceivePlan);


    /**
     * 根据债项id和期数查询当前期数所有收款人收款信息
     *
     * @param financingInformationId
     * @param phase
     * @return
     * @author Zeus
     */
    public List<P2pReceivePlan> getCurrentPhaseReceivePlan(@Param("financingInformationId") String financingInformationId, @Param("phase") String phase);


    /**
     * 根据投资人ID查询累计收益
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public Double findIncomeSumByUid(String userId);

    /**
     * 根据投资人id查询收款计划
     *
     * @param p2pReceivePlan
     * @return P2pReceivePlan
     * @author Chace
     */
    public List<P2pReceivePlan> findPlanByUserId(P2pReceivePlan p2pReceivePlan);

    /**
     * 投资人收款计划表 userId去重
     *
     * @return
     * @author Sora
     */
    public Integer findAllCountDistinctUserId();

    /**
     * 根据债项id查询个人标每期所有人应收利息的和
     *
     * @param p2pReceivePlan
     * @return sumInterest
     * @author Chace
     */
    public List<Double> getSumByfinancingId(String financingInformationId);

    /**
     * 当期还款金额分配
     *
     * @param financingInformationId
     * @param phase
     * @return
     */
    public List<P2pReceivePlan> getCurrentRepaymentDetails(@Param("financingInformationId") String financingInformationId, @Param("phase") String phase);
}