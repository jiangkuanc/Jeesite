package com.dagongsoft.p2p.user.web.front.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.investment.service.P2pInvestmentDetailsService;
import com.dagongsoft.p2p.investment.service.P2pInvestmentInformationService;
import com.dagongsoft.p2p.investment.service.front.InvestmentRecordService;
import com.dagongsoft.p2p.msg.entity.MsgSmsRecord;
import com.dagongsoft.p2p.msg.service.MsgSmsRecordService;
import com.dagongsoft.p2p.repayment.service.P2pReceivePlanService;
import com.dagongsoft.p2p.repayment.service.P2pReceiveRecordService;
import com.dagongsoft.p2p.risk.entity.P2pMember;
import com.dagongsoft.p2p.risk.entity.P2pMemberPayDetails;
import com.dagongsoft.p2p.risk.entity.P2pRiskRecord;
import com.dagongsoft.p2p.risk.service.P2pMemberPayDetailsService;
import com.dagongsoft.p2p.risk.service.P2pMemberService;
import com.dagongsoft.p2p.risk.service.P2pRiskRecordService;
import com.dagongsoft.p2p.user.dao.P2pAccountDao;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.user.service.front.P2pAccountService;
import com.dagongsoft.p2p.user.web.front.interceptor.AuthProcessStateConts;
import com.dagongsoft.p2p.user.web.front.interceptor.AuthStateBindingValue;
import com.dagongsoft.p2p.user.web.front.interceptor.AuthStateBindingValueUtils;
import com.dagongsoft.p2p.user.web.front.interceptor.CheckAuthUtils;
import com.dagongsoft.p2p.user.web.front.interceptor.UserAccountConst;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 账户总览
 *
 * @author DAGONG
 */
@Controller
@RequestMapping("${adminPath}/user/accountGeneration")
public class AccountGenerationController {

    @Autowired
    public P2pReceivePlanService p2pReceivePlanService;
    @Autowired
    public P2pReceiveRecordService p2pReceiveRecordService;
    @Autowired
    public P2pUserInformationService p2pUserInformationService;
    @Autowired
    public P2pRegUserCertifyService p2pRegUserCertifyService;
    @Autowired
    public P2pInvestmentDetailsService p2pInvestmentDetailsService;
    @Autowired
    public P2pInvestmentInformationService p2pInvestmentInformationService;
    @Autowired
    public P2pFinancingInformationService p2pFinancingInformationService;

    @Autowired
    public P2pAccountDao p2pAccountDao;
    /**
     * 绑定手机号服务类
     */
    @Autowired
    public MsgSmsRecordService msgSmsRecordService;
    /**
     * 计算累计投资总额
     */
    @Autowired
    private InvestmentRecordService investmentRecordService;

    @Autowired
    public P2pMemberService p2pMemberService;

    @Autowired
    public P2pMemberPayDetailsService p2pMemberPayDetailsService;
    //系统检查实名认证阶段该跳转的页面
    String redirectUrl = "";

    @Autowired
    private P2pRiskRecordService p2pRiskRecordService;

    /**
     * 账户总览
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/showAllInformation")
    public String showAllAccountInformation(HttpSession session, Model model) {
        try {
            User user = (User) session.getAttribute("user");
            //获取当前Session中User对象
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);    //从当前user中得到P2pUserInformation
            p2pUserInformation.setUserpic(UploadFileUtils.viewUrl(p2pUserInformation.getUserpic()));
            AuthStateBindingValue authStateBindingValue = AuthStateBindingValueUtils.bindingValue(p2pUserInformation);
            session.setAttribute("p2pUserInformation", p2pUserInformation);
            session.setAttribute("authStateBindingValue", authStateBindingValue);
            P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.get(user.getId());
            P2pMember p2pMember = p2pMemberService.get(user.getId());
            P2pMemberPayDetails p2pMemberPayDetails = p2pMemberPayDetailsService.get(user.getId());
            /**
             * 会员的判断标准
             * 不是会员:空或者0
             * 有效会员:1
             * 过期会员:2
             */
            model.addAttribute("p2pMember", p2pMember);
            model.addAttribute("p2pMemberPayDetails", p2pMemberPayDetails);

            if (p2pRegUserCertify == null) {
                model.addAttribute("userCertifyState", 0);
            }
            if (p2pRegUserCertify != null && p2pRegUserCertify.getAuditState() == 1) {
                model.addAttribute("userCertifyState", p2pRegUserCertify.getAuditState());
            }
            if (p2pRegUserCertify != null && p2pRegUserCertify.getAuditState() == 2) {
                model.addAttribute("userCertifyState", p2pRegUserCertify.getAuditState());
            }
            if (p2pRegUserCertify != null && p2pRegUserCertify.getAuditState() == 3) {
                model.addAttribute("userCertifyState", p2pRegUserCertify.getAuditState());
            }

            /**
             * 是否绑定手机号
             */
            /*List<MsgSmsRecord> msgSmsList = msgSmsRecordService.getListByUserId(user.getId());
            model.addAttribute("msgSmsList", msgSmsList);*/

            /**
             * 计算累计投资总额
             */

            model.addAttribute("sum", investmentRecordService.findInvestmentSumByUid(user.getId()));//投资总金额
            //推荐标的信息
            Map<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("markType", 2);//个人投资
            paramMap.put("currentStage", "500");//募集中...
            List<P2pFinancingInformation> p2pFinancingInformationList = p2pFinancingInformationService.findAllFinancingList(paramMap);

            model.addAttribute("p2pFinancingInformationList", p2pFinancingInformationList);
            String json = JsonMapper.toJsonString(p2pFinancingInformationList);
            model.addAttribute("json", json);
            return UserAccountConst.account_generationPage;                //返回到账户总览页面
        } catch (Exception e) {
            model.addAttribute("ex", e.getMessage());
            e.printStackTrace();
            return "redirect:/" + Global.getFrontPath();

        }
    }

    /**
     * 投资前准备检查
     *
     * @param session
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("preCheckInvestment")
    public String preCheckInvestement(HttpSession session, Model model, @RequestParam("id") String id) {
        String distinationUrl = "";
        try {
            User user = (User) session.getAttribute("user");
            String uid = user.getRoleList().get(0).getId();
            if (uid.equals("104")) {
                distinationUrl = CheckAuthUtils.checkAuthForAccount(Integer.parseInt(id));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return distinationUrl;
    }

    /**
     * 完成认证页面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("redirect_authCompletedUrl")
    public String completedAuthPage(HttpSession session, Model model) {
        return AuthProcessStateConts.authCompletedPage;
    }

    /**
     * 实名认证身份证页面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("redirect_unAuthIdCardUrl")
    public String unAuthIdCardPage(HttpSession session, Model model) {
        //加载身份信息
        User user = (User) session.getAttribute("user");
        P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
        AuthStateBindingValue authStateBindingValue = AuthStateBindingValueUtils.bindingValue(p2pUserInformation);
        session.setAttribute("authStateBindingValue", authStateBindingValue);
        P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.getByUserId(user.getId());
        model.addAttribute("p2pUserInformation", p2pUserInformation);

        session.setAttribute("p2pRegUserCertify", p2pRegUserCertify);
        if (p2pRegUserCertify == null) {
            p2pRegUserCertify = new P2pRegUserCertify();
            return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/certify";
        }
        session.setAttribute("p2pRegUserCertify", p2pRegUserCertify);
        model.addAttribute("bindingBank", p2pAccountDao.getAccountByUserId(user.getId()));

        int state = p2pRegUserCertify.getAuditState();
        int certifyState = p2pUserInformation.getCertificateState();
        //进行实名认证//TODO
        //TODO
        if (certifyState == 1001) {
            return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/certify";
        }
        if (state == 3) {
            return "modules/person/authingIdCardPage";
        }
        if (state == 2) {

            return "modules/person/failAuthIdCardPage";
        }
        if (state == 1) {
            return "modules/person/idCertifyPassInfo";
        } else
            return AuthProcessStateConts.unAuthIdCardPage;
    }

    @RequestMapping("redirect_unAuthIdCardUrl2")
    public String unAuthIdCardPage2(HttpSession session, Model model) {
        //加载身份信息
        User user = (User) session.getAttribute("user");
        P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
        AuthStateBindingValue authStateBindingValue = AuthStateBindingValueUtils.bindingValue(p2pUserInformation);
        session.setAttribute("authStateBindingValue", authStateBindingValue);
        P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.getByUserId(user.getId());
        model.addAttribute("p2pUserInformation", p2pUserInformation);

        session.setAttribute("p2pRegUserCertify", p2pRegUserCertify);
        if (p2pRegUserCertify == null) {
            return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/certify";
        }
        session.setAttribute("p2pRegUserCertify", p2pRegUserCertify);
        int state = p2pRegUserCertify.getAuditState();
        int certifyState = p2pUserInformation.getCertificateState();
        //进行实名认证//TODO
        //TODO
        if (certifyState == 1001) {
            return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/certify";
        }
        if (state == 3) {
            return "modules/person/authingIdCardPage";
        }
        if (state == 2) {

            return "modules/person/failAuthIdCardPage";
        }
        if (state == 1) {
            return "modules/person/idCertifyPassInfo";
        } else
            return AuthProcessStateConts.unAuthIdCardPage;
    }

    /**
     * 显示身份认证信息
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("showIdCardInfo")
    public String showIdCardInfo(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        P2pUserInformation p2pUserInformation = p2pUserInformationService.get(user.getId());
        P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.get(user.getId());
        model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);
        return "modules/person/showIdcardInfo";
    }


    /**
     * 实名认证绑卡页面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("redirect_unAuthBankCardUrl")//user/accountGeneration/redirect_unAuthBankCardUrl
    public String unBankCardPage(HttpSession session, Model model) {
        return AuthProcessStateConts.unAuthBankCardPage;
    }

    /**
     * 实名认证风险测评页面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("redirect_unAuthRiskEvaluateUrl")
    public String unRiskEvaluatePage(HttpSession session, Model model) {
        return AuthProcessStateConts.unAuthRiskEvaluatePage;
    }

    /**
     * 成为会员页面
     *
     * @param model
     */
    @RequestMapping("redirect_unBeMemberUrl")
    public String unBeMember(HttpSession session, Model model) {
        return AuthProcessStateConts.unBeMemberPage;
    }

    /**
     * 审核过程中页面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("redirect_authingIdCardUrl")
    public String authingIdCard(HttpSession session, Model model) {
        return AuthProcessStateConts.authingIdCardPage;
    }

    /**
     * 审核失败页面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("redirect_failAuthIdCardUrl")
    public String failAuthIdCard(HttpSession session, Model model) {
        return AuthProcessStateConts.failAuthIdCardPage;
    }

    @RequestMapping(value = "setUpPic")
    public String setUpPic(HttpSession session, Model model) {
        return "modules/front/account/userpicSetUp";
    }


    /**
     * 客户端累计投资收益
     *
     * @param session
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping("queryAccIncome")
    public String acculativeIncome(HttpSession session, Model model) {
        final List<Double> incomes = new LinkedList<Double>();
        final User user = (User) session.getAttribute("user");
        if (user == null) {
            //跳转到首页
            return "modules/front/user/userLogin";//返回登录页
        }
        /**
         * 创建一个单线程化的线程池
         */
        //累计收益
        ExecutorService singleThreadExecutor = Executors.newSingleThreadExecutor();
        singleThreadExecutor.execute(new Runnable() {
            Double income = 0.0;

            @Override
            public void run() {
                income = p2pReceiveRecordService.queryAccIncome(user.getId());
            }
        });
        return JsonMapper.toJsonString(incomes.get(0));
    }

    @RequestMapping("loadCertifyPage")
    public String loadCertifyPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");                                                            //获取当前Session中User对象
        P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);    //从当前user中得到P2pUserInformation
        if (p2pUserInformation == null) {
            return "modules/person/idCertifyInfoPage";
        }
        //如果用户未进行认证的话,则跳转到认证页面
        if (p2pUserInformation != null && p2pUserInformation.getCertificateState() == 1001) {

            return "modules/person/idCertifyInfoPage";
        }
        //如果用户进行了实名认证则显示相应的认证记录
        if (p2pUserInformation != null && p2pUserInformation.getCertificateState() == 1010 || p2pUserInformation.getCertificateState() == 1020 || p2pUserInformation.getCertificateState() == 1030 || p2pUserInformation.getCertificateState() == 1040) {
            //User user = (User) session.getAttribute("user");
            //P2pUserInformation p2pUserInformation = p2pUserInformationService.get(user.getId());
            P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.getByUserId(user.getId());
            p2pRegUserCertify.setIdCardFrontView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardFront()));
            p2pRegUserCertify.setIdCardBackView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardBack()));
            p2pRegUserCertify.setIdCardInhandView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardInhand()));
            model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);
            return "modules/person/unAuthIdCardPage";
        }

        //认证审核状态
        if (p2pUserInformation != null && p2pUserInformation.getCertificateState() == 2001) {
            P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.get(user.getId());
            p2pRegUserCertify.setIdCardFrontView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardFront()));
            p2pRegUserCertify.setIdCardBackView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardBack()));
            p2pRegUserCertify.setIdCardInhandView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardInhand()));
            model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);
            return "modules/person/authingIdCardPage";
        }
        //认证失败状态
        if (p2pUserInformation != null && p2pUserInformation.getCertificateState() == 3001) {
            P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.get(user.getId());
            p2pRegUserCertify.setIdCardFrontView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardFront()));
            p2pRegUserCertify.setIdCardBackView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardBack()));
            p2pRegUserCertify.setIdCardInhandView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardInhand()));
            model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);
            return "modules/person/failAuthIdCardPage";
        }
        return "modules/person/idCertifyInfoPage";


    }

    /**
     * 判断个人投资前准备
     */
    @RequestMapping("berforInvestment")
    public String berforInvestment(String certificateState) {
        if ("1001".equals(certificateState)) {
            return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/certify";
        }
        if ("1010".equals(certificateState)) {
            return "redirect:" + Global.getAdminPath() + "/user/bankCard/binding";
        }
        if ("1020".equals(certificateState)) {
//			return "redirect:"+Global.getAdminPath()+"/user/bankCard/riskEvaluating";
            //return "redirect:"+Global.getAdminPath()+"/p2p/risk/p2pRiskPaper/riskTest";
            return "redirect:" + Global.getAdminPath() + "/user/Institution/ctrlMenuPerson?mode=riskRecord";
        }
        if ("1030".equals(certificateState)) {
            return "redirect:" + Global.getAdminPath() + "/user/bankCard/beMember";
        }
        if ("2001".equals(certificateState)) {
            return "redirect:" + Global.getAdminPath() + "/user/idCardCertify/authingIdCard";
        }
        if ("3001".equals(certificateState)) {
            return "redirect:" + Global.getAdminPath() + "/user/accountGeneration/redirect_failAuthIdCardUrl";
        }
        return null;
    }

}
