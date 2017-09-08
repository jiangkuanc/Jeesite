package com.dagongsoft.p2p.user.web.front.util;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;

/**
 * XSS日志记录切面
 *
 * @author Joe
 */
@Aspect
public class XssLogginAspect {

    @AfterThrowing(value = "execution(public static String com.dagongsoft.p2p.user.web.util.XSSUtils.*(..))", throwing = "ex")
    public void logAfter(JoinPoint joinPoint, Exception ex) {
        String methodName = joinPoint.getSignature().getName();
        System.out.println("methodName: " + methodName);
        System.out.println("XSS抛出的异常：" + ex);
    }
}
