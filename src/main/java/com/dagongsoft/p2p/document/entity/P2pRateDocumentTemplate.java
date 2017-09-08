/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 评级材料模板Entity
 *
 * @author qichao
 * @version 2016-09-27
 */
public class P2pRateDocumentTemplate extends DataEntity<P2pRateDocumentTemplate> {

    private static final long serialVersionUID = 1L;
    private Integer tempType;        // 材料类型
    private String tempName;        // 名称
    private String enName;
    private String industryNum;
    private String tempExplain;
    private String tempAddress;
    private Integer isRequired;        //是否必填

    public P2pRateDocumentTemplate() {
        super();
    }

    public P2pRateDocumentTemplate(String id) {
        super(id);
    }

    public Integer getTempType() {
        return tempType;
    }

    public void setTempType(Integer tempType) {
        this.tempType = tempType;
    }

    public String getTempName() {
        return tempName;
    }

    public void setTempName(String tempName) {
        this.tempName = tempName;
    }

    public String getEnName() {
        return enName;
    }

    public void setEnName(String enName) {
        this.enName = enName;
    }

    public String getIndustryNum() {
        return industryNum;
    }

    public void setIndustryNum(String industryNum) {
        this.industryNum = industryNum;
    }


    public String getTempExplain() {
        return tempExplain;
    }

    public void setTempExplain(String tempExplain) {
        this.tempExplain = tempExplain;
    }

    public String getTempAddress() {
        return tempAddress;
    }

    public void setTempAddress(String tempAddress) {
        this.tempAddress = tempAddress;
    }

    public Integer getIsRequired() {
        return isRequired;
    }

    public void setIsRequired(Integer isRequired) {
        this.isRequired = isRequired;
    }


}