package com.dagongsoft.p2p.financing.web;

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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.dagongsoft.p2p.financing.entity.P2pGuaranteeRecord;
import com.dagongsoft.p2p.financing.service.P2pGuaranteeRecordService;

/**
 * 担保记录表Controller
 *
 * @author Sora
 * @version 2016-11-08
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/p2pGuaranteeRecord")
public class P2pGuaranteeRecordController extends BaseController {

    @Resource
    private P2pGuaranteeRecordService p2pGuaranteeRecordService;

    @ModelAttribute
    public P2pGuaranteeRecord get(@RequestParam(required = false) String id) {
        P2pGuaranteeRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pGuaranteeRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pGuaranteeRecord();
        }
        return entity;
    }

    @RequiresPermissions("financing:p2pGuaranteeRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pGuaranteeRecord p2pGuaranteeRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pGuaranteeRecord> page = p2pGuaranteeRecordService.findPage(new Page<P2pGuaranteeRecord>(request, response), p2pGuaranteeRecord);
        model.addAttribute("page", page);
        return "modules/financing/p2pGuaranteeRecordList";
    }

    @RequiresPermissions("financing:p2pGuaranteeRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pGuaranteeRecord p2pGuaranteeRecord, Model model) {
        model.addAttribute("p2pGuaranteeRecord", p2pGuaranteeRecord);
        return "modules/financing/p2pGuaranteeRecordForm";
    }

    @RequiresPermissions("financing:p2pGuaranteeRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pGuaranteeRecord p2pGuaranteeRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pGuaranteeRecord)) {
            return form(p2pGuaranteeRecord, model);
        }
        p2pGuaranteeRecordService.save(p2pGuaranteeRecord);
        addMessage(redirectAttributes, "保存担保记录表成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pGuaranteeRecord/?repage";
    }

    @RequiresPermissions("financing:p2pGuaranteeRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pGuaranteeRecord p2pGuaranteeRecord, RedirectAttributes redirectAttributes) {
        p2pGuaranteeRecordService.delete(p2pGuaranteeRecord);
        addMessage(redirectAttributes, "删除担保记录表成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pGuaranteeRecord/?repage";
    }

}