package com.dagongsoft.p2p.user.web.front.register;

import java.net.URL;
import java.util.Collection;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.web.servlet.ModelAndView;

import com.dagongsoft.p2p.user.web.front.model.PageCounter;
import com.dagongsoft.p2p.user.web.front.service.IPageRegister;

/**
 * 页面注册器的实现类
 *
 * @author Joe
 */
public class PageRegisterManager implements IPageRegister {

    Map<String, CopyOnWriteArrayList<String>> pageMap = new ConcurrentHashMap<String, CopyOnWriteArrayList<String>>();

    @Override
    public void initPageMap(Map<String, CopyOnWriteArrayList<String>> pageMap) {
        this.pageMap = pageMap;
    }

    /**
     * 注册页面实现方法
     */
    @Override
    public Boolean registPage(String pageUrl) {
        Boolean registIsOk = Boolean.TRUE;
        ;
        try {
            Collection<CopyOnWriteArrayList<String>> PageRegisterList = pageMap.values();
            for (CopyOnWriteArrayList<String> copyOnWriteArrayList : PageRegisterList) {
                copyOnWriteArrayList.add(copyOnWriteArrayList.size(), pageUrl);
            }
        } catch (Exception e) {
            return registIsOk = Boolean.FALSE;
        }
        return registIsOk;
    }

    @Override
    public String registPage(ModelAndView modelAndView) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public ModelAndView registPage(ModelAndView modelAndView, String type) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public PageCounter isExistsInPageMap(String pageUrl) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public PageCounter removeInPageMap(String pageUrl) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean registPage(URL pageUrl) {
        // TODO Auto-generated method stub
        return false;
    }


}
