/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 添加项目信息详情Entity
 *
 * @author lsm
 * @version 2016-08-10
 */
public class CmsProjectDetils extends DataEntity<CmsProjectDetils> {

    private static final long serialVersionUID = 1L;
    private String articleId;

    private String projectName;        // 项目名称
    private String investmentWay;        // 投资方式
    private String industryInvolved;        // 所属行业
    private String projectValidity;        // 项目有效期
    private String projectLocated;        // 项目所在地
    private String projectEnterprise;        // 项目简介
    private String projectDisplay;        // 项目展示
    private String cooperationOpportunities;        // 合作机会


    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public CmsProjectDetils() {
        super();
    }

    public CmsProjectDetils(String id) {
        super(id);
    }

    @Length(min = 0, max = 255, message = "项目名称长度必须介于 0 和 255 之间")
    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    @Length(min = 0, max = 255, message = "投资方式长度必须介于 0 和 255 之间")
    public String getInvestmentWay() {
        return investmentWay;
    }

    public void setInvestmentWay(String investmentWay) {
        this.investmentWay = investmentWay;
    }

    @Length(min = 0, max = 255, message = "所属行业长度必须介于 0 和 255 之间")
    public String getIndustryInvolved() {
        return industryInvolved;
    }

    public void setIndustryInvolved(String industryInvolved) {
        this.industryInvolved = industryInvolved;
    }

    @Length(min = 0, max = 16, message = "项目有效期长度必须介于 0 和 16 之间")
    public String getProjectValidity() {
        return projectValidity;
    }

    public void setProjectValidity(String projectValidity) {
        this.projectValidity = projectValidity;
    }

    @Length(min = 0, max = 255, message = "项目所在地长度必须介于 0 和 255 之间")
    public String getProjectLocated() {
        return projectLocated;
    }

    public void setProjectLocated(String projectLocated) {
        this.projectLocated = projectLocated;
    }

    @Length(min = 0, max = 10000, message = "项目简介长度必须介于 0 和 10000 之间")
    public String getProjectEnterprise() {
        return projectEnterprise;
    }

    public void setProjectEnterprise(String projectEnterprise) {
        this.projectEnterprise = projectEnterprise;
    }

    @Length(min = 0, max = 10000, message = "项目展示长度必须介于 0 和 10000 之间")
    public String getProjectDisplay() {
        return projectDisplay;
    }

    public void setProjectDisplay(String projectDisplay) {
        this.projectDisplay = projectDisplay;
    }

    @Length(min = 0, max = 1000, message = "合作机会长度必须介于 0 和 1000 之间")
    public String getCooperationOpportunities() {
        return cooperationOpportunities;
    }

    public void setCooperationOpportunities(String cooperationOpportunities) {
        this.cooperationOpportunities = cooperationOpportunities;
    }

}