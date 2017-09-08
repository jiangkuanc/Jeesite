/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 生成产品详情Entity
 *
 * @author lsm
 * @version 2016-08-15
 */
public class CmsReport extends DataEntity<CmsReport> {

    private static final long serialVersionUID = 1L;
    private String articleId;
    private String productName;        // 信息产品名称
    private String productContent;        // 信息产品简介
    private String productDisplay;        // 产品展示
    private String phone;        // 电话
    private String fax;        // 传真
    private String mailbox;        // 邮箱


    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public CmsReport() {
        super();
    }

    public CmsReport(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "信息产品名称长度必须介于 0 和 64 之间")
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Length(min = 0, max = 64, message = "信息产品简介长度必须介于 0 和 64 之间")
    public String getProductContent() {
        return productContent;
    }

    public void setProductContent(String productContent) {
        this.productContent = productContent;
    }

    @Length(min = 0, max = 1000, message = "产品展示长度必须介于 0 和 1000 之间")
    public String getProductDisplay() {
        return productDisplay;
    }

    public void setProductDisplay(String productDisplay) {
        this.productDisplay = productDisplay;
    }

    @Length(min = 0, max = 64, message = "电话长度必须介于 0 和 64 之间")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Length(min = 0, max = 64, message = "传真长度必须介于 0 和 64 之间")
    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    @Length(min = 0, max = 64, message = "邮箱长度必须介于 0 和 64 之间")
    public String getMailbox() {
        return mailbox;
    }

    public void setMailbox(String mailbox) {
        this.mailbox = mailbox;
    }

}