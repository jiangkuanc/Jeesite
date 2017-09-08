package com.dagongsoft.p2p.user.utils.test;

import java.util.Date;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.RandomStringUtils;

import com.thinkgem.jeesite.common.utils.SendMailUtil;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 大公邮箱工具类
 *
 * @author Joe
 */
public class DagongMailUtils {


    /**
     * 收件人邮箱地址
     */
    private String toEmailAddress;

    /**
     * 邮箱发送主题
     */
    private String subject;

    /**
     * 邮箱发送类型 0:验证码,1:邮箱连接地址
     */
    private String mailType;

    /**
     * 邮箱发送的验证码
     */
    private String certifyCode;

    /**
     * 邮箱发送的连接地址
     */
    private String linkUrl;
    /**
     * 邮箱有效时间
     */
    private Integer expiredTime;

    /**
     * 用户身份认证Id
     */
    private String authCode;
//	/**
//	 * 
//	 * @param toEmailAddress     收件人邮箱地址
//	 * @param subject	     	    邮箱发送主题
//	 * @param mailType   		    邮箱发送类型 0:验证码,1:邮箱连接地址
//	 * @param certifyCode 		    邮箱发送的验证码
//	 * @param expiredTime 		    邮箱有效时间
//	 */
//	public DagongMailUtils(String toEmailAddress,String subject,String mailType,String certifyCode,Integer expiredTime){
//		this.toEmailAddress=toEmailAddress;
//		this.subject=subject;
//		this.mailType=mailType;
//		this.certifyCode=certifyCode;
//		this.expiredTime=expiredTime;
//		
//		
//	}
//	/**
//	 * 
//	 * @param toEmailAddress 		 收件人邮箱地址
//	 * @param subject 				 邮箱发送主题
//	 * @param mailType				 邮箱发送类型 0:验证码,1:邮箱连接地址
//	 * @param linkUrl 				 邮箱发送的链接地址
//	 * @param expiredTime   		 邮箱有效时间
//	 * @param authCode				链接地址:带上用户身份的认证,userId
//	 */
//	public DagongMailUtils(String toEmailAddress,String subject,String mailType,String linkUrl,Integer expiredTime,String authCode){
//		this.toEmailAddress=toEmailAddress;
//		this.subject=subject;
//		this.mailType=mailType;
//		this.linkUrl=linkUrl;
//		this.expiredTime=expiredTime;
//		this.authCode=authCode;
//	}

    /**
     * 发送邮箱链接方法
     *
     * @param mailType
     * @param toEmailAddress
     * @param subject
     * @param linkUrl
     * @param authCode
     * @return
     */
    public static boolean sendEmailByLink(String mailType, String toEmailAddress, String subject, String linkUrl, String authCode) {
        boolean isSendOk = Boolean.FALSE;
        try {
            if (StringUtils.equalsIgnoreCase(mailType, DagongMailConst.linkUrl)) {

                SendMailUtil.sendCommonMail(toEmailAddress, subject, linkUrl + "?" + DigestUtils.md5Hex(authCode));
                isSendOk = Boolean.TRUE;
                return isSendOk;
            }
        } catch (Exception e) {
            return isSendOk;
        }
        return isSendOk;
    }


    /**
     * 发送邮箱验证码方法
     *
     * @param mailType
     * @param toEmailAddress
     * @param subject
     * @param certifyCode
     */
    public static boolean sendEmailByCode(String mailType, String toEmailAddress, String subject, String certifyCode) {
        boolean isSendOk = Boolean.FALSE;
        try {
            if (StringUtils.equalsIgnoreCase(mailType, DagongMailConst.mailCertifyCode)) {
                SendMailUtil.sendCommonMail(toEmailAddress, subject, certifyCode);
                isSendOk = Boolean.TRUE;
                return isSendOk;
            }
        } catch (Exception e) {
            return isSendOk;
        }
        return isSendOk;
    }

    /**
     * 自动生成验证码发送邮箱验证码方法
     *
     * @param mailType
     * @param toEmailAddress
     * @param subject
     * @param certifyCode
     */
    public static String sendEmailBySAutoGenerateCode(String toEmailAddress, String subject, boolean autoGenerateCodes) {
        String code = "";
        try {
            if (BooleanUtils.isTrue(autoGenerateCodes)) {
                code = RandomStringUtils.randomAlphanumeric(4);                //生成指定的4位验证码
                SendMailUtil.sendCommonMail(toEmailAddress, subject, code);
                return code;
            }
        } catch (Exception e) {
            return code;
        }
        return code;
    }

    /**
     * 自动生成验证码发送邮箱验证码方法并返回当时时间
     *
     * @param mailType
     * @param toEmailAddress
     * @param subject
     * @param certifyCode
     * @param datetime
     */
    public static MailCodeATime sendEmailBySAutoGenerateCode(String toEmailAddress, String subject, boolean autoGenerateCodes, Date date) {
        String code = "";
        try {
            if (BooleanUtils.isTrue(autoGenerateCodes)) {
                code = RandomStringUtils.randomAlphanumeric(4);                //生成指定的4位验证码
                SendMailUtil.sendCommonMail(toEmailAddress, subject, code);
                return new MailCodeATime(code, date);
            }
        } catch (Exception e) {
            return new MailCodeATime("", null);
        }
        return new MailCodeATime("", null);
    }
}
