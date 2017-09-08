package com.dagongsoft.p2p.document.web;

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
import com.dagongsoft.p2p.document.entity.P2pSupplyDocumentUpload;
import com.dagongsoft.p2p.document.service.P2pSupplyDocumentUploadService;

/**
 * 补充材料上传记录Controller
 *
 * @author Quincy
 * @version 2017-02-17
 */
@Controller
@RequestMapping(value = "${adminPath}/document/p2pSupplyDocumentUpload")
public class P2pSupplyDocumentUploadController extends BaseController {

    @Resource
    private P2pSupplyDocumentUploadService p2pSupplyDocumentUploadService;

    @ModelAttribute
    public P2pSupplyDocumentUpload get(@RequestParam(required = false) String id) {
        P2pSupplyDocumentUpload entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pSupplyDocumentUploadService.get(id);
        }
        if (entity == null) {
            entity = new P2pSupplyDocumentUpload();
        }
        return entity;
    }

    @RequiresPermissions("document:p2pSupplyDocumentUpload:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pSupplyDocumentUpload p2pSupplyDocumentUpload, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pSupplyDocumentUpload> page = p2pSupplyDocumentUploadService.findPage(new Page<P2pSupplyDocumentUpload>(request, response), p2pSupplyDocumentUpload);
        model.addAttribute("page", page);
        return "modules/document/p2pSupplyDocumentUploadList";
    }

    @RequiresPermissions("document:p2pSupplyDocumentUpload:view")
    @RequestMapping(value = "form")
    public String form(P2pSupplyDocumentUpload p2pSupplyDocumentUpload, Model model) {
        model.addAttribute("p2pSupplyDocumentUpload", p2pSupplyDocumentUpload);
        return "modules/document/p2pSupplyDocumentUploadForm";
    }

    @RequiresPermissions("document:p2pSupplyDocumentUpload:edit")
    @RequestMapping(value = "save")
    public String save(P2pSupplyDocumentUpload p2pSupplyDocumentUpload, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pSupplyDocumentUpload)) {
            return form(p2pSupplyDocumentUpload, model);
        }
        p2pSupplyDocumentUploadService.save(p2pSupplyDocumentUpload);
        addMessage(redirectAttributes, "保存补充材料上传记录成功");
        return "redirect:" + Global.getAdminPath() + "/document/p2pSupplyDocumentUpload/?repage";
    }

    @RequiresPermissions("document:p2pSupplyDocumentUpload:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pSupplyDocumentUpload p2pSupplyDocumentUpload, RedirectAttributes redirectAttributes) {
        p2pSupplyDocumentUploadService.delete(p2pSupplyDocumentUpload);
        addMessage(redirectAttributes, "删除补充材料上传记录成功");
        return "redirect:" + Global.getAdminPath() + "/document/p2pSupplyDocumentUpload/?repage";
    }

}