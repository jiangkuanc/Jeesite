/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 生成产品需求信息Entity
 *
 * @author lsm
 * @version 2016-08-12
 */
public class CmsRequirementInformation extends DataEntity<CmsRequirementInformation> {

    private static final long serialVersionUID = 1L;
    private String productName;        // 产品名称
    private String demandEnterprise;        // 需求企业
    private String productPrice;        // 产品单价
    private String demandQuantity;        // 需求数量
    private String periodForDelivery;        // 发货期限


    public CmsRequirementInformation() {
        super();
    }

    public CmsRequirementInformation(String id) {
        super(id);
    }

    @Length(min = 0, max = 255, message = "产品名称长度必须介于 0 和 255 之间")
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Length(min = 0, max = 255, message = "需求企业长度必须介于 0 和 255 之间")
    public String getDemandEnterprise() {
        return demandEnterprise;
    }

    public void setDemandEnterprise(String demandEnterprise) {
        this.demandEnterprise = demandEnterprise;
    }

    @Length(min = 0, max = 32, message = "产品单价长度必须介于 0 和 32 之间")
    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    @Length(min = 0, max = 255, message = "需求数量长度必须介于 0 和 255 之间")
    public String getDemandQuantity() {
        return demandQuantity;
    }

    public void setDemandQuantity(String demandQuantity) {
        this.demandQuantity = demandQuantity;
    }

    @Length(min = 0, max = 16, message = "发货期限长度必须介于 0 和 16 之间")
    public String getPeriodForDelivery() {
        return periodForDelivery;
    }

    public void setPeriodForDelivery(String periodForDelivery) {
        this.periodForDelivery = periodForDelivery;
    }

}