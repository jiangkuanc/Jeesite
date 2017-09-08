/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.activiti.engine.impl.util.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.document.entity.P2pDocumentUploadRecord;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentTemplate;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.document.service.P2pDocumentUploadRecordService;
import com.dagongsoft.p2p.document.service.P2pRateDocumentTemplateService;
import com.dagongsoft.p2p.document.service.P2pRateDocumentUploadService;
import com.dagongsoft.p2p.user.entity.P2pAuditRecord;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pAuditRecordService;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.utils.CertificateState;
import com.dagongsoft.p2p.utils.PermissionUtils;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.interceptor.Token;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * 注册用户绑定企业，需进行企业认证Controller
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/user/p2pEnterpriseCertify")
public class P2pEnterpriseCertifyController extends BaseController {

    @Autowired
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;
    @Autowired
    private P2pAuditRecordService p2pAuditRecordService;
    @Autowired
    private P2pRegUserCertifyService p2pRegUserCertifyService;
    @Autowired
    private P2pRateDocumentUploadService p2pRateDocumentUploadService;
    @Autowired
    private P2pRateDocumentTemplateService p2pRateDocumentTemplateService;
    @Autowired
    private P2pDocumentUploadRecordService p2pDocumentUploadRecordService;

    @ModelAttribute
    public P2pEnterpriseCertify get(@RequestParam(required = false) String id) {
        P2pEnterpriseCertify entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pEnterpriseCertifyService.get(id);
        }
        if (entity == null) {
            entity = new P2pEnterpriseCertify();
        }
        return entity;
    }

    @RequiresPermissions("user:p2pEnterpriseCertify:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pEnterpriseCertify p2pEnterpriseCertify,
                       HttpServletRequest request, HttpServletResponse response,
                       Model model) {
        Page<P2pEnterpriseCertify> page = p2pEnterpriseCertifyService.findPage(
                new Page<P2pEnterpriseCertify>(request, response),
                p2pEnterpriseCertify);
        model.addAttribute("page", page);
        return "modules/user/certifyManagement/p2pEnterpriseCertifyList";
    }

    @RequiresPermissions("user:p2pEnterpriseCertify:view")
    @RequestMapping(value = "form")
    public String form(P2pEnterpriseCertify p2pEnterpriseCertify, Model model) {
        model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
        return "modules/user/p2pEnterpriseCertifyForm";
    }

    @RequiresPermissions("user:p2pEnterpriseCertify:edit")
    @RequestMapping(value = "save")
    public String save(P2pEnterpriseCertify p2pEnterpriseCertify, Model model,
                       RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pEnterpriseCertify)) {
            return form(p2pEnterpriseCertify, model);
        }
        p2pEnterpriseCertifyService.save(p2pEnterpriseCertify);
        addMessage(redirectAttributes, "保存注册用户绑定企业，需进行企业认证成功");
        return "redirect:" + Global.getAdminPath()
                + "/user/p2pEnterpriseCertify/?repage";
    }

    @RequiresPermissions("user:p2pEnterpriseCertify:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pEnterpriseCertify p2pEnterpriseCertify,
                         RedirectAttributes redirectAttributes) {
        p2pEnterpriseCertifyService.delete(p2pEnterpriseCertify);
        addMessage(redirectAttributes, "删除注册用户绑定企业，需进行企业认证成功");
        return "redirect:" + Global.getAdminPath()
                + "/user/p2pEnterpriseCertify/?repage";
    }


    // 企业详情
    @RequiresPermissions("user:p2pEnterpriseCertify:view")
    @RequestMapping(value = "details")
    public String details(P2pEnterpriseCertify p2pEnterpriseCertify, Model model) {
        model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
        return "modules/user/userList/p2pEnterpriseCertifyUserDetails";
    }

    //企业详情2
    @RequiresPermissions("user:p2pEnterpriseCertify:view")
    @RequestMapping(value = "detailsTwo")
    public String detailsTwo(String id, String id2, Model model) {
        P2pEnterpriseCertify p2pEnterpriseCertify = p2pEnterpriseCertifyService.get(id2);
        //材料审核
        List<P2pRateDocumentUpload> list = p2pRateDocumentUploadService.findListById(id);
        Map<String, List> mapAll = new LinkedHashMap<String, List>();
        for (P2pRateDocumentUpload p : list) {
            List<P2pDocumentUploadRecord> p2pDocumentUploadRecord = p2pDocumentUploadRecordService.findById(p.getId());
            mapAll.put(p.getRateDocumentTempId(), p2pDocumentUploadRecord);
        }
        List<P2pRateDocumentTemplate> list2 = p2pRateDocumentTemplateService.findAll();
        model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify).addAttribute("list", list).addAttribute("list2", list2).addAttribute("mapAll", mapAll);

        String userid = p2pEnterpriseCertify.getUser().getId();
        model.addAttribute("userid", userid);


        return "p2p/back/financing/before/p2pMarketConfirmDetails";
    }

    // 企业其他基本信息
    @RequiresPermissions("user:p2pEnterpriseCertify:view")
    @RequestMapping(value = "otherBaseInfo")
    public String otherBaseInfo(P2pEnterpriseCertify p2pEnterpriseCertify,
                                Model model) {
        model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
        return "modules/user/userList/p2pEnterpriseOtherBaseInfo";
    }

    // 企业其他基本信息
    @RequiresPermissions("user:p2pEnterpriseCertify:view")
    @RequestMapping(value = "test")
    public String test(P2pEnterpriseCertify p2pEnterpriseCertify,
                       Model model) {
        model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
        return "modules/user/enterpriseList/test";
    }

    // 企业认证审核页
    @RequiresPermissions("user:p2pEnterpriseCertify:view")
    @RequestMapping(value = "auditView")
    public String auditView(P2pEnterpriseCertify p2pEnterpriseCertify, Model model, HttpServletRequest request, HttpServletResponse response) {
        P2pAuditRecord p2pAuditRecord = new P2pAuditRecord();
        p2pAuditRecord.setReferenceId(p2pEnterpriseCertify.getId());
        p2pAuditRecord.setAuditType(Integer.parseInt(DictUtils.getDictValue(
                "企业认证", "audit_type", "")));
        Page<P2pAuditRecord> page = p2pAuditRecordService
                .findAuditRecordListByIdAndType(new Page<P2pAuditRecord>(
                        request, response), p2pAuditRecord);

        model.addAttribute("page", page);
        model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
        return "modules/user/userList/p2pEnterpriseCertifyAuditView";
    }

    @Autowired
    private P2pUserInformationService P2pUserInformationService;

    /**
     * 前台提交企业认证信息
     *
     * @param p2pEnterpriseCertify
     * @param multipartRequest
     * @param session
     * @return
     */
    @RequestMapping(value = "enterpriseCertify", method = RequestMethod.POST)
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Token(remove = true)
    public String enterpriseCertify(P2pEnterpriseCertify p2pEnterpriseCertify,
                                    MultipartHttpServletRequest multipartRequest, HttpSession session, String topics, String topic2) {
        try {
            List<Integer> pers = new ArrayList<Integer>();
            pers.add(CertificateState.IDENTITY_CERTIFICATION_FINISHED);
            pers.add(CertificateState.ENTERPRISE_CERTIFICATION_FAILURE);
            if (PermissionUtils.ctrlPermission(session, pers, null) == false) {
                return "modules/front/state/error";
            }
            /*
             * 重命名并上传文件
			 */
            User user = (User) session.getAttribute("user");
            List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);
            /*
			 * 添加或修改账户企业认证信息
			 */
            // 判断企业法人照片是否存在
            Integer count = 0;
            if (p2pEnterpriseCertify.getLicenseIsReject() == null || p2pEnterpriseCertify.getLicenseIsReject() == 0) {
                p2pEnterpriseCertify.setBusinessLicense(list.get(count));
                p2pEnterpriseCertify.setLicenseIsReject(null);
                p2pEnterpriseCertify.setLicenseRejectReason(null);
                count++;
            }

            if ("yes".equals(topic2)) {
                p2pEnterpriseCertify.setIsEntLegalRep(1);
            }
            if ("no".equals(topic2)) {
                p2pEnterpriseCertify.setIsEntLegalRep(0);
            }
            //判断当前用户是否为企业法人
            if (p2pEnterpriseCertify.getId() != null && p2pEnterpriseCertify.getIsEntLegalRep() == 1) {
                P2pRegUserCertify p2pRegUserCertify = new P2pRegUserCertify();
                p2pRegUserCertify.setUser(user);
                p2pRegUserCertify = p2pRegUserCertifyService.findP2pRegUserCertifyByProperty(p2pRegUserCertify);
                p2pEnterpriseCertify.setNameOf(p2pRegUserCertify.getRealName());
                p2pEnterpriseCertify.setIdNumberOf(p2pRegUserCertify.getIdNumber());
                p2pEnterpriseCertify.setTelephoneNumOf(user.getPhone());
                p2pEnterpriseCertify.setIdCardFront(p2pRegUserCertify.getIdCardFront());
                p2pEnterpriseCertify.setIdCardBack(p2pRegUserCertify.getIdCardBack());
            } else {
                if (p2pEnterpriseCertify.getFrontIsReject() == null || p2pEnterpriseCertify.getFrontIsReject() == 0) {
                    p2pEnterpriseCertify.setIdCardFront(list.get(count));
                    p2pEnterpriseCertify.setFrontIsReject(null);
                    p2pEnterpriseCertify.setFrontRejectReason(null);
                    count++;
                }
                if (p2pEnterpriseCertify.getBackIsReject() == null || p2pEnterpriseCertify.getBackIsReject() == 0) {
                    p2pEnterpriseCertify.setIdCardBack(list.get(count));
                    p2pEnterpriseCertify.setBackIsReject(null);
                    p2pEnterpriseCertify.setBackRejectReason(null);
                    count++;
                }
            }
            if (p2pEnterpriseCertify.getPhoneNumber() != null && !"".equals(p2pEnterpriseCertify.getPhoneNumber())) {
                p2pEnterpriseCertify.setTelephoneNumOf(p2pEnterpriseCertify.getPhoneNumber());
            }
            if ("css1".equals(topics)) {
                p2pEnterpriseCertify.setCertificateType(0);
            }
            if ("javascript1".equals(topics)) {
                p2pEnterpriseCertify.setCertificateType(1);
                p2pEnterpriseCertify.setOrganizationCode(p2pEnterpriseCertify.getOrganizationCode2());
                p2pEnterpriseCertify.setTaxRegistrationNum(p2pEnterpriseCertify.getTaxRegistrationNum2());
                p2pEnterpriseCertify.setUnifiedSocialCreditCode(p2pEnterpriseCertify.getUnifiedSocialCreditCode2());
            }
            //判断营业期限是否为长期
            if ("1".equals(p2pEnterpriseCertify.getIsLongTerm())) {
                p2pEnterpriseCertify.setOperationPeriod(null);
            }
            p2pEnterpriseCertify.setAuditState(3);// 设置审核状态为待审核
            p2pEnterpriseCertify.setUser(user);// 让用户表与实名认证表进行账号关联
            p2pEnterpriseCertify.setSubmitTime(new Date());// 设置提交时间
            p2pEnterpriseCertifyService.saveOrUpdateP2pEnterpriseCertify(p2pEnterpriseCertify);
			/*
			 * 修改账号认证状态
			 */
            P2pUserInformation p2pUserInformation = new P2pUserInformation();
            p2pUserInformation.setUser(user);
            p2pUserInformation.setCertificateState(CertificateState.ENTERPRISE_CERTIFICATION);// 更改用户认证状态
            P2pUserInformationService.updateCertificateState(p2pUserInformation);
            return "modules/front/user/certifyCommitSuccess";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:" + frontPath;
        }
    }

    // 后台企业认证
    @RequestMapping(value = "backEnterpriseCertify")
    @Transactional(readOnly = false)
    public String backEnterpriseCertify(P2pAuditRecord p2pAuditRecord, P2pEnterpriseCertify p2pEnterpriseCertify,
                                        RedirectAttributes redirectAttributes) {
        try {
            //保存认证记录
            p2pAuditRecordService.save(p2pAuditRecord);
            //企业认证表修改认证状态

            p2pEnterpriseCertify.setId(p2pAuditRecord.getReferenceId());
            p2pEnterpriseCertify.setAuditState(Integer.parseInt(p2pAuditRecord.getAuditOpinion()));
            p2pEnterpriseCertify.setAuditPersonId(p2pAuditRecord.getAuditPersonId());
            p2pEnterpriseCertify.setAuditTime(p2pAuditRecord.getAuditTime());
            p2pEnterpriseCertify.setAuditExplain(p2pAuditRecord.getAuditResult());
            p2pEnterpriseCertifyService.saveOrUpdateP2pEnterpriseCertify(p2pEnterpriseCertify);
            //更改用户信息表认证状态
            P2pUserInformation pui = new P2pUserInformation();
            pui.setUser(p2pEnterpriseCertifyService.get(p2pAuditRecord.getReferenceId()).getUser());
            //认证成功
            if ("1".equals(p2pAuditRecord.getAuditOpinion())) {
                pui.setCertificateState(CertificateState.ENTERPRISE_CERTIFICATION_SUCCESS);
                //认证失败
            } else if ("2".equals(p2pAuditRecord.getAuditOpinion())) {
                pui.setCertificateState(CertificateState.ENTERPRISE_CERTIFICATION_FAILURE);
            }
            P2pUserInformationService.updateCertificateState(pui);
            addMessage(redirectAttributes, "操作成功,认证状态:" + DictUtils.getDictLabels(p2pAuditRecord.getAuditOpinion(), "audit_state", ""));
            return "redirect:" + Global.getAdminPath() + "/user/p2pEnterpriseCertify/list/?repage";
        } catch (Exception e) {
            addMessage(redirectAttributes, "操作失败");
            return "redirect:" + Global.getAdminPath()
                    + "/user/p2pEnterpriseCertify/list/?repage";
        }

    }

    // 身份认证审核页
    @RequiresPermissions("user:p2pEnterpriseCertify:view")
    @RequestMapping(value = "userAuditView")
    public String userAuditView(P2pEnterpriseCertify p2pEnterpriseCertify, Model model, HttpServletRequest request, HttpServletResponse response) {

        // 根据user查询身份认证表信息
        P2pRegUserCertify pruc = new P2pRegUserCertify();
        pruc.setUser(p2pEnterpriseCertify.getUser());
        pruc = p2pRegUserCertifyService.findP2pRegUserCertifyByProperty(pruc);

        P2pAuditRecord p2pAuditRecord = new P2pAuditRecord();
        p2pAuditRecord.setReferenceId(pruc.getId());
        p2pAuditRecord.setAuditType(Integer.parseInt(DictUtils.getDictValue("身份认证", "audit_type", "")));
        Page<P2pAuditRecord> page = p2pAuditRecordService.findAuditRecordListByIdAndType(new Page<P2pAuditRecord>(request, response), p2pAuditRecord);
        model.addAttribute("page", page);
        model.addAttribute("p2pRegUserCertify", pruc);
        return "modules/user/userList/userCertifyAuditView";
    }


    /**
     * 企业名称唯一性校验
     *
     * @param enterpriseName
     * @return
     */
    @RequestMapping(value = "getByEnterpriseName")
    @ResponseBody
    public String getByEnterpriseName(@RequestParam String enterpriseName) {
        JSONObject json = new JSONObject();
        try {
            if (p2pEnterpriseCertifyService.getByEnterpriseName(enterpriseName) == true) {
                json.put("valid", true);
            } else {
                json.put("valid", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json.toString();
    }

    @RequiresPermissions("user:p2pEnterpriseCertify:view")
    @RequestMapping(value = "formView")
    public String formView(P2pEnterpriseCertify p2pEnterpriseCertify, Model model) {
        //model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
        List<P2pAuditRecord> list = p2pAuditRecordService.findById(p2pEnterpriseCertify.getId());
        model.addAttribute("list", list);
        return "p2p/back/user/certifyAudit/p2pAuditRecordFormView";
    }

    /**
     * 营业执照下载
     *
     * @param address
     * @param request
     * @param response
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "download")
    public String download(@RequestParam String address, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        UploadFileUtils.download(Encodes.urlDecode(address), request, response);
        return null;
    }
}