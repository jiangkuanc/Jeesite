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
import com.thinkgem.jeesite.modules.cms.dao.CmsForeignCountryDao;
import com.thinkgem.jeesite.modules.cms.entity.CmsForeignCountry;

/**
 * 国外信息表Service
 *
 * @author duan
 * @version 2016-08-17
 */
@Service
@Transactional(readOnly = true)
public class CmsForeignCountryService extends CrudService<CmsForeignCountryDao, CmsForeignCountry> {

    @Autowired
    private CmsForeignCountryDao cmsForeignCountryDao;

    public CmsForeignCountry get(String id) {
        return super.get(id);
    }

    public List<CmsForeignCountry> findList(CmsForeignCountry cmsForeignCountry) {
        return super.findList(cmsForeignCountry);
    }

    public Page<CmsForeignCountry> findPage(Page<CmsForeignCountry> page, CmsForeignCountry cmsForeignCountry) {
        return super.findPage(page, cmsForeignCountry);
    }

    @Transactional(readOnly = false)
    public void save(CmsForeignCountry cmsForeignCountry) {
        if (cmsForeignCountry.getContent() != null) {
            String content = cmsForeignCountry.getContent();
            content = convertHTML(content);
            System.out.println(content);
            cmsForeignCountry.setContent(StringEscapeUtils.unescapeHtml4(content));
        }
        super.save(cmsForeignCountry);
    }


    @Transactional(readOnly = false)
    public void delete(CmsForeignCountry cmsForeignCountry) {
        super.delete(cmsForeignCountry);
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


    /**
     * 查询国外前5个国家
     */

    public List<CmsForeignCountry> selectFrontForejgnCountry() {
        return cmsForeignCountryDao.selectFrontForejgnCountry();
    }

    /**
     * 根据区域id查询区域国家
     */
    public List<CmsForeignCountry> selectCountrysAccAid(String id) {
        return cmsForeignCountryDao.selectCountrysAccAid(id);
    }
}