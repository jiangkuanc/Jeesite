/**
 *
 */
package com.dagongsoft.p2p.financing.service.back.after;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.OverduesService;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentRecordDao;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentVoucherAuditDao;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentRecord;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentVoucherAudit;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentVoucherAuditService;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * @author Zeus
 * @2017-2-16
 */
@Service
@Transactional(readOnly = true)
public class RepaymentVoucherAuditService {

    @Resource
    private P2pFinancingInformationDao p2pFinancingInformationDao;
    @Resource
    private OverduesService overduesService;
    @Resource
    private AfterFinancingService afterFinancingService;
    @Resource
    private P2pRepaymentRecordDao p2pRepaymentRecordDao;
    @Resource
    private P2pRepaymentVoucherAuditDao p2pRepaymentVoucherAuditDao;
    @Resource
    private P2pRepaymentVoucherAuditService p2pRepaymentVoucherAuditService;
    @Resource
    private P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao;

    /**
     * 还款凭证审核列表查询
     *
     * @param p2pFinancingInformation
     * @return p2pFinancingInformation
     * @author Zeus
     */
    public List<P2pFinancingInformation> getRepaymentVoucherAuditList(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.getRepaymentVoucherAuditList(p2pFinancingInformation);
    }

    /**
     * 还款凭证列表列表分页
     *
     * @param page
     * @param p2pFinancingInformation
     * @return
     * @author Zeus
     */
    public Page<P2pFinancingInformation> getRepaymentVoucherAuditListPage(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        List<P2pFinancingInformation> list = getRepaymentVoucherAuditList(p2pFinancingInformation);
        page.setList(list);
        return page;
    }

    /**
     * 还款凭证审核页面
     *
     * @param financingInformationId
     * @param model
     */
    public void repaymentVoucherAuditForm(String financingInformationId, String repaymentRecordId, Model model) {

        //借贷产品基本信息
        P2pFinancingInformation p2pFinancingInformation = afterFinancingService.getRepaymentPlanDebtDetails(financingInformationId);
        model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        //还款记录+审核意见
        P2pRepaymentRecord p2pRepaymentRecord = p2pRepaymentRecordDao.getRepaymentRecordById(repaymentRecordId);
        p2pRepaymentRecord.setRepaymentVoucher(UploadFileUtils.viewUrl(p2pRepaymentRecord.getRepaymentVoucher()));
        model.addAttribute("p2pRepaymentRecord", p2pRepaymentRecord);
        //历史审核记录
        List<P2pRepaymentVoucherAudit> p2pRepaymentVoucherAuditList = p2pRepaymentVoucherAuditDao.getByRepaymentRecordId(repaymentRecordId);
        for (P2pRepaymentVoucherAudit p : p2pRepaymentVoucherAuditList) {
            if (p.getRepaymentVoucher() != null && !"".equals(p.getRepaymentVoucher())) {
                p.setRepaymentVoucher(UploadFileUtils.viewUrl(p.getRepaymentVoucher()));
            }
        }
        model.addAttribute("p2pRepaymentVoucherAuditList", p2pRepaymentVoucherAuditList);
    }

    /**
     * 还款凭证审核
     *
     * @param p2pRepaymentVoucherAudit
     * @param realRepaymentDate        实际还款日期
     * @param planRepaymentDate        计划还款日期
     * @return
     */
    @Transactional(readOnly = false)
    public String repaymentVoucherAudit(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit, Date realRepaymentDate, Date planRepaymentDate) {
        //审核状态
        String state = p2pRepaymentVoucherAudit.getRepaymentAuditState();
        //期数
        String phase = p2pRepaymentVoucherAudit.getPhase();
        //借贷产品id
        String financingInformationId = p2pRepaymentVoucherAudit.getFinancingInformationId();
        if ("2".equals(state)) {
            //审核通过
            overduesService.overdueRollBack(financingInformationId, phase, realRepaymentDate, planRepaymentDate);
            //如果为最后一期 					-->更改Current_stage状态并添加到记录表
            String[] p = phase.split("/");
            if (p[0].equals(p[1])) {
                p2pFinancingInformationDao.updateCurrentStageById(financingInformationId, "900");
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                p2pBeforeMatchDebtState.setId(IdGen.uuid());
                p2pBeforeMatchDebtState.setFinacingInformationId(financingInformationId);
                p2pBeforeMatchDebtState.setProgressStage("900");
                p2pBeforeMatchDebtState.setStateTime(p2pRepaymentVoucherAudit.getRepaymentAuditTime());
                p2pBeforeMatchDebtState.setHandleResult(p2pRepaymentVoucherAudit.getRepaymentAuditReason());
                p2pBeforeMatchDebtState.setOperatorId(p2pRepaymentVoucherAudit.getRepaymentAuditPerson());
                p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
            }
            //更改审核状态，添加审核记录
            saveAuditStateAndRecord(p2pRepaymentVoucherAudit);
            return "审核通过";
        } else if ("3".equals(state)) {
            //审核不通过
            //更改审核状态，添加审核记录
            saveAuditStateAndRecord(p2pRepaymentVoucherAudit);

            MsgUtils.sendLetter(p2pFinancingInformationDao.getDebtDetails(financingInformationId).getApplicantsId(), MsgLetterTemplate.getHkpzshwtg(realRepaymentDate));
            MsgUtils.sendSMS(p2pFinancingInformationDao.getDebtDetails(financingInformationId).getApplicantsId(), MsgSmsTemplate.getHkpzshwtg(realRepaymentDate));
            return "审核不通过";
        } else {
            return "审核失败，请重新审核";
        }
    }

    /**
     * 更改审核状态，添加审核记录
     *
     * @param p2pRepaymentVoucherAudit
     */
    @Transactional(readOnly = false)
    private void saveAuditStateAndRecord(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit) {
        P2pRepaymentRecord p2pRepaymentRecord = new P2pRepaymentRecord();
        p2pRepaymentRecord.setId(p2pRepaymentVoucherAudit.getRepaymentRecordId());
        p2pRepaymentRecord.setRepaymentAuditState(p2pRepaymentVoucherAudit.getRepaymentAuditState());
        p2pRepaymentRecord.setRepaymentAuditTime(p2pRepaymentVoucherAudit.getRepaymentAuditTime());
        p2pRepaymentRecord.setRepaymentAuditPerson(p2pRepaymentVoucherAudit.getRepaymentAuditPerson());
        p2pRepaymentRecord.setRepaymentAuditReason(p2pRepaymentVoucherAudit.getRepaymentAuditReason());
        p2pRepaymentRecordDao.updateRepaymentVoucherAudit(p2pRepaymentRecord);
        // 解决repayment_voucher路径问题 start
        String repaymentRecordId = p2pRepaymentVoucherAudit.getRepaymentRecordId();
        P2pRepaymentRecord p2pRepaymentRecordNew = p2pRepaymentRecordDao.getRepaymentRecordById(repaymentRecordId);
        String repaymentVoucher = p2pRepaymentRecordNew.getRepaymentVoucher();
        p2pRepaymentVoucherAudit.setRepaymentVoucher(repaymentVoucher);
        // 解决repayment_voucher路径问题 end
        p2pRepaymentVoucherAuditService.save(p2pRepaymentVoucherAudit);
    }
}
