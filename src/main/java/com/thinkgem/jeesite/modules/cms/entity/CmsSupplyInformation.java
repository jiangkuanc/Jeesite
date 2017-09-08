/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 供给信息详情Entity
 *
 * @author lsm
 * @version 2016-08-11
 */
public class CmsSupplyInformation extends DataEntity<CmsSupplyInformation> {

    private static final long serialVersionUID = 1L;
    private String productId;            //产品编号
    private String informationName;        // 供给信息名称
    private String productPrice;        // 产品价格
    private String contacts;        // 联系人
    private String duty;        // 职务
    private String phone;        // 联系电话
    private String companyName;        // 企业名称
    private Date validity;        // 有效期至
    private String companyEnterprise;        // 企业简介
    private String companyDisplay;        // 企业展示
    private String minOrder;        // 最小起订量

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public CmsSupplyInformation() {
        super();
    }

    public CmsSupplyInformation(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "供给信息名称长度必须介于 0 和 64 之间")
    public String getInformationName() {
        return informationName;
    }

    public void setInformationName(String informationName) {
        this.informationName = informationName;
    }

    @Length(min = 0, max = 64, message = "产品价格长度必须介于 0 和 64 之间")
    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    @Length(min = 0, max = 64, message = "联系人长度必须介于 0 和 64 之间")
    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    @Length(min = 0, max = 255, message = "职务长度必须介于 0 和 255 之间")
    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    @Length(min = 0, max = 64, message = "联系电话长度必须介于 0 和 64 之间")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Length(min = 0, max = 64, message = "企业名称长度必须介于 0 和 64 之间")
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getValidity() {
        return validity;
    }

    public void setValidity(Date validity) {
        this.validity = validity;
    }

    @Length(min = 0, max = 255, message = "企业简介长度必须介于 0 和 255 之间")
    public String getCompanyEnterprise() {
        return companyEnterprise;
    }

    public void setCompanyEnterprise(String companyEnterprise) {
        this.companyEnterprise = companyEnterprise;
    }

    @Length(min = 0, max = 1000, message = "企业展示长度必须介于 0 和 1000 之间")
    public String getCompanyDisplay() {
        return companyDisplay;
    }

    public void setCompanyDisplay(String companyDisplay) {
        this.companyDisplay = companyDisplay;
    }

    @Length(min = 0, max = 32, message = "最小起订量长度必须介于 0 和 32 之间")
    public String getMinOrder() {
        return minOrder;
    }

    public void setMinOrder(String minOrder) {
        this.minOrder = minOrder;
    }

}