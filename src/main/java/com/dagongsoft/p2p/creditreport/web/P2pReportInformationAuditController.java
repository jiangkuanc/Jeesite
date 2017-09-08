package com.dagongsoft.p2p.creditreport.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.creditreport.entity.P2pReportInformationAudit;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportService;
import com.dagongsoft.p2p.creditreport.service.P2pReportInformationAuditService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 举报信息审核表Controller
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@Controller
@RequestMapping(value = "${adminPath}/creditreport/p2pReportInformationAudit")
public class P2pReportInformationAuditController extends BaseController {

    @Resource
    private P2pReportInformationAuditService p2pReportInformationAuditService;

    @ModelAttribute
    public P2pReportInformationAudit get(@RequestParam(required = false) String id) {
        P2pReportInformationAudit entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pReportInformationAuditService.get(id);
        }
        if (entity == null) {
            entity = new P2pReportInformationAudit();
        }
        return entity;
    }


    @RequestMapping(value = {"list", ""})
    public String list(P2pReportInformationAudit p2pReportInformationAudit, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pReportInformationAudit> page = p2pReportInformationAuditService.findPage(new Page<P2pReportInformationAudit>(request, response), p2pReportInformationAudit);
        model.addAttribute("page", page);
        return "modules/p2p/creditreport/p2pReportInformationAuditList";
    }


    @RequestMapping(value = "form")
    public String form(P2pReportInformationAudit p2pReportInformationAudit, Model model) {
        model.addAttribute("p2pReportInformationAudit", p2pReportInformationAudit);
        return "modules/p2p/creditreport/p2pReportInformationAuditForm";
    }


    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(P2pReportInformationAudit p2pReportInformationAudit, HttpSession session, Model model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        p2pReportInformationAudit.setUser(user);
        p2pReportInformationAudit.setReportTime(new Date());
        p2pReportInformationAudit.setReportAuditState("1");
        p2pReportInformationAuditService.save(p2pReportInformationAudit);
        List<P2pReportInformationAudit> p2pReportInformationAuditList = p2pReportInformationAuditService.ssList(user.getId());

        addMessage(redirectAttributes, "保存举报信息审核表成功");
        model.addAttribute("p2pReportInformationAuditList", p2pReportInformationAuditList);
        /*return "modules/front/account/reportRecord";*/
        return "forward:" + Global.getAdminPath() + "/cms/article/xinyongbg";


    }


    @RequestMapping(value = "delete")
    public String delete(P2pReportInformationAudit p2pReportInformationAudit, RedirectAttributes redirectAttributes) {
        p2pReportInformationAuditService.delete(p2pReportInformationAudit);
        addMessage(redirectAttributes, "删除举报信息审核表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/creditreport/p2pReportInformationAudit/?repage";
    }

    @RequestMapping(value = "p2pReportInformationAuditList")
    public String p2pReportInformationAuditList(P2pReportInformationAudit p2pReportInformationAudit, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pReportInformationAudit> page = p2pReportInformationAuditService.findPage(new Page<P2pReportInformationAudit>(request, response), p2pReportInformationAudit);
        model.addAttribute("page", page);

        return "p2p/creditreport/p2pReportInformationAuditList";
    }


}