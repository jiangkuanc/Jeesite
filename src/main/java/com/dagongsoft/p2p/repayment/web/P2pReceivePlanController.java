package com.dagongsoft.p2p.repayment.web;

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

import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.dagongsoft.p2p.repayment.service.P2pReceivePlanService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 投资人收款计划表Controller
 *
 * @author Zeus
 * @version 2016-11-08
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/repayment/p2pReceivePlan")
public class P2pReceivePlanController extends BaseController {

    @Resource
    private P2pReceivePlanService p2pReceivePlanService;

    @ModelAttribute
    public P2pReceivePlan get(@RequestParam(required = false) String id) {
        P2pReceivePlan entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pReceivePlanService.get(id);
        }
        if (entity == null) {
            entity = new P2pReceivePlan();
        }
        return entity;
    }

    @RequiresPermissions("p2p:repayment:p2pReceivePlan:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pReceivePlan p2pReceivePlan, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pReceivePlan> page = p2pReceivePlanService.findPage(new Page<P2pReceivePlan>(request, response), p2pReceivePlan);
        model.addAttribute("page", page);
        return "modules/p2p/repayment/p2pReceivePlanList";
    }

    @RequiresPermissions("p2p:repayment:p2pReceivePlan:view")
    @RequestMapping(value = "form")
    public String form(P2pReceivePlan p2pReceivePlan, Model model) {
        model.addAttribute("p2pReceivePlan", p2pReceivePlan);
        return "modules/p2p/repayment/p2pReceivePlanForm";
    }

    @RequiresPermissions("p2p:repayment:p2pReceivePlan:edit")
    @RequestMapping(value = "save")
    public String save(P2pReceivePlan p2pReceivePlan, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pReceivePlan)) {
            return form(p2pReceivePlan, model);
        }
        p2pReceivePlanService.save(p2pReceivePlan);
        addMessage(redirectAttributes, "保存投资人收款计划表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/repayment/p2pReceivePlan/?repage";
    }

    @RequiresPermissions("p2p:repayment:p2pReceivePlan:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pReceivePlan p2pReceivePlan, RedirectAttributes redirectAttributes) {
        p2pReceivePlanService.delete(p2pReceivePlan);
        addMessage(redirectAttributes, "删除投资人收款计划表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/repayment/p2pReceivePlan/?repage";
    }

}