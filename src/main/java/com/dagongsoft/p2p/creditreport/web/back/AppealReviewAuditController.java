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
import com.dagongsoft.p2p.creditreport.entity.P2pInformationAppeal;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportService;
import com.dagongsoft.p2p.creditreport.service.P2pInformationAppealService;
import com.dagongsoft.p2p.creditreport.service.back.AppealReviewAuditService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 申诉复审Controller
 *
 * @author Zeus
 * @version 2016-11-28
 */
@Controller
@RequestMapping(value = "${adminPath}/creditReport/appealReviewAudit")
public class AppealReviewAuditController extends BaseController {

    @Resource
    private AppealReviewAuditService appealReviewAuditService;
    @Resource
    private P2pInformationAppealService p2pInformationAppealService;
    @Resource
    private P2pCreditReportService p2pCreditReportService;
    @Resource
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;

    /**
     * 申诉复审列表
     *
     * @param p2pInformationAppeal
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pAppealReviewAuditList")
    public String p2pAppealReivewAuditList(P2pInformationAppeal p2pInformationAppeal, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pInformationAppeal> page = appealReviewAuditService.getAppealReviewAuditPage(new Page<P2pInformationAppeal>(request, response), p2pInformationAppeal);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "p2p/back/creditReport/p2pAppealReviewAuditList";
    }

    /**
     * 申诉复审页面
     *
     * @param p2pInformationAppeal
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pAppealReviewAuditForm")
    public String p2pAppealReviewAuditForm(String id, String type, Model model) {
        P2pInformationAppeal p2pInformationAppeal = p2pInformationAppealService.get(id);
        P2pCreditReport p2pCreditReport = p2pCreditReportService.get(p2pInformationAppeal.getCreditReportId());
        P2pEnterpriseCertify legalInfo = p2pEnterpriseCertifyService.getByUserId(p2pInformationAppeal.getUser().getId());
        model.addAttribute("legalInfo", legalInfo);
        model.addAttribute("p2pInformationAppeal", p2pInformationAppeal);
        model.addAttribute("p2pCreditReport", p2pCreditReport);
        model.addAttribute("type", type);
        return "p2p/back/creditReport/p2pAppealReviewAuditForm";
    }

    /**
     * 申诉复审
     *
     * @param p2pReportInformationAudit
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pAppealReviewAudit")
    public String p2pAppealReviewAudit(P2pInformationAppeal p, Model model, RedirectAttributes redirectAttributes) {
        try {
            P2pInformationAppeal entity = p2pInformationAppealService.get(p.getId());
            entity.setReviewOpinion(p.getReviewOpinion());
            entity.setReviewOfficer(p.getReviewOfficer());
            entity.setReviewExplain(p.getReviewExplain());
            entity.setReviewTime(new Date());


            if ("1".equals(p.getReviewOpinion())) { //通过
                entity.setAppealAuditState("3");
            } else if ("0".equals(p.getReviewOpinion())) { //不通过
                entity.setAppealAuditState("4");
            }
            p2pInformationAppealService.save(entity);
            addMessage(redirectAttributes, "操作成功");
        } catch (Exception e) {
            addMessage(redirectAttributes, "操作失败");
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/creditReport/appealReviewAudit/p2pAppealReviewAuditList?repage";
    }
}
