package com.dagongsoft.p2p.operation.web;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.operation.entity.P2pPlatformOperationDataShow;
import com.dagongsoft.p2p.operation.service.P2pPlatformOperationDataShowService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 平台运营数据披露表Controller
 *
 * @author Zeus
 * @version 2016-11-25
 */
@Controller
@RequestMapping(value = "${adminPath}/operation/p2pPlatformOperationDataShow")
public class P2pPlatformOperationDataShowController extends BaseController {

    @Resource
    private P2pPlatformOperationDataShowService p2pPlatformOperationDataShowService;

    @ModelAttribute
    public P2pPlatformOperationDataShow get(@RequestParam(required = false) String id) {
        P2pPlatformOperationDataShow entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pPlatformOperationDataShowService.get(id);
        }
        if (entity == null) {
            entity = new P2pPlatformOperationDataShow();
        }
        return entity;
    }


    @RequestMapping(value = {"list", ""})
    public String list(P2pPlatformOperationDataShow p2pPlatformOperationDataShow, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pPlatformOperationDataShow> page = p2pPlatformOperationDataShowService.findPage(new Page<P2pPlatformOperationDataShow>(request, response), p2pPlatformOperationDataShow);
            model.addAttribute("page", page);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

        return "p2p/back/operation/p2pPlatformOperationDataShowList";
    }


    @RequestMapping(value = "form")
    public String form(P2pPlatformOperationDataShow p2pPlatformOperationDataShow, Model model) {
        model.addAttribute("p2pPlatformOperationDataShow", p2pPlatformOperationDataShow);
        return "p2p/back/operation/p2pPlatformOperationDataShowForm";
    }


    @RequestMapping(value = "save")
    public String save(P2pPlatformOperationDataShow p2pPlatformOperationDataShow, Model model, RedirectAttributes redirectAttributes) {
        try {
            if (!beanValidator(model, p2pPlatformOperationDataShow)) {
                return form(p2pPlatformOperationDataShow, model);
            }
            p2pPlatformOperationDataShow.setHistoryDate(new Date());
            p2pPlatformOperationDataShowService.save(p2pPlatformOperationDataShow);
            addMessage(redirectAttributes, "保存平台运营数据披露表成功");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:" + Global.getAdminPath() + "/operation/p2pPlatformOperationDataShow/?repage";
    }


    @RequestMapping(value = "delete")
    public String delete(P2pPlatformOperationDataShow p2pPlatformOperationDataShow, RedirectAttributes redirectAttributes) {
        p2pPlatformOperationDataShowService.delete(p2pPlatformOperationDataShow);
        addMessage(redirectAttributes, "删除平台运营数据披露表成功");
        return "redirect:" + Global.getAdminPath() + "/operation/p2pPlatformOperationDataShow/?repage";
    }

}