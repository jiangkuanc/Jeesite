package com.dagongsoft.p2p.utils;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.thinkgem.jeesite.common.mapper.JsonMapper;

/**
 * 响应数据给页面
 *
 * @author Administrator
 */
public class FormatData2Json {

    /**
     * 将数据写成json格式响应给浏览器
     *
     * @param response 响应对象
     * @param object   被写成json数据对象
     */
    public static void writeJson(HttpServletResponse response, Object objcet) {
        String json = JsonMapper.getInstance().toJson(objcet);
        try {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 将带有日期的数据写成json格式响应给浏览器
     *
     * @param response 响应对象
     * @param object   被写成json数据对象
     */
    public static void writeJsonWithDateFormat(HttpServletResponse response, Object object) {
        String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd");
        try {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 将带有日期的数据写成json格式响应给浏览器
     *
     * @param response 响应对象
     * @param object   被写成json数据对象
     */
    public static void parseJsonWithDateFormat(HttpServletResponse response, Object object) {
        String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss");
        try {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
