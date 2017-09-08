package com.dagongsoft.p2p.user.web.front.util;

import org.springframework.beans.factory.annotation.Value;

/**
 * 个人投资链接常量类
 *
 * @author Joe
 */
public final class PersonLinkConst {

    @Value("adminPath")
    private String adminPath;

    //账户总览
    private static final String accountAll = "modules/front/investment/accountAll";//账户总览

    /**
     * 我的投资链接
     */

    //投资总览链接
    private static final String investmentGeneral = "modules/front/investment/investmentGeneral";//投资总览链接

    //投资收益链接
    private static final String investmentIncome = "modules/front/investment/investmentIncome";//账户总览链接

    //投资记录链接
    private static final String investmentRecord = "modules/front/investment/investmentRecord";//账户总览链接

    /**
     * 资金记录链接
     */

    //费用记录链接
    //private static final String investmentRecord = "modules/front/investment/investmentRecord";//账户总览链接

    //充值记录链接

    //提现记录链接

    /**
     * 账户管理链接
     */

    //绑定手机号链接
    //modules/front/investment/bindingPhone
    //身份认证链接

    //管理银行卡链接
    private static final String bankMsg = "modules/front/investment/bankMsg";

    //风险测评链接

    //密码管理链接
    //financing/myAccount/passwordModify
    //举报管理链接

    //消息中心链接

    /**
     * 交易助手
     */
}
