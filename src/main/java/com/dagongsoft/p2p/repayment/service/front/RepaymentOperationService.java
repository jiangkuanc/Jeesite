package com.dagongsoft.p2p.repayment.service.front;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentPlanDao;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;

/**
 * 还款操作Service
 *
 * @author Quincy
 */
@Service
@Transactional(readOnly = true)
public class RepaymentOperationService {

    @Autowired
    private P2pRepaymentPlanDao p2pRepaymentPlanDao;

    /**
     * 前台查询还款明细
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<P2pRepaymentPlan> findRepaymentDetailsByFid(String financingInformationId) {
        return p2pRepaymentPlanDao.findRepaymentDetailsByFid(financingInformationId);
    }

    /**
     * 根据债项ID查询还款统计	mode:	1.未还款总额	2.已还款总额	3.逾期罚金总额
     *
     * @param financingInformationId
     * @param mode
     * @return
     */
    public Double findRepaymentCountByFid(String financingInformationId, Integer mode) {
        Double amount = null;
        if (mode == 1) {
            amount = p2pRepaymentPlanDao.findNotPaidAmountByFid(financingInformationId);
            return amount != null ? amount : 0;
        }
        if (mode == 2) {
            amount = p2pRepaymentPlanDao.findHasPaidAmountByFid(financingInformationId);
            return amount != null ? amount : 0;
        }
        if (mode == 3) {
            amount = p2pRepaymentPlanDao.findOverdueFineByFid(financingInformationId);
            return amount != null ? amount : 0;
        }
        return (double) 0;
    }

    /**
     * 根据ID修改还款状态
     *
     * @param p2pRepaymentPlan
     * @author Quincy
     */
    public void updateRepaymentStateById(P2pRepaymentPlan p2pRepaymentPlan) {
        p2pRepaymentPlanDao.updateRepaymentStateById(p2pRepaymentPlan);
    }

    /**
     * 根据债项ID查询还款情况列表	mode:	1.未还款	2.已还款
     *
     * @param financingInformationId
     * @param mode
     * @return
     * @author Quincy
     */
    public List<P2pRepaymentPlan> findRepaymentListByFid(String userId, Date beginTime, Date endTime, Integer mode) {
        P2pRepaymentPlan p2pRepaymentPlan = null;
        if (mode == 1) {
            p2pRepaymentPlan = new P2pRepaymentPlan();
            P2pFinancingInformation p2p = new P2pFinancingInformation();
            p2p.setApplicantsId(userId);
            p2pRepaymentPlan.setP2pFinancingInformation(p2p);
            p2pRepaymentPlan.setBeginTime(beginTime);
            p2pRepaymentPlan.setEndTime(endTime);
            return p2pRepaymentPlanDao.findNoPaidListByFid(p2pRepaymentPlan);
        }
        if (mode == 2) {
            p2pRepaymentPlan = new P2pRepaymentPlan();
            P2pFinancingInformation p2p = new P2pFinancingInformation();
            p2p.setApplicantsId(userId);
            p2pRepaymentPlan.setP2pFinancingInformation(p2p);
            p2pRepaymentPlan.setBeginTime(beginTime);
            p2pRepaymentPlan.setEndTime(endTime);
            return p2pRepaymentPlanDao.findHasPaidListByFid(p2pRepaymentPlan);
        }
        return null;
    }

    /**
     * 根据用户ID查询逾期列表
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public List<P2pRepaymentPlan> findOverdueListByUserId(String userId) {
        return p2pRepaymentPlanDao.findOverdueListByUserId(userId);
    }

    /**
     * 根据期数查询每笔款项信息
     *
     * @param financingInformationId
     * @param phase
     * @return
     * @author Quincy
     */
    public P2pRepaymentPlan findPaymentDetailsByPhase(String financingInformationId, String phase) {
        P2pRepaymentPlan p2pRepaymentPlan = new P2pRepaymentPlan();
        p2pRepaymentPlan.setFinancingInformationId(financingInformationId);
        p2pRepaymentPlan.setPhase(phase);
        return p2pRepaymentPlanDao.findPaymentDetailsByPhase(p2pRepaymentPlan);
    }
}
