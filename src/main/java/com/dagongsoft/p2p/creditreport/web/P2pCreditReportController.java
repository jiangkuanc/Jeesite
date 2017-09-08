package com.dagongsoft.p2p.creditreport.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.creditreport.entity.P2pCreditReport;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 企业信用报告表Controller
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@Controller
@RequestMapping(value = "${adminPath}/creditreport/p2pCreditReport")
public class P2pCreditReportController extends BaseController {

    @Resource
    private P2pCreditReportService p2pCreditReportService;

    @ModelAttribute
    public P2pCreditReport get(@RequestParam(required = false) String id) {
        P2pCreditReport entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pCreditReportService.get(id);
        }
        if (entity == null) {
            entity = new P2pCreditReport();
        }
        return entity;
    }


    @RequestMapping(value = {"list", ""})
    public String list(P2pCreditReport p2pCreditReport, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pCreditReport> page = p2pCreditReportService.findPage(new Page<P2pCreditReport>(request, response), p2pCreditReport);
        model.addAttribute("page", page);
        return "modules/p2p/creditreport/p2pCreditReportList";
    }


    @RequestMapping(value = "form")
    public String form(P2pCreditReport p2pCreditReport, Model model) {
        model.addAttribute("p2pCreditReport", p2pCreditReport);
        return "modules/p2p/creditreport/p2pCreditReportForm";
    }


    @RequestMapping(value = "save")
    public String save(P2pCreditReport p2pCreditReport, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pCreditReport)) {
            return form(p2pCreditReport, model);
        }
        p2pCreditReportService.save(p2pCreditReport);
        addMessage(redirectAttributes, "保存企业信用报告表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/creditreport/p2pCreditReport/?repage";
    }


    @RequestMapping(value = "delete")
    public String delete(P2pCreditReport p2pCreditReport, RedirectAttributes redirectAttributes) {
        p2pCreditReportService.delete(p2pCreditReport);
        addMessage(redirectAttributes, "删除企业信用报告表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/creditreport/p2pCreditReport/?repage";
    }

    @RequestMapping(value = "p2pCreditReportList")
    public String p2pCreditReportList(P2pCreditReport p2pCreditReport, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pCreditReport> page = p2pCreditReportService.findPage(new Page<P2pCreditReport>(request, response), p2pCreditReport);
        model.addAttribute("page", page);
        return "p2p/creditreport/p2pCreditReportList";
    }

}