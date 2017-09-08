package com.dagongsoft.p2p.config.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.dagongsoft.p2p.config.service.P2pIndustryclassiService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 行业分类Controller
 *
 * @author Quincy
 * @version 2016-11-23
 */
@Controller
@RequestMapping(value = "${adminPath}/config/p2pIndustryclassi")
public class P2pIndustryclassiController extends BaseController {

    @Resource
    private P2pIndustryclassiService p2pIndustryclassiService;

    @ModelAttribute
    public P2pIndustryclassi get(@RequestParam(required = false) String id) {
        P2pIndustryclassi entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pIndustryclassiService.get(id);
        }
        if (entity == null) {
            entity = new P2pIndustryclassi();
        }
        return entity;
    }

    @RequiresPermissions("config:p2pIndustryclassi:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pIndustryclassi p2pIndustryclassi, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pIndustryclassi> page = p2pIndustryclassiService.findPage(new Page<P2pIndustryclassi>(request, response), p2pIndustryclassi);
        model.addAttribute("page", page);
        return "modules/config/p2pIndustryclassiList";
    }

    @RequiresPermissions("config:p2pIndustryclassi:view")
    @RequestMapping(value = "form")
    public String form(P2pIndustryclassi p2pIndustryclassi, Model model) {
        model.addAttribute("p2pIndustryclassi", p2pIndustryclassi);
        return "modules/config/p2pIndustryclassiForm";
    }

    @RequiresPermissions("config:p2pIndustryclassi:edit")
    @RequestMapping(value = "save")
    public String save(P2pIndustryclassi p2pIndustryclassi, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pIndustryclassi)) {
            return form(p2pIndustryclassi, model);
        }
        p2pIndustryclassiService.save(p2pIndustryclassi);
        addMessage(redirectAttributes, "保存行业分类成功");
        return "redirect:" + Global.getAdminPath() + "/config/p2pIndustryclassi/?repage";
    }

    @RequiresPermissions("config:p2pIndustryclassi:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pIndustryclassi p2pIndustryclassi, RedirectAttributes redirectAttributes) {
        p2pIndustryclassiService.delete(p2pIndustryclassi);
        addMessage(redirectAttributes, "删除行业分类成功");
        return "redirect:" + Global.getAdminPath() + "/config/p2pIndustryclassi/?repage";
    }

}