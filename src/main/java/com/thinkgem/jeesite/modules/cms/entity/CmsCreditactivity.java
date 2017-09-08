package com.thinkgem.jeesite.modules.cms.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 生成用户报名信息Entity
 *
 * @author summer
 * @version 2016-11-15
 */
public class CmsCreditactivity extends DataEntity<CmsCreditactivity> {

    private static final long serialVersionUID = 1L;
    private String articleId;        // 教育活动编号
    private String userId;        // 用户编号
    private String realName;        // 用户真实姓名
    private String tel;        // 手机号
    private Date registrationTime;        // 报名时间
    private String verificationCode;  //验证码
    private Article article;//文章
    private User user;


    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public CmsCreditactivity() {
        super();
    }

    public CmsCreditactivity(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "教育活动编号长度必须介于 0 和 64 之间")
    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Length(min = 0, max = 64, message = "用户真实姓名长度必须介于 0 和 64 之间")
    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    @Length(min = 0, max = 64, message = "手机号长度必须介于 0 和 64 之间")
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getRegistrationTime() {
        return registrationTime;
    }

    public void setRegistrationTime(Date registrationTime) {
        this.registrationTime = registrationTime;
    }

}