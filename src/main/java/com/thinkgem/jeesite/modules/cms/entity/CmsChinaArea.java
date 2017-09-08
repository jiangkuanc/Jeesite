/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * cms_caEntity
 *
 * @author duan
 * @version 2016-08-15
 */
public class CmsChinaArea extends DataEntity<CmsChinaArea> {

    private static final long serialVersionUID = 1L;
    private String areaname;        // areaname

    public CmsChinaArea() {
        super();
    }

    public CmsChinaArea(String id) {
        super(id);
    }

    @Length(min = 0, max = 255, message = "areaname长度必须介于 0 和 255 之间")
    public String getAreaname() {
        return areaname;
    }

    public void setAreaname(String areaname) {
        this.areaname = areaname;
    }

}