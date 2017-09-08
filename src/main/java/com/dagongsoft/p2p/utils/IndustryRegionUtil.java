package com.dagongsoft.p2p.utils;

import org.apache.commons.lang3.StringUtils;

import com.dagongsoft.p2p.config.dao.P2pIndustryclassiDao;
import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;

/**
 * 行业、地区工具类（待进一步扩展）
 *
 * @author Zach
 */
public class IndustryRegionUtil {

    private static P2pIndustryclassiDao industryclassiDao = SpringContextHolder.getBean(P2pIndustryclassiDao.class);


    public static String getIndustryclassiName(String value) {
        if (StringUtils.isNotBlank(value)) {
            P2pIndustryclassi industryclassi = industryclassiDao.get(value);
            if (industryclassi != null) {
                return industryclassi.getClassinameCn();
            }
        }
        return "";
    }

}

