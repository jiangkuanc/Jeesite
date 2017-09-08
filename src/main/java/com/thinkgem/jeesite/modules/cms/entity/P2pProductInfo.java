/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 产品供给信息Entity
 *
 * @author lsm
 * @version 2016-08-06
 */
public class P2pProductInfo extends DataEntity<P2pProductInfo> {

    private static final long serialVersionUID = 1L;
    private String productName;        // 产品名称
    private String productPrice;        // 产品单价
    private String supplyEnterprise;        // 供给企业
    private String minOrder;        // 最小起订量
    private String maxSupplyAmount;        // 最大供货量
    private String productInfo;        // 产品信息
    private String periodForDelivery;        // 发货期限
    private String supplyEnterpriseInfo;        // 供货企业信息简介
    private String productPic;        // 产品图片

    public P2pProductInfo() {
        super();
    }

    public P2pProductInfo(String id) {
        super(id);
    }

    @Length(min = 0, max = 255, message = "产品名称长度必须介于 0 和 255 之间")
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Length(min = 0, max = 32, message = "产品单价长度必须介于 0 和 32 之间")
    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    @Length(min = 0, max = 255, message = "supply_enterprise长度必须介于 0 和 255 之间")
    public String getSupplyEnterprise() {
        return supplyEnterprise;
    }

    public void setSupplyEnterprise(String supplyEnterprise) {
        this.supplyEnterprise = supplyEnterprise;
    }

    @Length(min = 0, max = 32, message = "最小起订量长度必须介于 0 和 32 之间")
    public String getMinOrder() {
        return minOrder;
    }

    public void setMinOrder(String minOrder) {
        this.minOrder = minOrder;
    }

    @Length(min = 0, max = 32, message = "最大供货量长度必须介于 0 和 32 之间")
    public String getMaxSupplyAmount() {
        return maxSupplyAmount;
    }

    public void setMaxSupplyAmount(String maxSupplyAmount) {
        this.maxSupplyAmount = maxSupplyAmount;
    }

    @Length(min = 0, max = 1000, message = "产品信息长度必须介于 0 和 1000 之间")
    public String getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(String productInfo) {
        this.productInfo = productInfo;
    }

    @Length(min = 0, max = 16, message = "发货期限长度必须介于 0 和 16 之间")
    public String getPeriodForDelivery() {
        return periodForDelivery;
    }

    public void setPeriodForDelivery(String periodForDelivery) {
        this.periodForDelivery = periodForDelivery;
    }

    @Length(min = 0, max = 1000, message = "供货企业信息简介长度必须介于 0 和 1000 之间")
    public String getSupplyEnterpriseInfo() {
        return supplyEnterpriseInfo;
    }

    public void setSupplyEnterpriseInfo(String supplyEnterpriseInfo) {
        this.supplyEnterpriseInfo = supplyEnterpriseInfo;
    }

    @Length(min = 0, max = 255, message = "产品图片长度必须介于 0 和 255 之间")
    public String getProductPic() {
        return productPic;
    }

    public void setProductPic(String productPic) {
        this.productPic = productPic;
    }

}