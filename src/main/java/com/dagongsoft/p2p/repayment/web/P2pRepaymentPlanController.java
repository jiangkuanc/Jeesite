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

import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentPlanService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 还款计划表Controller
 *
 * @author Quincy
 * @version 2016-11-03
 */
@Controller
@RequestMapping(value = "${adminPath}/repayment/p2pRepaymentPlan")
public class P2pRepaymentPlanController extends BaseController {

    @Resource
    private P2pRepaymentPlanService p2pRepaymentPlanService;

    @ModelAttribute
    public P2pRepaymentPlan get(@RequestParam(required = false) String id) {
        P2pRepaymentPlan entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRepaymentPlanService.get(id);
        }
        if (entity == null) {
            entity = new P2pRepaymentPlan();
        }
        return entity;
    }

    @RequiresPermissions("repayment:p2pRepaymentPlan:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRepaymentPlan p2pRepaymentPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRepaymentPlan> page = p2pRepaymentPlanService.findPage(new Page<P2pRepaymentPlan>(request, response), p2pRepaymentPlan);
        model.addAttribute("page", page);
        return "modules/repayment/p2pRepaymentPlanList";
    }

    @RequiresPermissions("repayment:p2pRepaymentPlan:view")
    @RequestMapping(value = "form")
    public String form(P2pRepaymentPlan p2pRepaymentPlan, Model model) {
        model.addAttribute("p2pRepaymentPlan", p2pRepaymentPlan);
        return "modules/repayment/p2pRepaymentPlanForm";
    }

    @RequiresPermissions("repayment:p2pRepaymentPlan:edit")
    @RequestMapping(value = "save")
    public String save(P2pRepaymentPlan p2pRepaymentPlan, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRepaymentPlan)) {
            return form(p2pRepaymentPlan, model);
        }
        p2pRepaymentPlanService.save(p2pRepaymentPlan);
        addMessage(redirectAttributes, "保存还款计划成功");
        return "redirect:" + Global.getAdminPath() + "/repayment/p2pRepaymentPlan/?repage";
    }

    @RequiresPermissions("repayment:p2pRepaymentPlan:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRepaymentPlan p2pRepaymentPlan, RedirectAttributes redirectAttributes) {
        p2pRepaymentPlanService.delete(p2pRepaymentPlan);
        addMessage(redirectAttributes, "删除还款计划成功");
        return "redirect:" + Global.getAdminPath() + "/repayment/p2pRepaymentPlan/?repage";
    }

}