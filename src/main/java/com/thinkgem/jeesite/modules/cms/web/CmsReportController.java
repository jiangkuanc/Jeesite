/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.thinkgem.jeesite.modules.cms.entity.CmsReport;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.service.CmsReportService;

/**
 * 生成产品详情Controller
 *
 * @author lsm
 * @version 2016-08-15
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/cmsReport")
public class CmsReportController extends BaseController {

    @Autowired
    private CmsReportService cmsReportService;

    @Autowired
    private ArticleService articleService;

    @ModelAttribute
    public CmsReport get(@RequestParam(required = false) String id) {
        CmsReport entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = cmsReportService.get(id);
        }
        if (entity == null) {
            entity = new CmsReport();
        }
        return entity;
    }

    @RequiresPermissions("cms:cmsReport:view")
    @RequestMapping(value = {"list", ""})
    public String list(CmsReport cmsReport, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CmsReport> page = cmsReportService.findPage(new Page<CmsReport>(request, response), cmsReport);
        model.addAttribute("page", page);
        return "modules/cms/cmsReportList";
    }

    @RequiresPermissions("cms:cmsReport:view")
    @RequestMapping(value = "form")
    public String form(CmsReport cmsReport, Model model) {
        model.addAttribute("cmsReport", cmsReport);
        return "modules/cms/cmsReportForm1  ";
    }

    @RequestMapping(value = "selectProjectList")
    public String selectProjectList(CmsReport cmsReport, Model model) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("aname", "国别研究报告");
        map.put("bname", "投资指南");
        map.put("cname", "丝路战略研究");

		/*Category category=new Category();

		category.setName("信息产品");
		//List<Article> articleList1=articleService.findArticleDfName(category)
		category.setName("投资指南");
		//List<Article> articleList1=articleService.findArticleDfName(category)
		category.setName("投资指南");
		//List<Article> articleList3=articleService.findArticleDfName(category)
		category.setName("丝路研究战略");*/
        List<Article> articleList = articleService.findArticleDfName(map);
        model.addAttribute("articleList", articleList);
        return "modules/cms/cmsReportForm";
    }

    @RequiresPermissions("cms:cmsReport:edit")
    @RequestMapping(value = "save")
    public String save(CmsReport cmsReport, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, cmsReport)) {
            return form(cmsReport, model);
        }
        cmsReportService.save(cmsReport);
        addMessage(redirectAttributes, "保存产品详情成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsReport/?repage";
    }

    @RequiresPermissions("cms:cmsReport:edit")
    @RequestMapping(value = "delete")
    public String delete(CmsReport cmsReport, RedirectAttributes redirectAttributes) {
        cmsReportService.delete(cmsReport);
        addMessage(redirectAttributes, "删除产品详情成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsReport/?repage";
    }

    /**
     * 跳转到报告详情页面
     */
    @RequestMapping(value = "selectCurrentReport")
    public String demandInformation(HttpServletRequest request, HttpServletResponse response, Model model) {
        String pid = request.getParameter("pid");
        List<CmsReport> currentReport = cmsReportService.selectCurrentReport(pid);
        for (CmsReport kk : currentReport) {
            System.out.println(kk);
        }
        model.addAttribute("currentReport", currentReport);
        return "modules/cms/front/themes/basic/product_details";
    }

    /**
     * 跳转到投资指南详情页面
     */
    @RequestMapping(value = "selectCurrentInvestmentGuide")
    public String InvestmentGuide(HttpServletRequest request, HttpServletResponse response, Model model) {
        String pid = request.getParameter("pid");
        List<CmsReport> currentInvestmentGuide = cmsReportService.selectCurrentInvestmentGuide(pid);
        for (CmsReport kk : currentInvestmentGuide) {
            System.out.println(kk);
        }
        model.addAttribute("currentInvestmentGuide", currentInvestmentGuide);
        return "modules/cms/front/themes/basic/investment_guide_details";

    }

    /**
     * 跳转到丝绸战略研究详情页面
     */
    @RequestMapping(value = "selectCurrentstrategicResearch")
    public String StrategicResearch(HttpServletRequest request, HttpServletResponse response, Model model) {
        String pid = request.getParameter("pid");
        List<CmsReport> currentstrategicResearch = cmsReportService.selectCurrentstrategicResearch(pid);
        model.addAttribute("currentstrategicResearch", currentstrategicResearch);
        return "modules/cms/front/themes/basic/strategic_research_details";

    }
}
