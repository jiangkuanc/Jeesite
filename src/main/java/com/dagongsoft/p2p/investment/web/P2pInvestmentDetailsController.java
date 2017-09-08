package com.dagongsoft.p2p.investment.web;

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

import com.dagongsoft.p2p.investment.entity.P2pInvestmentDetails;
import com.dagongsoft.p2p.investment.service.P2pInvestmentDetailsService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 投资明细表Controller
 *
 * @author Chace
 * @version 2016-11-08
 */
@Controller
@RequestMapping(value = "${adminPath}/investment/p2pInvestmentDetails")
public class P2pInvestmentDetailsController extends BaseController {

    @Resource
    private P2pInvestmentDetailsService p2pInvestmentDetailsService;

    @ModelAttribute
    public P2pInvestmentDetails get(@RequestParam(required = false) String id) {
        P2pInvestmentDetails entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pInvestmentDetailsService.get(id);
        }
        if (entity == null) {
            entity = new P2pInvestmentDetails();
        }
        return entity;
    }

    @RequiresPermissions("investment:p2pInvestmentDetails:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pInvestmentDetails p2pInvestmentDetails, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pInvestmentDetails> page = p2pInvestmentDetailsService.findPage(new Page<P2pInvestmentDetails>(request, response), p2pInvestmentDetails);
        model.addAttribute("page", page);
        return "modules/investment/p2pInvestmentDetailsList";
    }

    @RequiresPermissions("investment:p2pInvestmentDetails:view")
    @RequestMapping(value = "form")
    public String form(P2pInvestmentDetails p2pInvestmentDetails, Model model) {
        model.addAttribute("p2pInvestmentDetails", p2pInvestmentDetails);
        return "modules/investment/p2pInvestmentDetailsForm";
    }

    @RequiresPermissions("investment:p2pInvestmentDetails:edit")
    @RequestMapping(value = "save")
    public String save(P2pInvestmentDetails p2pInvestmentDetails, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pInvestmentDetails)) {
            return form(p2pInvestmentDetails, model);
        }
        p2pInvestmentDetailsService.save(p2pInvestmentDetails);
        addMessage(redirectAttributes, "保存投资明细成功");
        return "redirect:" + Global.getAdminPath() + "/investment/p2pInvestmentDetails/?repage";
    }

    @RequiresPermissions("investment:p2pInvestmentDetails:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pInvestmentDetails p2pInvestmentDetails, RedirectAttributes redirectAttributes) {
        p2pInvestmentDetailsService.delete(p2pInvestmentDetails);
        addMessage(redirectAttributes, "删除投资明细成功");
        return "redirect:" + Global.getAdminPath() + "/investment/p2pInvestmentDetails/?repage";
    }

}