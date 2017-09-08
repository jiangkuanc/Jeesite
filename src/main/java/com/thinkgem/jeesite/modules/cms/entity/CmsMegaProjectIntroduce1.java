/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 大型项目简介详情Entity
 *
 * @author lsm
 * @version 2016-08-11
 */
public class CmsMegaProjectIntroduce1 extends DataEntity<CmsMegaProjectIntroduce1> {

    private static final long serialVersionUID = 1L;
    private String articleId;
    private String projectName;//项目名称
    private String projectInvestment;        // 项目投资方
    private String projectContractor;        // 项目承建方
    private String projectSchedule;        // 项目进度
    private String projectLocated;        // 项目所在地
    private String contacts;        // 联系人
    private String duty;        // 职务
    private String phone;        // 联系电话
    private String industryInvolved;        // 所属行业
    private Date validity;        // 有效期至
    private String projectEnterprise;        // 项目简介
    private String workingRange;        // 工作范围
    private String qualificationRequirement;        // 资质要求
    private String requirement;        // 最低设计与咨询经验要求
    private String fileAccess;        // 招标文件获取
    private String fileSubmit;        // 文件提交
    private String projectDisplay;        // 项目展示
    private String cooperationOpportunities;        // 合作机会


    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public CmsMegaProjectIntroduce1() {
        super();
    }

    public CmsMegaProjectIntroduce1(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "项目投资方长度必须介于 0 和 64 之间")
    public String getProjectInvestment() {
        return projectInvestment;
    }

    public void setProjectInvestment(String projectInvestment) {
        this.projectInvestment = projectInvestment;
    }

    @Length(min = 0, max = 64, message = "项目承建方长度必须介于 0 和 64 之间")
    public String getProjectContractor() {
        return projectContractor;
    }

    public void setProjectContractor(String projectContractor) {
        this.projectContractor = projectContractor;
    }

    @Length(min = 0, max = 64, message = "项目进度长度必须介于 0 和 64 之间")
    public String getProjectSchedule() {
        return projectSchedule;
    }

    public void setProjectSchedule(String projectSchedule) {
        this.projectSchedule = projectSchedule;
    }

    @Length(min = 0, max = 255, message = "项目所在地长度必须介于 0 和 255 之间")
    public String getProjectLocated() {
        return projectLocated;
    }

    public void setProjectLocated(String projectLocated) {
        this.projectLocated = projectLocated;
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

    @Length(min = 0, max = 255, message = "所属行业长度必须介于 0 和 255 之间")
    public String getIndustryInvolved() {
        return industryInvolved;
    }

    public void setIndustryInvolved(String industryInvolved) {
        this.industryInvolved = industryInvolved;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getValidity() {
        return validity;
    }

    public void setValidity(Date validity) {
        this.validity = validity;
    }

    @Length(min = 0, max = 255, message = "项目简介长度必须介于 0 和 255 之间")
    public String getProjectEnterprise() {
        return projectEnterprise;
    }

    public void setProjectEnterprise(String projectEnterprise) {
        this.projectEnterprise = projectEnterprise;
    }

    @Length(min = 0, max = 255, message = "工作范围长度必须介于 0 和 255 之间")
    public String getWorkingRange() {
        return workingRange;
    }

    public void setWorkingRange(String workingRange) {
        this.workingRange = workingRange;
    }

    @Length(min = 0, max = 1000, message = "资质要求长度必须介于 0 和 1000 之间")
    public String getQualificationRequirement() {
        return qualificationRequirement;
    }

    public void setQualificationRequirement(String qualificationRequirement) {
        this.qualificationRequirement = qualificationRequirement;
    }

    @Length(min = 0, max = 255, message = "最低设计与咨询经验要求长度必须介于 0 和 255 之间")
    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    @Length(min = 0, max = 255, message = "招标文件获取长度必须介于 0 和 255 之间")
    public String getFileAccess() {
        return fileAccess;
    }

    public void setFileAccess(String fileAccess) {
        this.fileAccess = fileAccess;
    }

    @Length(min = 0, max = 255, message = "文件提交长度必须介于 0 和 255 之间")
    public String getFileSubmit() {
        return fileSubmit;
    }

    public void setFileSubmit(String fileSubmit) {
        this.fileSubmit = fileSubmit;
    }

    @Length(min = 0, max = 1000, message = "项目展示长度必须介于 0 和 1000 之间")
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