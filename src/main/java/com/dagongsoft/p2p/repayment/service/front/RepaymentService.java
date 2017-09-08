/**
 *
 */
package com.dagongsoft.p2p.repayment.service.front;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.repayment.dao.P2pReceivePlanDao;
import com.dagongsoft.p2p.repayment.dao.P2pReceiveRecordDao;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentPlanDao;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentRecordDao;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.dagongsoft.p2p.repayment.entity.P2pReceiveRecord;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentRecord;
import com.dagongsoft.p2p.user.dao.P2pAccountDao;
import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * @author Zeus
 * @2016-11-15
 */
@Service
@Transactional(readOnly = true)
public class RepaymentService {

    @Resource
    private P2pRepaymentPlanDao p2pRepaymentPlanDao;
    @Resource
    private P2pRepaymentRecordDao p2pRepaymentRecordDao;
    @Resource
    private P2pReceivePlanDao p2pReceivePlanDao;
    @Resource
    private P2pReceiveRecordDao p2pReceiveRecordDao;
    @Resource
    private P2pAccountDao p2pAccountDao;
    @Resource
    private P2pFinancingInformationDao p2pFinancingInformationDao;

    /**
     * 还款记账（更新还款计划、收款计划、新增还款记录、收款记录）
     *
     * @param financingInformationId 债项id
     * @param phase                  账期
     * @param repaymentVouchar       还款凭证
     * @param realRepaymentDate      还款日期
     * @param markType               标的类型（1机构，2个人）
     * @author Zeus
     */
    @Transactional(readOnly = false)
    public boolean repaymentAccouting(String financingInformationId, String phase,
                                      String repaymentVouchar, Date realRepaymentDate, String markType) {
        if (financingInformationId != null && phase != null && realRepaymentDate != null
                && !"".equals(financingInformationId) && !"".equals(phase) && !"".equals(repaymentVouchar) && !"".equals(realRepaymentDate)) {

            //1、更新还款计划
            P2pRepaymentPlan p2pRepaymentPlan = p2pRepaymentPlanDao.getCurrentPhaseRepaymentPlan(financingInformationId, phase);
            p2pRepaymentPlan.setRepaymentState("3");//设置还款状态为已还款
            p2pRepaymentPlanDao.update(p2pRepaymentPlan);
            //2、新增还款记录
            P2pRepaymentRecord p2pRepaymentRecord = new P2pRepaymentRecord();
            p2pRepaymentRecord.setId(IdGen.uuid());
            p2pRepaymentRecord.setRepaymentPlanId(p2pRepaymentPlan.getId());//还款计划表id
            p2pRepaymentRecord.setRealRepaymentDate(realRepaymentDate);//实际还款日期
            p2pRepaymentRecord.setRealRepaymentPrincipal(p2pRepaymentPlan.getPlanRepaymentPrincipal());//时间还款本金
            p2pRepaymentRecord.setRealRepaymentInterest(p2pRepaymentPlan.getPlanRepaymentInterest());//实际还款利息
            p2pRepaymentRecord.setRealRepaymentFine(p2pRepaymentPlan.getFine());//实际还款罚金
            p2pRepaymentRecord.setRepaymentAuditState("1");//审核状态
            if (markType == "1") { //机构
                p2pRepaymentRecord.setRepaymentVoucher(repaymentVouchar);//还款凭证地址
            } else if (markType == "2") { //个人
                P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationDao.getById(financingInformationId);
                P2pAccount p2pAccount = p2pAccountDao.getAccountByUserId(p2pFinancingInformation.getApplicantsId());
                if (p2pAccount != null) {
                    p2pRepaymentRecord.setRepaymentAccount(p2pAccount.getZjAccount());//还款账户
                }
            }
            p2pRepaymentRecordDao.insert(p2pRepaymentRecord);
            //3、更新收款计划
            List<P2pReceivePlan> list = p2pReceivePlanDao.getCurrentPhaseReceivePlan(financingInformationId, phase);
            for (P2pReceivePlan p : list) {
                p.setReceiveState("3");//设置收款状态为已收款
                p2pReceivePlanDao.update(p);
                //4、新增收款记录
                P2pReceiveRecord p2pReceiveRecord = new P2pReceiveRecord();
                p2pReceiveRecord.setId(IdGen.uuid());
                p2pReceiveRecord.setReceivePlanId(p.getId());//收款计划表id
                p2pReceiveRecord.setRealReceiveDate(realRepaymentDate);//实际收款日期
                p2pReceiveRecord.setRealReceivePrincipal(p.getPlanReceivePrincipal());//实际收款本金
                p2pReceiveRecord.setRealReceiveInterest(p.getPlanReceiveInterest());//实际收款利息
                p2pReceiveRecord.setRealReceiveFine(p.getPlanReceiveFine());//实际收款罚金

                P2pAccount p2pAccount = p2pAccountDao.getAccountByUserId(p.getUserId());
                if (p2pAccount != null) {
                    p2pReceiveRecord.setReceiveAccount(p2pAccount.getZjAccount());//收款账户
                }
                p2pReceiveRecordDao.insert(p2pReceiveRecord);
            }
            return true;
        } else {
            return false;
        }
    }

    /**
     * 根据ID修改还款信息（还款凭证、还款时间、还款审核状态）
     *
     * @param p2pRepaymentRecord
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void updateRepayInfo(P2pRepaymentRecord p2pRepaymentRecord) {
        p2pRepaymentRecordDao.updateRepayInfo(p2pRepaymentRecord);
    }

}
