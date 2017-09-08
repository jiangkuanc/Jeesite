/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import java.util.List;

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
import com.thinkgem.jeesite.modules.cms.entity.CmsSupplyInformation;
import com.thinkgem.jeesite.modules.cms.entity.P2pProductInfo;
import com.thinkgem.jeesite.modules.cms.service.CmsSupplyInformationService;
import com.thinkgem.jeesite.modules.cms.service.P2pProductInfoService;

/**
 * 供给信息详情Controller
 *
 * @author lsm
 * @version 2016-08-11
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/cmsSupplyInformation")
public class CmsSupplyInformationController extends BaseController {

    @Autowired
    private CmsSupplyInformationService cmsSupplyInformationService;

    @Autowired
    private P2pProductInfoService p2pProductInfoService;


    @ModelAttribute
    public CmsSupplyInformation get(@RequestParam(required = false) String id) {
        CmsSupplyInformation entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = cmsSupplyInformationService.get(id);
        }
        if (entity == null) {
            entity = new CmsSupplyInformation();
        }
        return entity;
    }

    @RequiresPermissions("cms:cmsSupplyInformation:view")
    @RequestMapping(value = {"list", ""})
    public String list(CmsSupplyInformation cmsSupplyInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CmsSupplyInformation> page = cmsSupplyInformationService.findPage(new Page<CmsSupplyInformation>(request, response), cmsSupplyInformation);
        model.addAttribute("page", page);
        return "modules/cms/cmsSupplyInformationList";
    }

    @RequiresPermissions("cms:cmsSupplyInformation:view")
    @RequestMapping(value = "form")
    public String form(CmsSupplyInformation cmsSupplyInformation, Model model) {
        model.addAttribute("cmsSupplyInformation", cmsSupplyInformation);
        return "modules/cms/cmsSupplyInformationForm1";
    }

    @RequestMapping(value = "selectSupplyInformationList")
    public String selectSupplyInfomation(CmsSupplyInformation cmsSupplyInformation, Model model) {
        List<P2pProductInfo> p2pProductInfoList = p2pProductInfoService.findFromList(new P2pProductInfo());
        model.addAttribute("p2pProductInfoList", p2pProductInfoList);
        return "modules/cms/cmsSupplyInformationForm";
    }

    @RequiresPermissions("cms:cmsSupplyInformation:edit")
    @RequestMapping(value = "save")
    public String save(CmsSupplyInformation cmsSupplyInformation, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, cmsSupplyInformation)) {
            return form(cmsSupplyInformation, model);
        }
        System.out.println("=====================" + cmsSupplyInformation);
        cmsSupplyInformationService.save(cmsSupplyInformation);
        addMessage(redirectAttributes, "保存供给信息成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsSupplyInformation/?repage";
    }

    @RequiresPermissions("cms:cmsSupplyInformation:edit")
    @RequestMapping(value = "delete")
    public String delete(CmsSupplyInformation cmsSupplyInformation, RedirectAttributes redirectAttributes) {
        cmsSupplyInformationService.delete(cmsSupplyInformation);
        addMessage(redirectAttributes, "删除供给信息成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsSupplyInformation/?repage";
    }

    /**
     * 调到供给信息详情的页面
     */
    @RequestMapping(value = "selectCurrentSupplyInformation")
    public String supplyInformation(HttpServletRequest request, HttpServletResponse response, Model model) {
        String pid = request.getParameter("pid");
        List<CmsSupplyInformation> currentSupplyInformation = cmsSupplyInformationService.selectCurrentSupplyInformation(pid);
        model.addAttribute("currentSupplyInformation", currentSupplyInformation);
        System.out.println(currentSupplyInformation);
        return "modules/cms/front/themes/basic/supplyInformation";

    }

}