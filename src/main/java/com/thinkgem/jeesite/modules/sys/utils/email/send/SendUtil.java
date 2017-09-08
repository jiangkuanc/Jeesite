package com.thinkgem.jeesite.modules.sys.utils.email.send;

import java.util.Properties;

import org.apache.commons.codec.digest.DigestUtils;

import com.thinkgem.jeesite.modules.sys.utils.email.MailSender;
import com.thinkgem.jeesite.modules.sys.utils.email.SendMail;

public class SendUtil {

    // 邮件发送者地址
    private static final String SenderEmailAddr = "projecttest123mail@163.com";
    // 邮件发送者邮箱用户 
    private static final String SMTPUserName = "projecttest123mail@163.com";
    // 邮件发送者邮箱密码 
    private static final String SMTPPassword = "projecttest123";
    // 邮件发送者邮箱SMTP服务器 
    private static final String SMTPServerName = "smtp.163.com";
    // 传输类型 
    private static final String TransportType = "smtp";
    //端口
    private static final String TransportPort = "25";
    // 属性 
    private static Properties props;

    /**
     * 私有构造函数，防止外界新建本实用类的实例，因为直接使用MailUtil.sendMail发送邮件即可
     */
    private SendUtil() {
    }

    /**
     * 静态构造器 
     */
    static {
        SendUtil.props = new Properties();
        // 存储发送邮件服务器的信息 
        SendUtil.props.put("mail.smtp.host", SendUtil.SMTPServerName);
        // 同时通过验证 
        SendUtil.props.put("mail.smtp.auth", "true");
        SendUtil.props.put("mail.smtp.starttls.enable", "true");
    }

    public static void sendMail(String email) {
        //设置邮件参数
        SendMail mail = new SendMail();
        mail.setMailServerHost(SMTPServerName); // 这里填发送者的邮箱服务器，我以qq举个例子
        mail.setMailServerPort(TransportPort);
        mail.setValidate(true);
        mail.setUserName(SMTPUserName);//发送者的邮箱名字
        mail.setPassword(SMTPPassword);//发送者邮箱密码
        mail.setFromAddress(SenderEmailAddr);//发送者邮箱账户
        mail.setToAddress(email);//接收者邮箱账户

    }

    public static void main(String[] args) {
        // 设置邮件参数
        SendMail mail = new SendMail();
        mail.setMailServerHost("smtp.163.com"); // 这里填发送者的邮箱服务器，我以qq举个例子
        mail.setMailServerPort("25");
        mail.setValidate(true);
        mail.setUserName("projecttest123mail@163.com");//发送者的邮箱名字
        mail.setPassword("projecttest123");//发送者邮箱密码
        mail.setFromAddress("projecttest123mail@163.com");//发送者邮箱账户
        mail.setToAddress("yongwei2008t@126.com");//接收者邮箱账户
//		String validCode = IdGen.uuid();
        String validCode = DigestUtils.md5Hex(mail.getFromAddress());
//		System.out.println("code=="+code);
//		System.out.println("validCode=="+validCode);
        //邮件的内容
        mail.setSubject("用户邮箱绑定成功，大公P2P互联网金融平台，网贷领导者");//邮件主题
        mail.setContent("<h2>邮箱认证-激活邮件!点击下面的链接完成激活操作，该链接24小时之内有效：</h2>" +
                "<h3><a href='http://192.168.24.169:8080/shop/user_active.action?email=" + mail.getToAddress() + "?code=" + validCode + "'>" +
                "http://192.168.24.169:8080/shop/user_active.action?email=" + mail.getToAddress() + "?code=" + validCode + "</a></h3>");

        //发送邮件  
        MailSender sms = new MailSender();
//		sms.sendTextMail(mail);// 发送文体格式
        sms.sendHtmlMail(mail);// 发送html格式
        System.out.println(mail.getContent());
    }
}
