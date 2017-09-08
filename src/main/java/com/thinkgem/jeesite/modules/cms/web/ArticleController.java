/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.dagongsoft.p2p.config.service.P2pIndustryclassiService;
import com.dagongsoft.p2p.creditreport.entity.P2pCreditReport;
import com.dagongsoft.p2p.creditreport.entity.P2pCreditReportBuy;
import com.dagongsoft.p2p.creditreport.entity.P2pCreditReportData;
import com.dagongsoft.p2p.creditreport.entity.P2pCreditReportIndex;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportBuyService;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportDataService;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportIndexService;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportService;
import com.dagongsoft.p2p.operation.entity.P2pPlatformOperationDataShow;
import com.dagongsoft.p2p.operation.service.P2pPlatformOperationDataShowService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.dagongsoft.p2p.utils.FormatData2Json;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Link;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;
import com.thinkgem.jeesite.modules.cms.service.FileTplService;
import com.thinkgem.jeesite.modules.cms.service.LinkService;
import com.thinkgem.jeesite.modules.cms.service.SiteService;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.cms.utils.TplUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 文章Controller
 *
 * @author ThinkGem
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/article")
public class ArticleController extends BaseController {


    @Autowired
    private ArticleService articleService;
    @Autowired
    private ArticleDataService articleDataService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private FileTplService fileTplService;
    @Resource
    private P2pCreditReportService p2pCreditReportService;
    @Autowired
    private SiteService siteService;
    @Autowired
    private P2pCreditReportDataService p2pCreditReportDataService;
    @Autowired
    private P2pCreditReportIndexService p2pCreditReportIndexService;
    @Autowired
    private P2pCreditReportBuyService p2pCreditReportBuyService;
    @Autowired
    private P2pPlatformOperationDataShowService p2pPlatformOperationDataShowService;
    @Autowired
    private P2pIndustryclassiService p2pIndustryclassiService;
    @Autowired
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;
    @Autowired
    private LinkService linkService;

    @ModelAttribute
    public Article get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return articleService.get(id);
        } else {
            return new Article();
        }
    }

    @RequiresPermissions("cms:article:view")
    @RequestMapping(value = {"list", ""})
    public String list(Article article, HttpServletRequest request, HttpServletResponse response, Model model) {
//		for (int i=0; i<10000000; i++){
//			Article a = new Article();
//			a.setCategory(new Category(article.getCategory().getId()));
//			a.setTitle("测试测试测试测试测试测试测试测试"+a.getCategory().getId());
//			a.setArticleData(new ArticleData());
//			a.getArticleData().setContent(a.getTitle());
//			articleService.save(a);
//		}
        /*String categoryId = article.getCategory().getId();
        if(categoryId.equals("84")){
			Page<Article> page = articleService.findWanChengList(new Page<Article>(request, response), article); 
	        model.addAttribute("page", page);
		}else if(categoryId.equals("31")){
			Page<Article> page = articleService.findJingXingListLieBiao(new Page<Article>(request, response), article); 
	        model.addAttribute("page", page);
		}else{*/
        Page<Article> page = articleService.findPage(new Page<Article>(request, response), article);
        model.addAttribute("page", page);
        //新闻发布
        if (article.getCategory().getId().equals("88")) {
            return "modules/cms/articleList_news";
        }
        return "modules/cms/articleList";
    }

    @RequiresPermissions("cms:article:view")
    @RequestMapping(value = "form")
    public String form(Article article, Model model) {
        // 如果当前传参有子节点，则选择取消传参选择
        if (article.getCategory() != null && StringUtils.isNotBlank(article.getCategory().getId())) {
            List<Category> list = categoryService.findByParentId(article.getCategory().getId(), Site.getCurrentSiteId());
            if (list.size() > 0) {
                article.setCategory(null);
            } else {
                article.setCategory(categoryService.get(article.getCategory().getId()));
            }
        }
        //将上传的图片地址转化
        if (article.getImage() != null && !"".equals(article.getImage())) {
            article.setImage(UploadFileUtils.viewUrl(article.getImage()));
        }
        article.setArticleData(articleDataService.get(article.getId()));
        model.addAttribute("contentViewList", getTplContent());
        model.addAttribute("article_DEFAULT_TEMPLATE", Article.DEFAULT_TEMPLATE);
        model.addAttribute("article", article);
        CmsUtils.addViewConfigAttribute(model, article.getCategory());
        //新闻发布
        if (article.getCategory().getId().equals("88")) {
            return "modules/cms/articleForm_news";
        }
        return "modules/cms/articleForm";
    }

    @RequiresPermissions("cms:article:view")
    @RequestMapping(value = "jingXingForm")
    public String jingXingForm(Article article, Model model) {
        // 如果当前传参有子节点，则选择取消传参选择
        if (article.getCategory() != null && StringUtils.isNotBlank(article.getCategory().getId())) {
            List<Category> list = categoryService.findByParentId(article.getCategory().getId(), Site.getCurrentSiteId());
            if (list.size() > 0) {
                article.setCategory(null);
            } else {
                article.setCategory(categoryService.get(article.getCategory().getId()));
            }
        }
        article.setArticleData(articleDataService.get(article.getId()));
//		if (article.getCategory()=null && StringUtils.isNotBlank(article.getCategory().getId())){
//			Category category = categoryService.get(article.getCategory().getId());
//		}
        //将上传的图片地址转化
        if (article.getImage() != null && !"".equals(article.getImage())) {
            article.setImage(UploadFileUtils.viewUrl(article.getImage()));
        }
        model.addAttribute("contentViewList", getTplContent());
        model.addAttribute("article_DEFAULT_TEMPLATE", Article.DEFAULT_TEMPLATE);
        model.addAttribute("article", article);
        CmsUtils.addViewConfigAttribute(model, article.getCategory());
        return "modules/cms/addJxHouDongForm";
    }


    @RequiresPermissions("cms:article:view")
    @RequestMapping(value = "WanChengForm")
    public String WanChengForm(Article article, Model model) {
        // 如果当前传参有子节点，则选择取消传参选择
        if (article.getCategory() != null && StringUtils.isNotBlank(article.getCategory().getId())) {
            List<Category> list = categoryService.findByParentId(article.getCategory().getId(), Site.getCurrentSiteId());
            if (list.size() > 0) {
                article.setCategory(null);
            } else {
                article.setCategory(categoryService.get(article.getCategory().getId()));
            }
        }
        article.setArticleData(articleDataService.get(article.getId()));
        //将上传的图片地址转化
        if (article.getImage() != null && !"".equals(article.getImage())) {
            article.setImage(UploadFileUtils.viewUrl(article.getImage()));
        }
        model.addAttribute("contentViewList", getTplContent());
        model.addAttribute("article_DEFAULT_TEMPLATE", Article.DEFAULT_TEMPLATE);
        model.addAttribute("article", article);
        CmsUtils.addViewConfigAttribute(model, article.getCategory());
        return "modules/cms/addWcHouDongForm";
    }


    @RequiresPermissions("cms:article:view")
    @RequestMapping(value = "gongGaoForm")
    public String gongGaoForm(Article article, Model model) {
        // 如果当前传参有子节点，则选择取消传参选择
        if (article.getCategory() != null && StringUtils.isNotBlank(article.getCategory().getId())) {
            List<Category> list = categoryService.findByParentId(article.getCategory().getId(), Site.getCurrentSiteId());
            if (list.size() > 0) {
                article.setCategory(null);
            } else {
                article.setCategory(categoryService.get(article.getCategory().getId()));
            }
        }
        article.setArticleData(articleDataService.get(article.getId()));
        //将上传的图片地址转化
        if (article.getImage() != null && !"".equals(article.getImage())) {
            article.setImage(UploadFileUtils.viewUrl(article.getImage()));
        }
        model.addAttribute("contentViewList", getTplContent());
        model.addAttribute("article_DEFAULT_TEMPLATE", Article.DEFAULT_TEMPLATE);
        model.addAttribute("article", article);
        CmsUtils.addViewConfigAttribute(model, article.getCategory());
        return "modules/cms/gonggaoForm";
    }


    //在文章列表中点击操作中的审核进入初审页面
    @RequestMapping(value = "audit")
    public String audit(HttpServletRequest request, HttpServletResponse response, Article article, Model model) {
        try {
            article.setAuditTime(new Date());
            articleService.baocun(article);
            Page<Article> page = articleService.findPage(new Page<Article>(request, response), article);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/cms/firsttria";
    }

    //在初审页面中点击保存进入初审详情页面
    @RequiresPermissions("cms:article:edit")
    @RequestMapping(value = "commit")
    public String commit(Article article, Model model, HttpServletRequest request, HttpServletResponse response) {
        if (!beanValidator(model, article)) {
            return form(article, model);
        }
        String categoryId = article.getCategory() != null ? article.getCategory().getId() : null;
        if (article.getAuditOpinion().equals("同意")) {
            article.setStatusCode("2");//将状态码的值设置为2
            articleService.tianjia(article);
            Page<Article> page = articleService.findPage(new Page<Article>(request, response), article);
            model.addAttribute("page", page);
            return "redirect:" + adminPath + "/cms/article/?repage&category.id=" + (categoryId != null ? categoryId : "");
        } else {
            article.setStatusCode("6");//审核意见不通过的时候将状态码的值设置为6
            articleService.tianjia(article);
            Page<Article> page = articleService.findPage(new Page<Article>(request, response), article);
            model.addAttribute("page", page);
            return "modules/cms/firsttrail_detailsn";
        }
    }

    //在初审页面中点击保存进入初审详情页面
    @RequiresPermissions("cms:article:edit")
    @RequestMapping(value = "fushen")
    public String fushen(Article article, Model model, HttpServletRequest request, HttpServletResponse response) {
        Page<Article> page = articleService.findPage(new Page<Article>(request, response), article);
        model.addAttribute("page", page);
        return "modules/cms/firsttrail_detailsy";
    }


    /**
     * 跳转到列表页面
     */
    @RequestMapping(value = "back")
    public String back(HttpServletRequest request, HttpServletResponse response, Model model, Article article) {
        if (!beanValidator(model, article)) {
            return form(article, model);
        }
        String categoryId = article.getCategory() != null ? article.getCategory().getId() : null;
        return "redirect:" + adminPath + "/cms/article/?repage&category.id=" + (categoryId != null ? categoryId : "");
    }

    //在初审详情页面点击进行复审开始进入复审页面
    @RequestMapping(value = "recheck")
    public String recheck(Article article, Model model, HttpServletRequest request, HttpServletResponse response) {
        article.setReviewTime(new Date());
        articleService.reviewtime(article);
        Page<Article> page = articleService.findPage(new Page<Article>(request, response), article);
        article.setStatusCode("3");
        model.addAttribute("page", page);
        return "modules/cms/recheck";
    }

    //在复审页面中点击保存进入复审详情页面
    @RequiresPermissions("cms:article:edit")
    @RequestMapping(value = "submit")
    public String submit(Article article, Model model, HttpServletRequest request, HttpServletResponse response) {
        if (!beanValidator(model, article)) {
            return form(article, model);
        }

        if (article.getReviewOpinions().equals("同意")) {
            article.setStatusCode("4"); //待复审时将状态码设置为4
            articleService.fushen(article);
            Page<Article> page = articleService.findPage(new Page<Article>(request, response), article);
            model.addAttribute("page", page);
            String categoryId = article.getCategory() != null ? article.getCategory().getId() : null;
            return "redirect:" + adminPath + "/cms/article/?repage&category.id=" + (categoryId != null ? categoryId : "");
        } else {
            article.setStatusCode("7"); //待复审时将状态码设置为7
            articleService.fushen(article);
            Page<Article> page = articleService.findPage(new Page<Article>(request, response), article);
            model.addAttribute("page", page);
            return "modules/cms/recheck_detailsn";

        }
    }

    //在初审页面中点击保存进入初审详情页面
    @RequiresPermissions("cms:article:edit")
    @RequestMapping(value = "fabu")
    public String fabu(Article article, Model model, HttpServletRequest request, HttpServletResponse response) {
        Page<Article> page = articleService.findPage(new Page<Article>(request, response), article);
        model.addAttribute("page", page);
        return "modules/cms/recheck_detailsy";
    }

    //点击复审页面中的发布按钮进入文章列表页
    @RequestMapping(value = "publish")
    public String publish(Article article, Model model, HttpServletRequest request, HttpServletResponse response) {
        if (!beanValidator(model, article)) {
            return form(article, model);
        }
        article.setStatusCode("5");
        articleService.fabu(article);
        Page<Article> page = articleService.findPage(new Page<Article>(request, response), article, true);
        model.addAttribute("page", page);
        String categoryId = article.getCategory() != null ? article.getCategory().getId() : null;
        return "redirect:" + adminPath + "/cms/article/?repage&category.id=" + (categoryId != null ? categoryId : "");

    }

    @RequiresPermissions("cms:article:edit")
    @RequestMapping(value = "save")
    public String save(HttpServletRequest request, Article article, MultipartHttpServletRequest multipartRequest, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, article)) {
            return form(article, model);
        }
        article.setStatusCode("1");//将状态码的值设置为1
        //开始上传文章附件
        MultipartFile articleFile = multipartRequest.getFile("file");
        if (articleFile.getOriginalFilename() != null && !"".equals(articleFile.getOriginalFilename())) {
            //调用上传方法
            String filePath = UploadFileUtils.fdfsUpload(articleFile);
            //在数据库中保存的路径
            article.setImage(filePath);
        }
        articleService.save(article, request);
        addMessage(redirectAttributes, "保存文章'" + StringUtils.abbr(article.getTitle(), 50) + "'成功");
        String categoryId = article.getCategory() != null ? article.getCategory().getId() : null;
        return "redirect:" + adminPath + "/cms/article/?repage&category.id=" + (categoryId != null ? categoryId : "");
    }

    @RequiresPermissions("cms:article:edit")
    @RequestMapping(value = "delete")
    public String delete(Article article, String categoryId, @RequestParam(required = false) Boolean isRe, RedirectAttributes redirectAttributes) {
        // 如果没有审核权限，则不允许删除或发布。
        if (!UserUtils.getSubject().isPermitted("cms:article:audit")) {
            addMessage(redirectAttributes, "你没有删除或发布权限");
        }
        articleService.delete(article, isRe);
        addMessage(redirectAttributes, (isRe != null && isRe ? "发布" : "删除") + "文章成功");
        return "redirect:" + adminPath + "/cms/article/?repage&category.id=" + (categoryId != null ? categoryId : "");
    }

    /**
     * 文章选择列表
     */
    @RequiresPermissions("cms:article:view")
    @RequestMapping(value = "selectList")
    public String selectList(Article article, HttpServletRequest request, HttpServletResponse response, Model model) {
        list(article, request, response, model);
        return "modules/cms/articleSelectList";
    }

    /**
     * 通过编号获取文章标题
     */
    @RequiresPermissions("cms:article:view")
    @ResponseBody
    @RequestMapping(value = "findByIds")
    public String findByIds(String ids) {
        List<Object[]> list = articleService.findByIds(ids);
        return JsonMapper.nonDefaultMapper().toJson(list);
    }

    private List<String> getTplContent() {
        List<String> tplList = fileTplService.getNameListByPrefix(siteService.get(Site.getCurrentSiteId()).getSolutionPath());
        tplList = TplUtils.tplTrim(tplList, Article.DEFAULT_TEMPLATE, "");
        return tplList;
    }


    /**
     * 跳转到信用记录查询主页
     */

    @RequestMapping(value = "xinyongjlcx")
    public String xinYongjlcx(P2pEnterpriseCertify p2pEnterpriseCertify, Model model, HttpServletRequest request, HttpServletResponse response) {
        String industryCode = p2pEnterpriseCertify.getIndustryCode();
        String enterpriseName = p2pEnterpriseCertify.getEnterpriseName();
        if (enterpriseName != null && !"".equals(enterpriseName)) {
            industryCode = "";
        }
        List<P2pIndustryclassi> industryList = p2pIndustryclassiService.findTopCategory();
        List<P2pEnterpriseCertify> list = p2pEnterpriseCertifyService.findCreditList(p2pEnterpriseCertify);
//    	model.addAttribute("enterpriseName", enterpriseName);
        model.addAttribute("industryCode", industryCode);
        model.addAttribute("industryList", industryList);
        model.addAttribute("list", list);
        model.addAttribute("count", list.size());
        return "modules/cms/front/themes/basic/xinyongjlcx";
    }

    /**
     * 信用记录详情页
     *
     * @author Chace
     */
    @RequestMapping("xinyongjlDetails")
    public String xinyongjlDetails(P2pEnterpriseCertify p2pEnterpriseCertify, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        User user = (User) session.getAttribute("user");
        p2pEnterpriseCertify = p2pEnterpriseCertifyService.findCreditByUserId(p2pEnterpriseCertify);
        model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
        model.addAttribute("countDagong", p2pEnterpriseCertify.getDagongList().size());
        model.addAttribute("countOther", p2pEnterpriseCertify.getOtherList().size());
        model.addAttribute("countBank", p2pEnterpriseCertify.getBankList().size());
        model.addAttribute("dagongList", p2pEnterpriseCertify.getDagongList());
        model.addAttribute("otherList", p2pEnterpriseCertify.getOtherList());
        model.addAttribute("bankList", p2pEnterpriseCertify.getBankList());
        model.addAttribute("user", user);
        model.addAttribute("reportUserId", p2pEnterpriseCertify.getUserId());
        return "modules/cms/front/themes/basic/xinyongjlDetails";
    }

    /**
     * 跳转到信用已购买查询
     */

    @RequestMapping(value = "xinyongygm")
    public String xinYongygm(Model model, HttpServletRequest request, HttpServletResponse response) {
        List<P2pIndustryclassi> industryList = p2pIndustryclassiService.findTopCategory();
        model.addAttribute("industryList", industryList);
        return "modules/cms/front/themes/basic/xinyongygm";

    }


    /**
     * 跳转到举报管理
     */
    /*@RequestMapping(value="reportRecord")
    public String reportRecord(HttpServletRequest request,HttpServletResponse reponse){
    	return "modules/front/account/reportRecord";
    }
    */
    @RequestMapping(value = "buyList")
    public void buyList(P2pCreditReportBuy p2pCreditReportbuy, HttpServletRequest request, HttpSession session,
                        HttpServletResponse response, Model model, String industryCode, String enterpriseType) {
        User user = (User) session.getAttribute("user");
        if (user != null && !"".equals(user.getId())) {
            p2pCreditReportbuy.setUser(user);
        }
        try {
            P2pCreditReport p2pCreditReport = new P2pCreditReport();
            p2pCreditReport.setIndustryCode(industryCode);
            p2pCreditReport.setEnterpriseType(enterpriseType);
            p2pCreditReportbuy.setP2pCreditReport(p2pCreditReport);
            List<P2pCreditReportBuy> list = p2pCreditReportBuyService.tableList(p2pCreditReportbuy);
            String json = JsonMapper.toJsonString(list);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 跳转到信用教育页面
     */

    @RequestMapping(value = "xinyongjiaoyu")
    public String xinYongJiaoYu(Article article, HttpServletRequest request, HttpServletResponse response, Model model) {
        Integer size = null;
        List<Article> publishArticleList = (List<Article>) articleService.findPublishArticle(article, size);
        for (Article a : publishArticleList) {
            //将上传的图片地址转化
            if (a.getImage() != null && !"".equals(a.getImage())) {
                a.setImage(UploadFileUtils.viewUrl(a.getImage()));
            }
        }
        List<Article> findJingXingList = (List<Article>) articleService.findJingXingList(article);
        //查询信用教育视频
        Link link = new Link();
        List<Link> linkList = linkService.findPaListShiPin(link);
        for (Link l : linkList) {
            //将上传的图片地址转化
            if (l.getImage() != null && !"".equals(l.getImage())) {
                l.setImage(UploadFileUtils.viewUrl(l.getImage()));
            }
        }
        List<Article> findWanChengList = (List<Article>) articleService.findWanChengLists(article);
        model.addAttribute("publishArticleList", publishArticleList);
        model.addAttribute("linkList", linkList);
        model.addAttribute("findJingXingList", findJingXingList);
        model.addAttribute("findWanChengList", findWanChengList);
        return "modules/cms/front/themes/basic/xinyongjiaoyu";

    }

    /**
     * 跳到信用教育讲堂页面 (使用分页)
     */

    //查询首页信用教育讲堂显示问题
    @RequestMapping(value = "xyjyJiangTangAjax")
    public void xyjyJiangTangAjax(Article article, HttpServletRequest request, HttpServletResponse response) {
        String num = request.getParameter("num");
        Integer size = null;
        if (num != null && "".equals(num)) {
            size = Integer.parseInt(num);
        }
        List<Article> publishArticleList = articleService.findPublishArticle(article, size);
        List<Object> l = new ArrayList<Object>();
        for (Article a : publishArticleList) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("pid", a.getId());
            map.put("title", a.getTitle());
            l.add(map);
        }
        try {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(JSON.toJSONString(l));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    @RequestMapping(value = "xyjyjiangtang")
    public String xyjyjiangtang(Article article, HttpServletRequest request, HttpServletResponse response, Model model) {
        Integer size = null;
        List<Article> publishArticleList = (List<Article>) articleService.findPublishArticle(article, size);
        for (Article a : publishArticleList) {
            //将上传的图片地址转化
            if (a.getImage() != null && !"".equals(a.getImage())) {
                a.setImage(UploadFileUtils.viewUrl(a.getImage()));
            }
        }
        model.addAttribute("publishArticleList", publishArticleList);
        return "modules/cms/front/themes/basic/xyjyjiangtang";

    }

    /**
     * 调到信用教育活动页面
     */
    @RequestMapping(value = "xyjyhuodong")
    public String xyjyhuodong(Article article, HttpServletRequest request, HttpServletResponse response, Model model) {
        List<Article> findJingXingList = (List<Article>) articleService.findJingXingList(article);
        List<Article> findWanChengList = (List<Article>) articleService.findWanChengLists(article);
        model.addAttribute("findJingXingList", findJingXingList);
        model.addAttribute("findWanChengList", findWanChengList);
        return "modules/cms/front/themes/basic/xyjyhuodong";

    }

    /**
     * 跳转到帮助中心页面
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "helpCenter")
    public String helpCenter(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/helpCenter";

    }

    /**
     * 跳转到关于我们的页面（公司简介）
     */
    @RequestMapping(value = "companyProfile")
    public String guanYuWoMen(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/companyProfile";

    }

    /**
     * 丝路互金网简介
     *
     * @return
     * @author Chace
     */
    @RequestMapping("cydiaProfile")
    public String cydiaProfile(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/cydiaProfile";
    }

    /**
     * 新闻动态列表
     *
     * @return
     * @author Chace
     */
    @RequestMapping("newsList")
    public String newsList(HttpServletRequest request, HttpServletResponse response,
                           Article article, Model model) {
        List<Article> newsList = (List<Article>) articleService.findNewsList(article);
        for (Article a : newsList) {
            //将上传的图片地址转化
            if (a.getImage() != null && !"".equals(a.getImage())) {
                a.setImage(UploadFileUtils.viewUrl(a.getImage()));
            }
        }
        model.addAttribute("newsList", newsList);
        return "modules/front/link/newsList";
    }

    //findImageNewsList

    /**
     * 获取具有焦点图的新闻动态列表，20170627首页
     *
     * @return
     * @author Frank Zhou
     */
    @RequestMapping("findImageNewsList")
    public void findImageNewsList(HttpServletRequest request, HttpServletResponse response) {
        String num = request.getParameter("num");
        Integer size = null;
        if (num != null) {
            size = Integer.parseInt(num);
        }
        List<Article> newsList = (List<Article>) articleService.findImageNewsList(size);
        FormatData2Json.writeJson(response, newsList);
    }

    /**
     * 新闻动态详情页
     *
     * @param article 文章实体
     * @param model
     * @return
     */
    @RequestMapping("newsListDetails")
    public String newsListDetails(HttpServletRequest request, HttpServletResponse response,
                                  Article article, Model model) {
        try {
            article.setHits(article.getHits() + 1);
            articleService.updateHitsAddOne(article.getId());
            if (article.getImage() != null && !"".equals(article.getImage())) {
                article.setImage(UploadFileUtils.viewUrl(article.getImage()));
            }
            model.addAttribute("articleDetails", article);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/front/link/newsListDetails";
    }

    /**
     * safetyGuarantee
     * 风控体系
     *
     * @return
     * @author Chace
     */
    @RequestMapping("safetyGuarantee")
    public String safetyGuarantee(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/safetyGuarantee";
    }

    /**
     * 跳转到联系我们的页面
     */
    @RequestMapping(value = "contactUs")
    public String contactUs(HttpServletRequest request, HttpServletResponse reponse) {
        return "modules/front/link/contactus";

    }

    /**
     * 跳转到合作伙伴的页面
     */
    @RequestMapping(value = "partner")
    public String partner(HttpServletRequest request, HttpServletResponse reponse) {
        Map<String, Object> map = Maps.newHashMap();
        return "modules/front/link/partner";

    }

    /**
     * 大公文化
     *
     * @param request
     * @param reponse
     * @return
     */
    @RequestMapping(value = "dagongwenhua")
    public String dagongwenhua(HttpServletRequest request, HttpServletResponse reponse) {
        return "modules/front/link/dagongwenhua";

    }

    //组织架构
    @RequestMapping(value = "orgStructure")
    public String orgStructure(HttpServletRequest request, HttpServletResponse reponse) {
        return "modules/front/link/organizationalStructure";

    }

    //组织架构
    @RequestMapping(value = "creditAptitude")
    public String creditAptitude(HttpServletRequest request, HttpServletResponse reponse) {
        return "modules/front/link/creditAptitude";

    }

    //安全保障
    @RequestMapping(value = "security")
    public String security(HttpServletRequest request, HttpServletResponse reponse) {
        return "modules/front/link/helpCenter_security";
    }

    //如何注册
    @RequestMapping(value = "register")
    public String register(HttpServletRequest request, HttpServletResponse reponse) {
        return "modules/front/link/help_register";
    }

    //如何借款
    @RequestMapping(value = "helpFinancing")
    public String borrow(HttpServletRequest request, HttpServletResponse reponse) {
        return "modules/front/link/help_financing";

    }

    //自助服务
    @RequestMapping(value = "helpService")
    public String helpService(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/self_service";

    }

    //平台简介
    @RequestMapping(value = "platformIntroduction")
    public String platformIntroduction(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/platform_Introduction";
    }

    //管理团队
    @RequestMapping(value = "teamManagement")
    public String teamManagement(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/team_management";

    }

    //新闻平台
    @RequestMapping(value = "platformNews")
    public String platformNews(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/platform_news";
    }

    //费用说明
    @RequestMapping(value = "costsThat")
    public String costsThat(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/costs_that";

    }

    //服务权责
    @RequestMapping(value = "serviceResponsibilities")
    public String serviceResponsibilities(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/service_responsibilities";

    }

    //跳转到服务条款的总体页面
    @RequestMapping(value = "serviceTerms")
    public String serviceTerms(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/service_terms";

    }

    //跳转到免责声明总体页面
    @RequestMapping(value = "disclaimer")
    public String disclaimer(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/disclaimer";

    }

    //跳转到融资免责页面
    @RequestMapping(value = "financing_liability")
    public String financingLiability(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/financing_liability";

    }

    //跳转到投资免责页面
    @RequestMapping(value = "investmentLiability")
    public String investmentLiability(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/investment_liability";

    }

    //跳转到服务热线页面
    @RequestMapping(value = "serviceHotline")
    public String serviceHotline(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/service_hotline";

    }

    //跳转到在线客服页面
    @RequestMapping(value = "onlineService")
    public String onlineService(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/online_service";

    }

    //跳转到产品介绍页面
    @RequestMapping(value = "productInformation")
    public String productInformation(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/product_information";

    }

    //跳到产品介绍投融资页面
    @RequestMapping(value = "investmentFinancing")
    public String investmentFinancing(HttpServletRequest request, HttpServletResponse response) {
        return "modules/front/link/investment_financing";

    }

    /**
     * 跳转到平台公告页面
     */
    @RequestMapping(value = "gonggao")
    public String gongGao(HttpServletRequest request, HttpServletResponse reponse, Model model) {
        String num = request.getParameter("num");
        Integer size = null;
        if (num != null) {
            size = Integer.parseInt(num);
        }
        Article article = new Article();
        List<Article> gonggaoDetails = articleService.findgonggaoList(article, size);
        for (Article a : gonggaoDetails) {
            //将上传的图片地址转化
            if (a.getImage() != null && !"".equals(a.getImage())) {
                a.setImage(UploadFileUtils.viewUrl(a.getImage()));
            }
        }
        model.addAttribute("gonggaoDetails", gonggaoDetails);
        return "modules/cms/front/themes/basic/gonggao";
    }

    /**
     * 对平台公告，进行分页
     *
     * @param request
     * @param reponse
     * @param model
     * @return
     * @author Frank Zhou
     */
    @RequestMapping(value = "gonggaoPage")
    public void gongGaoPage(HttpServletRequest request, HttpServletResponse response) {
        String num = request.getParameter("num");
        Integer size = null;
        if (num != null) {
            size = Integer.parseInt(num);
        }
        Article article = new Article();
        List<Article> gonggaoDetails = articleService.findgonggaoList(article, size);
        for (Article a : gonggaoDetails) {
            //将上传的图片地址转化
            if (a.getImage() != null && !"".equals(a.getImage())) {
                a.setImage(UploadFileUtils.viewUrl(a.getImage()));
            }
        }
        FormatData2Json.writeJson(response, gonggaoDetails);
    }


    /**
     * 跳转到一带一路的项目招标模块
     */
    @RequestMapping(value = "projectBiding")
    public String ProjectBiding(HttpServletRequest request, HttpServletResponse reponse, Model model) {
        return "modules/cms/front/themes/basic/project_biding";

    }

    /**
     * 跳转到一带一路的信息产品页面
     */
    @RequestMapping(value = "xinxichanpin")
    public String XinXiChanPin(HttpServletRequest request, HttpServletResponse reponse, Model model) {
        return "modules/cms/front/themes/basic/xinxichanpin";
    }


    /**
     * 跳转到一带一路大型项目简介页面
     */
    @RequestMapping(value = "programIntroduction")
    public String programIntroduction(HttpServletRequest request, HttpServletResponse reponse, Model model) {
        return "modules/cms/front/themes/basic/program_introduction";

    }

    /**
     * 一带一路信息列表页面
     * 政策信息
     *
     * @param request
     * @param reponse
     * @param article
     * @param model
     * @return
     */
    @RequestMapping(value = "infoListForeign")
    public String infoListForeign(HttpServletRequest request, HttpServletResponse reponse, Article article, Model model, String mode) {
        model.addAttribute("policy_category", "沿线国家政策");
        return "modules/cms/front/themes/basic/ydyl_infoListForeign";
    }

    //国内地方政策
    @RequestMapping(value = "infoListInland")
    public String infoListInland(HttpServletRequest request, HttpServletResponse reponse, Article article, Model model, String mode) {
        model.addAttribute("policy_category", "国内地方政策");
        return "modules/cms/front/themes/basic/ydyl_infoListInland";
    }

    /**
     * 跳转到资讯项目招标页面
     */
    @RequestMapping(value = "newsInformation")
    public String newsInformation(HttpServletRequest request, HttpServletResponse reponse, Model model) {
        return "modules/cms/front/themes/basic/news_information";

    }

    /**
     * 跳转到一带一路的投资指南页面
     */
    @RequestMapping(value = "investmentguide")
    public String InvestmentGuide(HttpServletRequest request, HttpServletResponse reponse, Model model) {
        return "modules/cms/front/themes/basic/investment_guide";
    }

    /**
     * 跳转到一带一路的丝路战略研究页面
     */
    @RequestMapping(value = "strategicResearch")
    public String StrategicResearch(HttpServletRequest request, HttpServletResponse reponse, Model model) {
        return "modules/cms/front/themes/basic/strategic_research";
    }


    /**
     * 一带一路页面
     * 人文信息
     */
    @RequestMapping(value = "humanity")
    public String Humanity(HttpServletRequest request, HttpServletResponse response, Model model) {
        model.addAttribute("humanity_category", "人文概述");
        return "modules/cms/front/themes/basic/ydyl_humanity";

    }

    @RequestMapping(value = "culturalCommunication")
    public String culturalCommunication(HttpServletRequest request, HttpServletResponse response, Model model) {
        model.addAttribute("cultural_category", "文化交流");
        return "modules/cms/front/themes/basic/cultural_communication";

    }


    /**
     * 一带一路页面
     * 投融资信息
     */

    @RequestMapping(value = "financing")
    public String Financing(HttpServletRequest request, HttpServletResponse response, Model model) {
        model.addAttribute("financing_catagory", "融资信息");
        return "modules/cms/front/themes/basic/ydyl_financing";

    }

    @RequestMapping(value = "bond")
    public String Bond(HttpServletRequest request, HttpServletResponse response, Model model) {
        model.addAttribute("bond_catagory", "丝路债券");
        return "modules/cms/front/themes/basic/ydyl_bond";

    }


    /**
     * 常见问题
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "helpCenter_FAQ")
    public String FAQ(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "modules/front/link/helpCenter_FAQ";
    }

    /**
     * 投资流程
     *
     * @return
     */
    @RequestMapping(value = "investment_flow")
    public String investment_flow(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "modules/front/link/help_investment";
    }

    /**
     * 信用报告
     */

    @RequestMapping(value = "xinyongbg")
    public String xinYongbg(String id, HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model) {
        User user = (User) session.getAttribute("user");
        List<P2pCreditReportBuy> p2pCreditReportBuyList = new ArrayList<P2pCreditReportBuy>();
        if (user != null && !"".equals(user.getId())) {
            p2pCreditReportBuyList = p2pCreditReportBuyService.getCreditReprotId(id, user.getId());
        }
        try {
            //得到报告表
            P2pCreditReport p2pCreditReport = p2pCreditReportService.get(id);
            //得到信用报告指标数据表
            List<P2pCreditReportData> p2pCreditReportDataList = p2pCreditReportDataService.getCreditReprotId(p2pCreditReport.getId());
            //得到信用报告指标表
            List<P2pCreditReportIndex> p2pCreditReportIndexList = p2pCreditReportIndexService.getIndexId();
            model.addAttribute(p2pCreditReport).addAttribute(p2pCreditReportDataList).addAttribute(p2pCreditReportIndexList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("user", user);
        model.addAttribute("p2pCreditReportBuyList", p2pCreditReportBuyList);
        return "modules/cms/front/themes/basic/xinyongbaogao";
    }

    /**
     * 跳转到进行中的活动的报名页面
     */
    @RequestMapping(value = "signUpActivities")
    public String signUpActivities(HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Article article = new Article();
            article.setId(request.getParameter("pid"));
            article = articleService.findSignUpActivities(article);
            //将上传的图片地址转化
            if (article.getImage() != null && !"".equals(article.getImage())) {
                article.setImage(UploadFileUtils.viewUrl(article.getImage()));
            }
            model.addAttribute("article", article);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/cms/front/themes/basic/hdbaoming";
    }

    /**
     * 跳转到已完成的活动的详情页面
     */
    @RequestMapping(value = "completedActivities")
    public String completedActivities(HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Article article = new Article();
            article.setId(request.getParameter("pid"));
            article = articleService.findcompletedActivities(article);
            //将上传的图片地址转化
            if (article.getImage() != null && !"".equals(article.getImage())) {
                article.setImage(UploadFileUtils.viewUrl(article.getImage()));
            }
            model.addAttribute("article", article);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/cms/front/themes/basic/completedactivities";
    }

    /**
     * 运营数据
     *
     * @author Chace
     */
    @RequestMapping("operationData")
    public String operationData(P2pPlatformOperationDataShow p2pPlatformOperationDataShow, Model model) {
        try {
            p2pPlatformOperationDataShow = p2pPlatformOperationDataShowService.findData(p2pPlatformOperationDataShow);
            model.addAttribute("p2pPlatformOperationDataShow", p2pPlatformOperationDataShow);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/front/link/operationData";
    }

    /**
     * 首页数据披露
     *
     * @author Chace
     */
    @RequestMapping("operationDataIndex")
    public void operationDataIndex(HttpServletResponse response) {
        try {
            P2pPlatformOperationDataShow p2pPlatformOperationDataShow = new P2pPlatformOperationDataShow();
            p2pPlatformOperationDataShow = p2pPlatformOperationDataShowService.findData(p2pPlatformOperationDataShow);
            String json = JsonMapper.toJsonString(p2pPlatformOperationDataShow);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 安全保障
     *
     * @return
     * @author Chace
     */
    @RequestMapping("safety")
    public String safety() {
        return "modules/front/financing/safety";
    }

    //查询教育讲堂内容详情
    @RequestMapping(value = "JiangTangDetails")
    public String selectJiangTangDetails(HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Article article = new Article();
            article.setId(request.getParameter("pid"));
            List<Article> JiangTangDetails = articleService.findJiangTangContent(article);
            articleService.updateHitsAddOne(request.getParameter("pid"));
            model.addAttribute("JiangTangDetails", JiangTangDetails);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/cms/front/themes/basic/jiangTangView";
    }

    //查询进行中教育活动内容详情
    @RequestMapping(value = "jxActivityDetails")
    public String selectjxActivityDetails(HttpServletRequest request, HttpServletResponse response, Model model) {
        Article article = new Article();
        article.setId(request.getParameter("pid"));
        List<Article> jxActivityDetails = articleService.findJxActivityContent(article);
        articleService.updateHitsAddOne(request.getParameter("pid"));
        model.addAttribute("jxActivityDetails", jxActivityDetails);
        return "modules/cms/front/themes/basic/jxActivityView";
    }

    //查询已完成教育活动内容详情
    @RequestMapping(value = "wcActivityDetails")
    public String selectwcActivityDetails(HttpServletRequest request, HttpServletResponse response, Model model) {
        Article article = new Article();
        article.setId(request.getParameter("pid"));
        List<Article> wcActivityDetails = articleService.findWcActivityContent(article);
        articleService.updateHitsAddOne(request.getParameter("pid"));
        model.addAttribute("wcActivityDetails", wcActivityDetails);
        return "modules/cms/front/themes/basic/wcActivityView";
    }

    //查询公示公告内容详情
    @RequestMapping(value = "gonggaoDetails")
    public String selectgonggaoDetails(HttpServletRequest request, HttpServletResponse response, Model model) {
        Article article = new Article();
        article.setId(request.getParameter("pid"));
        List<Article> gonggaoDetails = articleService.findgonggaoContent(article);
        articleService.updateHitsAddOne(request.getParameter("pid"));
        model.addAttribute("gonggaoDetails", gonggaoDetails);
        return "modules/cms/front/themes/basic/gonggaoView";
    }

    // 将GBK字符转化为ISO码
    public static String parseGBK(String sIn) {
        if (sIn == null || sIn.equals(""))
            return sIn;
        try {
            return new String(sIn.getBytes("GBK"), "ISO-8859-1");
        } catch (UnsupportedEncodingException usex) {
            return sIn;
        }
    }

    /**
     * 文件下载
     *
     * @param address
     * @param request
     * @param response
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "download")
    public static void download(String address, HttpServletRequest request,
                                HttpServletResponse response) throws UnsupportedEncodingException {
        address = Global.getConfig("filePath") + address;
        String address1 = null;
        String fileName = request.getParameter("fileName");
        try {
            address1 = URLDecoder.decode(address, "utf8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        String[] a = address1.split("/");
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition", "attachment;fileName=" + new String(fileName.getBytes("gb2312"), "ISO8859-1"));
        try {
            File file = new File(address1);
            InputStream inputStream = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
                os.flush();
            }
            // 这里主要关闭。
            os.close();
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
