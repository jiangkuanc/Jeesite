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

import com.dagongsoft.p2p.risk.entity.P2pRiskQuestion;
import com.dagongsoft.p2p.risk.service.P2pRiskQuestionService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 风险测评问题表Controller
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/risk/p2pRiskQuestion")
public class P2pRiskQuestionController extends BaseController {

    @Resource
    private P2pRiskQuestionService p2pRiskQuestionService;

    @ModelAttribute
    public P2pRiskQuestion get(@RequestParam(required = false) String id) {
        P2pRiskQuestion entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRiskQuestionService.get(id);
        }
        if (entity == null) {
            entity = new P2pRiskQuestion();
        }
        return entity;
    }

    @RequiresPermissions("p2p:risk:p2pRiskQuestion:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRiskQuestion p2pRiskQuestion, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRiskQuestion> page = p2pRiskQuestionService.findPage(new Page<P2pRiskQuestion>(request, response), p2pRiskQuestion);
        model.addAttribute("page", page);
        return "modules/p2p/risk/p2pRiskQuestionList";
    }

    @RequiresPermissions("p2p:risk:p2pRiskQuestion:view")
    @RequestMapping(value = "form")
    public String form(P2pRiskQuestion p2pRiskQuestion, Model model) {
        model.addAttribute("p2pRiskQuestion", p2pRiskQuestion);
        return "modules/p2p/risk/p2pRiskQuestionForm";
    }

    @RequiresPermissions("p2p:risk:p2pRiskQuestion:edit")
    @RequestMapping(value = "save")
    public String save(P2pRiskQuestion p2pRiskQuestion, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRiskQuestion)) {
            return form(p2pRiskQuestion, model);
        }
        p2pRiskQuestionService.save(p2pRiskQuestion);
        addMessage(redirectAttributes, "保存风险测评问题表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pRiskQuestion/?repage";
    }


    @RequestMapping(value = "delete")
    public String delete(P2pRiskQuestion p2pRiskQuestion, RedirectAttributes redirectAttributes) {
        p2pRiskQuestionService.delete(p2pRiskQuestion);
        addMessage(redirectAttributes, "删除风险测评问题表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pRiskPaper/form?id=" + p2pRiskQuestion.getPaperId() + "&paperId=" + p2pRiskQuestion.getPaperId();
    }

}