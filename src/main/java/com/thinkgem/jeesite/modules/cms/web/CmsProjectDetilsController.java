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
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.CmsProjectDetils;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.service.CmsProjectDetilsService;

/**
 * 添加项目信息详情Controller
 *
 * @author lsm
 * @version 2016-08-10
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/cmsProjectDetils")
public class CmsProjectDetilsController extends BaseController {

    @Autowired
    private CmsProjectDetilsService cmsProjectDetilsService;

    @Autowired
    private ArticleService articleService;

    @ModelAttribute
    public CmsProjectDetils get(@RequestParam(required = false) String id) {
        CmsProjectDetils entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = cmsProjectDetilsService.get(id);
        }
        if (entity == null) {
            entity = new CmsProjectDetils();
        }
        return entity;
    }

    @RequiresPermissions("cms:cmsProjectDetils:view")
    @RequestMapping(value = {"list", ""})
    public String list(CmsProjectDetils cmsProjectDetils, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CmsProjectDetils> page = cmsProjectDetilsService.findPage(new Page<CmsProjectDetils>(request, response), cmsProjectDetils);
        model.addAttribute("page", page);
        return "modules/cms/cmsProjectDetilsList";
    }

    @RequiresPermissions("cms:cmsProjectDetils:view")
    @RequestMapping(value = "form")
    public String form(CmsProjectDetils cmsProjectDetils, Model model) {
        model.addAttribute("cmsProjectDetils", cmsProjectDetils);
        return "modules/cms/cmsProjectDetilsForm1";
    }

    @RequestMapping(value = "selectProjectList")
    public String selectProjectList(CmsProjectDetils cmsProjectDetils, Model model) {
        Category category = new Category();
        category.setName("项目招标");
        List<Article> articleList = articleService.findArticleAccName(category);
        model.addAttribute("articleList", articleList);
        return "modules/cms/cmsProjectDetilsForm";
    }

    @RequiresPermissions("cms:cmsProjectDetils:edit")
    @RequestMapping(value = "save")
    public String save(CmsProjectDetils cmsProjectDetils, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, cmsProjectDetils)) {
            return form(cmsProjectDetils, model);
        }

        //cmsProjectDetils
        cmsProjectDetilsService.save(cmsProjectDetils);
        addMessage(redirectAttributes, "保存项目信息详情成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsProjectDetils/?repage";
    }

    @RequiresPermissions("cms:cmsProjectDetils:edit")
    @RequestMapping(value = "delete")
    public String delete(CmsProjectDetils cmsProjectDetils, RedirectAttributes redirectAttributes) {
        cmsProjectDetilsService.delete(cmsProjectDetils);
        addMessage(redirectAttributes, "删除项目信息详情成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsProjectDetils/?repage";
    }

    /**
     * 跳转到项目信息详情页面
     */
    @RequestMapping(value = "projectDetails")
    public String projectDetails(CmsProjectDetils cmsProjectDetils, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CmsProjectDetils> page = cmsProjectDetilsService.findPage(new Page<CmsProjectDetils>(request, response), cmsProjectDetils);
        model.addAttribute("page", page);
        return "modules/cms/front/themes/basic/project_details";
    }

    /**
     * 查询当前项目信息详情页面
     */
    @RequestMapping(value = "selectCurrentDetail")
    public String projectDetails(HttpServletRequest request, HttpServletResponse response, Model model) {
        String pid = request.getParameter("pid");
        List<CmsProjectDetils> currentProjectDetils = cmsProjectDetilsService.selectCurrentDetail(pid);
        for (CmsProjectDetils kk : currentProjectDetils) {
            System.out.println(kk.getProjectDisplay());
        }
        model.addAttribute("currentProjectDetils", currentProjectDetils);
        return "modules/cms/front/themes/basic/project_details";
    }

}