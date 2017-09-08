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

import com.dagongsoft.p2p.info.entity.InfPurchaseInformatio;
import com.dagongsoft.p2p.info.service.InfPurchaseInformatioService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 用户求购信息Controller
 *
 * @author dagong
 * @version 2016-09-23
 */
@Controller
@RequestMapping(value = "${adminPath}/info/infPurchaseInformatio")
public class InfPurchaseInformatioController extends BaseController {

    @Autowired
    private InfPurchaseInformatioService infPurchaseInformatioService;

    @ModelAttribute
    public InfPurchaseInformatio get(@RequestParam(required = false) String id) {
        InfPurchaseInformatio entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = infPurchaseInformatioService.get(id);
        }
        if (entity == null) {
            entity = new InfPurchaseInformatio();
        }
        return entity;
    }

    @RequestMapping(value = {"list", ""})
    public String list(InfPurchaseInformatio infPurchaseInformatio, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<InfPurchaseInformatio> page = infPurchaseInformatioService.findPage(new Page<InfPurchaseInformatio>(request, response), infPurchaseInformatio);
        model.addAttribute("page", page);
        return "modules/info/infPurchaseInformatioList";
    }

    @RequestMapping(value = "form")
    public String form(InfPurchaseInformatio infPurchaseInformatio, Model model) {
        model.addAttribute("infPurchaseInformatio", infPurchaseInformatio);
        return "modules/info/infPurchaseInformatioForm";
    }

    @RequiresPermissions("info:infPurchaseInformatio:edit")
    @RequestMapping(value = "save")
    public String save(InfPurchaseInformatio infPurchaseInformatio, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, infPurchaseInformatio)) {
            return form(infPurchaseInformatio, model);
        }
        infPurchaseInformatioService.save(infPurchaseInformatio);
        addMessage(redirectAttributes, "保存用户求购信息成功");
        return "redirect:" + Global.getAdminPath() + "/info/infPurchaseInformatio/?repage";
    }

    @RequiresPermissions("info:infPurchaseInformatio:edit")
    @RequestMapping(value = "delete")
    public String delete(InfPurchaseInformatio infPurchaseInformatio, RedirectAttributes redirectAttributes) {
        infPurchaseInformatioService.delete(infPurchaseInformatio);
        addMessage(redirectAttributes, "删除用户求购信息成功");
        return "redirect:" + Global.getAdminPath() + "/info/infPurchaseInformatio/?repage";
    }

}