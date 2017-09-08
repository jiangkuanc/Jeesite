/**
 *
 */
package com.dagongsoft.p2p.creditreport.web.back;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.creditreport.entity.P2pCreditReport;
import com.dagongsoft.p2p.creditreport.entity.P2pReportInformationAudit;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportService;
import com.dagongsoft.p2p.creditreport.service.P2pReportInformationAuditService;
import com.dagongsoft.p2p.creditreport.service.back.ReportReviewAuditService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 举报复审Controller
 *
 * @author Zeus
 * @version 2016-11-28
 */
@Controller
@RequestMapping(value = "${adminPath}/creditReport/reportReviewAudit")
public class ReportReviewAuditController extends BaseController {

    @Resource
    private ReportReviewAuditService reportReviewAuditService;
    @Resource
    private P2pReportInformationAuditService p2pReportInformationAuditService;
    @Resource
    private P2pCreditReportService p2pCreditReportService;
    @Resource
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;

    /**
     * 举报复审列表
     *
     * @param p2pReportInformationAudit
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pReportReviewAuditList")
    public String p2pReportReviewAuditList(P2pReportInformationAudit p2pReportInformationAudit, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pReportInformationAudit> page = reportReviewAuditService.getReportReviewAuditPage(new Page<P2pReportInformationAudit>(request, response), p2pReportInformationAudit);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "p2p/back/creditReport/p2pReportReviewAuditList";
    }

    /**
     * 举报复审页面
     *
     * @param p2pReportInformationAudit
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pReportReviewAuditForm")
    public String p2pReportReviewAuditForm(String id, String type, Model model) {
        try {
            P2pReportInformationAudit p2pReportInformationAudit = p2pReportInformationAuditService.get(id);
            P2pCreditReport p2pCreditReport = p2pCreditReportService.get(p2pReportInformationAudit.getCreditReportId());
            P2pEnterpriseCertify legalInfo = p2pEnterpriseCertifyService.getByUserId(p2pReportInformationAudit.getUser().getId());
            model.addAttribute("legalInfo", legalInfo);
            model.addAttribute("p2pReportInformationAudit", p2pReportInformationAudit);
            model.addAttribute("p2pCreditReport", p2pCreditReport);
            model.addAttribute("type", type);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/creditReport/p2pReportReviewAuditForm";
    }

    /**
     * 举报复审
     *
     * @param p2pReportInformationAudit
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pReportFirstAudit")
    public String p2pReportFirstAudit(P2pReportInformationAudit p, Model model, RedirectAttributes redirectAttributes) {
        try {
            P2pReportInformationAudit entity = p2pReportInformationAuditService.get(p.getId());
            entity.setReviewOpinion(p.getReviewOpinion());
            entity.setReviewOfficer(p.getReviewOfficer());
            entity.setReviewExplain(p.getReviewExplain());
            entity.setReviewTime(new Date());
            if ("1".equals(p.getReviewOpinion())) { //通过
                entity.setReportAuditState("3");
            } else if ("0".equals(p.getReviewOpinion())) { //不通过
                entity.setReportAuditState("4");
            }
            p2pReportInformationAuditService.save(entity);
            addMessage(redirectAttributes, "操作成功");
        } catch (Exception e) {
            addMessage(redirectAttributes, "操作失败");
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/creditReport/reportReviewAudit/p2pReportReviewAuditList?repage";
    }
}
