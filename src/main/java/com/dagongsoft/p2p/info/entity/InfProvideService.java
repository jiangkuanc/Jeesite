/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.info.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户提供服务Entity
 *
 * @author dagong
 * @version 2016-09-23
 */
public class InfProvideService extends DataEntity<InfProvideService> {

    private static final long serialVersionUID = 1L;
    private String productServiceName;        // 产品或服务名称
    private Date termOfValidity;        // 有效期至
    private String productUnitPrice;        // 产品单价
    private String setNum;        // 起订数量
    private String enterpriseName;        // 企业名称
    private String contactsPerson;        // 联系人
    private String positionPerson;        // 职位
    private String telphone;        // 联系电话
    private String tax;        // 传真
    private String productPicture;        // 产品图片
    private String productServiceIntroduction;        // 产品服务介绍
    private Date publishTime;        // 发布时间

    public InfProvideService() {
        super();
    }

    public InfProvideService(String id) {
        super(id);
    }

    @Length(min = 0, max = 255, message = "产品或服务名称长度必须介于 0 和 255 之间")
    public String getProductServiceName() {
        return productServiceName;
    }

    public void setProductServiceName(String productServiceName) {
        this.productServiceName = productServiceName;
    }

    public Date getTermOfValidity() {
        return termOfValidity;
    }

    public void setTermOfValidity(Date termOfValidity) {
        this.termOfValidity = termOfValidity;
    }

    @Length(min = 0, max = 50, message = "产品单价长度必须介于 0 和 50 之间")
    public String getProductUnitPrice() {
        return productUnitPrice;
    }

    public void setProductUnitPrice(String productUnitPrice) {
        this.productUnitPrice = productUnitPrice;
    }

    @Length(min = 0, max = 50, message = "起订数量长度必须介于 0 和 50 之间")
    public String getSetNum() {
        return setNum;
    }

    public void setSetNum(String setNum) {
        this.setNum = setNum;
    }

    @Length(min = 0, max = 255, message = "企业名称长度必须介于 0 和 255 之间")
    public String getEnterpriseName() {
        return enterpriseName;
    }

    public void setEnterpriseName(String enterpriseName) {
        this.enterpriseName = enterpriseName;
    }

    @Length(min = 0, max = 255, message = "联系人长度必须介于 0 和 255 之间")
    public String getContactsPerson() {
        return contactsPerson;
    }

    public void setContactsPerson(String contactsPerson) {
        this.contactsPerson = contactsPerson;
    }

    @Length(min = 0, max = 255, message = "职位长度必须介于 0 和 255 之间")
    public String getPositionPerson() {
        return positionPerson;
    }

    public void setPositionPerson(String positionPerson) {
        this.positionPerson = positionPerson;
    }

    @Length(min = 0, max = 11, message = "联系电话长度必须介于 0 和 11 之间")
    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    @Length(min = 0, max = 11, message = "传真长度必须介于 0 和 11 之间")
    public String getTax() {
        return tax;
    }

    public void setTax(String tax) {
        this.tax = tax;
    }

    @Length(min = 0, max = 255, message = "产品图片长度必须介于 0 和 255 之间")
    public String getProductPicture() {
        return productPicture;
    }

    public void setProductPicture(String productPicture) {
        this.productPicture = productPicture;
    }

    public String getProductServiceIntroduction() {
        return productServiceIntroduction;
    }

    public void setProductServiceIntroduction(String productServiceIntroduction) {
        this.productServiceIntroduction = productServiceIntroduction;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

}