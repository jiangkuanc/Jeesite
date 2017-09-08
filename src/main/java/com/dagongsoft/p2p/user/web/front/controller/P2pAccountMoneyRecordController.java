package com.dagongsoft.p2p.user.web.front.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.user.entity.P2pAccountMoneyRecord;
import com.dagongsoft.p2p.user.service.front.P2pAccountMoneyRecordService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;


/**
 * 账户金额记录表Controller
 *
 * @author Joe
 * @version 2016-11-04
 */
@Controller
@RequestMapping(value = "${adminPath}/user/p2pAccountMoneyRecord")
public class P2pAccountMoneyRecordController extends BaseController {

    @Autowired
    private P2pAccountMoneyRecordService p2pAccountMoneyRecordService;

    @ModelAttribute
    public P2pAccountMoneyRecord get(@RequestParam(required = false) String id) {
        P2pAccountMoneyRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pAccountMoneyRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pAccountMoneyRecord();
        }
        return entity;
    }

    @RequiresPermissions("user:p2pAccountMoneyRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pAccountMoneyRecord p2pAccountMoneyRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pAccountMoneyRecord> page = p2pAccountMoneyRecordService.findPage(new Page<P2pAccountMoneyRecord>(request, response), p2pAccountMoneyRecord);
        model.addAttribute("page", page);
        return "modules/user/p2pAccountMoneyRecordList";
    }

    @RequiresPermissions("user:p2pAccountMoneyRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pAccountMoneyRecord p2pAccountMoneyRecord, Model model) {
        model.addAttribute("p2pAccountMoneyRecord", p2pAccountMoneyRecord);
        return "modules/user/p2pAccountMoneyRecordForm";
    }

    @RequiresPermissions("user:p2pAccountMoneyRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pAccountMoneyRecord p2pAccountMoneyRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pAccountMoneyRecord)) {
            return form(p2pAccountMoneyRecord, model);
        }
        p2pAccountMoneyRecordService.save(p2pAccountMoneyRecord);
        addMessage(redirectAttributes, "保存费用记录成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pAccountMoneyRecord/?repage";
    }

    @RequiresPermissions("user:p2pAccountMoneyRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pAccountMoneyRecord p2pAccountMoneyRecord, RedirectAttributes redirectAttributes) {
        p2pAccountMoneyRecordService.delete(p2pAccountMoneyRecord);
        addMessage(redirectAttributes, "删除费用记录成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pAccountMoneyRecord/?repage";
    }

}