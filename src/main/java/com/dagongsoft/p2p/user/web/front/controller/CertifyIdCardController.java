package com.dagongsoft.p2p.user.web.front.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.user.web.front.consts.IndexConst;
import com.dagongsoft.p2p.user.web.front.consts.JsonAccountModelEnumConst;
import com.dagongsoft.p2p.user.web.front.consts.ProcesStateConst;
import com.dagongsoft.p2p.user.web.front.model.AccountModel;
import com.dagongsoft.p2p.user.web.front.model.JsonAccountModel;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 实名认证Controller
 *
 * @author Joe
 */
@Controller
@RequestMapping(value = "${adminPath}/user/certify")
public class CertifyIdCardController {

    private static final Logger logger = LoggerFactory.getLogger(P2pUserInfomationPersonController.class);

    @Autowired
    public P2pRegUserCertifyService p2pRegUserCertifyService;//用户认证服务类

    @Autowired
    public P2pUserInformationService p2pUserInformationService;    //用户信息服务类

    /**
     * 进入实名认证页面
     *
     * @return
     */
    @SuppressWarnings("unused")
    @RequestMapping("/enterCerfityPage")
    public String enterCertifyPage(HttpSession session, HttpServletResponse response, Model model) {
        AccountModel accountModel = new AccountModel();                                                //构建界面账户信息数据
        JsonAccountModel jsonAccountModel = new JsonAccountModel().build(accountModel);                //构建Json格式化消息数据
        User user = (User) session.getAttribute("user");                                            //获取当前session域中的User信息
        Role role = null;                                                                            //初始化role
        String roleId = "";
        if (user == null || "".equals(user.getId())) {                                                //判断当前用户是否登录
            return IndexConst.userLoginUrl;                                                            //返回登录页
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
                    return IndexConst.userLoginUrl;
                }
                throw new RuntimeException("权限不足!");
            }
        } catch (RuntimeException e) {
            logger.debug(e.getMessage());
            model.addAttribute("exceptionMsg", e.getMessage());
            return IndexConst.userLoginUrl;
        }
        if (roleId != null && "104".equals(roleId)) {                                    //判断当前用户类型  104为 投资个人
            logger.info("roleId行为...");                                                    //记录用户的操作行为
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            String certificateStateDb = String.valueOf(p2pUserInformation.getCertificateState());
            if (p2pUserInformation == null) {
                return IndexConst.userLoginUrl;
            }
            P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.get(user.getId());// 判断是否认证
            model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);
            /**
             * 未进行实名认证的话,则进行实名认证
             */
            int message = 0;//站内信消息
            int certificateState = p2pUserInformation.getCertificateState();             // 用户是否认证
            certificateState = 1001;
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
            }

        }
        return ProcesStateConst.registerUnIdCardUrl;
    }
}
