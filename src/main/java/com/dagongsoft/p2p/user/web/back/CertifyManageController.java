package com.dagongsoft.p2p.user.web.back;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.user.entity.P2pAuditRecord;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.service.P2pAuditRecordService;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.back.CertifyManageService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * 用户管理：认证审核Controller
 *
 * @author Zeus
 * @2016-10-25
 */
@Controller
@RequestMapping(value = "${adminPath}/user/certifyManage")
public class CertifyManageController extends BaseController {

    @Resource
    private CertifyManageService certifyManageService;
    @Resource
    private P2pRegUserCertifyService p2pRegUserCertifyService;
    @Resource
    private P2pAuditRecordService p2pAuditRecordService;
    @Resource
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;

    /**
     * 企业认证列表
     *
     * @param user
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = {"enterpriseCertifyList"})
    public String enterpriseCertifyList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<User> page = certifyManageService.getEnterpriseCertifyPage(new Page<User>(request, response), user);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "p2p/back/user/certifyManage/p2pEnterpriseCertifyList";
    }

    /**
     * 企业代理人认证页面
     *
     * @param userid
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = {"enterpriseAgentCertify"})
    public String enterpriseAgentCertify(String userid, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            //Page<User> page = certifyManageService.getEnterpriseCertifyPage(new Page<User>(request, response),user);
            //model.addAttribute("page", page);

            // 根据user查询身份认证表信息
            User user = new User();
            user.setId(userid);

            P2pRegUserCertify pruc = new P2pRegUserCertify();
            pruc.setUser(user);
            pruc = p2pRegUserCertifyService.findP2pRegUserCertifyByProperty(pruc);

            P2pAuditRecord p2pAuditRecord = new P2pAuditRecord();
            p2pAuditRecord.setReferenceId(pruc.getId());
            p2pAuditRecord.setAuditType(Integer.parseInt(DictUtils.getDictValue("身份认证", "audit_type", "")));
            Page<P2pAuditRecord> page = p2pAuditRecordService.findAuditRecordListByIdAndType(new Page<P2pAuditRecord>(request, response), p2pAuditRecord);
            model.addAttribute("page", page);
            model.addAttribute("p2pRegUserCertify", pruc);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/certifyManage/p2pEnterpriseAgentCertify";
    }


    /**
     * 企业代理人身份认证审核
     *
     * @param p2pAuditRecord
     * @param p2pRegUserCertify
     * @param redirectAttributes
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "enterpriseAgentAudit")
    public String enterpriseAgentAudit(P2pAuditRecord p2pAuditRecord, P2pRegUserCertify p2pRegUserCertify, RedirectAttributes redirectAttributes) {
        try {
            certifyManageService.enterpriseAgentAudit(p2pAuditRecord, p2pRegUserCertify);
            addMessage(redirectAttributes, "操作成功,认证状态:" + DictUtils.getDictLabels(p2pAuditRecord.getAuditOpinion(), "audit_state", ""));
            return "redirect:" + Global.getAdminPath() + "/user/certifyManage/enterpriseCertifyList/?repage";
        } catch (Exception e) {
            e.printStackTrace();
            addMessage(redirectAttributes, "操作失败");
            return "redirect:" + Global.getAdminPath() + "/user/certifyManage/enterpriseCertifyList/?repage";
        }

    }

    /**
     * 企业认证页面
     *
     * @param userid
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = {"enterpriseCertify"})
    public String enterpriseCertify(String userid, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            model.addAttribute("userid", userid);

            User user = new User();
            user.setId(userid);
            P2pEnterpriseCertify p2pEnterpriseCertify = new P2pEnterpriseCertify();
            p2pEnterpriseCertify.setUser(user);
            p2pEnterpriseCertify = p2pEnterpriseCertifyService.findP2pEnterpriseCertifyByProperty(p2pEnterpriseCertify);

            P2pAuditRecord p2pAuditRecord = new P2pAuditRecord();
            p2pAuditRecord.setReferenceId(p2pEnterpriseCertify.getId());
            p2pAuditRecord.setAuditType(Integer.parseInt(DictUtils.getDictValue("企业认证", "audit_type", "")));
            Page<P2pAuditRecord> page = p2pAuditRecordService.findAuditRecordListByIdAndType(new Page<P2pAuditRecord>(request, response), p2pAuditRecord);

            model.addAttribute("page", page);
            model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/certifyManage/p2pEnterpriseCertify";
    }

    /**
     * 企业认证审核
     *
     * @param p2pAuditRecord
     * @param p2pEnterpriseCertify
     * @param redirectAttributes
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "enterpriseAudit")
    public String enterpriseAudit(P2pAuditRecord p2pAuditRecord, P2pEnterpriseCertify p2pEnterpriseCertify,
                                  RedirectAttributes redirectAttributes) {
        try {
            certifyManageService.enterpriseAudit(p2pAuditRecord, p2pEnterpriseCertify);

            addMessage(redirectAttributes, "操作成功,认证状态:" + DictUtils.getDictLabels(p2pAuditRecord.getAuditOpinion(), "audit_state", ""));
            return "redirect:" + Global.getAdminPath() + "/user/certifyManage/enterpriseCertifyList/?repage";
        } catch (Exception e) {
            addMessage(redirectAttributes, "操作失败");
            return "redirect:" + Global.getAdminPath() + "/user/certifyManage/enterpriseCertifyList/?repage";
        }

    }

    /**
     * 个人认证列表
     *
     * @param user
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = {"personalCertifyList"})
    public String personalCertifyList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<User> page = certifyManageService.getPersonalCertifyPage(new Page<User>(request, response), user);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/certifyManage/p2pPersonalCertifyList";
    }

    /**
     * 个人认证页面
     *
     * @param userid
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = {"personalCertify"})
    public String personalCertify(String userid, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            // 根据user查询身份认证表信息
            User user = new User();
            user.setId(userid);

            P2pRegUserCertify pruc = new P2pRegUserCertify();
            pruc.setUser(user);
            pruc = p2pRegUserCertifyService.findP2pRegUserCertifyByProperty(pruc);

            P2pAuditRecord p2pAuditRecord = new P2pAuditRecord();
            p2pAuditRecord.setReferenceId(pruc.getId());
            p2pAuditRecord.setAuditType(Integer.parseInt(DictUtils.getDictValue("身份认证", "audit_type", "")));
            Page<P2pAuditRecord> page = p2pAuditRecordService.findAuditRecordListByIdAndType(new Page<P2pAuditRecord>(request, response), p2pAuditRecord);
            model.addAttribute("page", page);
            model.addAttribute("p2pRegUserCertify", pruc);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/certifyManage/p2pPersonalCertify";
    }

    /**
     * 个人身份认证审核
     *
     * @param p2pAuditRecord
     * @param p2pRegUserCertify
     * @param redirectAttributes
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "personalAudit")
    public String personalAudit(P2pAuditRecord p2pAuditRecord, P2pRegUserCertify p2pRegUserCertify, RedirectAttributes redirectAttributes) {
        try {
            certifyManageService.personalAgentAudit(p2pAuditRecord, p2pRegUserCertify);
            addMessage(redirectAttributes, "操作成功,认证状态:" + DictUtils.getDictLabels(p2pAuditRecord.getAuditOpinion(), "audit_state", ""));
            return "redirect:" + Global.getAdminPath() + "/user/certifyManage/personalCertifyList";
        } catch (Exception e) {
            e.printStackTrace();
            addMessage(redirectAttributes, "操作失败");
            return "redirect:" + Global.getAdminPath() + "/user/certifyManage/personalCertifyList";
        }

    }
}
