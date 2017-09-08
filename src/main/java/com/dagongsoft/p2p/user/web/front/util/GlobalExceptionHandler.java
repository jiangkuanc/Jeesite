package com.dagongsoft.p2p.user.web.front.util;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * 统一异常处理类
 *
 * @author Joe
 */
@ControllerAdvice
public class GlobalExceptionHandler {
    private static final Logger LOG = Logger
            .getLogger(GlobalExceptionHandler.class);
    private final static String EXPTION_MSG_KEY = "message";

    /**
     * 处理SQL异常
     *
     * @param ex
     * @return
     */
    @ExceptionHandler(SQLException.class)
    public ModelAndView handSql(Exception ex, HttpServletRequest request, HttpServletResponse response) {
//		final String referer = request.getHeader("Referer");
//		try {
//			response.sendRedirect(referer);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
        LOG.info("SQL Exception " + ex.getMessage());
        ModelAndView mv = new ModelAndView();
        mv.addObject("message", ex.getMessage());
        mv.setViewName("error");
        return mv;
    }

    @ExceptionHandler(IOException.class)
    public ModelAndView handIO(Exception ex, HttpServletRequest request, HttpServletResponse response) {
//		final String referer = request.getHeader("Referer");
//		try {
//			response.sendRedirect(referer);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
        LOG.info("SQL Exception " + ex.getMessage());
        ModelAndView mv = new ModelAndView();
        mv.addObject("message", ex.getMessage());
        mv.setViewName("error");
        return mv;
    }


}
