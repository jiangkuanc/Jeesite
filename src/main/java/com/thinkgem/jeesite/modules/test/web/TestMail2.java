package com.thinkgem.jeesite.modules.test.web;

import org.junit.Test;

import com.thinkgem.jeesite.common.utils.SendMailUtil;

public class TestMail2 {

    private String toMailAddr = "1042851713@qq.com";
    private String subject = "lol";
    private String message = "啦啦啦德玛西亚！！";

    @Test
    public void test() {
        for (int i = 0; i <= 100; i++) {
            SendMailUtil.sendCommonMail(toMailAddr, subject, message);
        }
    }
}
