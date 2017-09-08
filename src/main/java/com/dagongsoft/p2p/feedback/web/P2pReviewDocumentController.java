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

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.dagongsoft.p2p.feedback.entity.P2pReviewDocument;
import com.dagongsoft.p2p.feedback.service.P2pReviewDocumentService;

/**
 * 复评材料表Controller
 *
 * @author Quincy
 * @version 2016-11-10
 */
@Controller
@RequestMapping(value = "${adminPath}/feedback/p2pReviewDocument")
public class P2pReviewDocumentController extends BaseController {

    @Resource
    private P2pReviewDocumentService p2pReviewDocumentService;

    @ModelAttribute
    public P2pReviewDocument get(@RequestParam(required = false) String id) {
        P2pReviewDocument entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pReviewDocumentService.get(id);
        }
        if (entity == null) {
            entity = new P2pReviewDocument();
        }
        return entity;
    }

    @RequiresPermissions("feedback:p2pReviewDocument:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pReviewDocument p2pReviewDocument, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pReviewDocument> page = p2pReviewDocumentService.findPage(new Page<P2pReviewDocument>(request, response), p2pReviewDocument);
        model.addAttribute("page", page);
        return "modules/feedback/p2pReviewDocumentList";
    }

    @RequiresPermissions("feedback:p2pReviewDocument:view")
    @RequestMapping(value = "form")
    public String form(P2pReviewDocument p2pReviewDocument, Model model) {
        model.addAttribute("p2pReviewDocument", p2pReviewDocument);
        return "modules/feedback/p2pReviewDocumentForm";
    }

    @RequiresPermissions("feedback:p2pReviewDocument:edit")
    @RequestMapping(value = "save")
    public String save(P2pReviewDocument p2pReviewDocument, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pReviewDocument)) {
            return form(p2pReviewDocument, model);
        }
        p2pReviewDocumentService.save(p2pReviewDocument);
        addMessage(redirectAttributes, "保存复评材料成功");
        return "redirect:" + Global.getAdminPath() + "/feedback/p2pReviewDocument/?repage";
    }

    @RequiresPermissions("feedback:p2pReviewDocument:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pReviewDocument p2pReviewDocument, RedirectAttributes redirectAttributes) {
        p2pReviewDocumentService.delete(p2pReviewDocument);
        addMessage(redirectAttributes, "删除复评材料成功");
        return "redirect:" + Global.getAdminPath() + "/feedback/p2pReviewDocument/?repage";
    }

}