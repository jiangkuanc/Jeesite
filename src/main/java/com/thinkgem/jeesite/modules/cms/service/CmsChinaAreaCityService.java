/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.service;

import java.util.List;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.cms.dao.CmsChinaAreaCityDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsChinaArea;
import com.thinkgem.jeesite.modules.cms.entity.CmsChinaAreaCity;

/**
 * cms_caService
 *
 * @author duan
 * @version 2016-08-15
 */
@Service
@Transactional(readOnly = true)
public class CmsChinaAreaCityService extends CrudService<CmsChinaAreaCityDao, CmsChinaAreaCity> {
    @Autowired
    private CmsChinaAreaCityDao cmsChinaAreaCityDao;


    public CmsChinaAreaCity get(String id) {
        return super.get(id);
    }

    public List<CmsChinaAreaCity> findList(CmsChinaAreaCity cmsChinaAreaCity) {
        return super.findList(cmsChinaAreaCity);
    }

    public Page<CmsChinaAreaCity> findPage(Page<CmsChinaAreaCity> page, CmsChinaAreaCity cmsChinaAreaCity) {
        return super.findPage(page, cmsChinaAreaCity);
    }

    /**
     *
     */
    @Transactional(readOnly = false)
    public void save(CmsChinaAreaCity cmsChinaAreaCity) {
        if (cmsChinaAreaCity.getContent() != null) {
            String content = cmsChinaAreaCity.getContent();
            content = convertHTML(content);
            cmsChinaAreaCity.setContent(StringEscapeUtils.unescapeHtml4(content));
        }
        super.save(cmsChinaAreaCity);
    }

    /**
     * @param content
     * @return
     */
    private static String convertHTML(String content) {
        if (!content.contains("src")) {
            return content;
        }
        char[] contentChar = content.toCharArray();
        int positionStart = 0;
        int positionEnd = 0;
        if (content != "" && content != null) {
            for (int i = 2; i < contentChar.length; i++) {
                if (contentChar[i - 1] == 's' && contentChar[i] == 'r' && contentChar[i + 1] == 'c') {
                    positionStart = i;
                    //out.print("i-->"+positionStart);
                }
                if ((contentChar[i - 1] == 'p' && contentChar[i] == 'n' && contentChar[i + 1] == 'g') || (contentChar[i - 1] == 'j' && contentChar[i] == 'p' && contentChar[i + 1] == 'g')) {
                    positionEnd = i;
                    //out.print("j--->"+positionEnd);
                }
            }
            content = content.substring(positionStart + 9, positionEnd + 2);
        }
        if (positionStart == 0 && positionEnd == 0) {
            return content;
        }

        return content;
    }

    @Transactional(readOnly = false)
    public void delete(CmsChinaAreaCity cmsChinaAreaCity) {
        super.delete(cmsChinaAreaCity);
    }

    @Transactional(readOnly = true)
    public List<CmsChinaAreaCity> findCityNames() {
        return cmsChinaAreaCityDao.findCityNames();
    }

    /**
     * 根据区域id查城市
     */
    public List<CmsChinaAreaCity> seletCtityNamesAccAid(CmsChinaArea cmsChinaArea) {
        return cmsChinaAreaCityDao.seletCtityNamesAccAid(cmsChinaArea);
    }


    /**
     * 根据城市id查询城市概况、介绍等信息
     *
     * @param id
     * @return
     */
    public CmsChinaAreaCity seletCtityInfoAccCid(String id) {
        return cmsChinaAreaCityDao.seletCtityInfoAccCid(id);
    }

}