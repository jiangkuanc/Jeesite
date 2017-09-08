package com.dagongsoft.p2p.user.web.front.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.dagongsoft.p2p.user.web.front.consts.PageRegisterModelConst;
import com.thinkgem.jeesite.common.config.Global;

/**
 * 全局异常处理器
 *
 * @author DAGONG
 */
@Component
public class AuthExceptionHandler implements HandlerExceptionResolver {

    @Override
    @ExceptionHandler(AuthException.class)
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        if (ex.getClass() == AuthException.class) {
            return new ModelAndView("redirect:/" + Global.getFrontPath(), "message", ex.getMessage());
        }
        return null;
    }


}
