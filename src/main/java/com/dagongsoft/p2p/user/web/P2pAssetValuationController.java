package com.dagongsoft.p2p.user.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.user.entity.P2pAssetValuation;
import com.dagongsoft.p2p.user.service.P2pAssetValuationService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 资产评估表Controller
 *
 * @author Sora
 * @version 2016-11-15
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/p2pAssetValuation")
public class P2pAssetValuationController extends BaseController {

    @Resource
    private P2pAssetValuationService p2pAssetValuationService;

    @ResponseBody
    @RequestMapping(value = "get")
    public P2pAssetValuation get(@RequestParam(required = false) String id) {
        P2pAssetValuation entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pAssetValuationService.get(id);
        }
        if (entity == null) {
            entity = new P2pAssetValuation();
        }
        return entity;
    }

    @RequiresPermissions("financing:p2pAssetValuation:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pAssetValuation p2pAssetValuation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pAssetValuation> page = p2pAssetValuationService.findPage(new Page<P2pAssetValuation>(request, response), p2pAssetValuation);
        model.addAttribute("page", page);
        return "modules/financing/p2pAssetValuationList";
    }

    @RequiresPermissions("financing:p2pAssetValuation:view")
    @RequestMapping(value = "form")
    public String form(P2pAssetValuation p2pAssetValuation, Model model) {
        model.addAttribute("p2pAssetValuation", p2pAssetValuation);
        return "modules/financing/p2pAssetValuationForm";
    }

    @RequiresPermissions("financing:p2pAssetValuation:edit")
    @RequestMapping(value = "save")
    public String save(P2pAssetValuation p2pAssetValuation, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pAssetValuation)) {
            return form(p2pAssetValuation, model);
        }
        p2pAssetValuationService.save(p2pAssetValuation);
        addMessage(redirectAttributes, "保存资产评估表成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pAssetValuation/?repage";
    }

    @RequiresPermissions("financing:p2pAssetValuation:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pAssetValuation p2pAssetValuation, RedirectAttributes redirectAttributes) {
        p2pAssetValuationService.delete(p2pAssetValuation);
        addMessage(redirectAttributes, "删除资产评估表成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pAssetValuation/?repage";
    }

}