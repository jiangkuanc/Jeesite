package com.dagongsoft.p2p.user.listener;

import java.util.HashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.thinkgem.jeesite.modules.sys.entity.User;

public class SingleSignOnListener implements HttpSessionListener {

    private static HashMap<String, HttpSession> sessionMap = new HashMap<String, HttpSession>();
    private static int onlineCount = 0;

    @Override
    public void sessionCreated(HttpSessionEvent se) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        clearSessionRecord(se.getSession());
    }

    /**
     * 单点登录处理方法
     *
     * @param session
     * @param user
     */
    public static void ssologin(HttpSession session, User user) {
        HttpSession ss = sessionMap.get(user.getLoginName());
        if (ss != null) {
            ss.removeAttribute("user");
            sessionMap.remove(user.getLoginName());
            onlineCount--;
        }
        session.setAttribute("user", user);
        sessionMap.put(user.getLoginName(), session);
        onlineCount++;
    }

    /**
     * 统计前台在线人数
     */
    public static Integer calcOnlineCount() {
        return onlineCount;
    }

    /**
     * 删除SessionMap中的记录
     *
     * @param session
     */
    public static void clearSessionRecord(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            sessionMap.remove(user.getLoginName());
            onlineCount--;
        }

    }
}
