package com.dagongsoft.p2p.repayment.web;

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

import com.dagongsoft.p2p.repayment.entity.P2pReceiveRecord;
import com.dagongsoft.p2p.repayment.service.P2pReceiveRecordService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 投资人收款记录表Controller
 *
 * @author Zeus
 * @version 2016-11-08
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/repayment/p2pReceiveRecord")
public class P2pReceiveRecordController extends BaseController {

    @Resource
    private P2pReceiveRecordService p2pReceiveRecordService;

    @ModelAttribute
    public P2pReceiveRecord get(@RequestParam(required = false) String id) {
        P2pReceiveRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pReceiveRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pReceiveRecord();
        }
        return entity;
    }

    @RequiresPermissions("p2p:repayment:p2pReceiveRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pReceiveRecord p2pReceiveRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pReceiveRecord> page = p2pReceiveRecordService.findPage(new Page<P2pReceiveRecord>(request, response), p2pReceiveRecord);
        model.addAttribute("page", page);
        return "modules/p2p/repayment/p2pReceiveRecordList";
    }

    @RequiresPermissions("p2p:repayment:p2pReceiveRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pReceiveRecord p2pReceiveRecord, Model model) {
        model.addAttribute("p2pReceiveRecord", p2pReceiveRecord);
        return "modules/p2p/repayment/p2pReceiveRecordForm";
    }

    @RequiresPermissions("p2p:repayment:p2pReceiveRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pReceiveRecord p2pReceiveRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pReceiveRecord)) {
            return form(p2pReceiveRecord, model);
        }
        p2pReceiveRecordService.save(p2pReceiveRecord);
        addMessage(redirectAttributes, "保存投资人收款记录表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/repayment/p2pReceiveRecord/?repage";
    }

    @RequiresPermissions("p2p:repayment:p2pReceiveRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pReceiveRecord p2pReceiveRecord, RedirectAttributes redirectAttributes) {
        p2pReceiveRecordService.delete(p2pReceiveRecord);
        addMessage(redirectAttributes, "删除投资人收款记录表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/repayment/p2pReceiveRecord/?repage";
    }

}