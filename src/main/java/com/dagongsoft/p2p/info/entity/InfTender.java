/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.info.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户招商Entity
 *
 * @author dagong
 * @version 2016-09-23
 */
public class InfTender extends DataEntity<InfTender> {

    private static final long serialVersionUID = 1L;
    private String projectName;        // 项目名称
    private Date termOfValidity;        // 有效期至
    private String projectLocation;        // 项目所在地
    private String investmentSide;        // 投资方
    private String constructionSide;        // 承建方
    private String industry;        // 行业
    private String envyProgress;        // 项目进度
    private String constructionSiteLogo;        // 承建方logo
    private String contactsPerson;        // 联系人
    private String positionPerson;        // 职位
    private String telphone;        // 联系电话
    private String biddingContent;        // 招标内容
    private String projectZhao;//项目招标书
    private String infoStage;//状态

    private Date publishTime;        // 发布时间

    private String userId;//用户编号

    public String getInfoStage() {
        return infoStage;
    }

    public void setInfoStage(String infoStage) {
        this.infoStage = infoStage;
    }

    public InfTender() {
        super();
    }

    public InfTender(String id) {
        super(id);
    }

    @Length(min = 0, max = 100, message = "项目名称长度必须介于 0 和 100 之间")
    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Date getTermOfValidity() {
        return termOfValidity;
    }

    public void setTermOfValidity(Date termOfValidity) {
        this.termOfValidity = termOfValidity;
    }

    @Length(min = 0, max = 255, message = "项目所在地长度必须介于 0 和 255 之间")
    public String getProjectLocation() {
        return projectLocation;
    }

    public void setProjectLocation(String projectLocation) {
        this.projectLocation = projectLocation;
    }

    @Length(min = 0, max = 255, message = "投资方长度必须介于 0 和 255 之间")
    public String getInvestmentSide() {
        return investmentSide;
    }

    public void setInvestmentSide(String investmentSide) {
        this.investmentSide = investmentSide;
    }

    @Length(min = 0, max = 255, message = "承建方长度必须介于 0 和 255 之间")
    public String getConstructionSide() {
        return constructionSide;
    }

    public void setConstructionSide(String constructionSide) {
        this.constructionSide = constructionSide;
    }

    @Length(min = 0, max = 255, message = "行业长度必须介于 0 和 255 之间")
    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    @Length(min = 0, max = 255, message = "项目进度长度必须介于 0 和 255 之间")
    public String getEnvyProgress() {
        return envyProgress;
    }

    public void setEnvyProgress(String envyProgress) {
        this.envyProgress = envyProgress;
    }

    @Length(min = 0, max = 255, message = "承建方logo长度必须介于 0 和 255 之间")
    public String getConstructionSiteLogo() {
        return constructionSiteLogo;
    }

    public void setConstructionSiteLogo(String constructionSiteLogo) {
        this.constructionSiteLogo = constructionSiteLogo;
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

    public String getBiddingContent() {
        return biddingContent;
    }

    public void setBiddingContent(String biddingContent) {
        this.biddingContent = biddingContent;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    @Length(min = 0, max = 255, message = "项目进度长度必须介于 0 和 255 之间")
    public String getProjectZhao() {
        return projectZhao;
    }

    public void setProjectZhao(String projectZhao) {
        this.projectZhao = projectZhao;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }


}