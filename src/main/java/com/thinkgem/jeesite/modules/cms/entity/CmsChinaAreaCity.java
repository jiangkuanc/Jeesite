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
public class CmsChinaAreaCity extends DataEntity<CmsChinaAreaCity> {

    private static final long serialVersionUID = 1L;
    private String cmsChinaAreaId;        // cms_china_area_id
    private String cmsChinaAreaCityName;        // cms_china_area_city_name
    private String cmsChinaAreaCityBasic;        // cms_china_area_city_basic
    private String cmsChinaAreaCityPosition;        // cms_china_area_city_position
    private String cmsChinaAreaCityPopulation;
    private String cmsChinaAreaCityNation;        // cms_china_area_city_nation
    private String content;


    public CmsChinaAreaCity() {
        super();
    }

    public CmsChinaAreaCity(String id) {
        super(id);
    }


    public String getCmsChinaAreaCityPopulation() {
        return cmsChinaAreaCityPopulation;
    }

    public void setCmsChinaAreaCityPopulation(String cmsChinaAreaCityPopulation) {
        this.cmsChinaAreaCityPopulation = cmsChinaAreaCityPopulation;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Length(min = 0, max = 64, message = "cms_china_area_id长度必须介于 0 和 64 之间")
    public String getCmsChinaAreaId() {
        return cmsChinaAreaId;
    }

    public void setCmsChinaAreaId(String cmsChinaAreaId) {
        this.cmsChinaAreaId = cmsChinaAreaId;
    }

    @Length(min = 0, max = 255, message = "cms_china_area_city_name长度必须介于 0 和 255 之间")
    public String getCmsChinaAreaCityName() {
        return cmsChinaAreaCityName;
    }

    public void setCmsChinaAreaCityName(String cmsChinaAreaCityName) {
        this.cmsChinaAreaCityName = cmsChinaAreaCityName;
    }

    public String getCmsChinaAreaCityBasic() {
        return cmsChinaAreaCityBasic;
    }

    public void setCmsChinaAreaCityBasic(String cmsChinaAreaCityBasic) {
        this.cmsChinaAreaCityBasic = cmsChinaAreaCityBasic;
    }

    public String getCmsChinaAreaCityPosition() {
        return cmsChinaAreaCityPosition;
    }

    public void setCmsChinaAreaCityPosition(String cmsChinaAreaCityPosition) {
        this.cmsChinaAreaCityPosition = cmsChinaAreaCityPosition;
    }

    public String getCmsChinaAreaCityNation() {
        return cmsChinaAreaCityNation;
    }

    public void setCmsChinaAreaCityNation(String cmsChinaAreaCityNation) {
        this.cmsChinaAreaCityNation = cmsChinaAreaCityNation;
    }

}