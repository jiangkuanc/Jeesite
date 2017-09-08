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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.risk.entity.P2pRiskAnswer;
import com.dagongsoft.p2p.risk.service.P2pRiskAnswerService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 风险测评答案表Controller
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/risk/p2pRiskAnswer")
public class P2pRiskAnswerController extends BaseController {

    @Resource
    private P2pRiskAnswerService p2pRiskAnswerService;

    @ModelAttribute
    public P2pRiskAnswer get(@RequestParam(required = false) String id) {
        P2pRiskAnswer entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRiskAnswerService.get(id);
        }
        if (entity == null) {
            entity = new P2pRiskAnswer();
        }
        return entity;
    }

    @RequiresPermissions("p2p:risk:p2pRiskAnswer:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRiskAnswer p2pRiskAnswer, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRiskAnswer> page = p2pRiskAnswerService.findPage(new Page<P2pRiskAnswer>(request, response), p2pRiskAnswer);
        model.addAttribute("page", page);
        return "modules/p2p/risk/p2pRiskAnswerList";
    }

    @RequiresPermissions("p2p:risk:p2pRiskAnswer:view")
    @RequestMapping(value = "form")
    public String form(P2pRiskAnswer p2pRiskAnswer, Model model) {
        model.addAttribute("p2pRiskAnswer", p2pRiskAnswer);
        return "modules/p2p/risk/p2pRiskAnswerForm";
    }

    @RequiresPermissions("p2p:risk:p2pRiskAnswer:edit")
    @RequestMapping(value = "save")
    public String save(P2pRiskAnswer p2pRiskAnswer, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRiskAnswer)) {
            return form(p2pRiskAnswer, model);
        }
        p2pRiskAnswerService.save(p2pRiskAnswer);
        addMessage(redirectAttributes, "保存风险测评答案表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pRiskAnswer/?repage";
    }


    @RequestMapping(value = "delete")
    @ResponseBody
    public String delete(P2pRiskAnswer p2pRiskAnswer, RedirectAttributes redirectAttributes) {
        p2pRiskAnswerService.delete(p2pRiskAnswer);
        addMessage(redirectAttributes, "删除风险测评答案表成功");
        return p2pRiskAnswer.getRiskQuestionId();

    }

}