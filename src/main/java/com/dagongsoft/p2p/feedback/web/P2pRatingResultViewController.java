package com.dagongsoft.p2p.feedback.web;

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

import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.feedback.service.P2pRatingResultViewService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 评级结果意见表Controller
 *
 * @author Quincy
 * @version 2016-11-10
 */
@Controller
@RequestMapping(value = "${adminPath}/feedback/p2pRatingResultView")
public class P2pRatingResultViewController extends BaseController {

    @Resource
    private P2pRatingResultViewService p2pRatingResultViewService;

    @ModelAttribute
    public P2pRatingResultView get(@RequestParam(required = false) String id) {
        P2pRatingResultView entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRatingResultViewService.get(id);
        }
        if (entity == null) {
            entity = new P2pRatingResultView();
        }
        return entity;
    }

    @RequiresPermissions("feedback:p2pRatingResultView:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRatingResultView p2pRatingResultView, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRatingResultView> page = p2pRatingResultViewService.findPage(new Page<P2pRatingResultView>(request, response), p2pRatingResultView);
        model.addAttribute("page", page);
        return "modules/feedback/p2pRatingResultViewList";
    }

    @RequiresPermissions("feedback:p2pRatingResultView:view")
    @RequestMapping(value = "form")
    public String form(P2pRatingResultView p2pRatingResultView, Model model) {
        model.addAttribute("p2pRatingResultView", p2pRatingResultView);
        return "modules/feedback/p2pRatingResultViewForm";
    }

    @RequiresPermissions("feedback:p2pRatingResultView:edit")
    @RequestMapping(value = "save")
    public String save(P2pRatingResultView p2pRatingResultView, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRatingResultView)) {
            return form(p2pRatingResultView, model);
        }
        p2pRatingResultViewService.save(p2pRatingResultView);
        addMessage(redirectAttributes, "保存评级结果意见成功");
        return "redirect:" + Global.getAdminPath() + "/feedback/p2pRatingResultView/?repage";
    }

    @RequiresPermissions("feedback:p2pRatingResultView:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRatingResultView p2pRatingResultView, RedirectAttributes redirectAttributes) {
        p2pRatingResultViewService.delete(p2pRatingResultView);
        addMessage(redirectAttributes, "删除评级结果意见成功");
        return "redirect:" + Global.getAdminPath() + "/feedback/p2pRatingResultView/?repage";
    }
}