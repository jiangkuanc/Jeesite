package com.dagongsoft.p2p.risk.web;

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

import com.dagongsoft.p2p.risk.entity.P2pMemberPayDetails;
import com.dagongsoft.p2p.risk.service.P2pMemberPayDetailsService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 会员付费详情表Controller
 *
 * @author Joe
 * @version 2016-12-02
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/risk/p2pMemberPayDetails")
public class P2pMemberPayDetailsController extends BaseController {

    @Resource
    private P2pMemberPayDetailsService p2pMemberPayDetailsService;

    @ModelAttribute
    public P2pMemberPayDetails get(@RequestParam(required = false) String id) {
        P2pMemberPayDetails entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pMemberPayDetailsService.get(id);
        }
        if (entity == null) {
            entity = new P2pMemberPayDetails();
        }
        return entity;
    }

    @RequiresPermissions("p2p:risk:p2pMemberPayDetails:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pMemberPayDetails p2pMemberPayDetails, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pMemberPayDetails> page = p2pMemberPayDetailsService.findPage(new Page<P2pMemberPayDetails>(request, response), p2pMemberPayDetails);
        model.addAttribute("page", page);
        return "modules/p2p/risk/p2pMemberPayDetailsList";
    }

    @RequiresPermissions("p2p:risk:p2pMemberPayDetails:view")
    @RequestMapping(value = "form")
    public String form(P2pMemberPayDetails p2pMemberPayDetails, Model model) {
        model.addAttribute("p2pMemberPayDetails", p2pMemberPayDetails);
        return "modules/p2p/risk/p2pMemberPayDetailsForm";
    }

    @RequiresPermissions("p2p:risk:p2pMemberPayDetails:edit")
    @RequestMapping(value = "save")
    public String save(P2pMemberPayDetails p2pMemberPayDetails, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pMemberPayDetails)) {
            return form(p2pMemberPayDetails, model);
        }
        p2pMemberPayDetailsService.save(p2pMemberPayDetails);
        addMessage(redirectAttributes, "保存会员付费详情表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pMemberPayDetails/?repage";
    }

    @RequiresPermissions("p2p:risk:p2pMemberPayDetails:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pMemberPayDetails p2pMemberPayDetails, RedirectAttributes redirectAttributes) {
        p2pMemberPayDetailsService.delete(p2pMemberPayDetails);
        addMessage(redirectAttributes, "删除会员付费详情表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pMemberPayDetails/?repage";
    }

}