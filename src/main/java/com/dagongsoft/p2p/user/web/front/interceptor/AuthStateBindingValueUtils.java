package com.dagongsoft.p2p.user.web.front.interceptor;

import org.springframework.beans.factory.annotation.Autowired;

import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;

/**
 * 检查绑定值的工具类
 *
 * @author DAGONG
 */
public final class AuthStateBindingValueUtils {

    @Autowired
    private static P2pRegUserCertifyService p2pRegUserCertifyService;

    private AuthStateBindingValueUtils() {
    }

    static AuthStateBindingValue authStateBindingValue;

    /**
     * 检查P2pUserInformationd的认证信息,并为其页面状态赋值的工具方法
     *
     * @param p2pUserInformation
     * @return
     */
    public static AuthStateBindingValue bindingValue(P2pUserInformation p2pUserInformation) {
        try {
            authStateBindingValue = new AuthStateBindingValue();
            int state = p2pUserInformation.getCertificateState();
            //认证完成
            if (state == AuthProcessStateConts.authCompleted) {
                authStateBindingValue.setIsBeMember("1");
                authStateBindingValue.setIsBindBankCard("1");
                authStateBindingValue.setIsBindIdCard("1");
                authStateBindingValue.setIsRiskEvaluation("1");
            }
            //未成为会员
            else if (state == AuthProcessStateConts.unBeMember) {
                authStateBindingValue.setIsBeMember("0");
                authStateBindingValue.setIsBindBankCard("1");
                authStateBindingValue.setIsBindIdCard("1");
                authStateBindingValue.setIsRiskEvaluation("1");
            }
            //未进行风险测评
            else if (state == AuthProcessStateConts.unAuthRiskEvaluate) {
                authStateBindingValue.setIsBeMember("0");
                authStateBindingValue.setIsBindBankCard("1");
                authStateBindingValue.setIsBindIdCard("1");
                authStateBindingValue.setIsRiskEvaluation("0");
            }
            //未绑卡
            else if (state == AuthProcessStateConts.unAuthBankCard) {
                authStateBindingValue.setIsBeMember("0");
                authStateBindingValue.setIsBindBankCard("0");
                authStateBindingValue.setIsBindIdCard("1");
                authStateBindingValue.setIsRiskEvaluation("0");
            }
            //未实名认证
            else if (state == AuthProcessStateConts.unAuthIdCard) {
                authStateBindingValue.setIsBeMember("0");
                authStateBindingValue.setIsBindBankCard("0");
                authStateBindingValue.setIsBindIdCard("0");
                authStateBindingValue.setIsRiskEvaluation("0");
            }
            //实名认证审核中
            else if (state == AuthProcessStateConts.authingIdCard) {
                authStateBindingValue.setIsBeMember("0");
                authStateBindingValue.setIsBindBankCard("0");
                authStateBindingValue.setIsBindIdCard("2");
                authStateBindingValue.setIsRiskEvaluation("0");
            }
        } catch (Exception e) {            //出现异常,跳转到首页
            authStateBindingValue = null;
        } finally {
            return authStateBindingValue;
        }
    }


}
