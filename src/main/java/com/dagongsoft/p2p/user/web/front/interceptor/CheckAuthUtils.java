package com.dagongsoft.p2p.user.web.front.interceptor;

import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.utils.FinancingState;

/**
 * 权限检查的相关工具类
 *
 * @author DAGONG
 */
public class CheckAuthUtils {

    private CheckAuthUtils() {
    }

    /**
     * 获取P2pUserInformation中相关的权限信息
     *
     * @param p2pUserInformation
     * @return 返回相应阶段的Controller Api接口地址
     */
    public static String checkAuth(P2pUserInformation p2pUserInformation) {
        if (p2pUserInformation == null) {
            return "";
        }
        int state = p2pUserInformation.getCertificateState();
        //实名认证过程
        switch (state) {
            case AuthProcessStateConts.authCompleted:
                return AuthProcessStateConts.redirect_authCompletedUrl;

            case AuthProcessStateConts.failAuthIdCard:
                return AuthProcessStateConts.redirect_failAuthIdCardUrl;

            case AuthProcessStateConts.unBeMember:
                return AuthProcessStateConts.redirect_unBeMemberUrl;

            case AuthProcessStateConts.unAuthRiskEvaluate:
                return AuthProcessStateConts.redirect_unAuthRiskEvaluateUrl;

            case AuthProcessStateConts.unAuthBankCard:
                return AuthProcessStateConts.redirect_unAuthBankCardUrl;

            case AuthProcessStateConts.authingIdCard:
                return AuthProcessStateConts.redirect_unAuthIdCardUrl;
            default:
                break;
        }
        return "";
    }


    /**
     * 获取P2pUserInformation中相关的权限信息
     * 立即投资
     *
     * @param p2pUserInformation
     * @return 返回相应阶段的Controller Api接口地址
     */
    public static String checkAuthForAccount(int certificateState) {
        int state = certificateState;
        //实名认证过程
        switch (state) {
            case AuthProcessStateConts.authCompleted:
                return AuthProcessStateConts.redirect_authCompletedUrl;

            case AuthProcessStateConts.failAuthIdCard:
                return AuthProcessStateConts.redirect_failAuthIdCardUrl;

            case AuthProcessStateConts.unBeMember:
                return AuthProcessStateConts.redirect_unBeMemberUrl;

            case AuthProcessStateConts.unAuthRiskEvaluate:
                return AuthProcessStateConts.redirect_unAuthRiskEvaluateUrl;

            case AuthProcessStateConts.unAuthBankCard:
                return AuthProcessStateConts.redirect_unAuthBankCardUrl;

            case AuthProcessStateConts.authingIdCard:
                return AuthProcessStateConts.redirect_unAuthIdCardUrl;
            default:
                break;
        }
        return "";
    }


}
