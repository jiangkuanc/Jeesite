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

import com.dagongsoft.p2p.financing.entity.P2pDebtorOverdueRecord;
import com.dagongsoft.p2p.financing.service.P2pDebtorOverdueRecordService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 债务人逾期记录表Controller
 *
 * @author Zeus
 * @version 2016-11-11
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/financing/p2pDebtorOverdueRecord")
public class P2pDebtorOverdueRecordController extends BaseController {


    @Resource
    private P2pDebtorOverdueRecordService p2pDebtorOverdueRecordService;

    @ModelAttribute
    public P2pDebtorOverdueRecord get(@RequestParam(required = false) String id) {
        P2pDebtorOverdueRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pDebtorOverdueRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pDebtorOverdueRecord();
        }
        return entity;
    }

    @RequiresPermissions("p2p:financing:p2pDebtorOverdueRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pDebtorOverdueRecord p2pDebtorOverdueRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pDebtorOverdueRecord> page = p2pDebtorOverdueRecordService.findPage(new Page<P2pDebtorOverdueRecord>(request, response), p2pDebtorOverdueRecord);
        model.addAttribute("page", page);
        return "modules/p2p/financing/p2pDebtorOverdueRecordList";
    }

    @RequiresPermissions("p2p:financing:p2pDebtorOverdueRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pDebtorOverdueRecord p2pDebtorOverdueRecord, Model model) {
        model.addAttribute("p2pDebtorOverdueRecord", p2pDebtorOverdueRecord);
        return "modules/p2p/financing/p2pDebtorOverdueRecordForm";
    }

    @RequiresPermissions("p2p:financing:p2pDebtorOverdueRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pDebtorOverdueRecord p2pDebtorOverdueRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pDebtorOverdueRecord)) {
            return form(p2pDebtorOverdueRecord, model);
        }
        p2pDebtorOverdueRecordService.save(p2pDebtorOverdueRecord);
        addMessage(redirectAttributes, "保存债务人逾期记录表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/financing/p2pDebtorOverdueRecord/?repage";
    }

    @RequiresPermissions("p2p:financing:p2pDebtorOverdueRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pDebtorOverdueRecord p2pDebtorOverdueRecord, RedirectAttributes redirectAttributes) {
        p2pDebtorOverdueRecordService.delete(p2pDebtorOverdueRecord);
        addMessage(redirectAttributes, "删除债务人逾期记录表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/financing/p2pDebtorOverdueRecord/?repage";
    }

}