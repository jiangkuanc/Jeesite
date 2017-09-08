package com.dagongsoft.p2p.config.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.config.entity.P2pAgreement;
import com.dagongsoft.p2p.config.service.P2pAgreementService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 协议表Controller
 *
 * @author Zeus
 * @version 2016-11-21
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/config/p2pAgreement")
public class P2pAgreementController extends BaseController {

    @Resource
    private P2pAgreementService p2pAgreementService;

    @ModelAttribute
    public P2pAgreement get(@RequestParam(required = false) String id) {
        P2pAgreement entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pAgreementService.get(id);
        }
        if (entity == null) {
            entity = new P2pAgreement();
        }
        return entity;
    }


    @RequestMapping(value = {"list", ""})
    public String list(P2pAgreement p2pAgreement, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pAgreement> page = p2pAgreementService.findPage(new Page<P2pAgreement>(request, response), p2pAgreement);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/config/p2pAgreementList";
    }


    @RequestMapping(value = "form")
    public String form(P2pAgreement p2pAgreement, Model model) {
        //String agreementContent = StringEscapeUtils.unescapeHtml4(p2pAgreement.getAgreementContent());
        //p2pAgreement.setAgreementContent(agreementContent);
        model.addAttribute("p2pAgreement", p2pAgreement);
        return "p2p/back/config/p2pAgreementForm";
    }

    @RequestMapping(value = "save")
    public String save(P2pAgreement p2pAgreement, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pAgreement)) {
            return form(p2pAgreement, model);
        }
        if ("".equals(p2pAgreement.getId())) {
            p2pAgreement.setIsEnable("0");
        }
        p2pAgreementService.save(p2pAgreement);
        addMessage(redirectAttributes, "保存协议表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pAgreement/?repage";
    }


    @RequestMapping(value = "delete")
    public String delete(P2pAgreement p2pAgreement, RedirectAttributes redirectAttributes) {
        p2pAgreementService.delete(p2pAgreement);
        addMessage(redirectAttributes, "删除协议表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pAgreement/?repage";
    }

    /**
     * 验证是否有相同类型协议已经启用
     *
     * @param agreementType
     * @return 1、是   0、否(默认)
     * @author Zeus
     */
    @RequestMapping(value = "validateIsEnable")
    @ResponseBody
    public String validateIsEnable(String agreementType) {
        String data = "0";
        try {

            P2pAgreement p2pAgreement = p2pAgreementService.validateIsEnable(agreementType);
            if (p2pAgreement != null) {
                data = "1";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }

    /**
     * 协议启用
     *
     * @param id
     * @param agreementType
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "qiyong")
    public String qiyong(String id, String agreementType, RedirectAttributes redirectAttributes) {
        p2pAgreementService.qiyong(id, agreementType);
        addMessage(redirectAttributes, "已启用");
        return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pAgreement/?repage";
    }

    /**
     * 协议停用
     *
     * @param id
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "tingyong")
    public String tingyong(String id, RedirectAttributes redirectAttributes) {
        p2pAgreementService.tingyong(id);
        addMessage(redirectAttributes, "已停用");
        return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pAgreement/?repage";
    }

    /**
     * 协议展示
     *
     * @param agreementType
     * @param model
     * @return
     */
    @RequestMapping(value = "agreementShow")
    public String agreementShow(String agreementType, Model model) {
        try {
            P2pAgreement p2pAgreement = p2pAgreementService.getAgreementEnableByType(agreementType);
            //String agreementContent = StringEscapeUtils.unescapeHtml4(p2pAgreement.getAgreementContent());
            //p2pAgreement.setAgreementContent(agreementContent);
            model.addAttribute("p2pAgreement", p2pAgreement);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

        return "p2p/back/config/p2pAgreementShow";
    }
}