/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.entity;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 文章Entity
 *
 * @author ThinkGem
 * @version 2013-05-15
 */

/**
 * @author DAGONG
 */
public class Article extends DataEntity<Article> {

    public static final String DEFAULT_TEMPLATE = "frontViewArticle";

    private static final long serialVersionUID = 1L;
    private Category category;// 分类编号
    private String title;    // 标题
    private String link;    // 外部链接
    private String color;    // 标题颜色（red：红色；green：绿色；blue：蓝色；yellow：黄色；orange：橙色）
    private String image;    //
    private String keywords;// 关键字
    private String description;// 描述、摘要
    private Integer weight;    // 权重，越大越靠前
    private Date weightDate;// 权重期限，超过期限，将weight设置为0
    private Integer hits;    // 点击数
    private String posid;    // 推荐位，多选（1：首页焦点图；2：栏目页文章推荐；）
    private String customContentView;    // 自定义内容视图
    private String viewConfig;    // 视图参数

    private ArticleData articleData;    //文章副表

    //private Date beginDate;// 开始时间
    private Date createDate;
    private Date endDate;    // 结束时间
    private String speaker;//讲堂作者

    private User user;
    private String relatedEnterprises;//相关企业
    private String projectScale;//项目规模
    private String country;//国别

    private String auditOpinion;  //审核意见
    private String nthroughReason; //不通过原因
    private Date auditTime; //审核时间
    private String auditor; //审核人
    private String reviewOpinions; //复审意见
    private String nreviewReason; //复审不通过原因
    private Date reviewTime; //复审时间
    private String reauditor; //复审人

    private String statusCode; //状态码
    private String activityLocation; //报名地点
    private String registrationWay; //报名方式
    private String eventMessage; //活动寄语
    private String lectureNumber; //讲堂序号

    public String getLectureNumber() {
        return lectureNumber;
    }

    public void setLectureNumber(String lectureNumber) {
        this.lectureNumber = lectureNumber;
    }

    public String getEventMessage() {
        return eventMessage;
    }

    public void setEventMessage(String eventMessage) {
        this.eventMessage = eventMessage;
    }

    public String getActivityLocation() {
        return activityLocation;
    }

    public void setActivityLocation(String activityLocation) {
        this.activityLocation = activityLocation;
    }

    public String getRegistrationWay() {
        return registrationWay;
    }

    public void setRegistrationWay(String registrationWay) {
        this.registrationWay = registrationWay;
    }

    public String getAuditOpinion() {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion) {
        this.auditOpinion = auditOpinion;
    }

    public String getNthroughReason() {
        return nthroughReason;
    }

    public void setNthroughReason(String nthroughReason) {
        this.nthroughReason = nthroughReason;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    public String getAuditor() {
        return auditor;
    }

    public void setAuditor(String auditor) {
        this.auditor = auditor;
    }

    public String getReviewOpinions() {
        return reviewOpinions;
    }

    public void setReviewOpinions(String reviewOpinions) {
        this.reviewOpinions = reviewOpinions;
    }

    public String getNreviewReason() {
        return nreviewReason;
    }

    public void setNreviewReason(String nreviewReason) {
        this.nreviewReason = nreviewReason;
    }

    public Date getReviewTime() {
        return reviewTime;
    }

    public void setReviewTime(Date reviewTime) {
        this.reviewTime = reviewTime;
    }

    public String getReauditor() {
        return reauditor;
    }

    public void setReauditor(String reauditor) {
        this.reauditor = reauditor;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    public String getSpeaker() {
        return speaker;
    }

    public void setSpeaker(String speaker) {
        this.speaker = speaker;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getRelatedEnterprises() {
        return relatedEnterprises;
    }

    public void setRelatedEnterprises(String relatedEnterprises) {
        this.relatedEnterprises = relatedEnterprises;
    }

    public String getProjectScale() {
        return projectScale;
    }

    public void setProjectScale(String projectScale) {
        this.projectScale = projectScale;
    }

    public Article() {
        super();
        this.weight = 0;
        this.hits = 0;
        this.posid = "";
    }

    public Article(String id) {
        this();
        this.id = id;
    }

    public Article(Category category) {
        this();
        this.category = category;
    }

    public void prePersist() {
        //TODO 后续处理，暂不知有何用处
        //super.prePersist();
        articleData.setId(this.id);
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Length(min = 0, max = 255)
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Length(min = 0, max = 50)
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Length(min = 0, max = 255)
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;//CmsUtils.formatImageSrcToDb(image);
    }

    @Length(min = 0, max = 255)
    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    @Length(min = 0, max = 255)
    public String getDescription() {
        return description;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @NotNull
    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Date getWeightDate() {
        return weightDate;
    }

    public void setWeightDate(Date weightDate) {
        this.weightDate = weightDate;
    }

    public Integer getHits() {
        return hits;
    }

    public void setHits(Integer hits) {
        this.hits = hits;
    }

    @Length(min = 0, max = 10)
    public String getPosid() {
        return posid;
    }

    public void setPosid(String posid) {
        this.posid = posid;
    }

    public String getCustomContentView() {
        return customContentView;
    }

    public void setCustomContentView(String customContentView) {
        this.customContentView = customContentView;
    }

    public String getViewConfig() {
        return viewConfig;
    }

    public void setViewConfig(String viewConfig) {
        this.viewConfig = viewConfig;
    }

    public ArticleData getArticleData() {
        return articleData;
    }

    public void setArticleData(ArticleData articleData) {
        this.articleData = articleData;
    }

    public List<String> getPosidList() {
        List<String> list = Lists.newArrayList();
        if (posid != null) {
            for (String s : StringUtils.split(posid, ",")) {
                list.add(s);
            }
        }
        return list;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setPosidList(List<String> list) {
        posid = "," + StringUtils.join(list, ",") + ",";
    }

    public String getUrl() {
        return CmsUtils.getUrlDynamic(this);
    }

    public String getImageSrc() {
        return CmsUtils.formatImageSrcToWeb(this.image);
    }

}


