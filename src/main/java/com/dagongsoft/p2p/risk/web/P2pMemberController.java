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

import com.dagongsoft.p2p.risk.entity.P2pMember;
import com.dagongsoft.p2p.risk.service.P2pMemberService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 会员表Controller
 *
 * @author Joe
 * @version 2016-12-02
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/risk/p2pMember")
public class P2pMemberController extends BaseController {

    @Resource
    private P2pMemberService p2pMemberService;

    @ModelAttribute
    public P2pMember get(@RequestParam(required = false) String id) {
        P2pMember entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pMemberService.get(id);
        }
        if (entity == null) {
            entity = new P2pMember();
        }
        return entity;
    }

    @RequiresPermissions("p2p:risk:p2pMember:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pMember p2pMember, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pMember> page = p2pMemberService.findPage(new Page<P2pMember>(request, response), p2pMember);
        model.addAttribute("page", page);
        return "modules/p2p/risk/p2pMemberList";
    }

    @RequiresPermissions("p2p:risk:p2pMember:view")
    @RequestMapping(value = "form")
    public String form(P2pMember p2pMember, Model model) {
        model.addAttribute("p2pMember", p2pMember);
        return "modules/p2p/risk/p2pMemberForm";
    }

    @RequiresPermissions("p2p:risk:p2pMember:edit")
    @RequestMapping(value = "save")
    public String save(P2pMember p2pMember, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pMember)) {
            return form(p2pMember, model);
        }
        p2pMemberService.save(p2pMember);
        addMessage(redirectAttributes, "保存会员表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pMember/?repage";
    }

    @RequiresPermissions("p2p:risk:p2pMember:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pMember p2pMember, RedirectAttributes redirectAttributes) {
        p2pMemberService.delete(p2pMember);
        addMessage(redirectAttributes, "删除会员表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pMember/?repage";
    }

}