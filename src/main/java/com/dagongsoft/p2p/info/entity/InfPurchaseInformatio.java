/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.info.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户求购信息Entity
 *
 * @author dagong
 * @version 2016-09-23
 */
public class InfPurchaseInformatio extends DataEntity<InfPurchaseInformatio> {

    private static final long serialVersionUID = 1L;
    private String productName;        // 求购产品名称
    private String expectedPrice;        // 期望价格
    private String budgetAmount;        // 预算金额
    private String requiredQuantity;        // 所需数量
    private String enterpriseName;        // 企业名称
    private String contactsPerson;        // 联系人
    private String telphone;        // 联系电话
    private Date termOfValidity;        // 有效期至
    private Date publishTime;        // 发布时间
    private String notes;        // 附注说明
    private String productPicture;        // 产品图片

    public InfPurchaseInformatio() {
        super();
    }

    public InfPurchaseInformatio(String id) {
        super(id);
    }

    @Length(min = 0, max = 255, message = "求购产品名称长度必须介于 0 和 255 之间")
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Length(min = 0, max = 50, message = "期望价格长度必须介于 0 和 50 之间")
    public String getExpectedPrice() {
        return expectedPrice;
    }

    public void setExpectedPrice(String expectedPrice) {
        this.expectedPrice = expectedPrice;
    }

    @Length(min = 0, max = 50, message = "预算金额长度必须介于 0 和 50 之间")
    public String getBudgetAmount() {
        return budgetAmount;
    }

    public void setBudgetAmount(String budgetAmount) {
        this.budgetAmount = budgetAmount;
    }

    @Length(min = 0, max = 50, message = "所需数量长度必须介于 0 和 50 之间")
    public String getRequiredQuantity() {
        return requiredQuantity;
    }

    public void setRequiredQuantity(String requiredQuantity) {
        this.requiredQuantity = requiredQuantity;
    }

    @Length(min = 0, max = 100, message = "企业名称长度必须介于 0 和 100 之间")
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

    @Length(min = 0, max = 11, message = "联系电话长度必须介于 0 和 11 之间")
    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public Date getTermOfValidity() {
        return termOfValidity;
    }

    public void setTermOfValidity(Date termOfValidity) {
        this.termOfValidity = termOfValidity;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    @Length(min = 0, max = 1000, message = "附注说明长度必须介于 0 和 1000 之间")
    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Length(min = 0, max = 255, message = "产品图片长度必须介于 0 和 255 之间")
    public String getProductPicture() {
        return productPicture;
    }

    public void setProductPicture(String productPicture) {
        this.productPicture = productPicture;
    }

}