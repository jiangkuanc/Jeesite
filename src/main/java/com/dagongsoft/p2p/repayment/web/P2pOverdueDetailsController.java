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

import com.dagongsoft.p2p.repayment.entity.P2pOverdueDetails;
import com.dagongsoft.p2p.repayment.service.P2pOverdueDetailsService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 逾期明细表Controller
 *
 * @author Zeus
 * @version 2016-11-16
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/repayment/p2pOverdueDetails")
public class P2pOverdueDetailsController extends BaseController {

    @Resource
    private P2pOverdueDetailsService p2pOverdueDetailsService;

    @ModelAttribute
    public P2pOverdueDetails get(@RequestParam(required = false) String id) {
        P2pOverdueDetails entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pOverdueDetailsService.get(id);
        }
        if (entity == null) {
            entity = new P2pOverdueDetails();
        }
        return entity;
    }

    @RequiresPermissions("p2p:repayment:p2pOverdueDetails:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pOverdueDetails p2pOverdueDetails, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pOverdueDetails> page = p2pOverdueDetailsService.findPage(new Page<P2pOverdueDetails>(request, response), p2pOverdueDetails);
        model.addAttribute("page", page);
        return "modules/p2p/repayment/p2pOverdueDetailsList";
    }

    @RequiresPermissions("p2p:repayment:p2pOverdueDetails:view")
    @RequestMapping(value = "form")
    public String form(P2pOverdueDetails p2pOverdueDetails, Model model) {
        model.addAttribute("p2pOverdueDetails", p2pOverdueDetails);
        return "modules/p2p/repayment/p2pOverdueDetailsForm";
    }

    @RequiresPermissions("p2p:repayment:p2pOverdueDetails:edit")
    @RequestMapping(value = "save")
    public String save(P2pOverdueDetails p2pOverdueDetails, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pOverdueDetails)) {
            return form(p2pOverdueDetails, model);
        }
        p2pOverdueDetailsService.save(p2pOverdueDetails);
        addMessage(redirectAttributes, "保存逾期明细表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/repayment/p2pOverdueDetails/?repage";
    }

    @RequiresPermissions("p2p:repayment:p2pOverdueDetails:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pOverdueDetails p2pOverdueDetails, RedirectAttributes redirectAttributes) {
        p2pOverdueDetailsService.delete(p2pOverdueDetails);
        addMessage(redirectAttributes, "删除逾期明细表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/repayment/p2pOverdueDetails/?repage";
    }

}