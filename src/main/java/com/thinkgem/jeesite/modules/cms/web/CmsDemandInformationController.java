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
import com.thinkgem.jeesite.modules.cms.entity.CmsDemandInformation;
import com.thinkgem.jeesite.modules.cms.entity.CmsRequirementInformation;
import com.thinkgem.jeesite.modules.cms.service.CmsDemandInformationService;
import com.thinkgem.jeesite.modules.cms.service.CmsRequirementInformationService;

/**
 * 生成需求详细信息Controller
 *
 * @author lsm
 * @version 2016-08-12
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/cmsDemandInformation")
public class CmsDemandInformationController extends BaseController {

    @Autowired
    private CmsDemandInformationService cmsDemandInformationService;

    @Autowired
    private CmsRequirementInformationService cmsRequirementInformationService;

    @ModelAttribute
    public CmsDemandInformation get(@RequestParam(required = false) String id) {
        CmsDemandInformation entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = cmsDemandInformationService.get(id);
        }
        if (entity == null) {
            entity = new CmsDemandInformation();
        }
        return entity;
    }

    @RequiresPermissions("cms:cmsDemandInformation:view")
    @RequestMapping(value = {"list", ""})
    public String list(CmsDemandInformation cmsDemandInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CmsDemandInformation> page = cmsDemandInformationService.findPage(new Page<CmsDemandInformation>(request, response), cmsDemandInformation);
        model.addAttribute("page", page);
        return "modules/cms/cmsDemandInformationList";
    }

    @RequiresPermissions("cms:cmsDemandInformation:view")
    @RequestMapping(value = "form")
    public String form(CmsDemandInformation cmsDemandInformation, Model model) {
        System.out.println(cmsDemandInformation);
        model.addAttribute("cmsDemandInformation", cmsDemandInformation);
        return "modules/cms/cmsDemandInformationForm1";
    }

    @RequestMapping(value = "selectDemandInformationList")
    public String selectProjectList(CmsDemandInformation cmsDemandInformation, Model model) {
        List<CmsRequirementInformation> CmsRequirementList = cmsRequirementInformationService.findFromList(new CmsRequirementInformation());
        model.addAttribute("demandInformationList", CmsRequirementList);
        return "modules/cms/cmsDemandInformationForm";
    }

    @RequiresPermissions("cms:cmsDemandInformation:edit")
    @RequestMapping(value = "save")
    public String save(CmsDemandInformation cmsDemandInformation, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, cmsDemandInformation)) {
            return form(cmsDemandInformation, model);
        }
        cmsDemandInformationService.save(cmsDemandInformation);
        addMessage(redirectAttributes, "保存需求信息详情成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsDemandInformation/?repage";
    }

    @RequiresPermissions("cms:cmsDemandInformation:edit")
    @RequestMapping(value = "delete")
    public String delete(CmsDemandInformation cmsDemandInformation, RedirectAttributes redirectAttributes) {
        cmsDemandInformationService.delete(cmsDemandInformation);
        addMessage(redirectAttributes, "删除需求信息详情成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsDemandInformation/?repage";
    }

    /**
     * 跳转到需求信息详情页面
     */
    @RequestMapping(value = "selectCurrentDemandInformation")
    public String demandInformation(HttpServletRequest request, HttpServletResponse response, Model model) {
        String pid = request.getParameter("pid");
        CmsDemandInformation cmsDemandInformation = cmsDemandInformationService.selsectDemandInformation(pid);
//		CmsDemandInformation cmsdemandinformation=cmsDemandInformationService
//		for(CmsDemandInformation kk:currentDemandInformation){
//			System.out.println(kk);
//		}
        model.addAttribute("demandInformation", cmsDemandInformation);
        return "modules/cms/front/themes/basic/demand_information_details";
    }
}