package com.dagongsoft.p2p.user.web.front.interceptor;

import org.springframework.ui.ModelMap;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.context.request.WebRequestInterceptor;

import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 实名认证权限检查拦截器
 *
 * @author DAGONG
 */
public class CheckAuthInterceptor implements WebRequestInterceptor {
    private User user = null;

    @Override
    public void preHandle(WebRequest request) throws Exception {
        User user = (User) request.getAttribute("user", WebRequest.SCOPE_SESSION);
        if (user != null && !user.getRoleList().get(0).getId().equals("104")) {
            throw new AuthException("实名认证异常");
        }
    }

    @Override
    public void postHandle(WebRequest request, ModelMap model) throws Exception {
        try {
            if (user != null && user.getRoleList().get(0).getId().equals("104")) {
                P2pUserInformation p2pUserInformation = user.getP2pUserInformation();    //获取P2pUserInformation

            }
        } catch (Exception e) {
            throw new AuthException("实名认证异常");
        }
    }

    @Override
    public void afterCompletion(WebRequest request, Exception ex)
            throws Exception {

    }

}
