package com.dagongsoft.p2p.creditreport.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.dagongsoft.p2p.creditreport.entity.P2pCreditReportData;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportDataService;

/**
 * 信用报告指标数据表Controller
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/creditreport/p2pCreditReportData")
public class P2pCreditReportDataController extends BaseController {

    @Resource
    private P2pCreditReportDataService p2pCreditReportDataService;

    @ModelAttribute
    public P2pCreditReportData get(@RequestParam(required = false) String id) {
        P2pCreditReportData entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pCreditReportDataService.get(id);
        }
        if (entity == null) {
            entity = new P2pCreditReportData();
        }
        return entity;
    }

    @RequiresPermissions("p2p:creditreport:p2pCreditReportData:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pCreditReportData p2pCreditReportData, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pCreditReportData> page = p2pCreditReportDataService.findPage(new Page<P2pCreditReportData>(request, response), p2pCreditReportData);
        model.addAttribute("page", page);
        return "modules/p2p/creditreport/p2pCreditReportDataList";
    }

    @RequiresPermissions("p2p:creditreport:p2pCreditReportData:view")
    @RequestMapping(value = "form")
    public String form(P2pCreditReportData p2pCreditReportData, Model model) {
        model.addAttribute("p2pCreditReportData", p2pCreditReportData);
        return "modules/p2p/creditreport/p2pCreditReportDataForm";
    }

    @RequiresPermissions("p2p:creditreport:p2pCreditReportData:edit")
    @RequestMapping(value = "save")
    public String save(P2pCreditReportData p2pCreditReportData, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pCreditReportData)) {
            return form(p2pCreditReportData, model);
        }
        p2pCreditReportDataService.save(p2pCreditReportData);
        addMessage(redirectAttributes, "保存信用报告指标数据表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/creditreport/p2pCreditReportData/?repage";
    }

    @RequiresPermissions("p2p:creditreport:p2pCreditReportData:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pCreditReportData p2pCreditReportData, RedirectAttributes redirectAttributes) {
        p2pCreditReportDataService.delete(p2pCreditReportData);
        addMessage(redirectAttributes, "删除信用报告指标数据表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/creditreport/p2pCreditReportData/?repage";
    }

}