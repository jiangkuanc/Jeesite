/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * 重复提交拦截器
 *
 * @author ThinkGem
 * @version 2014-9-1
 */
public class ResubmitInterceptor extends HandlerInterceptorAdapter {

    private Log logger = LogFactory.getLog(this.getClass());

    /**
     * 在业务处理器处理请求之前被调用 如果返回false 从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链
     * 如果返回true 执行下一个拦截器,直到所有的拦截器都执行完毕 再执行被拦截的Controller 然后进入拦截器链,
     * 从最后一个拦截器往回执行所有的postHandle() 接着再从最后一个拦截器往回执行所有的afterCompletion()
     */
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {

        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();

            Token token = method.getAnnotation(Token.class);
            if (token != null) {
                // 单个token防重复提交
                boolean save = token.save();
                if (save) {
                    request.getSession().setAttribute("token", IdGen.uuid());
                }

                boolean remove = token.remove();
                if (remove) {
                    if (isRepeatSubmit(request)) {
                        logger.debug("please don't repeat submit,url:"
                                + request.getServletPath() + "]");
                        return false;
                    }
                    request.getSession().removeAttribute("token");
                }

                // 多个token防重复提交
                int saveNum = token.saveNum();
                if (saveNum > 0) {
                    for (int i = 1; i <= saveNum; i++) {
                        request.getSession().setAttribute("token" + i, IdGen.uuid());
                    }
                }

                int removeNum = token.removeNum();
                if (removeNum > 0) {
                    for (int i = 1; i <= removeNum; i++) {
                        String clinetToken = request.getParameter("token" + i);
                        if (i == removeNum) {
                            if (clinetToken != null && clinetToken != "") {
                                if (isRepeatSubmit(request, i)) {
                                    logger.debug("please don't repeat submit,url:"
                                            + request.getServletPath() + "]");
                                    return false;
                                }
                                request.getSession().removeAttribute("token" + i);

                            } else {
                                return false;
                            }
                        } else {
                            if (clinetToken != null && clinetToken != "") {
                                if (isRepeatSubmit(request, i)) {
                                    logger.debug("please don't repeat submit,url:"
                                            + request.getServletPath() + "]");
                                    return false;
                                }
                                request.getSession().removeAttribute("token" + i);
                                return true;
                            }
                        }
                    }
                }
            }
            return true;
        } else {
            return super.preHandle(request, response, handler);
        }
    }

    /**
     * 在业务处理器处理请求执行完成后,生成视图之前执行的动作 可在modelAndView中加入数据，比如当前时间
     */
    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {

    }

    /**
     * 在DispatcherServlet完全处理完请求后被调用,可用于清理资源等
     * <p>
     * 当有拦截器抛出异常时,会从当前拦截器往回执行所有的拦截器的afterCompletion()
     */
    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {

    }

    /**
     * 是否重复提交
     *
     * @param request
     * @return
     */
    private boolean isRepeatSubmit(HttpServletRequest request) {
        String serverToken = (String) request.getSession(true).getAttribute(
                "token");
        if (serverToken == null) {
            return true;
        }
        String clinetToken = request.getParameter("token");
        if (clinetToken == null) {
            return true;
        }
        if (!serverToken.equals(clinetToken)) {
            return true;
        }
        return false;
    }

    /**
     * 是否重复提交
     *
     * @param request
     * @return
     */
    private boolean isRepeatSubmit(HttpServletRequest request, int num) {
        String serverToken = (String) request.getSession(true).getAttribute(
                "token" + num);
        if (serverToken == null) {
            return true;
        }
        String clinetToken = request.getParameter("token" + num);
        if (clinetToken == null) {
            return true;
        }
        if (!serverToken.equals(clinetToken)) {
            return true;
        }
        return false;
    }

}
