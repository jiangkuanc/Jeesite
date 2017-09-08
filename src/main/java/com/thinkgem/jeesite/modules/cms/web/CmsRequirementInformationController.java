/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

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
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.CmsRequirementInformation;
import com.thinkgem.jeesite.modules.cms.service.CmsRequirementInformationService;

/**
 * 生成产品需求信息Controller
 *
 * @author lsm
 * @version 2016-08-12
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/cmsRequirementInformation")
public class CmsRequirementInformationController extends BaseController {

    @Autowired
    private CmsRequirementInformationService cmsRequirementInformationService;

    @ModelAttribute
    public CmsRequirementInformation get(@RequestParam(required = false) String id) {
        CmsRequirementInformation entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = cmsRequirementInformationService.get(id);
        }
        if (entity == null) {
            entity = new CmsRequirementInformation();
        }
        return entity;
    }

    @RequiresPermissions("cms:cmsRequirementInformation:view")
    @RequestMapping(value = {"list", ""})
    public String list(CmsRequirementInformation cmsRequirementInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CmsRequirementInformation> page = cmsRequirementInformationService.findPage(new Page<CmsRequirementInformation>(request, response), cmsRequirementInformation);
        model.addAttribute("page", page);
        return "modules/cms/cmsRequirementInformationList";
    }

    @RequiresPermissions("cms:cmsRequirementInformation:view")
    @RequestMapping(value = "form")
    public String form(CmsRequirementInformation cmsRequirementInformation, Model model) {
        model.addAttribute("cmsRequirementInformation", cmsRequirementInformation);
        return "modules/cms/cmsRequirementInformationForm";
    }

    @RequiresPermissions("cms:cmsRequirementInformation:edit")
    @RequestMapping(value = "save")
    public String save(CmsRequirementInformation cmsRequirementInformation, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, cmsRequirementInformation)) {
            return form(cmsRequirementInformation, model);
        }
        cmsRequirementInformationService.save(cmsRequirementInformation);
        addMessage(redirectAttributes, "保存产品需求信息成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsRequirementInformation/?repage";
    }

    @RequiresPermissions("cms:cmsRequirementInformation:edit")
    @RequestMapping(value = "delete")
    public String delete(CmsRequirementInformation cmsRequirementInformation, RedirectAttributes redirectAttributes) {
        cmsRequirementInformationService.delete(cmsRequirementInformation);
        addMessage(redirectAttributes, "删除产品需求信息成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsRequirementInformation/?repage";
    }

    /**
     * 跳转到产品需求信息页面
     */
    @RequestMapping(value = "requirementInformation")
    public String requirementInformation(CmsRequirementInformation cmsRequirementInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CmsRequirementInformation> page = cmsRequirementInformationService.findPage(new Page<CmsRequirementInformation>(request, response), cmsRequirementInformation);
        model.addAttribute("page", page);
        return "modules/cms/front/themes/basic/requirement_information";

    }
}