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
import com.dagongsoft.p2p.financing.entity.P2pDebtOverdueRecord;
import com.dagongsoft.p2p.financing.service.P2pDebtOverdueRecordService;

/**
 * 债项逾期记录表Controller
 *
 * @author Zeus
 * @version 2016-11-11
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/financing/p2pDebtOverdueRecord")
public class P2pDebtOverdueRecordController extends BaseController {

    @Resource
    private P2pDebtOverdueRecordService p2pDebtOverdueRecordService;

    @ModelAttribute
    public P2pDebtOverdueRecord get(@RequestParam(required = false) String id) {
        P2pDebtOverdueRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pDebtOverdueRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pDebtOverdueRecord();
        }
        return entity;
    }

    @RequiresPermissions("p2p:financing:p2pDebtOverdueRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pDebtOverdueRecord p2pDebtOverdueRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pDebtOverdueRecord> page = p2pDebtOverdueRecordService.findPage(new Page<P2pDebtOverdueRecord>(request, response), p2pDebtOverdueRecord);
        model.addAttribute("page", page);
        return "modules/p2p/financing/p2pDebtOverdueRecordList";
    }

    @RequiresPermissions("p2p:financing:p2pDebtOverdueRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pDebtOverdueRecord p2pDebtOverdueRecord, Model model) {
        model.addAttribute("p2pDebtOverdueRecord", p2pDebtOverdueRecord);
        return "modules/p2p/financing/p2pDebtOverdueRecordForm";
    }

    @RequiresPermissions("p2p:financing:p2pDebtOverdueRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pDebtOverdueRecord p2pDebtOverdueRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pDebtOverdueRecord)) {
            return form(p2pDebtOverdueRecord, model);
        }
        p2pDebtOverdueRecordService.save(p2pDebtOverdueRecord);
        addMessage(redirectAttributes, "保存债项逾期记录表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/financing/p2pDebtOverdueRecord/?repage";
    }

    @RequiresPermissions("p2p:financing:p2pDebtOverdueRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pDebtOverdueRecord p2pDebtOverdueRecord, RedirectAttributes redirectAttributes) {
        p2pDebtOverdueRecordService.delete(p2pDebtOverdueRecord);
        addMessage(redirectAttributes, "删除债项逾期记录表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/financing/p2pDebtOverdueRecord/?repage";
    }

}