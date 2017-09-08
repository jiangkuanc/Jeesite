package com.thinkgem.jeesite.modules.sys.interceptor;

import java.lang.reflect.Method;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.modules.sys.service.SysConfigService;

/**
 * 系统维护拦截器
 *
 * @author Quincy
 */
@Component
public class SystemMaintenanceInterceptor implements HandlerInterceptor {

    @Resource
    private SysConfigService sysConfigService;

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();

            SystemMaintenance annotation = method.getAnnotation(SystemMaintenance.class);
            if (annotation != null) {
                //String flag = sysConfigService.getValueBySysIdAndKey("dagongp2p", "CONSTANT_KEY05");
                String flag = Global.getConfig("sys_is_open");
                if ("2".equals(flag)) {
                    return false;
                } else {
                    return true;
                }
            }
            return true;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // TODO Auto-generated method stub

    }

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // TODO Auto-generated method stub

    }

}
