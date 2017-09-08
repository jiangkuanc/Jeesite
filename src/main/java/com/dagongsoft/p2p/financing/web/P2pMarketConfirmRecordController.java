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
import com.dagongsoft.p2p.financing.entity.P2pMarketConfirmRecord;
import com.dagongsoft.p2p.financing.service.P2pMarketConfirmRecordService;

/**
 * 市场人员审核记录Controller
 *
 * @author Sora
 * @version 2016-11-07
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/financing/p2pMarketConfirmRecord")
public class P2pMarketConfirmRecordController extends BaseController {

    @Resource
    private P2pMarketConfirmRecordService p2pMarketConfirmRecordService;

    @ModelAttribute
    public P2pMarketConfirmRecord get(@RequestParam(required = false) String id) {
        P2pMarketConfirmRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pMarketConfirmRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pMarketConfirmRecord();
        }
        return entity;
    }

    @RequiresPermissions("p2p:financing:p2pMarketConfirmRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pMarketConfirmRecord p2pMarketConfirmRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pMarketConfirmRecord> page = p2pMarketConfirmRecordService.findPage(new Page<P2pMarketConfirmRecord>(request, response), p2pMarketConfirmRecord);
        model.addAttribute("page", page);
        return "modules/p2p/financing/p2pMarketConfirmRecordList";
    }

    @RequiresPermissions("p2p:financing:p2pMarketConfirmRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pMarketConfirmRecord p2pMarketConfirmRecord, Model model) {
        model.addAttribute("p2pMarketConfirmRecord", p2pMarketConfirmRecord);
        return "modules/p2p/financing/p2pMarketConfirmRecordForm";
    }

    @RequiresPermissions("p2p:financing:p2pMarketConfirmRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pMarketConfirmRecord p2pMarketConfirmRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pMarketConfirmRecord)) {
            return form(p2pMarketConfirmRecord, model);
        }
        p2pMarketConfirmRecordService.save(p2pMarketConfirmRecord);
        addMessage(redirectAttributes, "保存市场人员审核记录成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/financing/p2pMarketConfirmRecord/?repage";
    }

    @RequiresPermissions("p2p:financing:p2pMarketConfirmRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pMarketConfirmRecord p2pMarketConfirmRecord, RedirectAttributes redirectAttributes) {
        p2pMarketConfirmRecordService.delete(p2pMarketConfirmRecord);
        addMessage(redirectAttributes, "删除市场人员审核记录成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/financing/p2pMarketConfirmRecord/?repage";
    }

}