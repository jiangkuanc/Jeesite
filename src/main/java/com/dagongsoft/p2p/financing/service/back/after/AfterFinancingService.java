/**
 *
 */
package com.dagongsoft.p2p.financing.service.back.after;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.repayment.dao.P2pReceivePlanDao;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentPlanDao;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.dagongsoft.p2p.utils.ZMath;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 撮合后债项列表Service
 *
 * @author Zeus
 * @2016-11-10
 */
@Service
@Transactional(readOnly = true)
public class AfterFinancingService {

    @Autowired
    private P2pFinancingInformationDao p2pFinancingInformationDao;
    @Resource
    private MoneyService moneyService;
    @Resource
    private P2pRepaymentPlanDao p2pRepaymentPlanDao;
    @Resource
    private P2pReceivePlanDao p2pReceivePlanDao;

    /**
     * 撮合后债项列表查询
     *
     * @param p2pFinancingInformation
     * @return p2pFinancingInformation
     * @author Zeus
     */
    public List<P2pFinancingInformation> getAfterFinancingList(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.getAfterFinancingList(p2pFinancingInformation);
    }

    /**
     * 撮合后债项列表分页
     *
     * @param page
     * @param p2pFinancingInformation
     * @return
     * @author Zeus
     */
    public Page<P2pFinancingInformation> getAfterFinancingPage(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        List<P2pFinancingInformation> list = getAfterFinancingList(p2pFinancingInformation);
        for (P2pFinancingInformation p : list) {
            String id = p.getId();
            p.setQbyhk(ZMath.add(moneyService.expectIncome(id), p.getFinancingAmount()));
            p.setOverdueNum(moneyService.DebtOverdueNum(id));
            p.setYhzjz(moneyService.DebtHasRepayment(id));
            p.setP2pRepaymentPlan(moneyService.currentRepaymentPlan(id));
        }
        page.setList(list);
        return page;
    }

    /**
     * 还款计划
     *
     * @param financingInformationId
     * @return
     * @author Zeus
     */
    public List<P2pRepaymentPlan> getRepaymentPlan(String financingInformationId) {
        return p2pRepaymentPlanDao.getRepaymentPlanByFid(financingInformationId);
    }

    /**
     * 根据债项id查询债项详情
     *
     * @param financingInformationId
     * @return
     */
    public P2pFinancingInformation getRepaymentPlanDebtDetails(String financingInformationId) {
        P2pFinancingInformation p = p2pFinancingInformationDao.getRepaymentPlanDebtDetails(financingInformationId);
        p.setQbyhk(ZMath.add(moneyService.expectIncome(financingInformationId), p.getFinancingAmount()));
        return p;
    }

    /**
     * 还款记录
     *
     * @param financingInformationId
     * @return
     */
    public List<P2pRepaymentPlan> getRepaymentRecord(String financingInformationId) {
        List<P2pRepaymentPlan> list = p2pRepaymentPlanDao.getRepaymentRecordByFid(financingInformationId);
        for (P2pRepaymentPlan p : list) {
            if (p.getP2pRepaymentRecord() != null && !"".equals(p.getP2pRepaymentRecord())) {
                p.getP2pRepaymentRecord().setRepaymentVoucher(UploadFileUtils.viewUrl(p.getP2pRepaymentRecord().getRepaymentVoucher()));
            }
        }
        return list;
    }

    /**
     * 当期还款金额分配
     *
     * @param financingInformationId
     * @param phase
     * @return
     */
    public List<P2pReceivePlan> getCurrentRepaymentDetails(String financingInformationId, String phase) {
        return p2pReceivePlanDao.getCurrentRepaymentDetails(financingInformationId, phase);
    }
}
