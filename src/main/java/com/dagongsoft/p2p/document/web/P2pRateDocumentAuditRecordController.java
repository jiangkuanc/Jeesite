package com.dagongsoft.p2p.document.web;

import java.util.Date;
import java.util.List;
import java.util.UUID;

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

import com.dagongsoft.p2p.document.entity.P2pRateDocumentAuditRecord;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.document.service.P2pRateDocumentAuditRecordService;
import com.dagongsoft.p2p.document.service.P2pRateDocumentUploadService;
import com.dagongsoft.p2p.user.entity.P2pAuditRecord;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.service.P2pAuditRecordService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 评级材料历史审核记录Controller
 *
 * @author Sora
 * @version 2016-11-01
 */
@Controller
@RequestMapping(value = "${adminPath}/document/p2pRateDocumentAuditRecord")
public class P2pRateDocumentAuditRecordController extends BaseController {

    @Resource
    private P2pRateDocumentAuditRecordService p2pRateDocumentAuditRecordService;
    @Resource
    private P2pRateDocumentUploadService p2pRateDocumentUploadService;
    @Resource
    private P2pAuditRecordService p2pAuditRecordService;

    @ModelAttribute
    public P2pRateDocumentAuditRecord get(@RequestParam(required = false) String id) {
        P2pRateDocumentAuditRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRateDocumentAuditRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pRateDocumentAuditRecord();
        }
        return entity;
    }

    @RequiresPermissions("document:p2pRateDocumentAuditRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRateDocumentAuditRecord p2pRateDocumentAuditRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRateDocumentAuditRecord> page = p2pRateDocumentAuditRecordService.findPage(new Page<P2pRateDocumentAuditRecord>(request, response), p2pRateDocumentAuditRecord);
        model.addAttribute("page", page);
        return "modules/document/p2pRateDocumentAuditRecordList";
    }

    @RequiresPermissions("document:p2pRateDocumentAuditRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pRateDocumentAuditRecord p2pRateDocumentAuditRecord, Model model) {
        model.addAttribute("p2pRateDocumentAuditRecord", p2pRateDocumentAuditRecord);
        return "modules/document/p2pRateDocumentAuditRecordForm";
    }

    @RequiresPermissions("document:p2pRateDocumentAuditRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pRateDocumentAuditRecord p2pRateDocumentAuditRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRateDocumentAuditRecord)) {
            return form(p2pRateDocumentAuditRecord, model);
        }
        p2pRateDocumentAuditRecordService.save(p2pRateDocumentAuditRecord);
        addMessage(redirectAttributes, "保存评级材料历史审核记录成功");
        return "redirect:" + Global.getAdminPath() + "/document/p2pRateDocumentAuditRecord/?repage";
    }

    @RequiresPermissions("document:p2pRateDocumentAuditRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRateDocumentAuditRecord p2pRateDocumentAuditRecord, RedirectAttributes redirectAttributes) {
        p2pRateDocumentAuditRecordService.delete(p2pRateDocumentAuditRecord);
        addMessage(redirectAttributes, "删除评级材料历史审核记录成功");
        return "redirect:" + Global.getAdminPath() + "/document/p2pRateDocumentAuditRecord/?repage";
    }


    //@RequiresPermissions("document:p2pRateDocumentAuditRecord:view")
    @RequestMapping(value = "formView")
    public String formView(P2pRateDocumentAuditRecord p2pRateDocumentAuditRecord, Model model) {
        List<P2pRateDocumentAuditRecord> list = p2pRateDocumentAuditRecordService.findById(p2pRateDocumentAuditRecord.getRateDocumentUploadId());
        model.addAttribute("list", list);
        return "p2p/back/financing/p2pRateDocumentAuditRecordFormView";
    }

    @RequestMapping(value = "formView2")
    public String formView(String id, Model model) {
        //根据企业认证id 获取企业认证记录
        P2pAuditRecord p2pAuditRecord = new P2pAuditRecord();
        p2pAuditRecord.setReferenceId(id);
        p2pAuditRecord.setAuditType(Integer.parseInt(DictUtils.getDictValue("企业认证", "audit_type", "")));
        List<P2pAuditRecord> p2pAuditRecordList = p2pAuditRecordService.findAuditRecordListByIdAndType(p2pAuditRecord);
        model.addAttribute("p2pAuditRecordList", p2pAuditRecordList);
        return "p2p/back/financing/p2pRateDocumentAuditRecordFormView2";
    }

    //@RequiresPermissions("document:p2pRateDocumentAuditRecord:edit")
    @RequestMapping(value = "addOne")
    @ResponseBody
    public String addOne(P2pRateDocumentUpload p2pRateDocumentUpload, Model model, RedirectAttributes redirectAttributes) {
        String msg = null;
        try {
            p2pRateDocumentUpload.setAuditPerson(UserUtils.getUser().getName());
            p2pRateDocumentUpload.setAuditTime(new Date());
            p2pRateDocumentUploadService.update(p2pRateDocumentUpload);
            //P2pRateDocumentUpload p2pRateDocumentUpload2 = p2pRateDocumentUploadService.get(p2pRateDocumentUpload.getId());
            P2pRateDocumentAuditRecord p = new P2pRateDocumentAuditRecord();
            p.setId(UUID.randomUUID().toString());
            p.setRateDocumentUploadId(p2pRateDocumentUpload.getId());
            p.setHandleTime(new Date());
            p.setAuditPerson(UserUtils.getUser().getName());
            p.setIsReject(p2pRateDocumentUpload.getIsReject());
            p.setRejectReason(p2pRateDocumentUpload.getRejectReason());
            p2pRateDocumentAuditRecordService.save(p);
            msg = "保存评级材料审核记录成功!";
        } catch (Exception e) {
            // TODO: handle exception
        }
        return msg;
    }

    /**
     * 企业基本信息
     *
     * @param 借贷产品id
     * @param model
     * @return
     */
    @RequestMapping(value = "enBaseInfoModal")
    public String enBaseInfoModal(String financingInformationId, Model model) {
        P2pEnterpriseCertify enBaseInfo = p2pRateDocumentAuditRecordService.getDebtBaseInfoModal(financingInformationId);
        model.addAttribute("enBaseInfo", enBaseInfo);
        return "p2p/back/financing/before/debtBaseInfoModal";
    }

    /**
     * 企业基本信息
     *
     * @param 借贷产品id
     * @param model
     * @return
     */
    @RequestMapping(value = "enBaseInfoModal2")
    public String enBaseInfoModal2(String financingInformationId, Model model) {
        P2pEnterpriseCertify enBaseInfo = p2pRateDocumentAuditRecordService.getDebtBaseInfoModal2(financingInformationId);
        model.addAttribute("enBaseInfo", enBaseInfo);
        String fid = financingInformationId.substring(0, 3);
        model.addAttribute("fid", fid);
        return "p2p/back/financing/before/debtBaseInfoModal";
    }
}