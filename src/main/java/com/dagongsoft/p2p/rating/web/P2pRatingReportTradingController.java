package com.dagongsoft.p2p.rating.web;

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
import com.dagongsoft.p2p.rating.entity.P2pRatingReportTrading;
import com.dagongsoft.p2p.rating.service.P2pRatingReportTradingService;

/**
 * 评级报告交易记录Controller
 *
 * @author Chace
 * @version 2017-03-06
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/rating/p2pRatingReportTrading")
public class P2pRatingReportTradingController extends BaseController {

    @Resource
    private P2pRatingReportTradingService p2pRatingReportTradingService;

    @ModelAttribute
    public P2pRatingReportTrading get(@RequestParam(required = false) String id) {
        P2pRatingReportTrading entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRatingReportTradingService.get(id);
        }
        if (entity == null) {
            entity = new P2pRatingReportTrading();
        }
        return entity;
    }

    @RequiresPermissions("p2p:rating:p2pRatingReportTrading:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRatingReportTrading p2pRatingReportTrading, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRatingReportTrading> page = p2pRatingReportTradingService.findPage(new Page<P2pRatingReportTrading>(request, response), p2pRatingReportTrading);
        model.addAttribute("page", page);
        return "modules/p2p/rating/p2pRatingReportTradingList";
    }

    @RequiresPermissions("p2p:rating:p2pRatingReportTrading:view")
    @RequestMapping(value = "form")
    public String form(P2pRatingReportTrading p2pRatingReportTrading, Model model) {
        model.addAttribute("p2pRatingReportTrading", p2pRatingReportTrading);
        return "modules/p2p/rating/p2pRatingReportTradingForm";
    }

    @RequiresPermissions("p2p:rating:p2pRatingReportTrading:edit")
    @RequestMapping(value = "save")
    public String save(P2pRatingReportTrading p2pRatingReportTrading, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRatingReportTrading)) {
            return form(p2pRatingReportTrading, model);
        }
        p2pRatingReportTradingService.save(p2pRatingReportTrading);
        addMessage(redirectAttributes, "保存评级报告交易记录成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/rating/p2pRatingReportTrading/?repage";
    }

    @RequiresPermissions("p2p:rating:p2pRatingReportTrading:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRatingReportTrading p2pRatingReportTrading, RedirectAttributes redirectAttributes) {
        p2pRatingReportTradingService.delete(p2pRatingReportTrading);
        addMessage(redirectAttributes, "删除评级报告交易记录成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/rating/p2pRatingReportTrading/?repage";
    }

}