package com.dagongsoft.p2p.risk.web;

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

import com.dagongsoft.p2p.risk.entity.P2pRiskScore;
import com.dagongsoft.p2p.risk.service.P2pRiskScoreService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 测评分数表Controller
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/risk/p2pRiskScore")
public class P2pRiskScoreController extends BaseController {

    @Resource
    private P2pRiskScoreService p2pRiskScoreService;

    @ModelAttribute
    public P2pRiskScore get(@RequestParam(required = false) String id) {
        P2pRiskScore entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRiskScoreService.get(id);
        }
        if (entity == null) {
            entity = new P2pRiskScore();
        }
        return entity;
    }

    @RequiresPermissions("p2p:risk:p2pRiskScore:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRiskScore p2pRiskScore, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRiskScore> page = p2pRiskScoreService.findPage(new Page<P2pRiskScore>(request, response), p2pRiskScore);
        model.addAttribute("page", page);
        return "modules/p2p/risk/p2pRiskScoreList";
    }

    @RequiresPermissions("p2p:risk:p2pRiskScore:view")
    @RequestMapping(value = "form")
    public String form(P2pRiskScore p2pRiskScore, Model model) {
        model.addAttribute("p2pRiskScore", p2pRiskScore);
        return "modules/p2p/risk/p2pRiskScoreForm";
    }

    @RequiresPermissions("p2p:risk:p2pRiskScore:edit")
    @RequestMapping(value = "save")
    public String save(P2pRiskScore p2pRiskScore, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRiskScore)) {
            return form(p2pRiskScore, model);
        }
        p2pRiskScoreService.save(p2pRiskScore);
        addMessage(redirectAttributes, "保存测评分数表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pRiskScore/?repage";
    }

    @RequiresPermissions("p2p:risk:p2pRiskScore:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRiskScore p2pRiskScore, RedirectAttributes redirectAttributes) {
        p2pRiskScoreService.delete(p2pRiskScore);
        addMessage(redirectAttributes, "删除测评分数表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pRiskScore/?repage";
    }

}