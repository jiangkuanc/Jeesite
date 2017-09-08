/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.AccountStrategic;
import com.thinkgem.jeesite.modules.sys.service.AccountStrategicService;

/**
 * 账户策略管理Controller
 *
 * @author system
 * @version 2016-06-30
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/accountStrategic")
public class AccountStrategicController extends BaseController {

    @Autowired
    private AccountStrategicService accountStrategicService;

    @ModelAttribute
    public AccountStrategic get(@RequestParam(required = false) String id) {
        AccountStrategic entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = accountStrategicService.get(id);
        }
        if (entity == null) {
            entity = new AccountStrategic();
        }
        return entity;
    }

    @RequiresPermissions("sys:accountStrategic:view")
    @RequestMapping(value = {"list", ""})
    public String list(AccountStrategic accountStrategic, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<AccountStrategic> page = accountStrategicService.findPage(new Page<AccountStrategic>(request, response), accountStrategic);
        model.addAttribute("page", page);
        return "modules/sys/accountStrategicList";
    }

    @RequiresPermissions("sys:accountStrategic:view")
    @RequestMapping(value = "form")
    public String form(AccountStrategic accountStrategic, Model model) {
        model.addAttribute("accountStrategic", accountStrategic);
        return "modules/sys/accountStrategicForm";
    }

    @RequiresPermissions("sys:accountStrategic:edit")
    @RequestMapping(value = "save")
    public String save(AccountStrategic accountStrategic, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, accountStrategic)) {
            return form(accountStrategic, model);
        }
        accountStrategicService.save(accountStrategic);
        addMessage(redirectAttributes, "保存账户策略管理成功");
        return "redirect:" + Global.getAdminPath() + "/sys/accountStrategic/?repage";
    }

    @RequiresPermissions("sys:accountStrategic:edit")
    @RequestMapping(value = "delete")
    public String delete(AccountStrategic accountStrategic, RedirectAttributes redirectAttributes) {
        accountStrategicService.delete(accountStrategic);
        addMessage(redirectAttributes, "删除账户策略管理成功");
        return "redirect:" + Global.getAdminPath() + "/sys/accountStrategic/?repage";
    }

}