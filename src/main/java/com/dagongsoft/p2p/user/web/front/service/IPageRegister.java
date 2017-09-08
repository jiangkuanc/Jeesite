package com.dagongsoft.p2p.user.web.front.service;

import java.net.URL;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.web.servlet.ModelAndView;

import com.dagongsoft.p2p.user.web.front.model.PageCounter;

/**
 * 页面注册服务
 * 如果有新页面加入,先到该接口实现注册页面,并发布地址
 *
 * @author Joe
 */
public interface IPageRegister {

    PageCounter pageCounter = null;

    /**
     * 初始化常用页面
     *
     * @param pageMap
     */
    void initPageMap(Map<String, CopyOnWriteArrayList<String>> pageMap);

    /**
     * 字符串参数注册页面
     *
     * @param pageUrl
     * @return
     */
    Boolean registPage(String pageUrl);

    /**
     * URL参数注册页面
     *
     * @param pageUrl
     * @return
     */
    boolean registPage(URL pageUrl);


    /**
     * ModelAndView类型注册页面
     *
     * @param modelAndView
     * @return
     */
    String registPage(ModelAndView modelAndView);

    /**
     * @param modelAndView
     * @param type
     * @return
     */
    ModelAndView registPage(ModelAndView modelAndView, String type);

    /**
     * 判断页面是否在页面管理器中存在
     *
     * @param pageUrl
     * @return
     */
    PageCounter isExistsInPageMap(String pageUrl);

    /**
     * 从页面管理器中移除该页面
     *
     * @param pageUrl
     * @return
     */
    PageCounter removeInPageMap(String pageUrl);
}
