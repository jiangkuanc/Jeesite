/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 国外信息表Entity
 *
 * @author duan
 * @version 2016-08-17
 */
public class CmsForeignCountry extends DataEntity<CmsForeignCountry> {

    private static final long serialVersionUID = 1L;
    private String cmsForgignAreaId;        // 国外区域id
    private String cmsCountryName;        // 国家名称
    private String cmsCountryBasic;        // 国家基本情况
    private String cmsCountryPosition;        // 国家地理位置
    private String cmsCountryPopulation;        // 国家人口
    private String cmsCountryNation;        // 民族
    private String content;        // 国家形象图片

    public CmsForeignCountry() {
        super();
    }

    public CmsForeignCountry(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "国外区域id长度必须介于 0 和 64 之间")
    public String getCmsForgignAreaId() {
        return cmsForgignAreaId;
    }

    public void setCmsForgignAreaId(String cmsForgignAreaId) {
        this.cmsForgignAreaId = cmsForgignAreaId;
    }

    @Length(min = 0, max = 255, message = "国家名称长度必须介于 0 和 255 之间")
    public String getCmsCountryName() {
        return cmsCountryName;
    }

    public void setCmsCountryName(String cmsCountryName) {
        this.cmsCountryName = cmsCountryName;
    }

    public String getCmsCountryBasic() {
        return cmsCountryBasic;
    }

    public void setCmsCountryBasic(String cmsCountryBasic) {
        this.cmsCountryBasic = cmsCountryBasic;
    }

    public String getCmsCountryPosition() {
        return cmsCountryPosition;
    }

    public void setCmsCountryPosition(String cmsCountryPosition) {
        this.cmsCountryPosition = cmsCountryPosition;
    }

    public String getCmsCountryPopulation() {
        return cmsCountryPopulation;
    }

    public void setCmsCountryPopulation(String cmsCountryPopulation) {
        this.cmsCountryPopulation = cmsCountryPopulation;
    }

    public String getCmsCountryNation() {
        return cmsCountryNation;
    }

    public void setCmsCountryNation(String cmsCountryNation) {
        this.cmsCountryNation = cmsCountryNation;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}