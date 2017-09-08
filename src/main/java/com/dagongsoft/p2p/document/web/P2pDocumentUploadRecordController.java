/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.document.entity.P2pDocumentUploadRecord;
import com.dagongsoft.p2p.document.service.P2pDocumentUploadRecordService;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 材料上传记录Controller
 *
 * @author Quincy
 * @version 2016-10-25
 */
@Controller
@RequestMapping(value = "${adminPath}/document/p2pDocumentUploadRecord")
public class P2pDocumentUploadRecordController extends BaseController {

    @Autowired
    private P2pDocumentUploadRecordService p2pDocumentUploadRecordService;

    @ModelAttribute
    public P2pDocumentUploadRecord get(@RequestParam(required = false) String id) {
        P2pDocumentUploadRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pDocumentUploadRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pDocumentUploadRecord();
        }
        return entity;
    }

    @RequiresPermissions("document:p2pDocumentUploadRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pDocumentUploadRecord p2pDocumentUploadRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pDocumentUploadRecord> page = p2pDocumentUploadRecordService.findPage(new Page<P2pDocumentUploadRecord>(request, response), p2pDocumentUploadRecord);
        model.addAttribute("page", page);
        return "modules/document/p2pDocumentUploadRecordList";
    }

    @RequiresPermissions("document:p2pDocumentUploadRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pDocumentUploadRecord p2pDocumentUploadRecord, Model model) {
        model.addAttribute("p2pDocumentUploadRecord", p2pDocumentUploadRecord);
        return "modules/document/p2pDocumentUploadRecordForm";
    }

    @RequiresPermissions("document:p2pDocumentUploadRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pDocumentUploadRecord p2pDocumentUploadRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pDocumentUploadRecord)) {
            return form(p2pDocumentUploadRecord, model);
        }
        p2pDocumentUploadRecordService.save(p2pDocumentUploadRecord);
        addMessage(redirectAttributes, "保存材料上传记录成功");
        return "redirect:" + Global.getAdminPath() + "/document/p2pDocumentUploadRecord/?repage";
    }

    @RequiresPermissions("document:p2pDocumentUploadRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pDocumentUploadRecord p2pDocumentUploadRecord, RedirectAttributes redirectAttributes) {
        p2pDocumentUploadRecordService.delete(p2pDocumentUploadRecord);
        addMessage(redirectAttributes, "删除材料上传记录成功");
        return "redirect:" + Global.getAdminPath() + "/document/p2pDocumentUploadRecord/?repage";
    }

    /**
     * 材料下载
     *
     * @param address
     * @param request
     * @param response
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "download")
    public String download(@RequestParam String address, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        int indexOf = address.indexOf("fileAddress=");
        int indexOf2 = address.indexOf(",remarks");
        address = address.substring(indexOf + 12, indexOf2);
        UploadFileUtils.download(Encodes.urlDecode(address), request, response);
        return null;
    }
}