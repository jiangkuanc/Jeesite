/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
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

import cn.id5.gboss.bussiness.validator.service.app.QueryValidatorServices;

import com.dagongsoft.p2p.user.entity.P2pAuditRecord;
import com.dagongsoft.p2p.user.entity.P2pCertificationDatabase;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.service.P2pAuditRecordService;
import com.dagongsoft.p2p.user.service.P2pCertificationDatabaseService;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.utils.CertificateState;
import com.dagongsoft.p2p.utils.CheckIdentityUtils;
import com.dagongsoft.p2p.utils.IdcardValidator;
import com.dagongsoft.p2p.utils.PermissionUtils;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.interceptor.Token;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * 注册用户的身份认证状态及材料Controller
 *
 * @author zhenghsuo
 * @version 2016-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/user/p2pRegUserCertify")
public class P2pRegUserCertifyController extends BaseController {

    @Autowired
    private P2pRegUserCertifyService p2pRegUserCertifyService;
    @Autowired
    private P2pAuditRecordService p2pAuditRecordService;
    @Autowired
    private P2pCertificationDatabaseService p2pCertificationDatabaseService;
    @Resource
    private QueryValidatorServices queryValidatorServices;
    private static String username;        //用户名
    private static String password;        //密码
    private static String datasource;    //数据类型
    private static String key;            //加密解密key
    private static String vector;        //加密解密向量

    static {
        username = Global.getConfig("userCertify.username");
        password = Global.getConfig("userCertify.password");
        datasource = Global.getConfig("userCertify.dataType");
        key = Global.getConfig("userCertify.key");
        vector = Global.getConfig("userCertify.vector");
    }

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

    @RequiresPermissions("user:p2pRegUserCertify:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRegUserCertify p2pRegUserCertify, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRegUserCertify> page = p2pRegUserCertifyService.findPage(new Page<P2pRegUserCertify>(request, response), p2pRegUserCertify);
        model.addAttribute("page", page);
        return "modules/user/p2pRegUserCertifyList";
    }

    @RequiresPermissions("user:p2pRegUserCertify:view")
    @RequestMapping(value = "form")
    public String form(P2pRegUserCertify p2pRegUserCertify, Model model) {
        model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);
        return "modules/user/p2pRegUserCertifyForm";
    }

    @RequiresPermissions("user:p2pRegUserCertify:edit")
    @RequestMapping(value = "save")
    public String save(P2pRegUserCertify p2pRegUserCertify, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRegUserCertify)) {
            return form(p2pRegUserCertify, model);
        }
        p2pRegUserCertifyService.save(p2pRegUserCertify);
        addMessage(redirectAttributes, "保存注册用户的身份认证状态及材料成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pRegUserCertify/?repage";
    }

    @RequiresPermissions("user:p2pRegUserCertify:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRegUserCertify p2pRegUserCertify, RedirectAttributes redirectAttributes) {
        p2pRegUserCertifyService.delete(p2pRegUserCertify);
        addMessage(redirectAttributes, "删除注册用户的身份认证状态及材料成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pRegUserCertify/?repage";
    }

    /**
     * 校验身份证号格式和合法性、可用性
     *
     * @param idNumber
     * @return
     */

    @RequestMapping(value = "checkIdNumber")
    @ResponseBody
    public String checkIdNumber(@RequestParam String idNumber) {
        JSONObject json = new JSONObject();
        try {
            if (new IdcardValidator().isValidate18Idcard(idNumber) && p2pRegUserCertifyService.getByIdNumber(idNumber)) {
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
    @Token(remove = true)
    public String userCertify(P2pRegUserCertify p2pRegUserCertify, MultipartHttpServletRequest multipartRequest, HttpSession session) {
        try {
            User user = (User) session.getAttribute("user");
            List<Integer> list1 = new ArrayList<Integer>();
            list1.add(CertificateState.ENTERPRISE_CERTIFICATION);
            list1.add(CertificateState.ENTERPRISE_CERTIFICATION_FAILURE);
            list1.add(CertificateState.ENTERPRISE_CERTIFICATION_SUCCESS);
            list1.add(CertificateState.IDENTITY_CERTIFICATION_FINISHED);
            list1.add(CertificateState.NEW_REGISTERED_USERS);
            if (PermissionUtils.ctrlPermission(session, list1, null) == false) {
                return "modules/front/state/error";
            }
            //进行身份匹配查询
            P2pCertificationDatabase p2pCertificationDatabase = new P2pCertificationDatabase();
            p2pCertificationDatabase.setIdNumber(p2pRegUserCertify.getIdNumber());
            p2pCertificationDatabase.setRealName(p2pRegUserCertify.getRealName());
            //初始化匹配结果标识
            boolean flag = false;
            //通过身份证号查询数据库中的姓名
            P2pCertificationDatabase p2p = p2pCertificationDatabaseService.findByIdNumber(p2pCertificationDatabase);
            //判断是否存在,如果不存在就访问外部身份认证webservice
            if (p2p == null || "".equals(p2p.getRealName())) {
                //判断是否启用外部身份认证
                if ("1".equals(Global.getConfig("userCertify.isCertify"))) {
                    System.setProperty("javax.net.ssl.trustStore", "CheckID.keystore");
                    String resultXML = "";
                    String asd = "";
                    //单条
                    try {
                        resultXML = queryValidatorServices.querySingle(CheckIdentityUtils.encode(key, username.getBytes()), CheckIdentityUtils.encode(key, password.getBytes()),
                                CheckIdentityUtils.encode(key, datasource.getBytes()), CheckIdentityUtils.encode(key, (p2pCertificationDatabase.getRealName() + "," + p2pCertificationDatabase.getIdNumber()).getBytes("GBK")));//对参数进行加密，执行webservice查询
                        byte[] b = new sun.misc.BASE64Decoder().decodeBuffer(resultXML);//对结果进行BASE64解码
                        asd = new String(CheckIdentityUtils.decode(key, b), "GBK");//进行解密
                        flag = CheckIdentityUtils.checkIdentity(asd);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    //flag = true;
                } else {
                    flag = true;//模拟
                }
                if (flag) {
                    p2pCertificationDatabase.setId(IdGen.uuid());//设置ID
                    p2pCertificationDatabase.setUpdatetime(new Date());//设置身份信息更新时间
                    p2pCertificationDatabaseService.insertNewInfo(p2pCertificationDatabase);//将正确身份信息添加到数据库
                }
            } else if (!p2p.getRealName().equals(p2pCertificationDatabase.getRealName())) {
                //如果数据库不匹配就返回最终结果
                flag = false;
            } else {
                //如果数据库匹配
                flag = true;
            }
            // 将flag存入后台，让后台人员进行审核,注释日期20170608
            //if(flag == false){
            //return "modules/front/user/userCertify";
            //}

            //进行上传操作
            List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);
            //进行实名认证信息添加
            Integer count = 0;
            if (p2pRegUserCertify.getInhandIsReject() == null || p2pRegUserCertify.getInhandIsReject() == 0) {
                p2pRegUserCertify.setIdCardInhand(list.get(count));//将上传照片地址添加到对应用户实名认证信息
                p2pRegUserCertify.setInhandIsReject(null);
                p2pRegUserCertify.setInhandRejectReason(null);
                count++;
            }
            if (p2pRegUserCertify.getFrontIsReject() == null || p2pRegUserCertify.getFrontIsReject() == 0) {
                p2pRegUserCertify.setIdCardFront(list.get(count));
                p2pRegUserCertify.setFrontIsReject(null);
                p2pRegUserCertify.setFrontRejectReason(null);
                count++;
            }
            if (p2pRegUserCertify.getBackIsReject() == null || p2pRegUserCertify.getBackIsReject() == 0) {
                p2pRegUserCertify.setIdCardBack(list.get(count));
                p2pRegUserCertify.setBackIsReject(null);
                p2pRegUserCertify.setBackRejectReason(null);
                count++;
            }
            if (p2pRegUserCertify.getAttorneyIsReject() == null || p2pRegUserCertify.getAttorneyIsReject() == 0) {
                p2pRegUserCertify.setPowerOfAttorney(list.get(count));
                p2pRegUserCertify.setAttorneyIsReject(null);
                p2pRegUserCertify.setAttorneyRejectReason(null);
                count++;
            }
            p2pRegUserCertify.setAuditState(3);//设置审核状态为待审核
            p2pRegUserCertify.setUser(user);//让用户表与实名认证表进行账号关联
            p2pRegUserCertify.setSubmitTime(new Date());//设置提交时间

            if (flag) {
                //实名认证，匹配成功
                p2pRegUserCertify.setAutoCertifyState(1);
            } else {
                //实名认证，匹配不成功
                p2pRegUserCertify.setAutoCertifyState(0);
            }
            p2pRegUserCertifyService.saveOrUpdateUserCertify(p2pRegUserCertify, user);
            return "modules/front/user/certifyCommitSuccess2";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + frontPath;
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