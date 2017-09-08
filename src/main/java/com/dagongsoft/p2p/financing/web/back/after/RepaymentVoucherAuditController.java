/**
 *
 */
package com.dagongsoft.p2p.financing.web.back.after;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.back.after.RepaymentVoucherAuditService;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentRecord;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentVoucherAudit;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * @author Zeus
 * @2017-2-15
 */
@Controller
@RequestMapping(value = "${adminPath}/after/repaymentVoucherAudit")
public class RepaymentVoucherAuditController extends BaseController {
    @Resource
    private RepaymentVoucherAuditService repaymentVoucherAuditService;

    /**
     * 还款凭证审核列表
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "list")
    public String repaymentVoucherAuditList(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = repaymentVoucherAuditService.getRepaymentVoucherAuditListPage(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "/p2p/back/financing/after/repaymentVoucherAuditList";
    }

    /**
     * 还款凭证审核页面
     *
     * @param financingInformationId
     * @param model
     * @return
     */
    @RequestMapping(value = "form")
    public String repaymentVoucherAuditForm(String financingInformationId, String repaymentRecordId, String temp, Model model) {
        repaymentVoucherAuditService.repaymentVoucherAuditForm(financingInformationId, repaymentRecordId, model);
        model.addAttribute("temp", temp);
        return "/p2p/back/financing/after/repaymentVoucherAuditForm";
    }

    /**
     * 还款凭证审核
     *
     * @param financingInformationId
     * @param model
     * @return
     */
    @RequestMapping(value = "audit")
    public String repaymentVoucherAudit(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit, Date realRepaymentDate, Date planRepaymentDate, RedirectAttributes redirectAttributes) {

        String msg = repaymentVoucherAuditService.repaymentVoucherAudit(p2pRepaymentVoucherAudit, realRepaymentDate, planRepaymentDate);
        addMessage(redirectAttributes, msg);
        return "redirect:" + Global.getAdminPath() + "/after/repaymentVoucherAudit/list?repage";
    }
}
