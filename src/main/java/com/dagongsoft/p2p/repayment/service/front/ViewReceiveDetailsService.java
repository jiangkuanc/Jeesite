package com.dagongsoft.p2p.repayment.service.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.repayment.dao.P2pReceivePlanDao;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;

/**
 * 查看收款详情Service
 *
 * @author Quincy
 */
@Service
@Transactional(readOnly = true)
public class ViewReceiveDetailsService {

    @Autowired
    private P2pReceivePlanDao p2pReceivePlanDao;

    /**
     * 根据还款期数查询收款人明细列表
     *
     * @param financingInformationId
     * @param phase
     * @return
     * @author Quincy
     */
    public List<P2pReceivePlan> findIncomeDetails(String financingInformationId, String phase) {
        P2pReceivePlan p2pReceivePlan = new P2pReceivePlan();
        p2pReceivePlan.setFinancingInformationId(financingInformationId);
        p2pReceivePlan.setPhase(phase);
        return p2pReceivePlanDao.findIncomeDetails(p2pReceivePlan);
    }
}
