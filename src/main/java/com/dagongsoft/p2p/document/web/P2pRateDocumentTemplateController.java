/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.web;

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

import com.dagongsoft.p2p.document.entity.P2pRateDocumentTemplate;
import com.dagongsoft.p2p.document.service.P2pRateDocumentTemplateService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 评级材料模板Controller
 *
 * @author qichao
 * @version 2016-09-27
 */
@Controller
@RequestMapping(value = "${adminPath}/document/p2pRateDocumentTemplate")
public class P2pRateDocumentTemplateController extends BaseController {

    @Autowired
    private P2pRateDocumentTemplateService p2pRateDocumentTemplateService;

    @ModelAttribute
    public P2pRateDocumentTemplate get(@RequestParam(required = false) String id) {
        P2pRateDocumentTemplate entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRateDocumentTemplateService.get(id);
        }
        if (entity == null) {
            entity = new P2pRateDocumentTemplate();
        }
        return entity;
    }

    @RequiresPermissions("document:p2pRateDocumentTemplate:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRateDocumentTemplate p2pRateDocumentTemplate, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRateDocumentTemplate> page = p2pRateDocumentTemplateService.findPage(new Page<P2pRateDocumentTemplate>(request, response), p2pRateDocumentTemplate);
        model.addAttribute("page", page);
        return "modules/cms/platformContent/rateDocumentTemplate";
    }

    @RequiresPermissions("document:p2pRateDocumentTemplate:view")
    @RequestMapping(value = "form")
    public String form(P2pRateDocumentTemplate p2pRateDocumentTemplate, Model model) {
        model.addAttribute("p2pRateDocumentTemplate", p2pRateDocumentTemplate);
        return "modules/cms/platformContent/p2pRateDocumentTemplateForm";
    }

    @RequiresPermissions("document:p2pRateDocumentTemplate:edit")
    @RequestMapping(value = "save")
    public String save(P2pRateDocumentTemplate p2pRateDocumentTemplate, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRateDocumentTemplate)) {
            return form(p2pRateDocumentTemplate, model);
        }
        p2pRateDocumentTemplateService.save(p2pRateDocumentTemplate);
        addMessage(redirectAttributes, "保存评级材料模板成功");
        return "redirect:" + Global.getAdminPath() + "/document/p2pRateDocumentTemplate/?repage";
    }

    @RequiresPermissions("document:p2pRateDocumentTemplate:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRateDocumentTemplate p2pRateDocumentTemplate, RedirectAttributes redirectAttributes) {
        p2pRateDocumentTemplateService.delete(p2pRateDocumentTemplate);
        addMessage(redirectAttributes, "删除评级材料模板成功");
        return "redirect:" + Global.getAdminPath() + "/document/p2pRateDocumentTemplate/?repage";
    }

}