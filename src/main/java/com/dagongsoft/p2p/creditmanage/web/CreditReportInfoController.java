package com.dagongsoft.p2p.creditmanage.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.creditmanage.entity.CreditReportInfo;
import com.dagongsoft.p2p.creditmanage.service.CreditReportInfoService;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.FileDownload;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 信用记录举报管理Controller
 *
 * @author Zazh
 * @version 2017-02-20
 */
@Controller
@RequestMapping(value = "${adminPath}/creditmanage/creditReportInfo")
public class CreditReportInfoController extends BaseController {

    @Resource
    private CreditReportInfoService creditReportInfoService;

    @RequiresPermissions("creditmanage:creditReportInfo:view")
    @RequestMapping(value = {"list", ""})
    public String list(CreditReportInfo creditReportInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
//		try{
//			if(creditReportInfo.getReportTime2() != null){
//				Date endTime = creditReportInfo.getReportTime2();
//				Calendar cal = Calendar.getInstance();
//				cal.setTime(endTime);
//				cal.add(Calendar.DATE, 1);
//				endTime = cal.getTime();
//				creditReportInfo.setReportTime2(endTime);
//			}
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
        Page<CreditReportInfo> page = creditReportInfoService.getReportPage(new Page<CreditReportInfo>(request, response), creditReportInfo);
        model.addAttribute("page", page);
        return "modules/creditmanage/creditReportInfoList";
    }

    @RequiresPermissions("creditmanage:creditReportInfo:view")
    @RequestMapping(value = "form")
    public String form(CreditReportInfo creditReportInfo, Model model) {
        String remarks = creditReportInfo.getRemarks();
        creditReportInfo = creditReportInfoService.getReportDetails(creditReportInfo);
        creditReportInfo.setRemarks(remarks);
        model.addAttribute("creditReportInfo", creditReportInfo);
        return "modules/creditmanage/creditReportInfoForm";
    }

    @RequiresPermissions("creditmanage:creditReportInfo:edit")
    @RequestMapping(value = "save")
    public String save(CreditReportInfo creditReportInfo, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, creditReportInfo)) {
            return form(creditReportInfo, model);
        }
        creditReportInfoService.save(creditReportInfo);
        addMessage(redirectAttributes, "保存信用记录举报管理成功");
        return "redirect:" + Global.getAdminPath() + "/creditmanage/creditReportInfo/?repage";
    }

    @RequiresPermissions("creditmanage:creditReportInfo:edit")
    @RequestMapping(value = "delete")
    public String delete(CreditReportInfo creditReportInfo, RedirectAttributes redirectAttributes) {
        creditReportInfoService.delete(creditReportInfo);
        addMessage(redirectAttributes, "删除信用记录举报管理成功");
        return "redirect:" + Global.getAdminPath() + "/creditmanage/creditReportInfo/?repage";
    }

    @RequestMapping(value = "reportAudit")
    public String reportAudit(CreditReportInfo creditReportInfo, Model model, RedirectAttributes redirectAttributes) {
        String isPass = creditReportInfo.getRecheckId();
        if ("1".equals(creditReportInfo.getAuditStatus())) {//如果是初审   字典项
            creditReportInfo.setCheckId(UserUtils.getUser().getId());
            creditReportInfo.setCheckOpinion(creditReportInfo.getRecheckOpinion());
            creditReportInfo.setRecheckId(null);
            creditReportInfo.setRecheckOpinion(null);
        } else if ("2".equals(creditReportInfo.getAuditStatus())) {//复审
            creditReportInfo.setRecheckId(UserUtils.getUser().getId());
        } else {//其他情况

        }
        if ("1".equals(isPass)) {//审核通过 审核状态+1
            creditReportInfo.setAuditStatus(Integer.parseInt(creditReportInfo.getAuditStatus()) + 1 + "");
        } else {//不通过  审核状态改为4 申诉失败
            creditReportInfo.setAuditStatus("4");
        }

        creditReportInfoService.reportAudit(creditReportInfo);
        addMessage(redirectAttributes, "信用记录举报审核成功");
        return "redirect:" + Global.getAdminPath() + "/creditmanage/creditReportInfo/?repage";
    }


    /**
     * 附件下载方法
     */
    @RequestMapping(value = "attachmentDownload")
    public String attachmentDownload(CreditReportInfo creditReportInfo, HttpServletResponse response) {

        UploadFileUtils.fdfsDownload(Encodes.urlDecode(creditReportInfo.getAttachment()), creditReportInfo.getAttachmentName(), response);
        return null;

    }

    /**
     * 附件下载方法
     */
    @RequestMapping(value = "download")
    public String download(String address, String fileName, HttpServletResponse response) {
        UploadFileUtils.fdfsDownload(Encodes.urlDecode(address), fileName, response);
        return null;
    }

}