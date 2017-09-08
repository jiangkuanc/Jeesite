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
import com.thinkgem.jeesite.modules.cms.entity.CmsMegaProjectIntroduce1;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.service.CmsMegaProjectIntroduce1Service;

/**
 * 大型项目简介详情Controller
 *
 * @author lsm
 * @version 2016-08-11
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/cmsMegaProjectIntroduce1")
public class CmsMegaProjectIntroduce1Controller extends BaseController {

    @Autowired
    private CmsMegaProjectIntroduce1Service cmsMegaProjectIntroduce1Service;

    @Autowired
    private ArticleService articleService;

    @ModelAttribute
    public CmsMegaProjectIntroduce1 get(@RequestParam(required = false) String id) {
        CmsMegaProjectIntroduce1 entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = cmsMegaProjectIntroduce1Service.get(id);
        }
        if (entity == null) {
            entity = new CmsMegaProjectIntroduce1();
        }
        return entity;
    }

    @RequiresPermissions("cms:cmsMegaProjectIntroduce1:view")
    @RequestMapping(value = {"list", ""})
    public String list(CmsMegaProjectIntroduce1 cmsMegaProjectIntroduce1, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CmsMegaProjectIntroduce1> page = cmsMegaProjectIntroduce1Service.findPage(new Page<CmsMegaProjectIntroduce1>(request, response), cmsMegaProjectIntroduce1);
        model.addAttribute("page", page);
        return "modules/cms/cmsMegaProjectIntroduce1List";
    }

    @RequiresPermissions("cms:cmsMegaProjectIntroduce1:view")
    @RequestMapping(value = "form")
    public String form(CmsMegaProjectIntroduce1 cmsMegaProjectIntroduce1, Model model) {
        model.addAttribute("cmsMegaProjectIntroduce1", cmsMegaProjectIntroduce1);
        System.out.println(cmsMegaProjectIntroduce1.getProjectName());
        return "modules/cms/cmsMegaProjectIntroduce1Form1";
    }

    @RequestMapping(value = "selectProjectList")
    public String selectProjectList(CmsMegaProjectIntroduce1 cmsMegaProjectIntroduce1, Model model) {
        Category category = new Category();
        category.setName("大型项目简介");
        List<Article> articleList = articleService.findArticleAccName1(category);
        model.addAttribute("articleList", articleList);
        return "modules/cms/cmsMegaProjectIntroduce1Form";
    }


    @RequiresPermissions("cms:cmsMegaProjectIntroduce1:edit")
    @RequestMapping(value = "save")
    public String save(CmsMegaProjectIntroduce1 cmsMegaProjectIntroduce1, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, cmsMegaProjectIntroduce1)) {
            return form(cmsMegaProjectIntroduce1, model);
        }
        cmsMegaProjectIntroduce1Service.save(cmsMegaProjectIntroduce1);
        addMessage(redirectAttributes, "保存大型项目详情成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsMegaProjectIntroduce1/?repage";
    }

    @RequiresPermissions("cms:cmsMegaProjectIntroduce1:edit")
    @RequestMapping(value = "delete")
    public String delete(CmsMegaProjectIntroduce1 cmsMegaProjectIntroduce1, RedirectAttributes redirectAttributes) {
        cmsMegaProjectIntroduce1Service.delete(cmsMegaProjectIntroduce1);
        addMessage(redirectAttributes, "删除大型项目详情成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsMegaProjectIntroduce1/?repage";
    }

    /**
     * 跳转到大型项目详情页面
     */
    @RequestMapping(value = "selectCurrentMegaProjectDetail")
    public String megaProjectDetail(HttpServletRequest request, HttpServletResponse response, Model model) {
        String pid = request.getParameter("pid");
        List<CmsMegaProjectIntroduce1> currentMegaProjectDetail = cmsMegaProjectIntroduce1Service.selectCurrentMegaProjectDetail(pid);
        for (CmsMegaProjectIntroduce1 kk : currentMegaProjectDetail) {
            System.out.println(kk);
        }
        model.addAttribute("currentMegaProjectDetail", currentMegaProjectDetail);
        return "modules/cms/front/themes/basic/largeproject_details";
    }

}