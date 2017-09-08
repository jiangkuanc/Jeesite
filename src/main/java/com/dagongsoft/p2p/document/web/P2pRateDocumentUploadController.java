/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.web;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.dagongsoft.p2p.document.entity.P2pDocumentUploadRecord;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentTemplate;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.document.service.P2pDocumentUploadRecordService;
import com.dagongsoft.p2p.document.service.P2pRateDocumentTemplateService;
import com.dagongsoft.p2p.document.service.P2pRateDocumentUploadService;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.utils.FileDownLoad;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 评级材料上传Controller
 *
 * @author qichao
 * @version 2016-09-27
 */
@Controller
@RequestMapping(value = "${adminPath}/document/p2pRateDocumentUpload")
public class P2pRateDocumentUploadController extends BaseController {

    @Autowired
    private P2pRateDocumentUploadService p2pRateDocumentUploadService;
    @Autowired
    private P2pRateDocumentTemplateService p2pRateDocumentTemplateService;
    @Autowired
    private P2pDocumentUploadRecordService p2pDocumentUploadRecordService;
    @Autowired
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;

    @ModelAttribute
    public P2pRateDocumentUpload get(@RequestParam(required = false) String id) {
        P2pRateDocumentUpload entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRateDocumentUploadService.get(id);
        }
        if (entity == null) {
            entity = new P2pRateDocumentUpload();
        }
        return entity;
    }

    @RequiresPermissions("document:p2pRateDocumentUpload:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRateDocumentUpload p2pRateDocumentUpload, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRateDocumentUpload> page = p2pRateDocumentUploadService.findPage(new Page<P2pRateDocumentUpload>(request, response), p2pRateDocumentUpload);
        model.addAttribute("page", page);
        return "modules/cms/platformContent/rateDocumentTemplate";
    }

    @RequiresPermissions("document:p2pRateDocumentUpload:view")
    @RequestMapping(value = "form")
    public String form(P2pRateDocumentUpload p2pRateDocumentUpload, Model model) {
        model.addAttribute("p2pRateDocumentUpload", p2pRateDocumentUpload);
        return "modules/document/p2pRateDocumentUploadForm";
    }

    @RequiresPermissions("document:p2pRateDocumentUpload:edit")
    @RequestMapping(value = "save")
    public String save(P2pRateDocumentUpload p2pRateDocumentUpload, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRateDocumentUpload)) {
            return form(p2pRateDocumentUpload, model);
        }
        p2pRateDocumentUploadService.save(p2pRateDocumentUpload);
        addMessage(redirectAttributes, "保存评级材料上传成功");
        return "redirect:" + Global.getAdminPath() + "/document/p2pRateDocumentUpload/?repage";
    }

    @RequiresPermissions("document:p2pRateDocumentUpload:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRateDocumentUpload p2pRateDocumentUpload, RedirectAttributes redirectAttributes) {
        p2pRateDocumentUploadService.delete(p2pRateDocumentUpload);
        addMessage(redirectAttributes, "删除评级材料上传成功");
        return "redirect:" + Global.getAdminPath() + "/document/p2pRateDocumentUpload/?repage";
    }

    //@RequiresPermissions("document:p2pRateDocumentUpload:view")
    @RequestMapping(value = "findlist")
    public String findlist(String id, String paymentId, Model model) {
        List<P2pRateDocumentUpload> list = p2pRateDocumentUploadService.findListById(id);
        Map<String, List> mapAll = new LinkedHashMap<String, List>();
        for (P2pRateDocumentUpload p : list) {
            List<P2pDocumentUploadRecord> p2pDocumentUploadRecord = p2pDocumentUploadRecordService.findById(p.getId());
            mapAll.put(p.getRateDocumentTempId(), p2pDocumentUploadRecord);
        }
//		List<P2pRateDocumentTemplate> list2 = p2pRateDocumentTemplateService.findAll();
        String json = JSON.toJSONString(list);
        model.addAttribute("list", list);
//		model.addAttribute("list2", list2);
        model.addAttribute("mapAll", mapAll);
        model.addAttribute("json", json);
        model.addAttribute("financingInformationId", id);
        model.addAttribute("paymentId", paymentId);
        return "p2p/back/financing/before/p2pIndustryList";
    }

    @RequestMapping(value = "findlistAudit")
    public String findlistAudit(String id, Model model) {
        List<P2pRateDocumentUpload> list = p2pRateDocumentUploadService.findListById(id);
        Map<String, List> mapAll = new LinkedHashMap<String, List>();
        for (P2pRateDocumentUpload p : list) {
            List<P2pDocumentUploadRecord> p2pDocumentUploadRecord = p2pDocumentUploadRecordService.findById(p.getId());
            mapAll.put(p.getRateDocumentTempId(), p2pDocumentUploadRecord);
        }
        List<P2pBeforeMatchDebtState> p2pBeforeMatchDebtState = p2pBeforeMatchDebtStateService.findById2(id);
//		List<P2pRateDocumentTemplate> list2 = p2pRateDocumentTemplateService.findAll();
        model.addAttribute("list", list).addAttribute("mapAll", mapAll).addAttribute("list3", p2pBeforeMatchDebtState);
        model.addAttribute("financingInformationId", id);
        return "p2p/back/financing/before/p2pRateDocumentAuditView";
    }

    @RequestMapping(value = "getAddress")
    public void getAddress(String financingInformationId, String rateDocumentTempId, HttpServletResponse response) {
        List<P2pDocumentUploadRecord> addressLists = p2pDocumentUploadRecordService.getAddresses(financingInformationId, rateDocumentTempId);
        P2pRateDocumentTemplate p2pRateDocumentTemplate = p2pRateDocumentTemplateService.get(rateDocumentTempId);
        String tempName = p2pRateDocumentTemplate.getTempName();
        if (tempName.contains("<br/>") || tempName.contains("<br>")) {
            tempName = tempName.replaceAll("<br/>", "");
            tempName = tempName.replaceAll("<br>", "");
        }

        String name[] = new String[addressLists.size()];
        String path[] = new String[addressLists.size()];
        for (int i = 0; i < addressLists.size(); i++) {
            name[i] = addressLists.get(i).getFileName();
            path[i] = addressLists.get(i).getFileAddress();
        }
        FileDownLoad.createZip(tempName + ".zip", name, path, response);
    }

    /**
     * 评级图片预览
     *
     * @param financingInformationId
     * @param rateDocumentTempId
     * @return
     */
    @RequestMapping(value = "modelViews")
    @ResponseBody
    public String modelViews(String financingInformationId, String rateDocumentTempId) {
        P2pRateDocumentUpload p2pRateDocumentUpload = new P2pRateDocumentUpload();
        p2pRateDocumentUpload.setFinancingInformationId(financingInformationId);
        p2pRateDocumentUpload.setRateDocumentTempId(rateDocumentTempId);
        P2pDocumentUploadRecord p2pDocumentUploadRecord = new P2pDocumentUploadRecord();
        p2pDocumentUploadRecord.setP2pRateDocumentUpload(p2pRateDocumentUpload);
        List<String> addressLists = p2pDocumentUploadRecordService.getAddress(p2pDocumentUploadRecord);
        String address = "";
        for (String s : addressLists) {
            address += UploadFileUtils.viewUrl(s) + ",";
        }
        address = address.substring(0, address.length() - 1);

        return address;
    }

    /**
     * 根据债项id验证材料是否全部审核(返回未审核数据)
     *
     * @param fiId
     * @param model
     * @return
     * @Zeus
     */
    @RequestMapping(value = "validateIfAuditAll")
    @ResponseBody
    public String validateIfAuditAll(String fiId) {
        List<P2pRateDocumentUpload> list = p2pRateDocumentUploadService.validateIfAuditAll(fiId);
        return JSON.toJSONString(list);
    }
}