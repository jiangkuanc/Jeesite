package com.dagongsoft.p2p.creditmanage.web.front;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.activiti.engine.impl.util.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.creditmanage.entity.CreditAppealInfo;
import com.dagongsoft.p2p.creditmanage.service.CreditAppealInfoService;
import com.dagongsoft.p2p.user.web.front.controller.BaseController;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.FileDownload;

/**
 * 信用记录申诉管理Controller
 *
 * @author Zazh
 * @version 2017-02-20
 */
@Controller
@RequestMapping(value = "${adminPath}/creditmanage/creditAppealInfoFront")
public class CreditAppealInfoFrontController extends BaseController {

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

    @RequestMapping(value = "save")
    public String save(MultipartHttpServletRequest request, HttpSession session, CreditAppealInfo creditAppealInfo, Model model, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        List<String> files = UploadFileUtils.fdfsUpload(request);
        creditAppealInfo.setAppealId(user.getId());
        if (!files.isEmpty()) {
            creditAppealInfo.setAttachment(files.get(0));
        }

        creditAppealInfo.setAppealTime(new Date());
        creditAppealInfo.setAuditStatus("1");
        creditAppealInfo.setAttachmentName(request.getFile("file").getOriginalFilename());
        creditAppealInfoService.save(creditAppealInfo);
        return "redirect:" + Global.getAdminPath() + "/user/p2pUserInformation/accountPermission?mode=creditRecord&state=0";

    }


}