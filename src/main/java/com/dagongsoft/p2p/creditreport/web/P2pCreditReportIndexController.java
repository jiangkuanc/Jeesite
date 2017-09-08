package com.dagongsoft.p2p.creditreport.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.creditreport.entity.P2pCreditReportIndex;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportIndexService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 信用报告指标表Controller
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/creditreport/p2pCreditReportIndex")
public class P2pCreditReportIndexController extends BaseController {

    @Resource
    private P2pCreditReportIndexService p2pCreditReportIndexService;

    @ModelAttribute
    public P2pCreditReportIndex get(@RequestParam(required = false) String id) {
        P2pCreditReportIndex entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pCreditReportIndexService.get(id);
        }
        if (entity == null) {
            entity = new P2pCreditReportIndex();
        }
        return entity;
    }


    @RequestMapping(value = {"list", ""})
    public String list(P2pCreditReportIndex p2pCreditReportIndex, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pCreditReportIndex> page = p2pCreditReportIndexService.findPage(new Page<P2pCreditReportIndex>(request, response), p2pCreditReportIndex);
        model.addAttribute("page", page);
        return "modules/p2p/creditreport/p2pCreditReportIndexList";
    }


    @RequestMapping(value = "form")
    public String form(P2pCreditReportIndex p2pCreditReportIndex, Model model) {
        model.addAttribute("p2pCreditReportIndex", p2pCreditReportIndex);
        return "modules/p2p/creditreport/p2pCreditReportIndexForm";
    }


    @RequestMapping(value = "save")
    public String save(P2pCreditReportIndex p2pCreditReportIndex, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pCreditReportIndex)) {
            return form(p2pCreditReportIndex, model);
        }
        p2pCreditReportIndexService.save(p2pCreditReportIndex);
        addMessage(redirectAttributes, "保存信用报告指标表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/creditreport/p2pCreditReportIndex/?repage";
    }


    @RequestMapping(value = "delete")
    public String delete(P2pCreditReportIndex p2pCreditReportIndex, RedirectAttributes redirectAttributes) {
        p2pCreditReportIndexService.delete(p2pCreditReportIndex);
        addMessage(redirectAttributes, "删除信用报告指标表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/creditreport/p2pCreditReportIndex/?repage";
    }


}