package com.dagongsoft.p2p.user.web.front.controller;

import static java.lang.System.out;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.front.P2pAccountService;
import com.dagongsoft.p2p.user.web.front.consts.PageRegisterModelConst;
import com.dagongsoft.p2p.user.web.front.consts.ProcesStateConst;
import com.dagongsoft.p2p.utils.FormatUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 账户总览信息Controller
 *
 * @author DAGONG
 */
@Controller
@RequestMapping("${adminPath}/user/myAccountinformation")
public class MyAccountInformation extends P2pUserInfomationPersonBaseController {

    @Autowired
    public P2pRegUserCertifyService p2pCertificationDatabaseService;

    @Autowired
    public MoneyService moneyService;    //累计投资收益服务类

    // 站内信Service

    @Autowired
    P2pAccountService p2pAccountService;                            // 我的账户金额Service

    @Autowired
    P2pFinancingInformationService p2pFinancingInformationService;  // 融资信息Service
    private static final Logger logger = LoggerFactory.getLogger(P2pUserInfomationPersonController.class);


    @RequestMapping("/certifyInputPage")
    public String list(P2pRegUserCertify p2pRegUserCertify, HttpServletRequest request, HttpServletResponse response, Model model) {
        return "modules/front/user/userPersonCertifyList";
    }

    /**
     * 实名认证和账户总览的Controller
     *
     * @param session
     * @param mode
     * @param model
     * @return
     */
    @RequestMapping("/allInformation")
    public String accountInformation(HttpSession session, String mode, Model model, String certifyState) {
        User user = (User) session.getAttribute("user"); // 获取当前session域中的User信息
        Role role = null; // 初始化role
        String roleId = "";
        try {
            role = user.getRoleList().get(0); // 获取该用户的角色类型
        } catch (Exception e) {
            return ProcesStateConst.unRegisterOrLoginUrl;
        }
        roleId = role.getId();
        if (roleId != null && "104".equals(roleId)) {
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            // 判断当前用户类型 104为 投资个人
            model.addAttribute("p2pUserInformation", p2pUserInformationService.findP2pUserInformationByUser(user));
            out.println(p2pUserInformationService.findP2pUserInformationByUser(user).getUserpic());
            model.addAttribute("allInvestmentAmount", loadAllInvestmentAmountByUserId(user.getId()));
            P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
            List<P2pFinancingInformation> p2pFinancingInformationList = p2pFinancingInformationService.loadInvestRecommend(p2pFinancingInformation);
            int size = p2pFinancingInformationList.size();
            model.addAttribute("size", size);
            model.addAttribute("p2pFinancingInformationList", p2pFinancingInformationList);
            model.addAttribute("p2pUserPic", findUserPicByUserId(user));
            // 账户总览
            model.addAttribute("p2pUserInformation", p2pUserInformation);
            /**
             * 默认值设置
             */
            model.addAttribute("beMember", 1);
            model.addAttribute("bindCardState", 1);
            model.addAttribute("certificateState", 1);
            Integer message = 0;                        //站内信消息

            //得到用户的认证信息
            P2pRegUserCertify p2pCertification = p2pRegUserCertifyService.get(user.getId());
            model.addAttribute("p2pRegUserCertify", p2pCertification);
            /**
             * 参数说明
             * @param certificateState 0:未认证,1:已认证成功,2:身份审核中,3:身份认证失败
             * @param bindCardState 0:未绑卡,1:绑卡失败,2:绑卡成功
             * @param message 0:没有站内信,大于1:有多少条站内信
             * @param beMember 0:未成为会员,1:已成为会员
             */
            int certificateState = p2pUserInformation.getCertificateState();             // 用户是否认证
            certificateState = 1012;
            /**
             * 未进行实名认证的话,则进行实名认证
             */
            if (certificateState == 1001) {//ProcesStateConst.registerUnIdCard
                model.addAttribute("certificateState", 0);
                model.addAttribute("bindCardState", 0);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
                return "modules/front/user/userPersonCertify";                                // 用户已认证,跳转到已认证的页面
            }
            /**
             * 实名认证在审核过程中,则进入实名认证审核页面
             */
            else if (certificateState == ProcesStateConst.registerIdCardAudit) {            //身份认证审核中

                model.addAttribute("certificateState", 2);
                model.addAttribute("bindCardState", 0);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
                return ProcesStateConst.registerAuditUrl;
            }
            /**
             * 绑卡未通过,则进入绑卡未通过页面
             */
            else if (certificateState == ProcesStateConst.registerIdCardUnPass) {            //身份认证失败
                model.addAttribute("certificateState", 3);
                model.addAttribute("bindCardState", 0);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
                return ProcesStateConst.registerIdCardUnPassPage;
            }
            /**
             * 身份认证通过,则进入身份认证结果通过页面
             */
            else if (certificateState == ProcesStateConst.registerAndIdCard) {                //身份认证成功
                model.addAttribute("certificateState", 1);
                model.addAttribute("bindCardState", 0);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
                return ProcesStateConst.registerBindCardSuccess;
            }
            /**
             * 未进行银行卡绑卡,则进入银行卡绑定页面
             */
            else if (ProcesStateConst.registerUnBindBank == certificateState) {
                model.addAttribute("certificateState", 1);
                model.addAttribute("bindCardState", 0);
                model.addAttribute("beMember", 0);        //载入P2pCertification信息
                model.addAttribute("message", message);
                return ProcesStateConst.registerUnBindBankUrl;                                //跳转到绑卡控制器
            }
            /**
             * 银行卡绑定失败,则进入银行卡绑定失败页面
             */
            else if (ProcesStateConst.registerBindCardUnPass == certificateState) {            //绑卡失败
                model.addAttribute("certificateState", 1);
                model.addAttribute("bindCardState", 1);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
                return ProcesStateConst.registerUnBindBankUnPassPage;                        //挑转到绑卡失败页面,进入到重新绑卡阶段
            }
            /**
             * 银行卡绑定成功,则进入银行卡绑定成功页面
             */
            else if (ProcesStateConst.registerBindBank == certificateState) {                    //绑卡成功
                model.addAttribute("certificateState", 1);
                model.addAttribute("bindCardState", 2);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
                return ProcesStateConst.regiesterUnRiskEvaluateUrl;                            //挑战到风险测评Url						//跳转到风险测评
            }
            /**
             * 实名认证完成,则进入立即投资页面
             */
            else if (ProcesStateConst.investmentPreparationCompleted == certificateState) {    //实名认证完成																		//已成为会员
                model.addAttribute("certificateState", 1);
                model.addAttribute("bindCardState", 2);
                model.addAttribute("beMember", 1);
                model.addAttribute("message", message);
                return ProcesStateConst.atOnceInvestmentPage;
            } else {
                //否则进入账户总览界面
                //累计投资计算接口

//				Double accumulativeIncome = moneyService.accumulativeIncome(user.getId());
//				model.addAttribute("accumulativeIncome",accumulativeIncome);
                P2pAccount p2pAccount = p2pAccountService.get(user.getId());
                model.addAttribute("p2pAccount", p2pAccount);                                     // 账户金额记录
                // model.addAttribute("p2pFinancingInformationService",
                // p2pFinancingInformationService.findAllcredit(page,
                // p2pFinancingInformation));													 //推荐标
                Map<String, Double> accountAmounts = new HashMap<String, Double>();
                accountAmounts = zjGetAccountInfo(accountAmounts);                                 // 调用中金接口查询账户总额,可用余额,冻结金额
                model.addAttribute("accountAmounts", accountAmounts);
                // 载入推荐投资
                P2pFinancingInformation p2pFinancingInformation1 = new P2pFinancingInformation();
                //List<P2pFinancingInformation> p2pFinancingInformationList1 = p2pFinancingInformationService.findAllFinancingInformations();

                model.addAttribute("p2pFinancingInformationList", p2pFinancingInformationList);

                // Page<P2pFinancingInformation>
                // p2pFinancingInformationList=p2pFinancingInformationService.findTheFinancingList(new
                // Page<P2pFinancingInformation>(request, response),
                // p2pFinancingInformation);
                // model.addAttribute("P2pFinancingInformationList",
                // p2pFinancingInformationList);
                // 调用shengsou的接口查询累计收益
                // Double accumulativeIncome = accumulativeIncode(user.getId());
                // 得到累计收益:
                // model.addAttribute("accumulativeIncome",accumulativeIncome);
                return PageRegisterModelConst.AccountAllPage;
            }

        }
        return PageRegisterModelConst.AccountAllPage;

    }

    /**
     * 成为会员页面
     *
     * @return
     */
    @RequestMapping("beMember")
    public String beMember() {
        return ProcesStateConst.beMemberPageUrl;
    }

    /**
     * 中金调用接口得到账户信息
     *
     * @param accountAmounts 账户总额
     * @param accountamount  账户信息Map集合
     * @param surplusamount  可用总额
     * @param freezeamount   冻结总额
     * @return 账户信息Map集合
     * @author Joe
     * @since 2016-11-08
     */
    private Map<String, Double> zjGetAccountInfo(
            Map<String, Double> accountAmounts) {
        HashMap<String, Double> accountMap = new HashMap<String, Double>();
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale
                .getDefault()); // 使用本地默认格式输出货币值
        accountMap.put(AccountConst.AccountAmount, 1000.00);
        accountMap.put(AccountConst.SurplusAmount, 1000.00);
        accountMap.put(AccountConst.FreezeAmount, 1000.00);
        return accountMap;
    }

    /**
     * 加载投资总金额
     *
     * @param userId
     * @return
     */
    public String loadAllInvestmentAmountByUserId(String userId) {
        Integer amount = p2pFinancingInformationService
                .loadAllInvestAmountByUserId(userId);
        if (amount != null) {
            return FormatUtils.amountFormat(amount);
        }
        return "0";
    }

    /**
     * 加载用户头像
     *
     * @param session
     * @param p2pUserInformation
     * @return
     */
    public P2pUserInformation findUserPicByUserId(User user) {
        P2pUserInformation p2pUserInformation = new P2pUserInformation();
        p2pUserInformation.setUser(user);
        return p2pUserInformationService
                .findUserPicByUserId(p2pUserInformation);
    }

    /**
     * 账户总览的默认页
     *
     * @param session
     * @param mode
     * @param model
     * @return
     */
    @RequestMapping("/accountDefaultPage")
    public String defaultPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user"); // 获取当前session域中的User信息
        Role role = null; // 初始化role
        String roleId = "";
        try {
            role = user.getRoleList().get(0); // 获取该用户的角色类型
        } catch (Exception e) {
            return ProcesStateConst.unRegisterOrLoginUrl;
        }
        roleId = role.getId();
        if (roleId != null && "104".equals(roleId)) {
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            // 判断当前用户类型 104为 投资个人
            model.addAttribute("p2pUserInformation", p2pUserInformationService.findP2pUserInformationByUser(user));
            out.println(p2pUserInformationService.findP2pUserInformationByUser(user).getUserpic());
            model.addAttribute("allInvestmentAmount", loadAllInvestmentAmountByUserId(user.getId()));
            P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
            List<P2pFinancingInformation> p2pFinancingInformationList = p2pFinancingInformationService.loadInvestRecommend(p2pFinancingInformation);
            int size = p2pFinancingInformationList.size();
            model.addAttribute("size", size);
            model.addAttribute("p2pFinancingInformationList", p2pFinancingInformationList);
            model.addAttribute("p2pUserPic", findUserPicByUserId(user));
            // 账户总览
            model.addAttribute("p2pUserInformation", p2pUserInformation);
            /**
             * 默认值设置
             */
            model.addAttribute("beMember", 1);
            model.addAttribute("bindCardState", 1);
            model.addAttribute("certificateState", 1);
            Integer message = 0;                        //站内信消息

            //得到用户的认证信息
            P2pRegUserCertify p2pCertification = p2pRegUserCertifyService.get(user.getId());
            model.addAttribute("p2pRegUserCertify", p2pCertification);
            /**
             * 参数说明
             * @param certificateState 0:未认证,1:已认证成功,2:身份审核中,3:身份认证失败
             * @param bindCardState 0:未绑卡,1:绑卡失败,2:绑卡成功
             * @param message 0:没有站内信,大于1:有多少条站内信
             * @param beMember 0:未成为会员,1:已成为会员
             */
            int certificateState = p2pUserInformation.getCertificateState();             // 用户是否认证
            certificateState = 1001;
            /**
             * 未进行实名认证的话,则进行实名认证
             */
            if (certificateState == 1001) {//ProcesStateConst.registerUnIdCard
                model.addAttribute("certificateState", 0);
                model.addAttribute("bindCardState", 0);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
            }
            /**
             * 实名认证在审核过程中,则进入实名认证审核页面
             */
            else if (certificateState == ProcesStateConst.registerIdCardAudit) {            //身份认证审核中

                model.addAttribute("certificateState", 2);
                model.addAttribute("bindCardState", 0);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
            }
            /**
             * 绑卡未通过,则进入绑卡未通过页面
             */
            else if (certificateState == ProcesStateConst.registerIdCardUnPass) {            //身份认证失败
                model.addAttribute("certificateState", 3);
                model.addAttribute("bindCardState", 0);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
            }
            /**
             * 身份认证通过,则进入身份认证结果通过页面
             */
            else if (certificateState == ProcesStateConst.registerAndIdCard) {                //身份认证成功
                model.addAttribute("certificateState", 1);
                model.addAttribute("bindCardState", 0);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
            }
            /**
             * 未进行银行卡绑卡,则进入银行卡绑定页面
             */
            else if (ProcesStateConst.registerUnBindBank == certificateState) {
                model.addAttribute("certificateState", 1);
                model.addAttribute("bindCardState", 0);
                model.addAttribute("beMember", 0);        //载入P2pCertification信息
                model.addAttribute("message", message);
            }
            /**
             * 银行卡绑定失败,则进入银行卡绑定失败页面
             */
            else if (ProcesStateConst.registerBindCardUnPass == certificateState) {            //绑卡失败
                model.addAttribute("certificateState", 1);
                model.addAttribute("bindCardState", 1);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
            }
            /**
             * 银行卡绑定成功,则进入银行卡绑定成功页面
             */
            else if (ProcesStateConst.registerBindBank == certificateState) {                    //绑卡成功
                model.addAttribute("certificateState", 1);
                model.addAttribute("bindCardState", 2);
                model.addAttribute("beMember", 0);
                model.addAttribute("message", message);
            }
            /**
             * 实名认证完成,则进入立即投资页面
             */
            else if (ProcesStateConst.investmentPreparationCompleted == certificateState) {    //实名认证完成																		//已成为会员
                model.addAttribute("certificateState", 1);
                model.addAttribute("bindCardState", 2);
                model.addAttribute("beMember", 1);
                model.addAttribute("message", message);
            } else {
                //否则进入账户总览界面
                //累计投资计算接口

//				Double accumulativeIncome = moneyService.accumulativeIncome(user.getId());
//				model.addAttribute("accumulativeIncome",accumulativeIncome);
                P2pAccount p2pAccount = p2pAccountService.get(user.getId());
                model.addAttribute("p2pAccount", p2pAccount);                                     // 账户金额记录
                // model.addAttribute("p2pFinancingInformationService",
                // p2pFinancingInformationService.findAllcredit(page,
                // p2pFinancingInformation));													 //推荐标
                Map<String, Double> accountAmounts = new HashMap<String, Double>();
                accountAmounts = zjGetAccountInfo(accountAmounts);                                 // 调用中金接口查询账户总额,可用余额,冻结金额
                model.addAttribute("accountAmounts", accountAmounts);
                // 载入推荐投资
                P2pFinancingInformation p2pFinancingInformation1 = new P2pFinancingInformation();
                //List<P2pFinancingInformation> p2pFinancingInformationList1 = p2pFinancingInformationService.findAllFinancingInformations();

                model.addAttribute("p2pFinancingInformationList", p2pFinancingInformationList);

                // Page<P2pFinancingInformation>
                // p2pFinancingInformationList=p2pFinancingInformationService.findTheFinancingList(new
                // Page<P2pFinancingInformation>(request, response),
                // p2pFinancingInformation);
                // model.addAttribute("P2pFinancingInformationList",
                // p2pFinancingInformationList);
                // 调用shengsou的接口查询累计收益
                // Double accumulativeIncome = accumulativeIncode(user.getId());
                // 得到累计收益:
                // model.addAttribute("accumulativeIncome",accumulativeIncome);
                return PageRegisterModelConst.AccountAllPage;
            }

        }
        return PageRegisterModelConst.AccountAllPage;
    }


}
