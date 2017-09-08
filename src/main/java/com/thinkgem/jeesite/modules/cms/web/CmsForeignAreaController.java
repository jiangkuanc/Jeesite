/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.thinkgem.jeesite.modules.cms.entity.CmsForeignArea;
import com.thinkgem.jeesite.modules.cms.service.CmsForeignAreaService;

/**
 * 国外区域表Controller
 *
 * @author duan
 * @version 2016-08-17
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/cmsForeignArea")
public class CmsForeignAreaController extends BaseController {

    @Autowired
    private CmsForeignAreaService cmsForeignAreaService;

    @ModelAttribute
    public CmsForeignArea get(@RequestParam(required = false) String id) {
        CmsForeignArea entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = cmsForeignAreaService.get(id);
        }
        if (entity == null) {
            entity = new CmsForeignArea();
        }
        return entity;
    }


    @RequestMapping(value = "list")
    public String list(CmsForeignArea cmsForeignArea, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CmsForeignArea> page = cmsForeignAreaService.findPage(new Page<CmsForeignArea>(request, response), cmsForeignArea);
        model.addAttribute("page", page);
        return "modules/cms/cmsForeignAreaList";
    }

    @RequestMapping(value = "form")
    public String form(CmsForeignArea cmsForeignArea, Model model) {
        model.addAttribute("cmsForeignArea", cmsForeignArea);
        return "modules/cms/cmsForeignAreaForm";
    }


    @RequestMapping(value = "save")
    public String save(CmsForeignArea cmsForeignArea, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, cmsForeignArea)) {
            return form(cmsForeignArea, model);
        }
        cmsForeignAreaService.save(cmsForeignArea);
        addMessage(redirectAttributes, "保存国外区域成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsForeignArea/list";
    }


    @RequestMapping(value = "delete")
    public String delete(CmsForeignArea cmsForeignArea, RedirectAttributes redirectAttributes) {
        cmsForeignAreaService.delete(cmsForeignArea);
        addMessage(redirectAttributes, "删除国外区域成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsForeignArea/list/?repage";
    }


    /**
     * 跳转至添加页面
     */

    @RequestMapping(value = "toSaveFormPage")
    public String toSaveFormPage() {
        return "modules/cms/cmsForeignAreaForm";
    }

}