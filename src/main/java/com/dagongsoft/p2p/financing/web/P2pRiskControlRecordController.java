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
import com.dagongsoft.p2p.financing.entity.P2pRiskControlRecord;
import com.dagongsoft.p2p.financing.service.P2pRiskControlRecordService;

/**
 * 募集期风控记录表Controller
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/financing/p2pRiskControlRecord")
public class P2pRiskControlRecordController extends BaseController {

    @Resource
    private P2pRiskControlRecordService p2pRiskControlRecordService;

    @ModelAttribute
    public P2pRiskControlRecord get(@RequestParam(required = false) String id) {
        P2pRiskControlRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRiskControlRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pRiskControlRecord();
        }
        return entity;
    }

    @RequiresPermissions("p2p:financing:p2pRiskControlRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRiskControlRecord p2pRiskControlRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRiskControlRecord> page = p2pRiskControlRecordService.findPage(new Page<P2pRiskControlRecord>(request, response), p2pRiskControlRecord);
        model.addAttribute("page", page);
        return "modules/p2p/financing/p2pRiskControlRecordList";
    }

    @RequiresPermissions("p2p:financing:p2pRiskControlRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pRiskControlRecord p2pRiskControlRecord, Model model) {
        model.addAttribute("p2pRiskControlRecord", p2pRiskControlRecord);
        return "modules/p2p/financing/p2pRiskControlRecordForm";
    }

    @RequiresPermissions("p2p:financing:p2pRiskControlRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pRiskControlRecord p2pRiskControlRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRiskControlRecord)) {
            return form(p2pRiskControlRecord, model);
        }
        p2pRiskControlRecordService.save(p2pRiskControlRecord);
        addMessage(redirectAttributes, "保存募集期风控记录表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/financing/p2pRiskControlRecord/?repage";
    }

    @RequiresPermissions("p2p:financing:p2pRiskControlRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRiskControlRecord p2pRiskControlRecord, RedirectAttributes redirectAttributes) {
        p2pRiskControlRecordService.delete(p2pRiskControlRecord);
        addMessage(redirectAttributes, "删除募集期风控记录表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/financing/p2pRiskControlRecord/?repage";
    }

}