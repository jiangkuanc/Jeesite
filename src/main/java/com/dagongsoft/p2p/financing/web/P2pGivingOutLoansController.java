/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.web;

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

import com.dagongsoft.p2p.financing.entity.P2pGivingOutLoans;
import com.dagongsoft.p2p.financing.service.P2pGivingOutLoansService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 贷款发放记录Controller
 *
 * @author zhengshuo
 * @version 2016-07-12
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/p2pGivingOutLoans")
public class P2pGivingOutLoansController extends BaseController {

    @Autowired
    private P2pGivingOutLoansService p2pGivingOutLoansService;

    @ModelAttribute
    public P2pGivingOutLoans get(@RequestParam(required = false) String id) {
        P2pGivingOutLoans entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pGivingOutLoansService.get(id);
        }
        if (entity == null) {
            entity = new P2pGivingOutLoans();
        }
        return entity;
    }

    @RequiresPermissions("financing:p2pGivingOutLoans:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pGivingOutLoans p2pGivingOutLoans, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pGivingOutLoans> page = p2pGivingOutLoansService.findPage(new Page<P2pGivingOutLoans>(request, response), p2pGivingOutLoans);
        model.addAttribute("page", page);
        return "modules/financing/p2pGivingOutLoansList";
    }

    @RequiresPermissions("financing:p2pGivingOutLoans:view")
    @RequestMapping(value = "form")
    public String form(P2pGivingOutLoans p2pGivingOutLoans, Model model) {
        model.addAttribute("p2pGivingOutLoans", p2pGivingOutLoans);
        return "modules/financing/p2pGivingOutLoansForm";
    }

    @RequiresPermissions("financing:p2pGivingOutLoans:edit")
    @RequestMapping(value = "save")
    public String save(P2pGivingOutLoans p2pGivingOutLoans, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pGivingOutLoans)) {
            return form(p2pGivingOutLoans, model);
        }
        p2pGivingOutLoansService.save(p2pGivingOutLoans);
        addMessage(redirectAttributes, "保存贷款发放记录成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pGivingOutLoans/?repage";
    }

    @RequiresPermissions("financing:p2pGivingOutLoans:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pGivingOutLoans p2pGivingOutLoans, RedirectAttributes redirectAttributes) {
        p2pGivingOutLoansService.delete(p2pGivingOutLoans);
        addMessage(redirectAttributes, "删除贷款发放记录成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pGivingOutLoans/?repage";
    }

}