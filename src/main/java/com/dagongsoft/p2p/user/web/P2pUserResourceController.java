/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.web;

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

import com.dagongsoft.p2p.user.entity.P2pUserResource;
import com.dagongsoft.p2p.user.service.P2pUserResourceService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 用户权限控制表，配置用户能访问的功能Controller
 *
 * @author qichao
 * @version 2016-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/user/p2pUserResource")
public class P2pUserResourceController extends BaseController {

    @Autowired
    private P2pUserResourceService p2pUserResourceService;

    @ModelAttribute
    public P2pUserResource get(@RequestParam(required = false) String id) {
        P2pUserResource entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pUserResourceService.get(id);
        }
        if (entity == null) {
            entity = new P2pUserResource();
        }
        return entity;
    }

    @RequiresPermissions("user:p2pUserResource:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pUserResource p2pUserResource, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pUserResource> page = p2pUserResourceService.findPage(new Page<P2pUserResource>(request, response), p2pUserResource);
        model.addAttribute("page", page);
        return "modules/user/p2pUserResourceList";
    }

    @RequiresPermissions("user:p2pUserResource:view")
    @RequestMapping(value = "form")
    public String form(P2pUserResource p2pUserResource, Model model) {
        model.addAttribute("p2pUserResource", p2pUserResource);
        return "modules/user/p2pUserResourceForm";
    }

    @RequiresPermissions("user:p2pUserResource:edit")
    @RequestMapping(value = "save")
    public String save(P2pUserResource p2pUserResource, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pUserResource)) {
            return form(p2pUserResource, model);
        }
        p2pUserResourceService.save(p2pUserResource);
        addMessage(redirectAttributes, "保存用户权限控制表，配置用户能访问的功能成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pUserResource/?repage";
    }

    @RequiresPermissions("user:p2pUserResource:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pUserResource p2pUserResource, RedirectAttributes redirectAttributes) {
        p2pUserResourceService.delete(p2pUserResource);
        addMessage(redirectAttributes, "删除用户权限控制表，配置用户能访问的功能成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pUserResource/?repage";
    }

}