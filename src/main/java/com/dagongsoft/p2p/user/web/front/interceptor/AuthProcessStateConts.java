package com.dagongsoft.p2p.user.web.front.interceptor;

import com.thinkgem.jeesite.common.config.Global;

/**
 * 实名认证过程中状态类
 *
 * @author DAGONG
 */
public final class AuthProcessStateConts {

    private static final StringBuilder JspBuilderToString;
    private static final String jspToString;

    static {
        JspBuilderToString = new StringBuilder().append("modules/person/");
        jspToString = JspBuilderToString.toString();
    }

    /**
     * 认证状态
     */
    public static final int unAuthIdCard = 1001;         //未进行实名认证
    public static final int unAuthBankCard = 1010;         //未进行绑卡
    public static final int unAuthRiskEvaluate = 1020;     //未进行风险测评
    public static final int unBeMember = 1030;             //未成为会员
    public static final int authCompleted = 1040;         //实名认证完成
    public static final int authingIdCard = 2001;         //实名认证审核过程中
    public static final int failAuthIdCard = 3001;         //实名认证审核失败


    /**
     * 页面地址
     */
    public static final String unAuthIdCardPage = jspToString + "unAuthIdCardPage";             //未进行实名认证页面地址
    public static final String unAuthBankCardPage = jspToString + "unAuthBankCardPage";         //未进行绑卡页面地址
    public static final String unAuthRiskEvaluatePage = "";                //未进行风险测评页面地址
    public static final String unBeMemberPage = "";                        //未成为会员页面地址
    public static final String authCompletedPage = "";                    //实名认证完成页面地址
    public static final String authingIdCardPage = jspToString + "authingIdCardPage";             //实名认证审核过程中页面地址
    public static final String failAuthIdCardPage = jspToString + "failAuthIdCardPage";         //实名认证审核失败页面地址

    /**
     * Api接口地址
     */
    public static final String redirect_unAuthIdCardUrl = "redirect:" + Global.getAdminPath() + "user/idCardCertify/certify";         //未进行实名认证Api接口地址
    public static final String redirect_unAuthBankCardUrl = "redirect:" + Global.getAdminPath() + "user/bankCard/binding";             //未进行绑卡Api接口地址
    public static final String redirect_unAuthRiskEvaluateUrl = "";                 //未进行风险测评Api接口地址页面地址
    public static final String redirect_unBeMemberUrl = "";                         //未成为会员Api接口地址
    public static final String redirect_authCompletedUrl = "";                     //实名认证完成Api接口地址
    public static final String redirect_authingIdCardUrl = "";                     //实名认证审核过程中Api接口地址
    public static final String redirect_failAuthIdCardUrl = "";                     //实名认证审核失败Api接口地址

}
