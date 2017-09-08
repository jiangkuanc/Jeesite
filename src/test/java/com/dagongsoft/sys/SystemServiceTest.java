package com.dagongsoft.sys;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

import com.dagongsoft.p2p.financing.service.front.PayRatingFeeService;

@ContextConfiguration(locations = {"classpath*:/spring-context*.xml"})
public class SystemServiceTest extends AbstractTransactionalJUnit4SpringContextTests {
    private static final Log log = LogFactory.getLog(SystemServiceTest.class);

    @Autowired
    private PayRatingFeeService payRatingFeeService;

    /**
     * 函数功能: 单元测试示例 <br/>
     * 作   者： MIET <br/>
     * 日   期： 2016-10-13 <br/>
     * 特别说明：<br/>
     */
    @Test
    @Rollback(false)
    public void mainTest() {
//		Thread a1 = new A1();
//		Thread a2 = new A2();
//		a1.start();
//		a2.start();

        payRatingFeeService.callbackOrder("20170414155250", 1, new Date(), "123");
        payRatingFeeService.callbackOrder("20170414155250", 3, new Date(), "123");
    }

    class A1 extends Thread {

        @Override
        public void run() {
            payRatingFeeService.callbackOrder("20170414155250", 3, new Date(), "123");

        }

    }

    class A2 extends Thread {

        @Override
        public void run() {
            payRatingFeeService.callbackOrder("20170414155250", 1, new Date(), "123");

        }

    }
}
