/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.info.web;

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

import com.dagongsoft.p2p.info.entity.InfProvideService;
import com.dagongsoft.p2p.info.service.InfProvideServiceService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 用户提供服务Controller
 *
 * @author dagong
 * @version 2016-09-23
 */
@Controller
@RequestMapping(value = "${adminPath}/info/infProvideService")
public class InfProvideServiceController extends BaseController {

    @Autowired
    private InfProvideServiceService infProvideServiceService;

    @ModelAttribute
    public InfProvideService get(@RequestParam(required = false) String id) {
        InfProvideService entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = infProvideServiceService.get(id);
        }
        if (entity == null) {
            entity = new InfProvideService();
        }
        return entity;
    }

    @RequestMapping(value = {"list", ""})
    public String list(InfProvideService infProvideService, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<InfProvideService> page = infProvideServiceService.findPage(new Page<InfProvideService>(request, response), infProvideService);
        model.addAttribute("page", page);
        return "modules/info/infProvideServiceList";
    }

    @RequestMapping(value = "form")
    public String form(InfProvideService infProvideService, Model model) {
        model.addAttribute("infProvideService", infProvideService);
        return "modules/info/infProvideServiceForm";
    }

    @RequiresPermissions("info:infProvideService:edit")
    @RequestMapping(value = "save")
    public String save(InfProvideService infProvideService, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, infProvideService)) {
            return form(infProvideService, model);
        }
        infProvideServiceService.save(infProvideService);
        addMessage(redirectAttributes, "保存用户提供服务成功");
        return "redirect:" + Global.getAdminPath() + "/info/infProvideService/?repage";
    }

    @RequiresPermissions("info:infProvideService:edit")
    @RequestMapping(value = "delete")
    public String delete(InfProvideService infProvideService, RedirectAttributes redirectAttributes) {
        infProvideServiceService.delete(infProvideService);
        addMessage(redirectAttributes, "删除用户提供服务成功");
        return "redirect:" + Global.getAdminPath() + "/info/infProvideService/?repage";
    }

}