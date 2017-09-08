package com.dagongsoft.p2p.user.web.back;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.user.entity.P2pAssetValuation;
import com.dagongsoft.p2p.user.entity.P2pAuditRecord;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.entity.P2pGuarantee;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pAuditRecordService;
import com.dagongsoft.p2p.user.service.back.UserListService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;

/**
 * 用户管理：用户列表Controller
 *
 * @author Zeus
 * @version 2016-10-24
 */
@Controller
@RequestMapping(value = "${adminPath}/user/userList")
public class UserListController extends BaseController {

    @Resource
    private UserListService userListService;
    @Resource
    private P2pAuditRecordService p2pAuditRecordService;


    /**
     * 企业用户列表
     *
     * @param User
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "enterpriseList")
    public String enterpriseList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {

            Page<User> page = userListService.getEnterprisePage(new Page<User>(request, response), user);
            model.addAttribute("page", page);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/userList/p2pEnterpriseList";
    }

    /**
     * 企业其他基本信息页
     *
     * @param userid
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "otherBaseInfo")
    public String otherBaseInfo(String userid, Model model) {
        try {
            User user = new User();
            user.setId(userid);
            user = userListService.getOtherBaseInfo(user);
            model.addAttribute("user", user);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/userList/p2pEnterpriseOtherBaseInfo";
    }

    /**
     * 企业基本信息
     *
     * @param userid
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "enterpriseBaseInfo")
    @ResponseBody
    public String enterpriseBaseInfo(String userid) {
        String data = null;
        try {
            P2pEnterpriseCertify p2pEnterpriseCertify = userListService.getEnterpriseBaseInfo(userid);
            ObjectMapper mapper = new ObjectMapper();
            data = mapper.writeValueAsString(p2pEnterpriseCertify);
        } catch (JsonProcessingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return data;
    }

    /**
     * 企业详情
     *
     * @param userid
     * @param model
     * @return
     */
    @RequestMapping(value = "enterpriseDetails")
    public String enterpriseDetails(String userid, Model model) {
        try {
            model.addAttribute("userid", userid);
            //根据userid 获取企业信息
            P2pEnterpriseCertify p2pEnterpriseCertify = userListService.getEnterpriseBaseInfo(userid);
            model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
            //根据企业认证id 获取企业认证记录
            P2pAuditRecord p2pAuditRecord = new P2pAuditRecord();
            p2pAuditRecord.setReferenceId(p2pEnterpriseCertify.getId());
            p2pAuditRecord.setAuditType(Integer.parseInt(DictUtils.getDictValue("企业认证", "audit_type", "")));
            List<P2pAuditRecord> p2pAuditRecordList = p2pAuditRecordService.findAuditRecordListByIdAndType(p2pAuditRecord);
            model.addAttribute("p2pAuditRecordList", p2pAuditRecordList);
            return "p2p/back/user/userList/p2pEnterpriseDetails";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/userList/p2pEnterpriseDetails";
    }

    /**
     * 投资机构列表
     *
     * @param user
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "agencyList")
    public String agencyList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<User> page = userListService.getAgencyPage(new Page<User>(request, response), user);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "p2p/back/user/userList/p2pAgencyList";
    }

    /**
     * 投资机构后台注册
     *
     * @param user
     * @param p2pUserInformation
     * @param redirectAttributes
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "agencyRegister")
    public String agencyRegister(MultipartHttpServletRequest multipartRequest, User user, P2pUserInformation p2pUserInformation, RedirectAttributes redirectAttributes, Model model) {
        try {
            userListService.agencyRegister(multipartRequest, user, p2pUserInformation);
            addMessage(redirectAttributes, "注册成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/user/userList/agencyList?repage";
    }

    /**
     * 投资机构基本信息
     *
     * @param userid
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "agencyBaseInfo")
    public String agencyBaseInfo(String userid, Model model) {
        try {
            User user = userListService.getAgencyBaseInfo(userid);
            model.addAttribute("user", user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/userList/p2pAgencyBaseInfo";
    }


    /**
     * 个人列表
     *
     * @param user
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "personalList")
    public String personalList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<User> page = userListService.getPersonalPage(new Page<User>(request, response), user);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/userList/p2pPersonalList";
    }

    /**
     * 个人基本信息
     *
     * @param userid
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "personalBaseInfo")
    public String personalBaseInfo(String userid, Model model) {
        try {
            User user = userListService.getPersonalBaseInfo(userid);
            model.addAttribute("user", user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "p2p/back/user/userList/p2pPersonalBaseInfo";
    }


    /**
     * 评估公司列表
     *
     * @param user
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "assetList")
    public String assetList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<User> page = userListService.getAssetPage(new Page<User>(request, response), user);
            model.addAttribute("page", page);
        } catch (Exception e) {
            // TODO: handle exception
        }
        return "p2p/back/user/userList/p2pAssetList";
    }

    /**
     * 评估公司后台注册页面
     *
     * @return
     */
    @RequestMapping(value = "assetRegisterForm")
    public String assetRegisterForm() {
        return "p2p/back/user/userList/p2pAssetRegister";
    }

    /**
     * 评估公司后台注册
     *
     * @return
     */
    @RequestMapping(value = "assetRegister")
    public String assetRegister(MultipartHttpServletRequest multipartRequest, P2pAssetValuation p2pAssetValuation, RedirectAttributes redirectAttributes, Model model) {
        try {
            userListService.assetRegister(multipartRequest, p2pAssetValuation);
            addMessage(redirectAttributes, "注册成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/user/userList/assetList?repage";
    }

    /**
     * 评估公司基本信息
     *
     * @param userid
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "assetBaseInfo")
    public String assetBaseInfo(String userid, Model model) {
        try {
            User user = userListService.getAssetBaseInfo(userid);
            model.addAttribute("user", user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/userList/p2pAssetBaseInfo";
    }

    /**
     * 担保公司基本信息
     *
     * @param userid
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "guaranteeBaseInfo")
    public String guaranteeBaseInfo(String userid, Model model) {
        try {
            User user = userListService.getGuaranteeBaseInfo(userid);
            model.addAttribute("user", user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/userList/p2pGuaranteeBaseInfo";
    }


    /**
     * 担保公司列表
     *
     * @param user
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "guaranteeList")
    public String guaranteeList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<User> page = userListService.getGuaranteePage(new Page<User>(request, response), user);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/user/userList/p2pGuaranteeList";
    }

    /**
     * 担保公司后台注册页面
     *
     * @return
     */
    @RequestMapping(value = "guaranteeRegisterForm")
    public String guaranteeRegisterForm() {
        return "p2p/back/user/userList/p2pGuaranteeRegister";
    }

    /**
     * 担保公司后台注册
     *
     * @return
     */
    @RequestMapping(value = "guaranteeRegister")
    public String guaranteeRegister(MultipartHttpServletRequest multipartRequest, P2pGuarantee p2pGuarantee, RedirectAttributes redirectAttributes, Model model) {
        try {
            userListService.guaranteeRegister(multipartRequest, p2pGuarantee);
            addMessage(redirectAttributes, "注册成功！");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/user/userList/guaranteeList?repage";
    }
}
