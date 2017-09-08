package com.dagongsoft.p2p.user.web.front.consts;

import com.thinkgem.jeesite.common.config.Global;

/**
 * 用户认证流程的状态常量类
 *
 * @author Joe
 * @since 2016-11-07
 */
public class ProcesStateConst {

    /**
     * 实名认证认证流程
     */
    public static final Integer unRegisterOrLogin = 1000;                        //未注册

    public static final Integer registerUnIdCard = 1001;                        //已注册,未实名认证

    public static final Integer registerUnPhone = 1002;                            //已注册,未手机验证

    public static final Integer registerUnEmail = 1003;                            //已注册,未邮箱验证

    public static final Integer registerUnBindBank = 1004;                        //已注册,未绑卡

    public static final Integer registerAndIdCard = 1005;                        //注册已进行绑卡,未进行风险测评

    public static final Integer regiesterUnRiskEvaluate = 1006;                    //注册已进行绑卡,进行风险测评

    public static final Integer regiesterUnBeMember = 1007;                        //已进行风险测评,未成为会员

    public static final Integer investmentPreparationCompleted = 1008;            //投资前准备完成

    public static final Integer othersState = 1009;                                //其他情况(带扩展状态)

    public static final Integer registerBindBank = 1010;                        //已注册,已绑卡

    public static final Integer registerAudit = 1011;                            //实名认证审核过程中

    public static final Integer registerIdCardAudit = 1012;                        //身份认证审核中

    public static final Integer registerIdCardUnPass = 1013;                    //身份失败

    public static final Integer registerBindCardUnPass = 1014;                    //绑卡失败
    /**
     * 实名认证认证流程Url地址
     */

    //外部调用投资前准备服务接口
    public static final String ApiForInvestmentPrepared = "user/myAccountinformation/allInformation";

    public static final String unRegisterOrLoginUrl = PageRegisterModelConst.LOGIN_URL;        //未注册

    public static final String registerUnBindBankUrl = "redirect:" + Global.getAdminPath() + "/user/bankManage/binding";                        //已注册,未绑卡

    public static final String registerUnPhoneUrl = "/user/p2pUserInformation/accountPermissionPerson?mode=bindingPhone";                        //已注册,未手机验证

    public static final String registerUnEmailUrl = "modules/front/investment/emailAuthenticationPerson";                                        //已注册,未邮箱验证

    public static final String registerUnIdCardUrl = "modules/front/user/userPersonCertify";                                                        //已注册,未实名认证

    public static final String beMemberUrl = "/user/p2pUserInformation/accountPermissionPerson?mode=bindingPhone";

    public static final String registerAndAllUrl = "redirect:" + Global.getAdminPath() + "/user/p2pUserInformation/accountPermissionPerson";        //注册已进行实名认证

    public static final String othersStateUrl = "user/p2pUserInformation/accountPermissionPerson?mode=bindingPhone";                            //其他情况(带扩展状态)

    public static final String exceptionUrl = "redirect:" + Global.getAdminPath() + "/user/p2pUserInformation/accountPermissionPerson";        //实名过程中出现异常的页面																							//实名过程中出现异常的页面

    public static final String beMemberPageUrl = "modules/front/investment/beMemberPage";

    public static final String registerBindCardSuccess = "modules/front/investment/bindCardSuccess";                                                    //绑卡成功页面

    public static final String registerAuditUrl = "modules/front/investment/bindCardAuditPage";                                                        //实名认证审核页面

    public static final String registerRenzheng = "user/myAccountinformation/allInformation";                                                        //实名认证浏览器端地址

    /**
     * 风险测评外部接口
     */
    public static final String atOnceInvestmentPage = "redirect:" + Global.getAdminPath() + "/financing/p2pFinancingInformation/financingInfoPage";                                                                                            //立即投资页面

    /**
     * 风险测评外部接口
     */
    public static String regiesterUnRiskEvaluateUrl = "redirect:" + Global.getAdminPath();                                                    //跳转到风险测评

    public static String registerUnBindBankUnPassPage = "modules/front/investment/bindCardUnPassPage";

    public static String registerIdCardUnPassPage = "modules/front/investment/bindIdCardFailure";                                                        //身份认证失败页面

    public static String registereBankCardSuccessUrl = "redirect:" + Global.getAdminPath() + "user/bankManage/bindingSuccess";                                            //银行卡绑定成功页面

    public static String registereBankCardSuccessPage = "modules/front/investment/bindbankCardPage";                                                //绑定银行卡成功页面
}
