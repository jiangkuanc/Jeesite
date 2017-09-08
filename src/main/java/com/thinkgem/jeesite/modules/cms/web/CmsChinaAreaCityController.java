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
import com.thinkgem.jeesite.modules.cms.entity.CmsChinaArea;
import com.thinkgem.jeesite.modules.cms.entity.CmsChinaAreaCity;
import com.thinkgem.jeesite.modules.cms.entity.CmsRequirementInformation;
import com.thinkgem.jeesite.modules.cms.service.CmsChinaAreaCityService;
import com.thinkgem.jeesite.modules.cms.service.CmsChinaAreaService;
import com.thinkgem.jeesite.modules.cms.service.CmsRequirementInformationService;

/**
 * cms_caController
 *
 * @author duan
 * @version 2016-08-15
 */
@Controller
@RequestMapping(value = "${adminPath}/cmsca/cmsChinaAreaCity")
public class CmsChinaAreaCityController extends BaseController {

    @Autowired
    private CmsChinaAreaCityService cmsChinaAreaCityService;
    @Autowired
    private CmsChinaAreaService cmsChinaAreaService;
    @Autowired
    private CmsRequirementInformationService cmsRequirementInformationService;


    @ModelAttribute
    public CmsChinaAreaCity get(@RequestParam(required = false) String id) {
        CmsChinaAreaCity entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = cmsChinaAreaCityService.get(id);
        }
        if (entity == null) {
            entity = new CmsChinaAreaCity();
        }
        return entity;
    }

    @RequestMapping(value = "list")
    public String list(CmsChinaAreaCity cmsChinaAreaCity, HttpServletRequest request, HttpServletResponse response, Model model) {
        System.out.println(cmsChinaAreaCity.toString());
        Page<CmsChinaAreaCity> page = cmsChinaAreaCityService.findPage(new Page<CmsChinaAreaCity>(request, response), cmsChinaAreaCity);
        model.addAttribute("page", page);
        return "modules/cms/cmsChinaAreaCityList";
    }

    @RequestMapping(value = "form")
    public String form(CmsChinaAreaCity cmsChinaAreaCity, Model model) {
        CmsChinaAreaCity cmsChinaAreaCity1 = this.get(cmsChinaAreaCity.getId());

        CmsChinaArea cmsChinaArea = cmsChinaAreaService.get(cmsChinaAreaCity1.getCmsChinaAreaId());
        List<CmsChinaArea> cmsChinaAreaList = cmsChinaAreaService.findAllChinaAreaList();//查询区域名称
        model.addAttribute("cmsChinaAreaList", cmsChinaAreaList);
        model.addAttribute("cmsChinaAreaCity", cmsChinaAreaCity1);
        model.addAttribute("cmsChinaArea", cmsChinaArea);
        return "modules/cms/cmsChinaAreaCityForm";
    }

    @RequestMapping(value = "save")
    public String save(CmsChinaAreaCity cmsChinaAreaCity, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, cmsChinaAreaCity)) {
            return form(cmsChinaAreaCity, model);
        }
        cmsChinaAreaCityService.save(cmsChinaAreaCity);
        addMessage(redirectAttributes, "保存成功");
        return "redirect:" + Global.getAdminPath() + "/cmsca/cmsChinaAreaCity/list?repage";
    }

    @RequestMapping(value = "delete")
    public String delete(CmsChinaAreaCity cmsChinaAreaCity, RedirectAttributes redirectAttributes) {
        cmsChinaAreaCityService.delete(cmsChinaAreaCity);
        addMessage(redirectAttributes, "删除国内信息成功");
        return "redirect:" + Global.getAdminPath() + "/cmsca/cmsChinaAreaCity/list?repage";
    }

    /**
     * 跳转到国内城市添加页面
     */
    @RequestMapping(value = "toChinaCitySavePage")
    public String toChinaCitySavePage(Model model) {
        List<CmsChinaArea> cmsChinaAreaList = cmsChinaAreaService.findAllChinaAreaList();
        model.addAttribute("cmsChinaAreaList", cmsChinaAreaList);
        return "modules/cms/cmsChinaAreaCityForm";

    }

    /**
     * 查询出所有地区名称及第一个地区的省会名称
     */
    @RequestMapping(value = "findAllChinaAreaNamesC")
    public String findAllChinaAreaNamesC(Model model) {
        List<CmsChinaArea> cmsChinaAreaList = cmsChinaAreaService.findAllChinaAreaList();//查询到所有地区
        CmsChinaArea cmsChinaArea = (CmsChinaArea) cmsChinaAreaList.get(0);
        List<CmsChinaAreaCity> cmsChinaAreaCityList = cmsChinaAreaCityService.seletCtityNamesAccAid(cmsChinaArea);//获得第一个地区对应的城市

        CmsChinaAreaCity cmsChinaAreaCityOne = this.get(((CmsChinaAreaCity) cmsChinaAreaCityList.get(0)).getId());

        //查询 资讯、项目、商务、投资项、政策、人文、报告、机构

        List<CmsRequirementInformation> requirementInformationList = cmsRequirementInformationService.selectRequirementInformation();


        model.addAttribute("cmsChinaAreaList", cmsChinaAreaList);
        model.addAttribute("cmsChinaAreaCityList", cmsChinaAreaCityList);
        model.addAttribute("cmsChinaAreaCityOne", cmsChinaAreaCityOne);
        model.addAttribute("requirementInformationList", requirementInformationList);
        return "modules/cms/guoneizhongdiandiqu";

    }


    /**
     * 根据id查询出相应地区城市名称、图片信息
     */
    @RequestMapping(value = "findTheCitysAccAid")
    @ResponseBody
    public Map<String, Object> findTheCitysAccAid(Model model, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String aid = request.getParameter("aid");
        CmsChinaArea cmsChinaArea = new CmsChinaArea();
        cmsChinaArea.setId(aid);

        List<CmsChinaAreaCity> cmsChinaAreaCityList = cmsChinaAreaCityService.seletCtityNamesAccAid(cmsChinaArea);//根据Id获得相应区域城市
        CmsChinaAreaCity cmsChinaAreaCity = cmsChinaAreaCityList.get(0);
        CmsChinaAreaCity cmsOneChinaAreaCity = this.get(cmsChinaAreaCity.getId());
        map.put("cmsChinaAreaCityList", cmsChinaAreaCityList);
        map.put("cmsOneChinaAreaCity", cmsOneChinaAreaCity);

        return map;

    }

    /**
     * 一带一路首页点击地区名称查询对应地区信息
     */
    @RequestMapping(value = "findTheCitysAccClick")
    public String findTheCitysAccClick(Model model, HttpServletRequest request) {
        String aid = request.getParameter("aid");
        CmsChinaArea cmsChinaArea = new CmsChinaArea();
        cmsChinaArea.setId(aid);
        List<CmsChinaAreaCity> cmsChinaAreaCityList = cmsChinaAreaCityService.seletCtityNamesAccAid(cmsChinaArea);//根据Id获得相应区域城市

        CmsChinaAreaCity CmsChinaAreaCity1 = cmsChinaAreaCityList.get(0);//获得第一个城市信息
        CmsChinaAreaCity cmsChinaAreaCityOne = cmsChinaAreaCityService.seletCtityInfoAccCid(CmsChinaAreaCity1.getId());

        List<CmsChinaArea> cmsChinaAreaList = cmsChinaAreaService.findAllChinaAreaList();//查询到所有地区
        List<CmsRequirementInformation> requirementInformationList = cmsRequirementInformationService.selectRequirementInformationList(null);//商务需求信息查询


        model.addAttribute("cmsChinaAreaList", cmsChinaAreaList);//国内所有区域
        model.addAttribute("cmsChinaAreaCityList", cmsChinaAreaCityList);//对应的省市名称
        model.addAttribute("cmsChinaAreaCityOne", cmsChinaAreaCityOne);//一个城市详细信息
        model.addAttribute("requirementInformationList", requirementInformationList);//商务信息
        return "modules/cms/guoneizhongdiandiqu";

    }


    /**
     * 根据城市id查询城市概况、介绍等信息
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "seletCtityInfoAccCid")
    public String seletCtityInfoAccCid(Model model, HttpServletRequest request) {
        String cid = request.getParameter("cid");
        CmsChinaAreaCity cmsChinaAreaCity = cmsChinaAreaCityService.seletCtityInfoAccCid(cid);
        model.addAttribute("cmsChinaAreaCity", cmsChinaAreaCity);
        return "modules/cms/ydyl_zfgk-els";
    }

}