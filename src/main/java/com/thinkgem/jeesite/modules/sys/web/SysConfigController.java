package com.thinkgem.jeesite.modules.sys.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.SysConfig;
import com.thinkgem.jeesite.modules.sys.service.SysConfigService;

/**
 * 系统配置信息Controller
 *
 * @author Summer
 * @version 2016-12-05
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sysConfig")
public class SysConfigController extends BaseController {

    @Resource
    private SysConfigService sysConfigService;

    @ModelAttribute
    public SysConfig get(@RequestParam(required = false) String id) {
        SysConfig entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = sysConfigService.get(id);
        }
        if (entity == null) {
            entity = new SysConfig();
        }
        return entity;
    }

    //根据系统编号，查询所有符合条件的配置集合
    @RequestMapping(value = {"list", ""})
    public String list(String sysId, HttpServletRequest request, HttpServletResponse response, Model model) {
        List sysConfigList = sysConfigService.getListBySysId(sysId);
        model.addAttribute("sysConfigList", sysConfigList);
        return "modules/sys/sysConfigList";
    }

    @RequestMapping(value = "form")
    public String form(SysConfig sysConfig, Model model) {
        model.addAttribute("sysConfig", sysConfig);
        return "modules/sys/sysConfigForm";
    }

    @RequestMapping(value = "save")
    public String save(SysConfig sysConfig, HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, sysConfig)) {
            return form(sysConfig, model);
        }
        sysConfigService.save(sysConfig);
        model.addAttribute("sysConfig", sysConfig);
        addMessage(redirectAttributes, "保存系统配置信息成功");
        String sysConfig1 = sysConfig.getSysId();
        return list(sysConfig1, request, response, model);
    }
}