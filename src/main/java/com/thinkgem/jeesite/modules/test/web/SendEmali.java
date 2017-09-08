package com.thinkgem.jeesite.modules.test.web;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmali {
    public static void main(String[] args) throws Exception {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.qq.com");
        props.put("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        //基本的邮件会话
        Session session = Session.getInstance(props);
        //构造信息体
        MimeMessage message = new MimeMessage(session);
        //发件地址
        Address address = new InternetAddress("563476817@qq.com");
        message.setFrom(address);
        //收件地址
        Address toAddress = new InternetAddress("yongwei2008t@126.com");
        message.setRecipient(MimeMessage.RecipientType.TO, toAddress);
        //主题
        message.setSubject("Hello world");
        //正文
        message.setText("这是一封测试邮件");
        message.saveChanges(); // implicit with send()
        //Exception in thread "main" javax.mail.NoSuchProviderException: smtp
        session.setDebug(true);
        Transport transport = session.getTransport("smtp");
        transport.connect("smtp.qq.com", "563476817@qq.com", "ubeqdlrzhmtmbcah");
        //发送
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
}
