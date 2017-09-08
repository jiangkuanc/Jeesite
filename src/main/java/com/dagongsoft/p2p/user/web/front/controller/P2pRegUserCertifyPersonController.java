/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.web.front.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.activiti.engine.impl.util.json.JSONObject;
import org.apache.commons.lang3.BooleanUtils;
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

import com.dagongsoft.p2p.user.entity.P2pAuditRecord;
import com.dagongsoft.p2p.user.entity.P2pCertificationDatabase;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.service.P2pAuditRecordService;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.user.web.front.util.JoeZJVerifyGateway;
import com.dagongsoft.p2p.user.web.front.util.ZJException;
import com.dagongsoft.p2p.user.web.front.util.ZJVerifyGateway;
import com.dagongsoft.p2p.utils.CertificateState;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * 注册用户的身份认证状态及材料Controller
 *
 * @author zhenghsuo
 * @version 2016-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/user/p2pRegUserCertifyPerson")
public class P2pRegUserCertifyPersonController extends BaseController {

    @Autowired
    private P2pRegUserCertifyService p2pRegUserCertifyService;
    @Autowired
    private P2pAuditRecordService p2pAuditRecordService;

    @ModelAttribute
    public P2pRegUserCertify get(@RequestParam(required = false) String id) {
        P2pRegUserCertify entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRegUserCertifyService.get(id);
        }
        if (entity == null) {
            entity = new P2pRegUserCertify();
        }
        return entity;
    }

    /**
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "list")
    public String list(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "modules/front/investment/userPersonCertifyList";
    }


    @RequestMapping(value = "delete")
    public String delete(P2pRegUserCertify p2pRegUserCertify, RedirectAttributes redirectAttributes) {
        p2pRegUserCertifyService.delete(p2pRegUserCertify);
        addMessage(redirectAttributes, "删除注册用户的身份认证状态及材料成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pRegUserCertify/?repage";
    }

    @Autowired
    private P2pUserInformationService p2pUserInformationService;

    /**
     * 查询当前身份证号是否存在
     *
     * @param idNumber
     * @return
     */
    @RequestMapping(value = "getByIdNumber")
    @ResponseBody
    public String getByIdNumber(@RequestParam String idNumber) {
        JSONObject json = new JSONObject();
        try {
            if (p2pRegUserCertifyService.getByIdNumber(idNumber) == true) {
                json.put("valid", true);
            } else {
                json.put("valid", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json.toString();
    }


    /**
     * 前台提交实名认证信息
     *
     * @param p2pRegUserCertify
     * @param session
     * @return
     */
    @RequestMapping(value = "userCertify", method = RequestMethod.POST)
    @Transactional(readOnly = false)
    public String userCertify(P2pRegUserCertify p2pRegUserCertify, MultipartHttpServletRequest multipartRequest, HttpSession session) {
        try {
            User user = (User) session.getAttribute("user");
            List<Integer> list1 = new ArrayList<Integer>();
            list1.add(CertificateState.unRegisterOrLogin);
            list1.add(CertificateState.registerUnPhone);
            list1.add(CertificateState.registerUnIdCard);
            list1.add(CertificateState.registerUnEmail);
            list1.add(CertificateState.registerUnBindBank);
            list1.add(CertificateState.othersState);

            //进行身份匹配查询
            P2pCertificationDatabase p2pCertificationDatabase = new P2pCertificationDatabase();
            p2pCertificationDatabase.setIdNumber(p2pRegUserCertify.getIdNumber());
            p2pCertificationDatabase.setRealName(p2pRegUserCertify.getRealName());

            /**
             * 中金网关
             */
            String zjURL = "";                //中金网关地址
            if (!ZJCanConnecting(zjURL)) {    //连接中金网关
                throw new ZJException("中金网关连接异常>>>>>>");
            }
            /**
             * 调用中金网关进行身份证和姓名的校验
             */
            Boolean retFromZJ = ZJVerifyGateway(p2pRegUserCertify.getIdNumber(), p2pRegUserCertify.getRealName());
            if (BooleanUtils.isFalse(retFromZJ)) {
                throw new ZJException("中金网关>>>>>>身份证和姓名模块调用异常");
            }

            //进行上传操作
            if (p2pRegUserCertify.getInhandIsReject() == null || p2pRegUserCertify.getInhandIsReject() == 0) {
                p2pRegUserCertify.setInhandIsReject(null);
                p2pRegUserCertify.setInhandRejectReason(null);
            }
            if (p2pRegUserCertify.getFrontIsReject() == null || p2pRegUserCertify.getFrontIsReject() == 0) {
                p2pRegUserCertify.setFrontIsReject(null);
                p2pRegUserCertify.setFrontRejectReason(null);
            }
            if (p2pRegUserCertify.getBackIsReject() == null || p2pRegUserCertify.getBackIsReject() == 0) {
                p2pRegUserCertify.setBackIsReject(null);
                p2pRegUserCertify.setBackRejectReason(null);
            }

            List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);

            //进行实名认证信息添加
            Integer count = 0;
            if (p2pRegUserCertify.getInhandIsReject() == null || p2pRegUserCertify.getInhandIsReject() == 0) {
                p2pRegUserCertify.setIdCardInhand(list.get(count));//将上传照片地址添加到对应用户实名认证信息
                count++;
            }
            if (p2pRegUserCertify.getFrontIsReject() == null || p2pRegUserCertify.getFrontIsReject() == 0) {
                p2pRegUserCertify.setIdCardFront(list.get(count));
                count++;
            }
            if (p2pRegUserCertify.getBackIsReject() == null || p2pRegUserCertify.getBackIsReject() == 0) {
                p2pRegUserCertify.setIdCardBack(list.get(count));
                count++;
            }

            p2pRegUserCertify.setAuditState(3);//设置审核状态为待审核
            p2pRegUserCertify.setUser(user);//让用户表与实名认证表进行账号关联
            p2pRegUserCertify.setSubmitTime(new Date());//设置提交时间
            p2pRegUserCertifyService.saveOrUpdateUserCertify(p2pRegUserCertify, user);

            return "modules/front/user/certifyCommitPersonSuccess";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + frontPath;
    }


    /**
     * 中金网关连接方法
     *
     * @param zjURL
     * @return
     * @throws ZJException
     */
    private boolean ZJCanConnecting(String zjURL) throws ZJException {
        JoeZJVerifyGateway joeZJVerifyGateway = new JoeZJVerifyGateway();
        return joeZJVerifyGateway.isCanConnecting("");
    }

    /**
     * @param idNumber
     * @param realName
     * @return
     * @throws ZJException
     */
    private boolean ZJVerifyGateway(String idNumber, String realName) throws ZJException {
        ZJVerifyGateway zjVerifyGateway = new JoeZJVerifyGateway();
        return zjVerifyGateway.verifyIdCardAndName(idNumber, realName);

    }


    /**
     * 后台用户身份认证
     *
     * @param p2pRegUserCertify
     * @param session
     * @return
     */
    @RequestMapping(value = "backUserCertify")
    @Transactional(readOnly = false)
    public String backUserCertify(P2pAuditRecord p2pAuditRecord, P2pRegUserCertify p2pRegUserCertify, RedirectAttributes redirectAttributes) {
        try {
            //保存认证记录
            p2pAuditRecordService.save(p2pAuditRecord);
            //身份认证表修改认证状态
            p2pRegUserCertify.setId(p2pAuditRecord.getReferenceId());
            p2pRegUserCertify.setAuditState(Integer.parseInt(p2pAuditRecord.getAuditOpinion()));
            p2pRegUserCertify.setAuditPersonId(p2pAuditRecord.getAuditPersonId());
            p2pRegUserCertify.setAuditTime(p2pAuditRecord.getAuditTime());
            p2pRegUserCertify.setAuditExplain(p2pAuditRecord.getAuditResult());
            p2pRegUserCertifyService.saveOrUpdateUserCertify(p2pRegUserCertify, null);
            addMessage(redirectAttributes, "操作成功,认证状态:" + DictUtils.getDictLabels(p2pAuditRecord.getAuditOpinion(), "audit_state", ""));
            return "redirect:" + Global.getAdminPath() + "/user/p2pEnterpriseCertify/list/?repage";
        } catch (Exception e) {
            addMessage(redirectAttributes, "操作失败");
            return "redirect:" + Global.getAdminPath() + "/user/p2pEnterpriseCertify/list/?repage";
        }

    }
}