/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 生成需求详细信息Entity
 *
 * @author lsm
 * @version 2016-08-12
 */
public class CmsDemandInformation extends DataEntity<CmsDemandInformation> {

    private static final long serialVersionUID = 1L;
    private String requirementId;    //信息产品编号
    private String productName;        // 产品名称
    private String hopePrice;        // 期望价格
    private String budgetAmount;        // 预算金额
    private String requiredNumber;        // 所需数量
    private String companyName;        // 企业名称
    private String contacts;        // 联系人
    private String phone;        // 联系电话
    private Date validity;        // 有效期至
    private String requiredEnterprise;        // 需求信息简介


    public String getRequirementId() {
        return requirementId;
    }

    public void setRequirementId(String requirementId) {
        this.requirementId = requirementId;
    }

    public CmsDemandInformation() {
        super();
    }

    public CmsDemandInformation(String id) {
        super(id);
    }

    @Length(min = 0, max = 255, message = "产品名称长度必须介于 0 和 255 之间")
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Length(min = 0, max = 255, message = "期望价格长度必须介于 0 和 255 之间")
    public String getHopePrice() {
        return hopePrice;
    }

    public void setHopePrice(String hopePrice) {
        this.hopePrice = hopePrice;
    }

    @Length(min = 0, max = 255, message = "预算金额长度必须介于 0 和 255 之间")
    public String getBudgetAmount() {
        return budgetAmount;
    }

    public void setBudgetAmount(String budgetAmount) {
        this.budgetAmount = budgetAmount;
    }

    @Length(min = 0, max = 255, message = "所需数量长度必须介于 0 和 255 之间")
    public String getRequiredNumber() {
        return requiredNumber;
    }

    public void setRequiredNumber(String requiredNumber) {
        this.requiredNumber = requiredNumber;
    }

    @Length(min = 0, max = 255, message = "企业名称长度必须介于 0 和 255 之间")
    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    @Length(min = 0, max = 64, message = "联系人长度必须介于 0 和 64 之间")
    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    @Length(min = 0, max = 64, message = "联系电话长度必须介于 0 和 64 之间")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getValidity() {
        return validity;
    }

    public void setValidity(Date validity) {
        this.validity = validity;
    }

    @Length(min = 0, max = 255, message = "需求信息简介长度必须介于 0 和 255 之间")
    public String getRequiredEnterprise() {
        return requiredEnterprise;
    }

    public void setRequiredEnterprise(String requiredEnterprise) {
        this.requiredEnterprise = requiredEnterprise;
    }

}