/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.CmsForeignArea;
import com.thinkgem.jeesite.modules.cms.entity.CmsForeignCountry;
import com.thinkgem.jeesite.modules.cms.entity.CmsRequirementInformation;
import com.thinkgem.jeesite.modules.cms.service.CmsForeignAreaService;
import com.thinkgem.jeesite.modules.cms.service.CmsForeignCountryService;
import com.thinkgem.jeesite.modules.cms.service.CmsRequirementInformationService;

/**
 * 国外信息表Controller
 *
 * @author duan
 * @version 2016-08-17
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/cmsForeignCountry")
public class CmsForeignCountryController extends BaseController {

    @Autowired
    private CmsForeignCountryService cmsForeignCountryService;

    @Autowired
    private CmsForeignAreaService cmsForeignAreaService;

    @Autowired
    private CmsRequirementInformationService cmsRequirementInformationService;


    @ModelAttribute
    public CmsForeignCountry get(@RequestParam(required = false) String id) {
        CmsForeignCountry entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = cmsForeignCountryService.get(id);
        }
        if (entity == null) {
            entity = new CmsForeignCountry();
        }
        return entity;
    }

    @RequestMapping(value = "list")
    public String list(CmsForeignCountry cmsForeignCountry, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CmsForeignCountry> page = cmsForeignCountryService.findPage(new Page<CmsForeignCountry>(request, response), cmsForeignCountry);
        model.addAttribute("page", page);
        return "modules/cms/cmsForeignCountryList";
    }


    @RequestMapping(value = "form")
    public String form(CmsForeignCountry cmsForeignCountry, Model model) {
        List<CmsForeignArea> cmsForeignAreaList = cmsForeignAreaService.selecForeignArea();//查询区域
        model.addAttribute("cmsForeignAreaList", cmsForeignAreaList);
        model.addAttribute("cmsForeignCountry", cmsForeignCountry);
        return "modules/cms/cmsForeignCountryForm";
    }


    @RequestMapping(value = "save")
    public String save(CmsForeignCountry cmsForeignCountry, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, cmsForeignCountry)) {
            return form(cmsForeignCountry, model);
        }
        cmsForeignCountryService.save(cmsForeignCountry);
        addMessage(redirectAttributes, "保存国外信息成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsForeignCountry/list?repage";
    }

    @RequestMapping(value = "delete")
    public String delete(CmsForeignCountry cmsForeignCountry, RedirectAttributes redirectAttributes) {
        cmsForeignCountryService.delete(cmsForeignCountry);
        addMessage(redirectAttributes, "删除国外信息成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsForeignCountry/list?repage";
    }

    /**
     * 跳转到国外国家信息添加页面
     */
    @RequestMapping(value = "toForeignCountrySavePage")
    public String toForeignCountrySavePage(Model model) {
        List<CmsForeignArea> cmsForeignAreaList = cmsForeignAreaService.selecForeignArea();
        model.addAttribute("cmsForeignAreaList", cmsForeignAreaList);
        return "modules/cms/cmsForeignCountryForm";

    }

    /**
     * 跳转到国外重点信息页面
     */
    @RequestMapping(value = "toForeignCountryShowPage")
    public String toForeignCountryShowPage(Model model, HttpServletRequest request) {
        List<CmsForeignArea> cmsForeignAreaList = cmsForeignAreaService.selecForeignArea();//查询所有区域
        CmsForeignArea cmsForeignAreaOne = (CmsForeignArea) cmsForeignAreaList.get(0);//第一个区域
        //根据区域id查询出国家id及国旗信息
        List<CmsForeignCountry> foreignCountrys = cmsForeignCountryService.selectCountrysAccAid(cmsForeignAreaOne.getId());
        //获得第一个国家信息
        CmsForeignCountry cmsForeignCountry = (CmsForeignCountry) foreignCountrys.get(0);//(此对象不包含图片及介绍等信息)
        CmsForeignCountry cmsOneForeignCountry = this.get(cmsForeignCountry.getId());//包含图片及简介

        //查询 资讯、项目、商务、投资项、政策、人文、报告、机构

        List<CmsRequirementInformation> requirementInformationList = cmsRequirementInformationService.selectRequirementInformationList(null);//商务需求信息查询


        model.addAttribute("cmsForeignAreaList", cmsForeignAreaList);
        model.addAttribute("foreignCountrys", foreignCountrys);
        model.addAttribute("cmsOneForeignCountry", cmsOneForeignCountry);
        model.addAttribute("requirementInformationList", requirementInformationList);
        return "modules/cms/guowaizhongdiandiqu";

    }


    /**
     * 根据区域id查询包含的国家信息及一个国家详细信息
     */

    @RequestMapping(value = "selectCountrysInfo")
    @ResponseBody
    public Map<String, Object> selectCountrysInfo(Model model, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String cid = request.getParameter("cid");
        List<CmsForeignCountry> foreignCountrys = cmsForeignCountryService.selectCountrysAccAid(cid);//根据区域id查询出对应国家

        CmsForeignCountry cmsForeignCountry = (CmsForeignCountry) foreignCountrys.get(0);//获得第一个区域国家信息(此对象不包含图片及介绍等信息)
        CmsForeignCountry cmsOneForeignCountry = this.get(cmsForeignCountry.getId());//第一个国家信息包含图片及简介
        map.put("foreignCountrys", foreignCountrys);
        map.put("cmsOneForeignCountry", cmsOneForeignCountry);
        return map;

    }

    /**
     * 根据区域id查询包含的国家信息及一个国家详细信息
     */

    @RequestMapping(value = "selectCountrysInfoAccClick")
    public String selectCountrysInfoAccClick(Model model, HttpServletRequest request) {
        String cid = request.getParameter("cid");
        List<CmsForeignCountry> foreignCountrys = cmsForeignCountryService.selectCountrysAccAid(cid);//根据区域id查询出对应区域国家

        List<CmsForeignArea> cmsForeignAreaList = cmsForeignAreaService.selecForeignArea();//查询所有区域

        CmsForeignCountry cmsForeignCountry = (CmsForeignCountry) foreignCountrys.get(0);//获得第一个区域国家信息(此对象不包含图片及介绍等信息)
        CmsForeignCountry cmsOneForeignCountry = this.get(cmsForeignCountry.getId());//第一个国家信息包含图片及简介

        List<CmsRequirementInformation> requirementInformationList = cmsRequirementInformationService.selectRequirementInformationList(null);//商务需求信息查询
        model.addAttribute("cmsForeignAreaList", cmsForeignAreaList);//所有区域
        model.addAttribute("foreignCountrys", foreignCountrys);//指定区域对应的国家
        model.addAttribute("cmsOneForeignCountry", cmsOneForeignCountry);//第一个国家详情
        model.addAttribute("requirementInformationList", requirementInformationList);//商务需求信息
        return "modules/cms/guowaizhongdiandiqu";

    }


    /**
     * 根据国家id查询国家信息
     */

    @RequestMapping(value = "toForeignCountryetailPage")
    public String toForeignCountryetailPage(Model model, HttpServletRequest request) {
        String cid = request.getParameter("cid");
        CmsForeignCountry cmsOneForeignCountry = this.get(cid);//包含详细信息
        model.addAttribute("cmsOneForeignCountry", cmsOneForeignCountry);
        return "modules/cms/ydyl_zfgk-for";
    }


}