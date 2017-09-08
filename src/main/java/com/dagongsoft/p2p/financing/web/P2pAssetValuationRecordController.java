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
import com.dagongsoft.p2p.financing.entity.P2pAssetValuationRecord;
import com.dagongsoft.p2p.financing.service.P2pAssetValuationRecordService;

/**
 * 资产评估记录Controller
 *
 * @author Sora
 * @version 2016-11-08
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/p2pAssetValuationRecord")
public class P2pAssetValuationRecordController extends BaseController {

    @Resource
    private P2pAssetValuationRecordService p2pAssetValuationRecordService;

    @ModelAttribute
    public P2pAssetValuationRecord get(@RequestParam(required = false) String id) {
        P2pAssetValuationRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pAssetValuationRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pAssetValuationRecord();
        }
        return entity;
    }

    @RequiresPermissions("financing:p2pAssetValuationRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pAssetValuationRecord p2pAssetValuationRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pAssetValuationRecord> page = p2pAssetValuationRecordService.findPage(new Page<P2pAssetValuationRecord>(request, response), p2pAssetValuationRecord);
        model.addAttribute("page", page);
        return "modules/financing/p2pAssetValuationRecordList";
    }

    @RequiresPermissions("financing:p2pAssetValuationRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pAssetValuationRecord p2pAssetValuationRecord, Model model) {
        model.addAttribute("p2pAssetValuationRecord", p2pAssetValuationRecord);
        return "modules/financing/p2pAssetValuationRecordForm";
    }

    @RequiresPermissions("financing:p2pAssetValuationRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pAssetValuationRecord p2pAssetValuationRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pAssetValuationRecord)) {
            return form(p2pAssetValuationRecord, model);
        }
        p2pAssetValuationRecordService.save(p2pAssetValuationRecord);
        addMessage(redirectAttributes, "保存资产评估记录成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pAssetValuationRecord/?repage";
    }

    @RequiresPermissions("financing:p2pAssetValuationRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pAssetValuationRecord p2pAssetValuationRecord, RedirectAttributes redirectAttributes) {
        p2pAssetValuationRecordService.delete(p2pAssetValuationRecord);
        addMessage(redirectAttributes, "删除资产评估记录成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pAssetValuationRecord/?repage";
    }

}