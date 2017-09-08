package com.dagongsoft.p2p.user.web.front.controller;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.dagongsoft.p2p.user.web.front.util.Base64Util;
import com.dagongsoft.p2p.user.web.front.util.BaseCookieEnum;
import com.dagongsoft.p2p.user.web.front.util.BaseEnum;
import com.dagongsoft.p2p.user.web.front.util.BaseSessionEnum;
import com.dagongsoft.p2p.user.web.front.util.ResultJson;
import com.dagongsoft.p2p.user.web.front.util.StringUtil;
import com.thinkgem.jeesite.common.mapper.JsonMapper;

/**
 * 基础控制类
 *
 * @author Joe
 */
public abstract class BaseController {

    /**
     *
     * @param request
     * @return
     */
    /**
     * 默认页码参数
     */
    private final String PAGE_NO = "pageNo";

    /**
     * 默认一页显示的数量
     */
    private final String PAGE_SIZE = "pageSize";
    /**
     * Log4j日志记录
     *
     * @param request
     * @return
     */
    protected final Logger LOG = Logger.getLogger(this.getClass());

    protected Integer getPageNo(HttpServletRequest request) {
        return this.getInt(request, PAGE_NO, 1);
    }

    /**
     * 获取整型值
     *
     * @param request HttpServletRequest对象
     * @param param   参数名称
     * @param def     默认值，如果参数不存在或不符合规则就用默认值替代
     * @return 返回整型值
     */
    protected Integer getInt(HttpServletRequest request, String param, int def) {
        String value = request.getParameter(param);
        if (StringUtil.isInteger(value)) {
            return Integer.parseInt(value);
        } else {
            return def;
        }
    }

    /**
     * @param request
     * @param param
     * @return
     * @author Joe
     */
    protected Integer getInt(HttpServletRequest request, String param) {
        String value = request.getParameter("param");
        if (StringUtil.isInteger(value)) {
            return Integer.parseInt(value);
        } else {
            return 0;
        }
    }

    /**
     * 获取当前一页显示数量,默认参数名称pageSize 默认10条
     *
     * @param request HttpServletRequest对象
     * @return 默认10, 如果存在pageNo参数就返回相应的值
     */
    protected Integer getPageSize(HttpServletRequest request) {
        return this.getPageSize(request, 10);
    }

    /**
     * 获取当前一页显示数量,默认参数名称pageSize
     *
     * @param request  HttpServletRequest对象
     * @param pageSize 一页显示条数
     * @return 默认10, 如果存在pageNo参数就返回相应的值
     */
    protected Integer getPageSize(HttpServletRequest request, int pageSize) {
        return this.getInt(request, PAGE_SIZE, pageSize);
    }

    /**
     * 获取base64机密的整型值
     *
     * @param request
     * @param param
     * @return
     */
    protected Integer getIntBase64(HttpServletRequest request, String param) {
        String value = request.getParameter(param);
        if (StringUtil.isInteger(value)) {
            return Integer.parseInt(new String(Base64Util.decode(value)));
        } else {
            return null;
        }
    }

    public Object getSession(HttpServletRequest request, BaseSessionEnum key) {
        return request.getSession().getAttribute(key.toString());
    }

    /**
     * 设置session的值
     *
     * @param request HttpServletRequest对象
     * @param key     枚举类中的值
     */
    protected void setSession(HttpServletRequest request, BaseSessionEnum key,
                              Object value) {
        request.getSession().setAttribute(key.toString(), value);
    }

    /**
     * 移除session的值
     *
     * @param request HttpServletRequest对象
     * @param key     枚举类中的值
     */
    protected void removeSession(HttpServletRequest request, BaseSessionEnum key) {
        request.getSession().removeAttribute(key.toString());
    }

    /**
     * 获取Cookie的值
     *
     * @param request HttpServletRequest对象
     * @param key     枚举类中的值
     * @return Cookie中获取的对象
     */
    protected String getCookie(HttpServletRequest request, BaseCookieEnum key) {
        if (request.getCookies() != null) {
            for (Cookie c : request.getCookies()) {
                if (c.getName().equals(key.toString())) {
                    return c.getValue();
                }
            }
        }
        return null;
    }

    /**
     * 设置Cookie值
     *
     * @param request  HttpServletRequest对象
     * @param response HttpServletResponse对象
     * @param key      枚举类中的值
     * @param value    存储对象
     */
    protected void setCookie(HttpServletRequest request,
                             HttpServletResponse response, BaseCookieEnum key, Object value) {
        request.getSession().setAttribute(key.toString(), value);
        Cookie cookie = new Cookie(key.toString(), (String) value);
        cookie.setPath("/");
        cookie.setValue((String) value);
        response.addCookie(cookie);
    }

    /**
     * 输出json数据
     *
     * @param response HttpServletResponse对象
     * @param code     模块编号<br/>
     * @param flag     成功状态,true:成功、false:失败
     * @param msg      提示信息
     * @param data     数据
     */
    protected void outJson(HttpServletResponse response, BaseEnum code,
                           boolean flag, String msg, String data) {
        try {
            response.setContentType("application/json;charset=utf-8");
            ResultJson result = new ResultJson();
            if (code != null) {
                result.setCode(code.toString());
            }
            result.setResult(flag);
            result.setResultMsg(msg);
            result.setResultData(data);
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.print(JsonMapper.toJsonString(result));
            LOG.debug(JsonMapper.toJsonString(result));
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            LOG.error(e);
        }
    }

    /**
     * 输出json数据
     *
     * @param response HttpServletResponse对象
     * @param code     模块编号<br/>
     * @param flag     成功状态,true:成功、false:失败
     * @param msg      提示信息
     */
    protected void outJson(HttpServletResponse response, BaseEnum code,
                           boolean flag, String msg) {
        this.outJson(response, code, flag, msg, null);
    }

    /**
     * 输出json数据
     *
     * @param response HttpServletResponse对象
     * @param code     模块编号<br/>
     * @param flag     成功状态,true:成功、false:失败
     * @param msg      提示信息
     */
    protected void outJson(HttpServletResponse response, boolean flag,
                           String msg) {
        this.outJson(response, null, flag, msg, null);
    }

    /**
     * 输出json数据
     *
     * @param response HttpServletResponse对象
     * @param code     模块编号<br/>
     * @param flag     成功状态,true:成功、false:失败
     */
    protected void outJson(HttpServletResponse response, BaseEnum code,
                           boolean flag) {
        this.outJson(response, code, flag, null, null);
    }

    /**
     * 输出json数据
     *
     * @param response HttpServletResponse对象
     * @param flag     成功状态,true:成功、false:失败
     */
    protected void outJson(HttpServletResponse response, boolean flag) {
        this.outJson(response, null, flag, null, null);
    }

    /**
     * 输出json数据字符串
     *
     * @param response    HttpServletResponse对象
     * @param jsonDataStr 字符串
     */
    protected void outJson(HttpServletResponse response, Object jsonDataStr) {
        try {
            response.setContentType("application/json;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print(jsonDataStr);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
            LOG.error(e);
        }
    }

    /**
     * 获取项目路径
     *
     * @param request HttpServletRequest对象
     * @return 返回项目路径，例如：http://www.ip.com/projectName 后面没有反斜杠，后面接地址或参数必须加/
     */
    protected String getUrl(HttpServletRequest request) {
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName();
        if (request.getServerPort() == 80) {
            basePath += path;
        } else {
            basePath += ":" + request.getServerPort() + path;
        }
        return basePath;
    }

    /**
     * 获取请求域名，域名不包括http请求协议头
     *
     * @param request HttpServletRequest对象
     * @return 返回域名地址
     */
    protected String getDomain(HttpServletRequest request) {
        String path = request.getContextPath();
        String domain = request.getServerName();
        if (request.getServerPort() == 80) {
            domain += path;
        } else {
            domain += ":" + request.getServerPort() + path;
        }
        return domain;
    }

    /**
     * 读取服务器主机信息
     *
     * @param request HttpServletRequest对象
     * @return 返回主机信息
     */
    protected String getHost(HttpServletRequest request) {
        String basePath = request.getServerName();
        if (request.getServerPort() != 80) {
            basePath += ":" + request.getServerPort();
        }
        return basePath;
    }

    /**
     * 读取服务器主机ip信息
     *
     * @return 返回主机IP，异常将会获取不到ip
     */
    protected String getHostIp() {
        InetAddress addr;
        try {
            addr = InetAddress.getLocalHost();
            return addr.getHostAddress().toString();// 获得本机IP
        } catch (UnknownHostException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "";
    }

    /**
     * 通过spring的webapplicationcontext上下文对象读取bean对象
     *
     * @param sc       上下文servletConext对象
     * @param beanName 要读取的bean的名称
     * @return 返回获取到的对象。获取不到返回null
     */
    protected Object getBean(ServletContext sc, String beanName) {
        return WebApplicationContextUtils.getWebApplicationContext(sc).getBean(beanName);
    }

    /**
     * 获取请求客户端ip
     *
     * @param request
     * @return ip地址
     */
    public String getIp(HttpServletRequest request) {
        String ipAddress = null;
        // ipAddress = this.getRequest().getRemoteAddr();
        ipAddress = request.getHeader("x-forwarded-for");
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if (ipAddress.equals("127.0.0.1")) {
                // 根据网卡取本机配置的IP
                InetAddress inet = null;
                try {
                    inet = InetAddress.getLocalHost();
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
                ipAddress = inet.getHostAddress();
            }

        }

        // 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
            // = 15
            if (ipAddress.indexOf(",") > 0) {
                ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
            }
        }
        return ipAddress;
    }

    /**
     * 获取对应ip地址的mac地址
     *
     * @param ip
     * @return mac地址
     */
    public String getMACAddress(String ip) {
        String str = "";
        String macAddress = "";
        try {
            Process p = Runtime.getRuntime().exec("nbtstat -A " + ip);
            InputStreamReader ir = new InputStreamReader(p.getInputStream());
            LineNumberReader input = new LineNumberReader(ir);
            for (int i = 1; i < 100; i++) {
                str = input.readLine();
                if (str != null) {
                    if (str.indexOf("MAC Address") > 1) {
                        macAddress = str.substring(str.indexOf("MAC Address") + 14, str.length());
                        break;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace(System.out);
        }
        return macAddress;
    }


}
