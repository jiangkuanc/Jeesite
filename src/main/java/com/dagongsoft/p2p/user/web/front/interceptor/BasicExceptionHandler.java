package com.dagongsoft.p2p.user.web.front.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.thinkgem.jeesite.common.config.Global;

@ControllerAdvice
public class BasicExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ModelAndView handleBankCardBindException(Exception ex) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:" + Global.getFrontPath());
        mv.addObject("ex", ex);
        return mv;
    }
}
