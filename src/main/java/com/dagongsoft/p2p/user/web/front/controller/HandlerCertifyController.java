package com.dagongsoft.p2p.user.web.front.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.user.web.front.consts.PageRegisterModelConst;
import com.dagongsoft.p2p.user.web.front.consts.ProcesStateConst;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 修改实名认证状态值Controller
 *
 * @author DAGONG
 */
@Controller
@RequestMapping(value = "${adminPath}/user/handleCetify")
public class HandlerCertifyController {

    @Autowired
    public P2pRegUserCertifyService p2pCertificationDatabaseService;
    @Autowired
    public P2pUserInformationService p2pUserInformationService;

    /**
     * 修改实名认证状态值
     *
     * @param confirm
     * @param stateCode
     * @param session
     * @return
     */
    @SuppressWarnings("finally")
    @RequestMapping("/hanldeState")
    public String handleState(String confirm, String stateCode, HttpSession session) {
        try {
            User user = (User) session.getAttribute("user");
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            p2pUserInformation.getCertificateState();
            if (StringUtils.equalsIgnoreCase("yes", confirm)) {
                //如果传递的参数为1的话,则进入实名认证待审核状态
                if (StringUtils.equalsIgnoreCase(stateCode, "1")) {
                    p2pUserInformation.setCertificateState(ProcesStateConst.registerIdCardAudit);
                    p2pUserInformationService.save(p2pUserInformation);
                }
                //如果传递的参数为2的话,则进入实名认证失败状态
                else if (StringUtils.equalsIgnoreCase(stateCode, "2")) {
                    p2pUserInformation.setCertificateState(ProcesStateConst.registerIdCardAudit);
                    p2pUserInformationService.save(p2pUserInformation);
                }
                //如果传递的参数为3的话,则进入实名认证成功状态,待绑定银行卡
                else if (StringUtils.equalsIgnoreCase(stateCode, "3")) {
                    p2pUserInformation.setCertificateState(ProcesStateConst.registerUnBindBank);
                    p2pUserInformationService.save(p2pUserInformation);
                }
                //如果传递的参数为4的话,则进入绑卡成功状态,
                else if (StringUtils.equalsIgnoreCase(stateCode, "4")) {
                    p2pUserInformation.setCertificateState(ProcesStateConst.registerAndIdCard);
                    p2pUserInformationService.save(p2pUserInformation);
                }
                //如果传递的参数为5的话,则进入绑卡失败状态,
                else if (StringUtils.equalsIgnoreCase(stateCode, "5")) {
                    p2pUserInformation.setCertificateState(ProcesStateConst.registerBindCardUnPass);
                    p2pUserInformationService.save(p2pUserInformation);
                }
                //如果传递的参数为6的话,则进入风险测评成功状态,
                else if (StringUtils.equalsIgnoreCase(stateCode, "6")) {
                    p2pUserInformation.setCertificateState(ProcesStateConst.regiesterUnBeMember);
                    p2pUserInformationService.save(p2pUserInformation);
                }
                //如果传递的参数为7的话,则进入成为会员成功状态,投资前准备完成
                else if (StringUtils.equalsIgnoreCase(stateCode, "7")) {
                    p2pUserInformation.setCertificateState(ProcesStateConst.investmentPreparationCompleted);
                    p2pUserInformationService.save(p2pUserInformation);
                }
            }
        } catch (Exception e) {
            return PageRegisterModelConst.MyAccoutUrl;                //如果出现异常,则进入账户总览首页
        } finally {
            return "redirect:" + Global.getAdminPath() + "/user/myAccountinformation/allInformation";
        }
    }
}

