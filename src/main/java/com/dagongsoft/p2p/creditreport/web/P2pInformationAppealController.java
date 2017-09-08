package com.dagongsoft.p2p.creditreport.web;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.creditreport.entity.P2pInformationAppeal;
import com.dagongsoft.p2p.creditreport.service.P2pInformationAppealService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 企业信息申诉表Controller
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@Controller
@RequestMapping(value = "${adminPath}/creditreport/p2pInformationAppeal")
public class P2pInformationAppealController extends BaseController {

    @Resource
    private P2pInformationAppealService p2pInformationAppealService;

    @ModelAttribute
    public P2pInformationAppeal get(@RequestParam(required = false) String id) {
        P2pInformationAppeal entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pInformationAppealService.get(id);
        }
        if (entity == null) {
            entity = new P2pInformationAppeal();
        }
        return entity;
    }


    @RequestMapping(value = {"list", ""})
    public String list(P2pInformationAppeal p2pInformationAppeal, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pInformationAppeal> page = p2pInformationAppealService.findPage(new Page<P2pInformationAppeal>(request, response), p2pInformationAppeal);
        model.addAttribute("page", page);
        return "modules/p2p/creditreport/p2pInformationAppealList";
    }


    @RequestMapping(value = "form")
    public String form(P2pInformationAppeal p2pInformationAppeal, Model model) {
        model.addAttribute("p2pInformationAppeal", p2pInformationAppeal);
        return "modules/p2p/creditreport/p2pInformationAppealForm";
    }


    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String save(P2pInformationAppeal p2pInformationAppeal, HttpSession session, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        p2pInformationAppeal.setUser(user);
        p2pInformationAppeal.setAppealTime(new Date());
        p2pInformationAppeal.setAppealAuditState("1");

        p2pInformationAppealService.save(p2pInformationAppeal);

        List<P2pInformationAppeal> p2pInformationAppealList = p2pInformationAppealService.ssList(user.getId());
        addMessage(redirectAttributes, "保存企业信息申诉表成功");
        /*return "redirect:" + Global.getAdminPath() + "/p2p/creditreport/p2pInformationAppeal/?repage";*/
        model.addAttribute("p2pInformationAppealList", p2pInformationAppealList);
        return "modules/front/account/creditRecord";

    }


    @RequestMapping(value = "delete")
    public String delete(P2pInformationAppeal p2pInformationAppeal, RedirectAttributes redirectAttributes) {
        p2pInformationAppealService.delete(p2pInformationAppeal);
        addMessage(redirectAttributes, "删除企业信息申诉表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/creditreport/p2pInformationAppeal/?repage";
    }

    @RequestMapping(value = "p2pInformationAppealList")
    public String p2pInformationAppealList(P2pInformationAppeal p2pInformationAppeal, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pInformationAppeal> page = p2pInformationAppealService.findPage(new Page<P2pInformationAppeal>(request, response), p2pInformationAppeal);

            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }


        return "p2p/creditreport/p2pInformationAppealList";
    }

    @RequestMapping(value = "p2pInformationAppealView")
    public String p2pInformationAppealView(String id, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            P2pInformationAppeal p2pInformationAppeal = p2pInformationAppealService.get(id);
            model.addAttribute("p2pInformationAppeal", p2pInformationAppeal);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "p2p/creditreport/p2pInformationAppealView";
    }

    @RequestMapping(value = "p2pInformationAppealForm")
    public String p2pInformationAppealForm(String id, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            P2pInformationAppeal p2pInformationAppeal = p2pInformationAppealService.get(id);
            model.addAttribute("p2pInformationAppeal", p2pInformationAppeal);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/creditreport/p2pInformationAppealForm";
    }

}