package com.thinkgem.jeesite.modules.cms.web;

import java.io.IOException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSONObject;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.CmsCreditactivity;
import com.thinkgem.jeesite.modules.cms.service.CmsCreditactivityService;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 生成用户报名信息Controller
 *
 * @author summer
 * @version 2016-11-15
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/cmsCreditactivity")
public class CmsCreditactivityController extends BaseController {

    @Resource
    private CmsCreditactivityService cmsCreditactivityService;

    @ModelAttribute
    public CmsCreditactivity get(@RequestParam(required = false) String id) {
        CmsCreditactivity entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = cmsCreditactivityService.get(id);
        }
        if (entity == null) {
            entity = new CmsCreditactivity();
        }
        return entity;
    }

    @RequestMapping(value = {"list", ""})
    public String list(CmsCreditactivity cmsCreditactivity, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<CmsCreditactivity> page = cmsCreditactivityService.findPage(new Page<CmsCreditactivity>(request, response), cmsCreditactivity);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "modules/cms/cmsCreditactivityList";
    }

    @RequestMapping(value = "form")
    public String form(CmsCreditactivity cmsCreditactivity, Model model) {
        model.addAttribute("cmsCreditactivity", cmsCreditactivity);
        return "modules/cms/cmsCreditactivityForm";
    }

    @RequestMapping(value = "save")
    public String save(CmsCreditactivity cmsCreditactivity, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, cmsCreditactivity)) {
            return form(cmsCreditactivity, model);
        }
        cmsCreditactivityService.save(cmsCreditactivity);
        addMessage(redirectAttributes, "保存用户报名信息成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsCreditactivity/?repage";
    }

    @RequestMapping(value = "delete")
    public String delete(CmsCreditactivity cmsCreditactivity, RedirectAttributes redirectAttributes) {
        cmsCreditactivityService.delete(cmsCreditactivity);
        addMessage(redirectAttributes, "删除用户报名信息成功");
        return "redirect:" + Global.getAdminPath() + "/cms/cmsCreditactivity/?repage";
    }

    //保存用户的报名信息
    @RequestMapping(value = "commite")
    public void commite(HttpServletRequest request, HttpSession session, CmsCreditactivity cmsCreditactivity, Model model, HttpServletResponse response) {
        User user = (User) session.getAttribute("user");
        cmsCreditactivity.setArticleId(request.getParameter("id"));
        cmsCreditactivity.setId(IdGen.uuid());
        cmsCreditactivity.setUserId(user.getId()); //设置
        cmsCreditactivity.setRegistrationTime(new Date()); //设置报名时间
        cmsCreditactivityService.commite(cmsCreditactivity);
//		addMessage(redirectAttributes, "保存用户报名信息成功");
        JSONObject jsonObject = new JSONObject();
        try {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(jsonObject.toJSONString("保存成功"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}