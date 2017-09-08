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

import com.dagongsoft.p2p.user.entity.P2pCertificationDatabase;
import com.dagongsoft.p2p.user.service.P2pCertificationDatabaseService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 个人身份认证数据库Controller
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/user/p2pCertificationDatabase")
public class P2pCertificationDatabaseController extends BaseController {

    @Autowired
    private P2pCertificationDatabaseService p2pCertificationDatabaseService;

    @ModelAttribute
    public P2pCertificationDatabase get(@RequestParam(required = false) String id) {
        P2pCertificationDatabase entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pCertificationDatabaseService.get(id);
        }
        if (entity == null) {
            entity = new P2pCertificationDatabase();
        }
        return entity;
    }

    @RequiresPermissions("user:p2pCertificationDatabase:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pCertificationDatabase p2pCertificationDatabase, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pCertificationDatabase> page = p2pCertificationDatabaseService.findPage(new Page<P2pCertificationDatabase>(request, response), p2pCertificationDatabase);
        model.addAttribute("page", page);
        return "modules/user/p2pCertificationDatabaseList";
    }

    @RequiresPermissions("user:p2pCertificationDatabase:view")
    @RequestMapping(value = "form")
    public String form(P2pCertificationDatabase p2pCertificationDatabase, Model model) {
        model.addAttribute("p2pCertificationDatabase", p2pCertificationDatabase);
        return "modules/user/p2pCertificationDatabaseForm";
    }

    @RequiresPermissions("user:p2pCertificationDatabase:edit")
    @RequestMapping(value = "save")
    public String save(P2pCertificationDatabase p2pCertificationDatabase, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pCertificationDatabase)) {
            return form(p2pCertificationDatabase, model);
        }
        p2pCertificationDatabaseService.save(p2pCertificationDatabase);
        addMessage(redirectAttributes, "保存个人身份认证数据库成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pCertificationDatabase/?repage";
    }

    @RequiresPermissions("user:p2pCertificationDatabase:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pCertificationDatabase p2pCertificationDatabase, RedirectAttributes redirectAttributes) {
        p2pCertificationDatabaseService.delete(p2pCertificationDatabase);
        addMessage(redirectAttributes, "删除个人身份认证数据库成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pCertificationDatabase/?repage";
    }

}