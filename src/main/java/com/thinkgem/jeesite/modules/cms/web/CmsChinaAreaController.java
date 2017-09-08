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
import com.thinkgem.jeesite.modules.cms.entity.CmsChinaArea;
import com.thinkgem.jeesite.modules.cms.service.CmsChinaAreaService;

/**
 * cms_caController
 *
 * @author duan
 * @version 2016-08-15
 */
@Controller
@RequestMapping(value = "${adminPath}/cmsca/cmsChinaArea")
public class CmsChinaAreaController extends BaseController {

    @Autowired
    private CmsChinaAreaService cmsChinaAreaService;

    @ModelAttribute
    public CmsChinaArea get(@RequestParam(required = false) String id) {
        CmsChinaArea entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = cmsChinaAreaService.get(id);
        }
        if (entity == null) {
            entity = new CmsChinaArea();
        }
        return entity;
    }

    @RequestMapping(value = "list")
    public String list(CmsChinaArea cmsChinaArea, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CmsChinaArea> page = cmsChinaAreaService.findPage(new Page<CmsChinaArea>(request, response), cmsChinaArea);
        model.addAttribute("page", page);
        return "modules/cms/cmsChinaAreaList";
    }

    @RequestMapping(value = "form")
    public String form(CmsChinaArea cmsChinaArea, Model model) {
        CmsChinaArea cmsArea = this.get(cmsChinaArea.getId());
        model.addAttribute("cmsChinaArea", cmsArea);
        return "modules/cms/cmsChinaAreaForm";
    }


    @RequestMapping(value = "save")
    public String save(CmsChinaArea cmsChinaArea, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, cmsChinaArea)) {
            return form(cmsChinaArea, model);
        }
        cmsChinaAreaService.save(cmsChinaArea);
        addMessage(redirectAttributes, "保存国内区域成功");
        return "redirect:" + Global.getAdminPath() + "/cmsca/cmsChinaArea/list?repage";
    }

    @RequestMapping(value = "delete")
    public String delete(CmsChinaArea cmsChinaArea, RedirectAttributes redirectAttributes) {
        cmsChinaAreaService.delete(cmsChinaArea);
        addMessage(redirectAttributes, "删除国内区域成功");
        return "redirect:" + Global.getAdminPath() + "/cmsca/cmsChinaArea/list?repage";
    }

    /**
     * 跳转至添加页面
     */

    @RequestMapping(value = "toSaveForm")
    public String toSaveForm() {
        return "modules/cms/cmsChinaAreaForm";
    }


}