/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.formula.functions.T;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;

/**
 * 文章DAO接口
 *
 * @author ThinkGem
 * @version 2013-8-23
 */
@MyBatisDao
public interface ArticleDao extends CrudDao<Article> {

    public List<Article> findByIdIn(String[] ids);
//	{
//		return find("from Article where id in (:p1)", new Parameter(new Object[]{ids}));
//	}

    public int updateHitsAddOne(String id);
//	{
//		return update("update Article set hits=hits+1 where id = :p1", new Parameter(id));
//	}

    public int updateExpiredWeight(Article article);

    public List<Category> findStats(Category category);
//	{
//		return update("update Article set weight=0 where weight > 0 and weightDate < current_timestamp()");
//	}

    /**
     * 分页查询
     */
    public List<Article> findPaList(Article article);

    public List<Article> findPaListCredit();

    public List<Article> findArticleAccName(Category category);


    public List<Article> findArticleDfName(Map<String, String> map);

    public List<Article> findArticleAccName1(Category category);

    public void update1(Article article);

    public void update2(Article article);

    public void update3(Article article);

    public void update4(Article article);

    public void update5(Article article);

    //对进行中活动进行报名填写
    public Article findSignUpActivities(Article article);

    //查询已完成的活动详情
    public Article findcompletedActivities(Article article);

    //查询已经发布的教育讲堂文章信息
    public List<Article> findPublishArticle(Article article, @Param("size") Integer size);

    //查询教育讲堂内容详情
    public List<Article> findJiangTangContent(Article article);

    //查询进行中教育活动内容详情
    public List<Article> findJxActivityContent(Article article);

    //查询已完成教育活动内容详情
    public List<Article> findWcActivityContent(Article article);

    //查询公告内容详情
    public List<Article> findgonggaoContent(Article article);

    //查询教育活动进行中内容
    public List<Article> findJingXingListLieBiao(Article article);

    public List<Article> findJingXingList(Article article);

    //查询已完成教育活动已完成
    public List<Article> findWanChengList(Article article);

    public List<Article> findWanChengLists(Article article);

    public List<Article> findgonggaoList(Article article, @Param("size") Integer size);

    public List<Article> findNewsList(Article article);

    //返回具有焦点图的新闻动态
    public List<Article> findImageNewsList(@Param("size") Integer size);


}
