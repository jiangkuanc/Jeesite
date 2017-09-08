package com.dagongsoft.p2p.utils;

/**
 * 用户账号认证状态
 *
 * @author DAGONG
 */
public class CertificateState {

    /**
     * 新注册用户
     */
    public static final int NEW_REGISTERED_USERS = 101;

    /**
     * 身份认证完成
     */
    public static final int IDENTITY_CERTIFICATION_FINISHED = 200;

    /**
     * 企业认证审核中
     */
    public static final int ENTERPRISE_CERTIFICATION = 302;

    /**
     * 企业认证失败
     */
    public static final int ENTERPRISE_CERTIFICATION_FAILURE = 301;

    /**
     * 企业认证成功
     */
    public static final int ENTERPRISE_CERTIFICATION_SUCCESS = 303;

    /**
     * 成为会员(认证通过)
     */
    public static final int BECOME_MEMBER = 400;


    //**********************************************************************//
    /**
     * 个人投资状态码
     *
     * @author Joe
     * @since 2016-11-03
     */

    public static final Integer unRegisterOrLogin = 0;        //未注册

    public static final Integer registerUnBindBank = 1;        //已注册,未绑卡

    public static final Integer registerUnPhone = 2;        //已注册,未手机验证

    public static final Integer registerUnEmail = 3;        //已注册,未邮箱验证

    public static final Integer registerUnIdCard = 4;        //已注册,未实名认证

    public static final Integer othersState = 5;        //其他情况(带扩展状态)
    //**********************************************************************//
}
