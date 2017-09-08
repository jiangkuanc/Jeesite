package com.dagongsoft.p2p.user.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.user.entity.P2pGuarantee;
import com.dagongsoft.p2p.user.service.P2pGuaranteeService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 担保公司表Controller
 *
 * @author Sora
 * @version 2016-11-15
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/p2pGuarantee")
public class P2pGuaranteeController extends BaseController {

    @Resource
    private P2pGuaranteeService p2pGuaranteeService;

    @ResponseBody
    @RequestMapping(value = "get")
    public P2pGuarantee get(@RequestParam(required = false) String id) {
        P2pGuarantee entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pGuaranteeService.get(id);
        }
        if (entity == null) {
            entity = new P2pGuarantee();
        }
        return entity;
    }

    @RequiresPermissions("financing:p2pGuarantee:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pGuarantee p2pGuarantee, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pGuarantee> page = p2pGuaranteeService.findPage(new Page<P2pGuarantee>(request, response), p2pGuarantee);
        model.addAttribute("page", page);
        return "modules/financing/p2pGuaranteeList";
    }

    @RequiresPermissions("financing:p2pGuarantee:view")
    @RequestMapping(value = "form")
    public String form(P2pGuarantee p2pGuarantee, Model model) {
        model.addAttribute("p2pGuarantee", p2pGuarantee);
        return "modules/financing/p2pGuaranteeForm";
    }

    @RequiresPermissions("financing:p2pGuarantee:edit")
    @RequestMapping(value = "save")
    public String save(P2pGuarantee p2pGuarantee, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pGuarantee)) {
            return form(p2pGuarantee, model);
        }
        p2pGuaranteeService.save(p2pGuarantee);
        addMessage(redirectAttributes, "保存担保公司表成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pGuarantee/?repage";
    }

    @RequiresPermissions("financing:p2pGuarantee:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pGuarantee p2pGuarantee, RedirectAttributes redirectAttributes) {
        p2pGuaranteeService.delete(p2pGuarantee);
        addMessage(redirectAttributes, "删除担保公司表成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pGuarantee/?repage";
    }

}