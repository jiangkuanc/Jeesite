package com.dagongsoft.p2p.user.web.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.user.service.front.P2pAccountService;
import com.dagongsoft.p2p.user.web.front.consts.ProcesStateConst;
import com.dagongsoft.p2p.user.web.front.consts.RiskEvaludationPageConst;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;


/**
 * 账户表Controller
 *
 * @author Joe
 * @version 2016-11-07
 */
@Controller
@RequestMapping(value = "${adminPath}/user/p2pAccount")
public class P2pAccountController extends BaseController {

    @Autowired
    private P2pAccountService p2pAccountService;

    @Autowired
    protected P2pUserInformationService p2pUserInformationService;


    @ModelAttribute
    public P2pAccount get(@RequestParam(required = false) String id) {
        P2pAccount entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pAccountService.get(id);
        }
        if (entity == null) {
            entity = new P2pAccount();
        }
        return entity;
    }

    /**
     * @param p2pAccount
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequiresPermissions("user:p2pAccount:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pAccount p2pAccount, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pAccount> page = p2pAccountService.findPage(new Page<P2pAccount>(request, response), p2pAccount);
        model.addAttribute("page", page);
        return "modules/user/p2pAccountList";
    }

    /**
     * 进入绑卡填写信息页面
     *
     * @param p2pAccount
     * @param model
     * @return
     * @author Joe
     */
    @RequiresPermissions("user:p2pAccount:view")
    @RequestMapping(value = "form")
    public String form(P2pAccount p2pAccount, Model model) {
        model.addAttribute("p2pAccount", p2pAccount);
        return "modules/user/p2pAccountForm";
    }

    /**
     * 保存绑卡信息
     *
     * @param p2pAccount
     * @param model
     * @param redirectAttributes
     * @param session
     * @return
     */
    @RequiresPermissions("user:p2pAccount:edit")
    @RequestMapping(value = "save")
    public String save(P2pAccount p2pAccount, Model model, RedirectAttributes redirectAttributes, HttpSession session) {
        if (!beanValidator(model, p2pAccount)) {
            return form(p2pAccount, model);
        }
        User user = (User) session.getAttribute("user");
        if (user == null && p2pUserInformationService == null) {                    //若user或者服务类为空,跳转到错误页面
            return ProcesStateConst.exceptionUrl;
        }
        //修改投资前准备过程中的状态值
        P2pUserInformation p2pUserInformation = user.getP2pUserInformation();
        p2pUserInformation.setCertificateState(ProcesStateConst.regiesterUnRiskEvaluate);
        p2pAccountService.save(p2pAccount);
        try {
            p2pUserInformationService.save(p2pUserInformation);
            addMessage(redirectAttributes, "保存账户表成功");
            return RiskEvaludationPageConst.riskControllerUrl;                    //进入风险测评阶段
        } catch (Exception e) {
            return ProcesStateConst.exceptionUrl;                                //测评过程中出现异常,则跳转至首页
        }
    }

    /**
     * @param p2pAccount
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("user:p2pAccount:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pAccount p2pAccount, RedirectAttributes redirectAttributes) {
        p2pAccountService.delete(p2pAccount);
        addMessage(redirectAttributes, "删除账户表成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pAccount/?repage";
    }

}