package com.dagongsoft.p2p.utils;

import java.util.List;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.dao.AreaDao;
import com.thinkgem.jeesite.modules.sys.entity.Area;

public class AreaUtils {

    private static AreaDao areaDao = SpringContextHolder.getBean(AreaDao.class);

    public static List<Area> loadProvincialArea() {
        List<Area> list = areaDao.loadProvincialArea();
        return list;
    }

    public static List<Area> loadMunicipalArea(String parentId) {
        List<Area> list = areaDao.loadMunicipalArea(parentId);
        return list;
    }

    public static Area findById(String id) {
        return areaDao.findById(id);
    }
}
