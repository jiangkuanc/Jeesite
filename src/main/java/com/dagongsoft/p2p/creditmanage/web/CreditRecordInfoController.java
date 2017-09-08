package com.dagongsoft.p2p.creditmanage.web;

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

import com.dagongsoft.p2p.creditmanage.entity.CreditRecordInfo;
import com.dagongsoft.p2p.creditmanage.service.CreditRecordInfoService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 信用记录Controller
 *
 * @author Zazh
 * @version 2017-02-20
 */
@Controller
@RequestMapping(value = "${adminPath}/creditmanage/creditRecordInfo")
public class CreditRecordInfoController extends BaseController {

    @Resource
    private CreditRecordInfoService creditRecordInfoService;

    @ModelAttribute
    public CreditRecordInfo get(@RequestParam(required = false) String id) {
        CreditRecordInfo entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = creditRecordInfoService.get(id);
        }
        if (entity == null) {
            entity = new CreditRecordInfo();
        }
        return entity;
    }

    @RequiresPermissions("creditmanage:creditRecordInfo:view")
    @RequestMapping(value = {"list", ""})
    public String list(CreditRecordInfo creditRecordInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<CreditRecordInfo> page = creditRecordInfoService.findPage(new Page<CreditRecordInfo>(request, response), creditRecordInfo);
        model.addAttribute("page", page);
        return "modules/creditmanage/creditRecordInfoList";
    }

    @RequiresPermissions("creditmanage:creditRecordInfo:view")
    @RequestMapping(value = "form")
    public String form(CreditRecordInfo creditRecordInfo, Model model) {
        model.addAttribute("creditRecordInfo", creditRecordInfo);
        return "modules/creditmanage/creditRecordInfoForm";
    }

    @RequiresPermissions("creditmanage:creditRecordInfo:edit")
    @RequestMapping(value = "save")
    public String save(CreditRecordInfo creditRecordInfo, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, creditRecordInfo)) {
            return form(creditRecordInfo, model);
        }
        creditRecordInfoService.save(creditRecordInfo);
        addMessage(redirectAttributes, "保存信用记录维护成功");
        return "redirect:" + Global.getAdminPath() + "/creditmanage/creditRecordInfo/?repage";
    }

    @RequiresPermissions("creditmanage:creditRecordInfo:edit")
    @RequestMapping(value = "delete")
    public String delete(CreditRecordInfo creditRecordInfo, RedirectAttributes redirectAttributes) {
        creditRecordInfoService.delete(creditRecordInfo);
        addMessage(redirectAttributes, "删除信用记录成功");
        return "redirect:" + Global.getAdminPath() + "/creditmanage/creditRecordInfo/?repage";
    }

}