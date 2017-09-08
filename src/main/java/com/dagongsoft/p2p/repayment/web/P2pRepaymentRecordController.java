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

import com.dagongsoft.p2p.repayment.entity.P2pRepaymentRecord;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentRecordService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 还款记录表Controller
 *
 * @author Quincy
 * @version 2016-11-03
 */
@Controller
@RequestMapping(value = "${adminPath}/repayment/p2pRepaymentRecord")
public class P2pRepaymentRecordController extends BaseController {

    @Resource
    private P2pRepaymentRecordService p2pRepaymentRecordService;

    @ModelAttribute
    public P2pRepaymentRecord get(@RequestParam(required = false) String id) {
        P2pRepaymentRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRepaymentRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pRepaymentRecord();
        }
        return entity;
    }

    @RequiresPermissions("repayment:p2pRepaymentRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRepaymentRecord p2pRepaymentRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRepaymentRecord> page = p2pRepaymentRecordService.findPage(new Page<P2pRepaymentRecord>(request, response), p2pRepaymentRecord);
        model.addAttribute("page", page);
        return "modules/repayment/p2pRepaymentRecordList";
    }

    @RequiresPermissions("repayment:p2pRepaymentRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pRepaymentRecord p2pRepaymentRecord, Model model) {
        model.addAttribute("p2pRepaymentRecord", p2pRepaymentRecord);
        return "modules/repayment/p2pRepaymentRecordForm";
    }

    @RequiresPermissions("repayment:p2pRepaymentRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pRepaymentRecord p2pRepaymentRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRepaymentRecord)) {
            return form(p2pRepaymentRecord, model);
        }
        p2pRepaymentRecordService.save(p2pRepaymentRecord);
        addMessage(redirectAttributes, "保存还款记录成功");
        return "redirect:" + Global.getAdminPath() + "/repayment/p2pRepaymentRecord/?repage";
    }

    @RequiresPermissions("repayment:p2pRepaymentRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRepaymentRecord p2pRepaymentRecord, RedirectAttributes redirectAttributes) {
        p2pRepaymentRecordService.delete(p2pRepaymentRecord);
        addMessage(redirectAttributes, "删除还款记录成功");
        return "redirect:" + Global.getAdminPath() + "/repayment/p2pRepaymentRecord/?repage";
    }

}