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
import com.dagongsoft.p2p.creditreport.service.back.AppealFirstAuditService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 申诉初审Controller
 *
 * @author Zeus
 * @version 2016-11-28
 */
@Controller
@RequestMapping(value = "${adminPath}/creditReport/appealFirstAudit")
public class AppealFirstAuditController extends BaseController {

    @Resource
    private AppealFirstAuditService appealFirstAuditService;
    @Resource
    private P2pInformationAppealService p2pInformationAppealService;
    @Resource
    private P2pCreditReportService p2pCreditReportService;
    @Resource
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;

    /**
     * 申诉初审列表
     *
     * @param p2pInformationAppeal
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pAppealFirstAuditList")
    public String p2pAppealFirstAuditList(P2pInformationAppeal p2pInformationAppeal, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pInformationAppeal> page = appealFirstAuditService.getAppealFirstAuditPage(new Page<P2pInformationAppeal>(request, response), p2pInformationAppeal);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/creditReport/p2pAppealFirstAuditList";
    }

    /**
     * 申诉初审页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pAppealFirstAuditForm")
    public String p2pAppealFirstAuditForm(String id, String type, Model model) {
        P2pInformationAppeal p2pInformationAppeal = p2pInformationAppealService.get(id);
        P2pCreditReport p2pCreditReport = p2pCreditReportService.get(p2pInformationAppeal.getCreditReportId());
        P2pEnterpriseCertify legalInfo = p2pEnterpriseCertifyService.getByUserId(p2pInformationAppeal.getUser().getId());
        model.addAttribute("legalInfo", legalInfo);
        model.addAttribute("p2pInformationAppeal", p2pInformationAppeal);
        model.addAttribute("p2pCreditReport", p2pCreditReport);
        model.addAttribute("type", type);
        return "p2p/back/creditReport/p2pAppealFirstAuditForm";
    }

    /**
     * 申诉初审
     *
     * @param p2pReportInformationAudit
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pAppealFirstAudit")
    public String p2pAppealFirstAudit(P2pInformationAppeal p, Model model, RedirectAttributes redirectAttributes) {
        try {
            P2pInformationAppeal entity = p2pInformationAppealService.get(p.getId());
            entity.setFirstReviewOpinion(p.getFirstReviewOpinion());
            entity.setFirstReviewStaff(p.getFirstReviewStaff());
            entity.setFirstReviewExplain(p.getFirstReviewExplain());
            entity.setFirstReviewTime(new Date());

            if ("1".equals(p.getFirstReviewOpinion())) { //通过
                entity.setAppealAuditState("2");
            } else if ("0".equals(p.getFirstReviewOpinion())) { //不通过
                entity.setAppealAuditState("4");
            }
            p2pInformationAppealService.save(entity);
            addMessage(redirectAttributes, "操作成功");
        } catch (Exception e) {
            addMessage(redirectAttributes, "操作失败");
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/creditReport/appealFirstAudit/p2pAppealFirstAuditList?repage";
    }
}
