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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentVoucherAudit;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentVoucherAuditService;

/**
 * 还款凭证审核记录Controller
 *
 * @author zeus
 * @version 2017-02-16
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/repayment/p2pRepaymentVoucherAudit")
public class P2pRepaymentVoucherAuditController extends BaseController {

    @Resource
    private P2pRepaymentVoucherAuditService p2pRepaymentVoucherAuditService;

    @ModelAttribute
    public P2pRepaymentVoucherAudit get(@RequestParam(required = false) String id) {
        P2pRepaymentVoucherAudit entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRepaymentVoucherAuditService.get(id);
        }
        if (entity == null) {
            entity = new P2pRepaymentVoucherAudit();
        }
        return entity;
    }

    @RequiresPermissions("p2p:repayment:p2pRepaymentVoucherAudit:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRepaymentVoucherAudit> page = p2pRepaymentVoucherAuditService.findPage(new Page<P2pRepaymentVoucherAudit>(request, response), p2pRepaymentVoucherAudit);
        model.addAttribute("page", page);
        return "modules/p2p/repayment/p2pRepaymentVoucherAuditList";
    }

    @RequiresPermissions("p2p:repayment:p2pRepaymentVoucherAudit:view")
    @RequestMapping(value = "form")
    public String form(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit, Model model) {
        model.addAttribute("p2pRepaymentVoucherAudit", p2pRepaymentVoucherAudit);
        return "modules/p2p/repayment/p2pRepaymentVoucherAuditForm";
    }

    @RequiresPermissions("p2p:repayment:p2pRepaymentVoucherAudit:edit")
    @RequestMapping(value = "save")
    public String save(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRepaymentVoucherAudit)) {
            return form(p2pRepaymentVoucherAudit, model);
        }
        p2pRepaymentVoucherAuditService.save(p2pRepaymentVoucherAudit);
        addMessage(redirectAttributes, "保存还款凭证审核记录成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/repayment/p2pRepaymentVoucherAudit/?repage";
    }

    @RequiresPermissions("p2p:repayment:p2pRepaymentVoucherAudit:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit, RedirectAttributes redirectAttributes) {
        p2pRepaymentVoucherAuditService.delete(p2pRepaymentVoucherAudit);
        addMessage(redirectAttributes, "删除还款凭证审核记录成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/repayment/p2pRepaymentVoucherAudit/?repage";
    }

}