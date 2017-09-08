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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.creditmanage.entity.CreditAppealInfo;
import com.dagongsoft.p2p.creditmanage.service.CreditAppealInfoService;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.FileDownload;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 信用记录申诉管理Controller
 *
 * @author Zazh
 * @version 2017-02-20
 */
@Controller
@RequestMapping(value = "${adminPath}/creditmanage/creditAppealInfo")
public class CreditAppealInfoController extends BaseController {

    @Resource
    private CreditAppealInfoService creditAppealInfoService;

    @ModelAttribute
    public CreditAppealInfo get(@RequestParam(required = false) String id) {
        CreditAppealInfo entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = creditAppealInfoService.get(id);
        }
        if (entity == null) {
            entity = new CreditAppealInfo();
        }
        return entity;
    }

    @RequiresPermissions("creditmanage:creditAppealInfo:view")
    @RequestMapping(value = {"list", ""})
    public String list(CreditAppealInfo creditAppealInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
//		try{
//			if(creditAppealInfo.getAppealTime2() != null){
//				Date endTime = creditAppealInfo.getAppealTime2();
//				Calendar cal = Calendar.getInstance();
//				cal.setTime(endTime);
//				cal.add(Calendar.DATE, 1);
//				endTime = cal.getTime();
//				creditAppealInfo.setAppealTime2(endTime);
//			}
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
        Page<CreditAppealInfo> page = creditAppealInfoService.findPage(new Page<CreditAppealInfo>(request, response), creditAppealInfo);
        model.addAttribute("page", page);
        return "modules/creditmanage/creditAppealInfoList";
    }

    @RequiresPermissions("creditmanage:creditAppealInfo:view")
    @RequestMapping(value = "form")
    public String form(CreditAppealInfo creditAppealInfo, Model model) {
        model.addAttribute("creditAppealInfo", creditAppealInfo);
        return "modules/creditmanage/creditAppealInfoForm";
    }

    @RequiresPermissions("creditmanage:creditAppealInfo:edit")
    @RequestMapping(value = "save")
    public String save(CreditAppealInfo creditAppealInfo, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, creditAppealInfo)) {
            return form(creditAppealInfo, model);
        }
        creditAppealInfoService.save(creditAppealInfo);
        addMessage(redirectAttributes, "保存信用记录申诉管理成功");
        return "redirect:" + Global.getAdminPath() + "/creditmanage/creditAppealInfo/?repage";
    }

    @RequiresPermissions("creditmanage:creditAppealInfo:edit")
    @RequestMapping(value = "delete")
    public String delete(CreditAppealInfo creditAppealInfo, RedirectAttributes redirectAttributes) {
        creditAppealInfoService.delete(creditAppealInfo);
        addMessage(redirectAttributes, "删除信用记录申诉管理成功");
        return "redirect:" + Global.getAdminPath() + "/creditmanage/creditAppealInfo/?repage";
    }

    @RequestMapping(value = "appealAudit")
    public String appealAudit(CreditAppealInfo creditAppealInfo, Model model, RedirectAttributes redirectAttributes) {
        String isPass = creditAppealInfo.getRecheckId();
        if ("1".equals(creditAppealInfo.getAuditStatus())) {//如果是初审   字典项
            creditAppealInfo.setCheckId(UserUtils.getUser().getId());
            creditAppealInfo.setCheckOpinion(creditAppealInfo.getRecheckOpinion());
            creditAppealInfo.setRecheckId(null);
            creditAppealInfo.setRecheckOpinion(null);
        } else if ("2".equals(creditAppealInfo.getAuditStatus())) {//复审
            creditAppealInfo.setRecheckId(UserUtils.getUser().getId());
        } else {//其他情况

        }
        if ("1".equals(isPass)) {//审核通过 审核状态+1
            creditAppealInfo.setAuditStatus(Integer.parseInt(creditAppealInfo.getAuditStatus()) + 1 + "");
        } else {//不通过  审核状态改为4 申诉失败
            creditAppealInfo.setAuditStatus("4");
        }

        creditAppealInfoService.appealAudit(creditAppealInfo);
        addMessage(redirectAttributes, "信用记录申诉审核成功");
        return "redirect:" + Global.getAdminPath() + "/creditmanage/creditAppealInfo/?repage";
    }

    /**
     * 附件下载方法
     */
    @RequestMapping(value = "attachmentDownload")
    public String attachmentDownload(CreditAppealInfo creditAppealInfo, HttpServletResponse response) {

        UploadFileUtils.fdfsDownload(Encodes.urlDecode(creditAppealInfo.getAttachment()), creditAppealInfo.getAttachmentName(), response);
        return null;
    }

}