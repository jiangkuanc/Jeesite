/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.investment.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.investment.entity.P2pInvestmentEarnRecord;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.investment.service.P2pInvestmentInformationService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 投资信息Controller
 *
 * @author qichao
 * @version 2016-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/investment/p2pInvestmentInformation")
public class P2pInvestmentInformationController extends BaseController {

    @Autowired
    private P2pInvestmentInformationService p2pInvestmentInformationService;

    @ModelAttribute
    public P2pInvestmentInformation get(@RequestParam(required = false) String id) {
        P2pInvestmentInformation entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pInvestmentInformationService.get(id);
        }
        if (entity == null) {
            entity = new P2pInvestmentInformation();
        }
        return entity;
    }

    @RequiresPermissions("investment:p2pInvestmentInformation:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pInvestmentInformation p2pInvestmentInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pInvestmentInformation> page = p2pInvestmentInformationService.findPage(new Page<P2pInvestmentInformation>(request, response), p2pInvestmentInformation);
        model.addAttribute("page", page);
        return "modules/investment/subscribeRecord";
    }

    @RequiresPermissions("investment:p2pInvestmentInformation:view")
    @RequestMapping(value = "form")
    public String form(P2pInvestmentInformation p2pInvestmentInformation, Model model) {
        model.addAttribute("p2pInvestmentInformation", p2pInvestmentInformation);
        return "modules/investment/p2pInvestmentInformationForm";
    }

    @RequiresPermissions("investment:p2pInvestmentInformation:edit")
    @RequestMapping(value = "save")
    public String save(P2pInvestmentInformation p2pInvestmentInformation, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pInvestmentInformation)) {
            return form(p2pInvestmentInformation, model);
        }
        p2pInvestmentInformationService.save(p2pInvestmentInformation);
        addMessage(redirectAttributes, "保存投资信息成功");
        return "redirect:" + Global.getAdminPath() + "/investment/subscribeRecord/?repage";
    }

    @RequiresPermissions("investment:p2pInvestmentInformation:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pInvestmentInformation p2pInvestmentInformation, RedirectAttributes redirectAttributes) {
        p2pInvestmentInformationService.delete(p2pInvestmentInformation);
        addMessage(redirectAttributes, "删除投资信息成功");
        return "redirect:" + Global.getAdminPath() + "/investment/subscribeRecord/?repage";
    }

    //投资收益记录
    @RequiresPermissions("investment:p2pInvestmentInformation:view")
    @RequestMapping(value = "investmentEarnRecord")
    public String investmentEarnRecord(P2pInvestmentEarnRecord p2pInvestmentEarnRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pInvestmentEarnRecord> page = p2pInvestmentInformationService.investmentEarnRecord(new Page<P2pInvestmentEarnRecord>(request, response), p2pInvestmentEarnRecord);
        model.addAttribute("page", page);
        return "modules/investment/investmentEarnRecord";
    }

    //投资债项列表
    @RequiresPermissions("investment:p2pInvestmentInformation:view")
    @RequestMapping(value = "investmentDebtList")
    public String investmentDebtList(P2pInvestmentInformation p2pInvestmentInformation, P2pInvestmentEarnRecord p2pInvestmentEarnRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        p2pInvestmentEarnRecord.setId(p2pInvestmentInformation.getUser().getP2pUserInformation().getId());
        Page<P2pInvestmentInformation> page = p2pInvestmentInformationService.findPage(new Page<P2pInvestmentInformation>(request, response), p2pInvestmentInformation);
        model.addAttribute("p2pInvestmentEarnRecord", p2pInvestmentEarnRecord);
        model.addAttribute("page", page);
        return "modules/investment/investmentDebtList";
    }

}