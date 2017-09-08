package com.dagongsoft.p2p.creditmanage.web.front;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.config.service.front.IndustryConfigService;
import com.dagongsoft.p2p.creditmanage.entity.CreditReportInfo;
import com.dagongsoft.p2p.creditmanage.service.CreditReportInfoService;
import com.dagongsoft.p2p.user.web.front.controller.BaseController;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.FileDownload;


/**
 * 信用记录举报管理Controller
 *
 * @author Zazh
 * @version 2017-02-20
 */
@Controller
@RequestMapping(value = "${adminPath}/creditmanage/creditReportInfoFront")
public class CreditReportInfoFrontController extends BaseController {
    @Resource
    private CreditReportInfoService creditReportInfoService;

    @ModelAttribute
    public CreditReportInfo get(@RequestParam(required = false) String id) {
        CreditReportInfo entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = creditReportInfoService.get(id);
        }
        if (entity == null) {
            entity = new CreditReportInfo();
        }
        return entity;
    }


    @RequestMapping(value = "save")
    public String save(MultipartHttpServletRequest request, HttpSession session, CreditReportInfo creditReportInfo, Model model, RedirectAttributes redirectAttributes) {

        User user = (User) session.getAttribute("user");
        List<String> files = UploadFileUtils.fdfsUpload(request);
        creditReportInfo.setReportId(user.getId());
        if (!files.isEmpty()) {
            creditReportInfo.setAttachment(files.get(0));
        }
        creditReportInfo.setReportTime(new Date());
        creditReportInfo.setAuditStatus("1");
        creditReportInfo.setAttachmentName(request.getFile("file").getOriginalFilename());
        creditReportInfoService.save(creditReportInfo);
        /*return "modules/cms/front/themes/basic/xinyongjlDetails";*/
        return "redirect:" + Global.getAdminPath() + "/cms/article/xinyongjlDetails?userId=" + creditReportInfo.getBeReportedId();


    }

}