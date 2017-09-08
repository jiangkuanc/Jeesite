/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 国外区域表Entity
 *
 * @author duan
 * @version 2016-08-17
 */
public class CmsForeignArea extends DataEntity<CmsForeignArea> {

    private static final long serialVersionUID = 1L;
    private String areaname;        // 区域名称

    public CmsForeignArea() {
        super();
    }

    public CmsForeignArea(String id) {
        super(id);
    }

    @Length(min = 0, max = 255, message = "区域名称长度必须介于 0 和 255 之间")
    public String getAreaname() {
        return areaname;
    }

    public void setAreaname(String areaname) {
        this.areaname = areaname;
    }

}