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
import com.thinkgem.jeesite.modules.cms.entity.CmsChinaArea;
import com.thinkgem.jeesite.modules.cms.entity.CmsChinaAreaCity;
import com.thinkgem.jeesite.modules.cms.entity.CmsForeignArea;
import com.thinkgem.jeesite.modules.cms.entity.CmsForeignCountry;
import com.thinkgem.jeesite.modules.cms.entity.CmsRequirementInformation;
import com.thinkgem.jeesite.modules.cms.entity.P2pProductInfo;
import com.thinkgem.jeesite.modules.cms.service.CmsChinaAreaCityService;
import com.thinkgem.jeesite.modules.cms.service.CmsChinaAreaService;
import com.thinkgem.jeesite.modules.cms.service.CmsForeignAreaService;
import com.thinkgem.jeesite.modules.cms.service.CmsForeignCountryService;
import com.thinkgem.jeesite.modules.cms.service.CmsRequirementInformationService;
import com.thinkgem.jeesite.modules.cms.service.P2pProductInfoService;

/**
 * 产品供给信息Controller
 *
 * @author lsm
 * @version 2016-08-06
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/p2pProductInfo")
public class P2pProductInfoController extends BaseController {

    @Autowired
    private P2pProductInfoService p2pProductInfoService;

    @Autowired
    private CmsChinaAreaCityService cmsChinaAreaCityService;
    @Autowired
    private CmsChinaAreaService cmsChinaAreaService;

    @Autowired
    private CmsRequirementInformationService CmsRequirementInformationService;

    @Autowired
    private CmsForeignAreaService cmsForeignAreaService;

    @Autowired
    CmsForeignCountryService cmsForeignCountryService;


    @ModelAttribute
    public P2pProductInfo get(@RequestParam(required = false) String id) {
        P2pProductInfo entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pProductInfoService.get(id);
        }
        if (entity == null) {
            entity = new P2pProductInfo();
        }
        return entity;
    }

    @RequiresPermissions("cms:p2pProductInfo:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pProductInfo p2pProductInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pProductInfo> page = p2pProductInfoService.findPage(new Page<P2pProductInfo>(request, response), p2pProductInfo);
        model.addAttribute("page", page);
        return "modules/cms/p2pProductInfoList";
    }

    @RequiresPermissions("cms:p2pProductInfo:view")
    @RequestMapping(value = "form")
    public String form(P2pProductInfo p2pProductInfo, Model model) {
        model.addAttribute("p2pProductInfo", p2pProductInfo);
        return "modules/cms/p2pProductInfoForm";
    }

    @RequiresPermissions("cms:p2pProductInfo:edit")
    @RequestMapping(value = "save")
    public String save(P2pProductInfo p2pProductInfo, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pProductInfo)) {
            return form(p2pProductInfo, model);
        }
        p2pProductInfoService.save(p2pProductInfo);
        addMessage(redirectAttributes, "保存产品供给信息成功");
        return "redirect:" + Global.getAdminPath() + "/cms/p2pProductInfo/?repage";
    }

    @RequiresPermissions("cms:p2pProductInfo:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pProductInfo p2pProductInfo, RedirectAttributes redirectAttributes) {
        p2pProductInfoService.delete(p2pProductInfo);
        addMessage(redirectAttributes, "删除产品供给信息成功");
        return "redirect:" + Global.getAdminPath() + "/cms/p2pProductInfo/?repage";
    }

    @RequestMapping(value = "productInfo")
    public String productInfo(Model model) {
        List<P2pProductInfo> p2pProductInfolist = p2pProductInfoService.findProductList();
        model.addAttribute("p2pProductInfolist", p2pProductInfolist);
        return "modules/cms/front/themes/basic/provide_info";

    }

    /**
     * 跳转到一带一路页面
     */
    @RequestMapping(value = "yidaiyilu")

    public String yiDaiYiLu(HttpServletRequest request, HttpServletResponse response, Model model, P2pProductInfo p2pProductInfo) {
        //查询国内前5个地区及省市
        List<CmsChinaArea> cmsChinaAreaListlist = cmsChinaAreaService.findAllChinaAreaList();//国内地区搜索
        List<CmsChinaAreaCity> cmsChinaAreaCiNames = cmsChinaAreaCityService.findCityNames();//国内城市名称搜索

        //查询国外前5个地区，前5个国家
        List<CmsForeignArea> cmsForeignAreaList = cmsForeignAreaService.selectFrontForeignArea();
        List<CmsForeignCountry> cmsForeignCountryList = cmsForeignCountryService.selectFrontForejgnCountry();

        model.addAttribute("cmsChinaAreaListlist", cmsChinaAreaListlist);
        model.addAttribute("cmsChinaAreaCiNames", cmsChinaAreaCiNames);
        model.addAttribute("cmsForeignAreaList", cmsForeignAreaList);
        model.addAttribute("cmsForeignCountryList", cmsForeignCountryList);


        List<P2pProductInfo> p2pProductInfoList = p2pProductInfoService.selectProductInfo();//查询product表 返回List列表
        List<CmsRequirementInformation> cmsRequirementInformationList = CmsRequirementInformationService.selectRequirementInformation();//查询CmsRequirementInformation
        model.addAttribute("p2pProductInfoList", p2pProductInfoList);
        model.addAttribute("cmsRequirementInformationList", cmsRequirementInformationList);
        return "modules/cms/front/themes/basic/yidaiyilu";
    }

}