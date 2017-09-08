package com.dagongsoft.p2p.user.web.front.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.risk.entity.P2pMember;
import com.dagongsoft.p2p.risk.entity.P2pMemberPayDetails;
import com.dagongsoft.p2p.risk.service.P2pMemberPayDetailsService;
import com.dagongsoft.p2p.risk.service.P2pMemberService;
import com.dagongsoft.p2p.user.dao.P2pAccountDao;
import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.user.service.front.P2pAccountService;
import com.dagongsoft.p2p.user.web.front.interceptor.AuthProcessStateConts;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 绑定银行卡Controller
 *
 * @author Joe
 */

@Controller
@RequestMapping(value = "${adminPath}/user/bankCard")
public class BankbindingController extends P2pUserInfomationPersonBaseController {

    @Autowired
    private P2pUserInformationService p2pUserInformationService;
    @Autowired
    private P2pRegUserCertifyService p2pRegUserCertifyService;
    @Autowired
    private P2pMemberService p2pMemberService;

    @Autowired
    private P2pMemberPayDetailsService p2pMemberPayDetailsService;

    @Autowired
    public P2pAccountDao p2pAccountDao;
    @Autowired
    public P2pAccountService p2pAccountService;

    /**
     * 绑定银行卡页面
     *
     * @return
     */
    @RequestMapping("binding")
    public String bankbinding(HttpSession session, Model model) {
        /**
         * 是否进行实名认证
         *
         */
        String bankCardUrl = "";
        try {
            User user = (User) session.getAttribute("user");
            P2pUserInformation p2pUserInformation = p2pUserInformationService.get(user.getId());
            P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.getByUserId(user.getId());
            if (p2pRegUserCertify == null) {
                //如果认证信息为null,进行实名认证
                return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/certify";
            }
            /**
             * 进行是否实名认证判断
             */
            //未绑定银行卡
            if (AuthProcessStateConts.unAuthBankCard == p2pUserInformation.getCertificateState()) {
                return AuthProcessStateConts.unAuthBankCardPage;
            }
            //已绑定银行卡,未进行风险测评1020
            if (AuthProcessStateConts.unAuthRiskEvaluate == p2pUserInformation.getCertificateState()) {
                P2pAccount p2pAccount = p2pAccountDao.getAccountByUserId(user.getId());
                model.addAttribute("p2pAccount", p2pAccount);
                return "modules/person/p2pAccountPage";
            }
            //已绑定银行卡,已进行风险测评,未成为会员
            if (AuthProcessStateConts.unBeMember == p2pUserInformation.getCertificateState()) {
                //
            }
            //实名审核中
            if (p2pUserInformation.getCertificateState() == AuthProcessStateConts.authingIdCard && (p2pRegUserCertify.getAuditState() == 3)) {
//				return AuthProcessStateConts.unAuthBankCardPage;
                return "redirect:" + Global.getAdminPath() + "/user/bankManage/bankInfo";
                //return "redirect:"+Global.getAdminPath()+"/user/idCardCertify/authingIdCard";//authingIdCard
            }
            //实名认证通过
            if (p2pUserInformation.getCertificateState() == AuthProcessStateConts.authingIdCard && p2pRegUserCertify.getAuditState() == 1) {
                return AuthProcessStateConts.unAuthBankCardPage;
            }
            //实名认证失败,从新进入实名认证
            if (AuthProcessStateConts.failAuthIdCard == p2pUserInformation.getCertificateState() && p2pRegUserCertify.getAuditState() == 2) {
                return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/certify";
            }
            //获取认证状态
            int state = p2pUserInformation.getCertificateState();
            //System.out.println(state);
            if (state == 1010) {
                //未进行实名认证
                return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/certify";
            }
//			P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.getByUserId(user.getId());
//			//认证情况
//			if(p2pRegUserCertify==null){
//				return "redirect:"+Global.getAdminPath()+"/user/idCardCertify/certify";
//			}
            //后台认证审核通过
            if (p2pRegUserCertify.getAuditState() == 1) {
                return AuthProcessStateConts.unAuthBankCardPage;
            }
            if (p2pRegUserCertify.getAuditState() == 3 || p2pRegUserCertify.getAuditState() == 2) {
                return "redirect:" + Global.getAdminPath() + "/user/bankManage/bankInfo";
            }
            Integer cerState = p2pRegUserCertify.getAuditState();
            //进行实名认证
            if (cerState == null || cerState == 3) {
                if (p2pUserInformation.getCertificateState() == 1001) {
                    return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/certify";
                }
                //实名认证审核中
                else if (p2pUserInformation.getCertificateState() == 2001) {
                    return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/authingIdCard";
                }
                //实名认证完成,进行绑卡
                else if (p2pUserInformation.getCertificateState() == 1010) {
                    return AuthProcessStateConts.unAuthBankCardPage;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:" + Global.getFrontPath();

        }
        return bankCardUrl;
    }

    /**
     * 前端请求获取用户认证状态
     *
     * @param session
     * @return
     */
    @RequestMapping("getCertifyStateVal")
    @ResponseBody
    public String certifyStateVal(HttpSession session) {
        int certifyFromDb = 0, frontCertifyVal = 0;
        try {
            User user = (User) session.getAttribute("user");
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);    //从当前user中得到P2pUserInformation
            certifyFromDb = p2pUserInformation.getCertificateState();        //从数据库中获取相应的认证状态码值
            frontCertifyVal = getCertifyForCurrentUser(certifyFromDb);
            //TODO Mock Test frontCertifyVal = -4,-3,-2,-1,0,1,2,3
            //Mock Test frontCertifyVal = 0;		//未完成银行卡绑定
            //Mock Test frontCertifyVal = -3;
            //frontCertifyVal = -3;					//实名认证失败
        } catch (Exception e) {
            frontCertifyVal = -4;
            return JsonMapper.toJsonString(String.valueOf(frontCertifyVal));//返回前端请求认证异常状态码值
        }
        return JsonMapper.toJsonString(String.valueOf(frontCertifyVal));    //返回前端请求认证状态码值
    }

    /**
     * 获取当前用户的认证状态值从数库中
     * 该层将后台认证 状态转换为前端状态码
     * -4.网络异常
     * -3.实名认证失败
     * -2.实名认证审核
     * -1.未进行实名认证
     * 0.未进行绑卡
     * 1.未进行风险测评
     * 2.未成为会员
     * 3.实名认证完成
     *
     * @param certifyFromDb
     */

    private int getCertifyForCurrentUser(int certifyFromDb) {
        int frontCertifyStateVal = 0;
        switch (certifyFromDb) {
            case 1001:
                frontCertifyStateVal = -1;
                break;
            case 1010:
                frontCertifyStateVal = 0;
                break;
            case 1020:
                frontCertifyStateVal = 1;
                break;
            case 1030:
                frontCertifyStateVal = 2;
                break;
            case 1040:
                frontCertifyStateVal = 3;
                break;
            case 2001:
                frontCertifyStateVal = -2;
                break;
            case 3001:
                frontCertifyStateVal = -3;
                break;
            default:
                break;
        }
        return frontCertifyStateVal;
    }

    /**
     * 绑卡提交信息
     *
     * @param p2pAccount
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("bindBankCard")
    public String bindBankCard(P2pAccount p2pAccount, HttpSession session, Model model, @RequestParam("bankPhone") String bankPhone) {
        try {
            if (p2pAccount != null) {
                User user = (User) session.getAttribute("user");
                P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
                p2pUserInformation.setCertificateState(AuthProcessStateConts.unAuthRiskEvaluate);
                p2pAccount.setUser(user);
                p2pAccountService.save(p2pAccount);
                p2pUserInformation.setUser(user);
                p2pUserInformation.setIsBindBankCard(1);
                p2pUserInformationService.updateCertificateState(p2pUserInformation);
                p2pUserInformationService.updateBindState(p2pUserInformation);
                model.addAttribute("bankPhone", bankPhone);

                return "modules/person/bankCardInfoPage";
            }
        } catch (Exception e) {
            //System.out.println(e);
        }
        return "modules/person/unAuthBankCardPage";

    }

    /**
     * 成为会员页面
     *
     * @param p2pAccount
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("beMember")
    public String beMember(HttpSession session, Model model) {

        try {
            User user = (User) session.getAttribute("user");
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            p2pUserInformation.setUser(user);
            int state = p2pUserInformation.getCertificateState();


            if (state == AuthProcessStateConts.unBeMember) {
                return "modules/person/beMemberPage";
            }
            //如果已成为会员
            if (state == AuthProcessStateConts.authCompleted) {
                return "modules/person/beMemberPage4";
            }
            P2pMember p2pMember = p2pMemberService.get(user.getId());
            if (p2pMember != null) {
                return "redirect:" + Global.getAdminPath() + "/user/bankCard/beMember4";
            }
            P2pMemberPayDetails p2pMemberPayDetails = p2pMemberPayDetailsService.get(user.getId());
            model.addAttribute("p2pMemberPayDetails", p2pMemberPayDetails);
            model.addAttribute("p2pMember", p2pMember);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/person/beMemberPage";
    }

    /**
     * 成为会员页面
     *
     * @param p2pAccount
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("beMember2")
    public String beMember2(HttpSession session, Model model) {
        try {
            User user = (User) session.getAttribute("user");
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            p2pUserInformation.setUser(user);
            int state = p2pUserInformation.getCertificateState();
            /**
             * 进行实名判断
             */
            //未进行身份认证,进行实名认证
            if (state == 1001) {
                return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/certify";
            }
            //未进行绑卡
            if (state == 1010) {
                return "redirect:" + Global.getAdminPath() + "/user/bankCard/binding";
            }
            //未进行风险测评
            if (state == 1020) {
                //进行风险测评
                return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pRiskPaper/riskTest";
            }
            P2pMember p2pMember = p2pMemberService.get(user.getId());
            P2pMemberPayDetails p2pMemberPayDetails = p2pMemberPayDetailsService.get(user.getId());

            model.addAttribute("p2pMemberPayDetails", p2pMemberPayDetails);
            model.addAttribute("p2pMember", p2pMember);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/person/beMemberPage2";
    }

    /**
     * 成为会员页面
     *
     * @param p2pAccount
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("beMember3")
    public String beMember3(HttpSession session, Model model) {
        /**
         * 创建表p2pMember和表P2pMemberPayDetails
         */
        P2pMember p2pMember = new P2pMember();
        P2pMemberPayDetails p2pMemberPayDetails = new P2pMemberPayDetails();
        try {
            User user = (User) session.getAttribute("user");
            //创建会员表
            p2pMember.setJoinMemberTime(new Date());
            p2pMember.setUser(user);
            DateFormat endDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date endDate = endDateFormat.parse("2017-05-31");
            p2pMember.setEndTime(endDate);
            p2pMember.setLastRenewalTime(new Date());
            p2pMember.setMemberState("有效会员");
            p2pMember.setMemberType("个人投资会员");
            p2pMemberService.save(p2pMember);
            //创建会员详情表
            p2pMemberPayDetails.setUser(user);
            p2pMemberPayDetails.setMemberType("个人投资会员");
            p2pMemberPayDetails.setRenewalTime(new Date());
            p2pMemberPayDetails.setStartTime(new Date());
            p2pMemberPayDetails.setEndTime(endDate);
            p2pMemberPayDetails.setPayCost("0.00");
            p2pMemberPayDetails.setPayStyle("银联支付");
            p2pMemberPayDetailsService.save(p2pMemberPayDetails);

            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            p2pUserInformation.setUser(user);
            p2pUserInformation.setCertificateState(AuthProcessStateConts.authCompleted);//实名认证完成
            p2pUserInformationService.updateCertificateState(p2pUserInformation);
            model.addAttribute("p2pMemberPayDetails", p2pMemberPayDetails);
            model.addAttribute("p2pMember", p2pMember);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/person/beMemberPage3";
    }

    /**
     * 成为会员页面
     *
     * @param p2pAccount
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("beMember4")
    public String beMember4(HttpSession session, Model model) {

        try {
            User user = (User) session.getAttribute("user");
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            p2pUserInformation.setUser(user);
            p2pUserInformation.setCertificateState(AuthProcessStateConts.authCompleted);//实名认证完成
            p2pUserInformationService.saveOrUpdateUserPic(p2pUserInformation);
            P2pMember p2pMember = p2pMemberService.get(user.getId());
            P2pMemberPayDetails p2pMemberPayDetails = p2pMemberPayDetailsService.get(user.getId());
            model.addAttribute("p2pMemberPayDetails", p2pMemberPayDetails);
            model.addAttribute("p2pMember", p2pMember);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/person/beMemberPage4";
    }

    /**
     * 实名认证完成
     *
     * @param p2pAccount
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("authComplete")
    public String authComplete(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
        P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.getByUserId(user.getId());
        int userCertifyState = p2pRegUserCertify.getAuditState();
        model.addAttribute("userCertifyState", userCertifyState);
        model.addAttribute("p2pUserInformation", p2pUserInformation);
        p2pUserInformation.setUser(user);
        int state = p2pUserInformation.getCertificateState();
        state = AuthProcessStateConts.authCompleted;
        //推荐标的信息
        Map<String, Object> paramMap = new HashMap<String, Object>();
        List<P2pFinancingInformation> p2pFinancingInformationList = p2pFinancingInformationService.findAllFinancingList(paramMap);
        model.addAttribute("p2pFinancingInformationList", p2pFinancingInformationList);
        String json = JsonMapper.toJsonString(p2pFinancingInformationList);
        model.addAttribute("json", json);


        if (state == AuthProcessStateConts.authCompleted) {
            state = AuthProcessStateConts.authCompleted;//使其成为会员状态
            p2pUserInformation.setCertificateState(state);
            p2pUserInformationService.updateCertificateState(p2pUserInformation);
        }
        return "modules/person/account_generationPage";

    }


    /**
     * 校验手机号是否存在
     *
     * @param bankPhone
     * @return
     */
    @RequestMapping("validBankPhone")
    @ResponseBody
    public String validBankPhone(@RequestParam("bankPhone") String bankPhone) {
        BankPhoneJson bankPhoneJson;
        if (bankPhone != null) {
            bankPhoneJson = new BankPhoneJson(0, "手机号已经存在");
        } else {
            bankPhoneJson = new BankPhoneJson(1, "手机号可以验证");
        }
        return JsonMapper.toJsonString(bankPhoneJson);

    }

    class BankPhoneJson {
        private Integer status;
        private String message;

        public Integer getStatus() {
            return status;
        }

        public void setStatus(Integer status) {
            this.status = status;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        @Override
        public String toString() {
            return "BankPhoneJson [status=" + status + ", message=" + message
                    + "]";
        }

        public BankPhoneJson(Integer status, String message) {
            super();
            this.status = status;
            this.message = message;
        }

        public BankPhoneJson() {
            super();
        }

    }

    /**
     * 风险测评
     *
     * @return
     */
    @RequestMapping("riskEvaluating")
    public String riskEvaluation(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
        p2pUserInformation.setUser(user);
        int state = p2pUserInformation.getCertificateState();
        //已完成风险测评
        if (state != AuthProcessStateConts.unAuthRiskEvaluate && state != AuthProcessStateConts.failAuthIdCard && state != AuthProcessStateConts.authingIdCard && state != AuthProcessStateConts.unAuthBankCard) {
            return "modules/person/riskEvaluateResultPage";
        }
        state = AuthProcessStateConts.unAuthRiskEvaluate;

        if (state == AuthProcessStateConts.unAuthRiskEvaluate) {
            state = AuthProcessStateConts.unBeMember;//使其成为会员状态
            p2pUserInformation.setCertificateState(state);
            p2pUserInformationService.updateCertificateState(p2pUserInformation);
        }
        return "modules/person/unAuthRiskEvaluatePage";
    }


}
