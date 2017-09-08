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

import com.dagongsoft.p2p.user.entity.P2pAuditRecord;
import com.dagongsoft.p2p.user.service.P2pAuditRecordService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 认证审核记录，包含个人身份认证、企业身份认证Controller
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/user/p2pAuditRecord")
public class P2pAuditRecordController extends BaseController {

    @Autowired
    private P2pAuditRecordService p2pAuditRecordService;

    @ModelAttribute
    public P2pAuditRecord get(@RequestParam(required = false) String id) {
        P2pAuditRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pAuditRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pAuditRecord();
        }
        return entity;
    }

    @RequiresPermissions("user:p2pAuditRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pAuditRecord p2pAuditRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pAuditRecord> page = p2pAuditRecordService.findPage(new Page<P2pAuditRecord>(request, response), p2pAuditRecord);
        model.addAttribute("page", page);
        return "modules/user/p2pAuditRecordList";
    }

    @RequiresPermissions("user:p2pAuditRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pAuditRecord p2pAuditRecord, Model model) {
        model.addAttribute("p2pAuditRecord", p2pAuditRecord);
        return "modules/user/p2pAuditRecordForm";
    }

    @RequiresPermissions("user:p2pAuditRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pAuditRecord p2pAuditRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pAuditRecord)) {
            return form(p2pAuditRecord, model);
        }
        p2pAuditRecordService.save(p2pAuditRecord);
        addMessage(redirectAttributes, "保存认证审核记录成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pAuditRecord/?repage";
    }

    @RequiresPermissions("user:p2pAuditRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pAuditRecord p2pAuditRecord, RedirectAttributes redirectAttributes) {
        p2pAuditRecordService.delete(p2pAuditRecord);
        addMessage(redirectAttributes, "删除认证审核记录成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pAuditRecord/?repage";
    }

}