package com.dagongsoft.p2p.repayment.dao;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 还款计划表DAO接口
 *
 * @author Quincy
 * @version 2016-11-03
 */
@MyBatisDao
public interface P2pRepaymentPlanDao extends CrudDao<P2pRepaymentPlan> {

    /**
     * 前台查询还款明细
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<P2pRepaymentPlan> findRepaymentDetailsByFid(String financingInformationId);

    /**
     * 查询未还款总额
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public Double findNotPaidAmountByFid(String financingInformationId);

    /**
     * 查询已还款总额
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public Double findHasPaidAmountByFid(String financingInformationId);

    /**
     * 查询逾期罚金总额
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public Double findOverdueFineByFid(String financingInformationId);

    /**
     * 根据ID修改还款状态
     *
     * @param p2pRepaymentPlan
     * @author Quincy
     */
    public void updateRepaymentStateById(P2pRepaymentPlan p2pRepaymentPlan);


    /**
     * 根据债项ID查询待还款列表
     *
     * @param p2pRepaymentPlan
     * @return
     * @author Quincy
     */
    public List<P2pRepaymentPlan> findNoPaidListByFid(P2pRepaymentPlan p2pRepaymentPlan);

    /**
     * 根据债项ID查询已还款列表
     *
     * @param p2pRepaymentPlan
     * @return
     * @author Quincy
     */
    public List<P2pRepaymentPlan> findHasPaidListByFid(P2pRepaymentPlan p2pRepaymentPlan);

    /**
     * 根据用户ID查询逾期列表
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public List<P2pRepaymentPlan> findOverdueListByUserId(String userId);


    /**
     * 根据债项id查询债项逾期次数
     *
     * @param financingInformationId
     * @return
     * @author Zeus
     */
    public Integer getDebtOverdueNum(String financingInformationId);

    /**
     * 根据债项id查询债项逾期次数
     *
     * @param financingInformationId
     * @return
     * @author Zeus
     */
    public Double getDebtOverdueAmount(String financingInformationId);

    /**
     * 根据债项id查询债项已还总期数
     *
     * @param financingInformationId
     * @return
     * @author Zeus
     */
    public Integer getDebtRepaymentPhaseNum(String financingInformationId);

    /**
     * 根据债项id和期数查询当前期数还款信息
     *
     * @param financingInformationId
     * @return
     * @author Zeus
     */
    public P2pRepaymentPlan getCurrentPhaseRepaymentPlan(@Param("financingInformationId") String financingInformationId, @Param("phase") String phase);

    /**
     * 根据债项id查询还款计划
     *
     * @param financingInformationId
     * @return
     * @author Zeus
     */
    public List<P2pRepaymentPlan> getRepaymentPlanByFid(String financingInformationId);

    /**
     * 根据债项id查询还款记录
     *
     * @param financingInformationId
     * @return
     * @author Zeus
     */
    public List<P2pRepaymentPlan> getRepaymentRecordByFid(String financingInformationId);


    /**
     * 根据期数查询每笔款项信息
     *
     * @param p2pRepaymentPlan
     * @return
     * @author Quincy
     */
    public P2pRepaymentPlan findPaymentDetailsByPhase(P2pRepaymentPlan p2pRepaymentPlan);

    /**
     * 获得每一期未还完债项集合
     *
     * @return
     * @author Zeus
     */
    public List<P2pRepaymentPlan> getNotRepaymentDebt();

    /**
     * 计划还款本金累加
     *
     * @author Sora
     * @return0
     */
    public BigDecimal findAllPlanRepaymentPrincipal();

    /**
     * 还款计划条数和去重债项编号
     *
     * @return
     * @author Sora
     */
    public Integer findAllCountDistinctFid();

    /**
     * 融资人数
     *
     * @return
     * @author Sora
     */
    public Integer findFiNumber();

    /**
     * 代偿金额
     *
     * @return
     * @author Sora
     */
    public BigDecimal SumPlanRepaymentPrincipal();

    /**
     * 逾期金额
     *
     * @return
     * @author Sora
     */
    public BigDecimal OverDueTotal();

    /**
     * 待偿金额最大的融资人的待偿金额
     *
     * @return
     * @author Sora
     */
    public BigDecimal findDaichangHuan();

    /**
     * 代偿金额最大的前十位融资人 的代偿金额总和
     *
     * @return
     * @author Sora
     */
    public BigDecimal findDaichangHuanTopTen();

    /**
     * 查询处于还款预警状态的融资项目
     *
     * @return
     */
    public List<P2pRepaymentPlan> findRepaymentAndWarning(Date date);
}