/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.info.web;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.info.entity.InfTender;
import com.dagongsoft.p2p.info.service.InfTenderService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户招商Controller
 *
 * @author dagong
 * @version 2016-09-23
 */
@Controller
@RequestMapping(value = "${adminPath}/info/infTender")
public class InfTenderController extends BaseController {

    @Autowired
    private InfTenderService infTenderService;

    @ModelAttribute
    public InfTender get(@RequestParam(required = false) String id) {
        InfTender entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = infTenderService.get(id);
        }
        if (entity == null) {
            entity = new InfTender();
        }
        return entity;
    }

    @RequestMapping(value = {"list", ""})
    public String list(HttpSession session, InfTender infTender, HttpServletRequest request, HttpServletResponse response, Model model) {
        if (infTender.getInfoStage() != null) {
            infTenderService.updateInfoStage(infTender);
        }
        User user = (User) session.getAttribute("user");
        if (user != null) {
            infTender.setUserId(user.getId());
        }
        infTender.setId("");
        infTender.setInfoStage("");
        infTender.setProjectName("");
        Page<InfTender> page = infTenderService.findPage(new Page<InfTender>(request, response), infTender);
        model.addAttribute("page", page);
        return "modules/info/infTenderList";
    }

    @RequestMapping(value = "form")
    public String form(InfTender infTender, Model model) {
        model.addAttribute("infTender", infTender);
        return "modules/info/infTenderForm";
    }

    @RequestMapping(value = "save")
    public String save(HttpSession session, InfTender infTender, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        if (!beanValidator(model, infTender)) {
            return toTenderinfoPage(infTender, model);
        }
        User user = (User) session.getAttribute("user");
        if (user != null) {
            infTender.setUserId(user.getId());
        }
        if (!beanValidator(model, infTender)) {
            return form(infTender, model);
        }
        String pan = request.getParameter("pan");
        if ("发布".equals(pan)) {
            infTender.setInfoStage("2");
        }
        if ("待提交".equals(pan)) {
            infTender.setInfoStage("1");
        }
        infTender.setPublishTime(new Date());
        infTenderService.save(infTender);
        addMessage(redirectAttributes, "保存用户招商成功");
        return "redirect:" + Global.getAdminPath() + "/info/infTender/list/?repage";
    }


    @RequestMapping(value = "delete")
    public String delete(InfTender infTender, RedirectAttributes redirectAttributes) {
        infTenderService.delete(infTender);
        addMessage(redirectAttributes, "删除用户招商成功");
        return "redirect:" + Global.getAdminPath() + "/info/infTender/?repage";
    }


    /**
     * 跳转到我要招商页面
     */
    @RequestMapping(value = "toTenderinfoPage")
    public String toTenderinfoPage(InfTender infTender, Model model) {
        model.addAttribute("infTender", infTender);
        return "modules/info/tenderinfoPage";
    }

    /**
     * 跳转到显示招商信息列表页面（后台审核招商信息）
     *
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    @RequestMapping(value = "findTenderinfoList")
    public String findTenderinfoList(HttpSession httpsession, InfTender infTender, HttpServletRequest request, HttpServletResponse response, Model model) throws IllegalAccessException, InvocationTargetException {
        //查询所有状态的招标信息，设置infoStage为空
        if (infTender.getInfoStage() != null && infTender.getInfoStage() != "") {
            if ((infTender.getInfoStage()).equals("0")) {
                infTender.setInfoStage(null);
            }
        }
        //审核完毕走待审核列表项，将传递的对象属性赋值给当前对象infTender
        InfTender infTender1 = (InfTender) httpsession.getAttribute("info1");
        if (infTender1 != null) {
            BeanUtils.copyProperties(infTender, infTender1);
            httpsession.removeAttribute("info1");//移除重定向传递对象
        }
        Page<InfTender> page = infTenderService.findTenderinfoList(new Page<InfTender>(request, response), infTender);
        model.addAttribute("page", page);
        return "modules/info/tenderinfoList";
    }


    /**
     * 审核一条招商信息，先查询信息
     */
    @RequestMapping(value = "toOneTenderinfoPage")
    public String toOneTenderinfoPage(InfTender infTender, HttpServletRequest request, HttpServletResponse response, Model model) {
        InfTender infTender1 = this.get(infTender.getId());
        model.addAttribute("infTender", infTender1);
        return "modules/info/examinePage";
    }


    /**
     * 审核招商信息
     */

    @RequestMapping(value = "examineTenderInfo")
    public String examineTenderInfo(InfTender infTender, HttpServletRequest request, HttpSession httpSession, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
        String res = request.getParameter("res");
        if (res.equals("pass")) {
            infTender.setInfoStage("3");
        } else {
            infTender.setInfoStage("4");
        }
        InfTender infTender2 = new InfTender();
        infTender2.setId(infTender.getId());
        infTender2.setInfoStage(infTender.getInfoStage());

        infTenderService.updateInfoStage(infTender2);//更新当前信息状态（通过、不通过）
        InfTender infTender1 = new InfTender();
        infTender1.setInfoStage("2");
        httpSession.setAttribute("info1", infTender1);
        return "redirect:" + Global.getAdminPath() + "/info/infTender/findTenderinfoList/?repage";
    }

}