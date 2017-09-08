package com.dagongsoft.p2p.user.web.front.controller;

import static java.lang.System.out;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.front.P2pAccountService;
import com.dagongsoft.p2p.user.web.front.consts.IndexConst;
import com.dagongsoft.p2p.user.web.front.consts.JsonAccountModelEnumConst;
import com.dagongsoft.p2p.user.web.front.consts.PageRegisterModelConst;
import com.dagongsoft.p2p.user.web.front.consts.PersonalInvestmentConst;
import com.dagongsoft.p2p.user.web.front.consts.ProcesStateConst;
import com.dagongsoft.p2p.user.web.front.model.AccountModel;
import com.dagongsoft.p2p.user.web.front.model.JsonAccountModel;
import com.dagongsoft.p2p.utils.FormatUtils;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 个人投资基类
 *
 * @author Joe
 */
@Controller
@RequestMapping(value = "${adminPath}/user/p2pUserInformation")
public class P2pUserInfomationPersonController extends P2pUserInfomationPersonBaseController {

    //银行卡账户服务类
    @Autowired
    public P2pAccountService p2pAccountService;


    private static final Logger logger = LoggerFactory.getLogger(P2pUserInfomationPersonController.class);

    /**
     * 异常发生,跳转页面error.jsp
     *
     * @param request
     * @param response
     * @param model
     * @return
     * @author Joe
     */
    @RequestMapping("systemErrorPage")
    public ModelAndView redirecErrorPage(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
        ModelAndView errorModel = new ModelAndView("modules/front/investment/error", model);
        logger.debug(model.get("exceptionMsg").toString());
        return errorModel;
    }

    /**
     * 我的账户权限总控制器
     *
     * @param session
     * @param mode    表示所访问的功能模块
     * @param page
     * @return
     */
    @SuppressWarnings("unused")
    @RequestMapping(value = "accountPermissionPerson")
    public String accountPermission(HttpSession session, String mode, Model model, Date beginDate, Date endDate, Integer state, HttpServletRequest request, HttpServletResponse response) {
        AccountModel accountModel = new AccountModel();                                                //构建界面账户信息数据
        JsonAccountModel jsonAccountModel = new JsonAccountModel().build(accountModel);                //构建Json格式化消息数据
        String errorPageUrl = "redirect:" + adminPath + "/user/p2pUserInformation/systemErrorPage";    //出现异常,重定向到异常处理页面

        User user = (User) session.getAttribute("user");                                            //获取当前session域中的User信息
        Role role = null;                                                                            //初始化role
        String roleId = "";
        if (user == null || "".equals(user.getId())) {                                                //判断当前用户是否登录
            return IndexConst.userLoginUrl;                                                            //返回登录页
        }
        if (p2pUserInformationService == null) {
            logger.debug(p2pUserInformationService.getClass().getName() + "初始化异常...");
            return errorPageUrl;                                                                    //初始化和服务类异常
        }
        try {
            role = user.getRoleList().get(0);                                                        //获取该用户的角色类型
            roleId = role.getId();
            if (role == null) {                                                                            //角色异常,返回json格式信息到客户端
                jsonAccountModel.setStatus(JsonAccountModelEnumConst.ERROR);
                jsonAccountModel.setMessage("服务器未知错误,请重试...");
                try {
                    response.getWriter().print(JsonMapper.toJsonString(jsonAccountModel));
                } catch (IOException e) {
                    logger.debug(e.getMessage());
                    model.addAttribute("exceptionMsg", e.getMessage());
                    return errorPageUrl;
                }
                throw new RuntimeException("权限不足!");
            }
        } catch (RuntimeException e) {
            logger.debug(e.getMessage());
            model.addAttribute("exceptionMsg", e.getMessage());
            return errorPageUrl;
        }

        if (roleId != null && "104".equals(roleId)) {                                    //判断当前用户类型  104为 投资个人
            logger.info("roleId行为...");                                                    //记录用户的操作行为
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            String certificateStateDb = String.valueOf(p2pUserInformation.getCertificateState());
            if (p2pUserInformation == null) {
                return errorPageUrl;
            }
            model.addAttribute("p2pUserInformation", p2pUserInformation);                //将用户信息数据放入model中
            mode = com.dagongsoft.p2p.user.web.front.util.XSSUtils.escapeHtml(mode);                                            //防止XSS攻击
            if ("accountAll".equals(mode)) {                                            // 账户总览
                return accountAllPage(user, model, session, p2pUserInformation);        //载入账户总览模块
            }
            //绑定手机卡
            else if ("bindingPhone".equals(mode)) {                                        // 绑定手机
                return "modules/front/investment/bindingPhone";

            } else if ("p2pRegUserCertify".equalsIgnoreCase(mode)) {                        // 身份认证
                //P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.get(user.getId());// 判断是否认证
                //model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);
                switch (4) {//processState(p2pRegUserCertify.getAuditState())
                    case 0:
                        return unRegisterOrLogin();                                        //未注册或者未登陆
                    case 1:
                        return registerUnBindBank();                                    //未绑卡
                    case 2:
                        return registerUnPhone();                                        //未手机验证
                    case 3:
                        return registerUnEmail();                                        //未注册邮箱
                    case 4:
                        return registerUnIdCard();                                        //未实名认证
                    case 5:
                        return registerAndAll();                                        //已经完成实名认证
                    case 6:
                        return othersState();                                            //其他
                    default:
                        ;
                }
            } else if ("passwordModify".equals(mode)) {                                    //密码修改
                return "redirect:" + adminPath + "/financing/myAccount/passwordModify";
            } else if (StringUtils.containsIgnoreCase(mode, "msgCenter")) {                // 消息中心
                return msgCenterPage(mode);
            } else if ("accountSet".equals(mode)) {                                        // 账户设置 accountSet
                return accountSet(mode);
            } else if ("applyFinance".equals(mode)) {                                        //我的融资申请
                return applyFinance(mode);
            } else if ("myBock".equals(mode)) {                                            //我的债项
                return myBock(mode);
            } else if ("myRepayment".equals(mode)) {                                        //我的还款
                return myRepayment(mode);
            } else if ("financeRecord".equals(mode)) {                                    //融资记录
                return financeRecord(mode);
            } else if ("projectPublish".equals(mode)) {                                    //项目发布
                return projectPublish(mode);
            } else if ("PublishRecord".equals(mode)) {                                    //发布记录
                return PublishRecord(mode);
            }

            //进入管理银行卡界面
            else if ("bankMsg".equals(mode)) {                                            // 管理银行卡
                return bankMsgPage(mode, model, user, "");
            } else if ("memberMag".equals(mode)) {                                        // 会员管理
                String memberStatus = StringUtils.substringAfter(mode, "&");
                return memberMag(memberStatus, certificateStateDb);
            } else {
                return defaultLoadPage(model, user);                                    //进入账户中心的默认页面

            }
        }
        return "modules/front/user/financingAccount";
    }


    /**
     * 已完成实名认证
     *
     * @return
     * @author Joe
     * @since 2016-11-07
     */
    private String registerAndAll() {
        return ProcesStateConst.registerAndAllUrl;
    }

    /**
     * 会员管理
     *
     * @param memberStatus
     * @param certificateStateDb
     * @return
     */
    private String memberMag(String memberStatus, String certificateStateDb) {
        //注册,未进行实名
        if (ProcesStateConst.registerUnIdCard.equals(memberStatus)) {
            return PageRegisterModelConst.CertifyPage;                                    //跳转到实名认证页面
        }
        //注册,已进行实名
        else if (ProcesStateConst.registerAndIdCard.equals(memberStatus)) {
            return "";                                            //会员下一步状态页面
        }
        return null;
    }

    /**
     * @param mode
     * @return
     */
    private String PublishRecord(String mode) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * @param mode
     * @return
     */
    private String projectPublish(String mode) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * @param mode
     * @return
     */
    private String myBock(String mode) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * @param mode
     * @return
     */
    private String myRepayment(String mode) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * @param mode
     * @return
     */
    private String financeRecord(String mode) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * @param mode
     * @return
     */
    private String applyFinance(String mode) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * @param mode
     * @return
     */
    private String accountSet(String mode) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * @return
     */
    private String registerUnPhone() {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * @return
     */
    private String othersState() {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * 实名认证页面
     *
     * @return 实名认证页面
     * @author Joe
     * @since 2016-11-02
     */
    private String registerUnIdCard() {
        try {
            return PageRegisterModelConst.CertifyPage;
        } catch (RuntimeException e) {
            logger.debug("当前:" + P2pUserInfomationPersonController.class + "方法：registerUnIdCard" + "发生了>>>>>>" + e.getMessage());
            return PageRegisterModelConst.CertifyPage;
        }
    }

    /**
     * @return 进入邮箱验证页面
     * @author Joe
     * @since 2016-11-07
     */
    private String registerUnEmail() {
        return ProcesStateConst.registerUnEmailUrl;
    }

    /**
     * @return 进入未绑卡页面
     * @author Joe
     * @since 2016-11-07
     */
    private String registerUnBindBank() {
        return ProcesStateConst.registerUnBindBankUrl;
    }

    /**
     * 未登录用户跳转首页
     *
     * @return 首页链接地址
     * @author Joe
     * @since 2016-11-02
     */
    private String unRegisterOrLogin() {
        try {
            return PageRegisterModelConst.LOGIN_URL;
        } catch (RuntimeException e) {
            logger.debug("当前:" + P2pUserInfomationPersonController.class + "方法：unRegisterOrLogin" + "发生了>>>>>>" + e.getMessage());
            return PageRegisterModelConst.LOGIN_URL;
        }
    }

    /**
     * @param auditState
     * @return
     */
    private int processState(Integer auditState) {
        // TODO Auto-generated method stub
        return 0;
    }

    /**
     * 账户总览
     *
     * @param user               当前User
     * @param model              当前Model
     * @param session            当前Session
     * @param p2pUserInformation
     */
    private String accountAllPage(User user, Model model, HttpSession session, P2pUserInformation p2pUserInformation) {
        String accountAllUrl = "modules/front/investment/accountAll";
        AccountModel accountModel = new AccountModel();// 实例化账户总览模型类,传递数据到页面
        // 个人名称,是否,认证,手机是否绑定,邮箱信息
        if (p2pUserInformation != null) {
            int state = p2pUserInformation.getCertificateState();// 认证流程状态
            P2pRegUserCertify p2pRegUserCertify = p2pUserInformation.getP2pRegUserCertify();// 实名认证信息数据
            if (p2pRegUserCertify != null) {
                session.setAttribute("p2pRegUserCertify", p2pRegUserCertify);// 用户认证状态信息
            }
            accountModel.setState(state);
            // 站内信信息
            // 是否是会员 不知道在那张表中
            // 银行卡是否绑定（p2p_bind_bank_card）
            // 风险测评
            // 账户金额记录表(p2p_account_money_record)
            // 风险承受能力:是否测评
            // 账户总额
            // 可用余额
            // 冻结余额
            // 累计收益
            session.setAttribute("accountModel", accountModel);
            return accountAllUrl;
        } else {
            accountModel = new AccountModel();// 实例化账户总览模型类,传递数据到页面
            session.setAttribute("accountModel", accountModel);
            return accountAllUrl;
        }
    }

    /**
     * 管理银行卡方法
     *
     * @param mode
     * @param model
     * @param user
     * @return
     * @author Joe
     */
    private String bankMsgPage(String mode, Model model, User user, String atOnceCerfify) {
        P2pAccount p2pAccount = p2pAccountService.get(user.getId());
        model.addAttribute("p2pAccount", p2pAccount);
        String bankUrl = PersonalInvestmentConst.bankMsgUrl;
        P2pUserInformation p2pUserInformation = user.getP2pUserInformation();
        //得到认证状态
        int certifyState = p2pUserInformation.getCertificateState();
        //已绑卡,未进行风险测评
        if (certifyState == ProcesStateConst.regiesterUnRiskEvaluate) {
            model.addAttribute("certifyState", certifyState);
        }
        //未绑卡
        else if (certifyState == ProcesStateConst.registerUnBindBank) {
            model.addAttribute("certifyState", certifyState);
        }
        //绑卡失败
        else if (certifyState == ProcesStateConst.registerBindCardUnPass) {
            model.addAttribute("certifyState", certifyState);
        }//atOnceCerfify
        else if (certifyState == ProcesStateConst.registerUnBindBank && StringUtils.equalsIgnoreCase("yes", atOnceCerfify))
            ;

        return bankUrl;
    }

    /**
     * 流标通知
     *
     * @param mode
     * @return
     * @author Joe
     */
    private String msgCenterPage(String mode) {
        if (StringUtils.containsIgnoreCase(mode, "liubiaoNotify")) {
            // 流标通知

        }
        if (StringUtils.containsIgnoreCase(mode, "tuikuanNotify")) {
            // 退款通知
        }
        if (StringUtils.containsIgnoreCase(mode, "jixiNotify")) {
            // 计息通知
        }
        if (StringUtils.containsIgnoreCase(mode, "shouyiNotify")) {
            // 收益通知
        }
        if (StringUtils.containsIgnoreCase(mode, "shouyiyuqiNotify")) {
            // 收益逾期通知

        } else {
            // 加载默认页面

        }
        return mode;
    }

    /**
     * 加载默认的页面
     *
     * @param model
     * @param user
     * @author Joe
     */
    private String defaultLoadPage(Model model, User user) {
        model.addAttribute("p2pUserInformation", p2pUserInformationService.findP2pUserInformationByUser(user));
        out.println(p2pUserInformationService.findP2pUserInformationByUser(user).getUserpic());
        model.addAttribute("allInvestmentAmount", loadAllInvestmentAmountByUserId(user.getId()));
        P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
        List<P2pFinancingInformation> p2pFinancingInformationList = p2pFinancingInformationService.loadInvestRecommend(p2pFinancingInformation);
        int size = p2pFinancingInformationList.size();
        model.addAttribute("size", size);
        model.addAttribute("p2pFinancingInformationList", p2pFinancingInformationList);
        model.addAttribute("p2pUserPic", findUserPicByUserId(user));
        return "modules/front/investment/personInvestmentAccount";
    }

    /**
     * 加载投资总金额
     *
     * @param userId
     * @return
     */
    public String loadAllInvestmentAmountByUserId(String userId) {
        Integer amount = p2pFinancingInformationService.loadAllInvestAmountByUserId(userId);
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
        return p2pUserInformationService.findUserPicByUserId(p2pUserInformation);
    }

}
