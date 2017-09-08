/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.StorageClient1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.utils.FdfsClientPool;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.cms.dao.ArticleDao;
import com.thinkgem.jeesite.modules.cms.dao.ArticleDataDao;
import com.thinkgem.jeesite.modules.cms.dao.CategoryDao;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.ArticleData;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 文章Service
 *
 * @author ThinkGem
 * @version 2013-05-15
 */
@Service
@Transactional(readOnly = true)
public class ArticleService extends CrudService<ArticleDao, Article> {
    @Autowired
    private ArticleDao articleDao;
    @Autowired
    private ArticleDataDao articleDataDao;
    @Autowired
    private CategoryDao categoryDao;

    @Transactional(readOnly = false)
    public Page<Article> findPage(Page<Article> page, Article article, boolean isDataScopeFilter) {
        // 更新过期的权重，间隔为“6”个小时
        Date updateExpiredWeightDate = (Date) CacheUtils.get("updateExpiredWeightDateByArticle");
        if (updateExpiredWeightDate == null || (updateExpiredWeightDate != null
                && updateExpiredWeightDate.getTime() < new Date().getTime())) {
            dao.updateExpiredWeight(article);
            CacheUtils.put("updateExpiredWeightDateByArticle", DateUtils.addHours(new Date(), 6));
        }
//		DetachedCriteria dc = dao.createDetachedCriteria();
//		dc.createAlias("category", "category");
//		dc.createAlias("category.site", "category.site");
        if (article.getCategory() != null && StringUtils.isNotBlank(article.getCategory().getId()) && !Category.isRoot(article.getCategory().getId())) {
            Category category = categoryDao.get(article.getCategory().getId());
            if (category == null) {
                category = new Category();
            }
            category.setParentIds(category.getId());
            category.setSite(category.getSite());
            article.setCategory(category);
        } else {
            article.setCategory(new Category());
        }
//		if (StringUtils.isBlank(page.getOrderBy())){
//			page.setOrderBy("a.weight,a.update_date desc");
//		}
//		return dao.find(page, dc);
        //	article.getSqlMap().put("dsf", dataScopeFilter(article.getCurrentUser(), "o", "u"));
        return super.findPage(page, article);

    }

    @Transactional(readOnly = false)
    public void save(Article article, HttpServletRequest request) {
        if (article.getArticleData().getContent() != null) {
            article.getArticleData().setContent(StringEscapeUtils.unescapeHtml4(
                    article.getArticleData().getContent()));
        }
        // 如果没有审核权限，则将当前内容改为待审核状态
        if (!UserUtils.getSubject().isPermitted("cms:article:audit")) {
            article.setDelFlag(Article.DEL_FLAG_AUDIT);
        }
        // 如果栏目不需要审核，则将该内容设为发布状态
        if (article.getCategory() != null && StringUtils.isNotBlank(article.getCategory().getId())) {
            Category category = categoryDao.get(article.getCategory().getId());
            if (!Global.YES.equals(category.getIsAudit())) {
                article.setDelFlag(Article.DEL_FLAG_NORMAL);
            }
        }
        article.setUpdateBy(UserUtils.getUser());
        article.setUpdateDate(new Date());
        if (StringUtils.isNotBlank(article.getViewConfig())) {
            article.setViewConfig(StringEscapeUtils.unescapeHtml4(article.getViewConfig()));
        }

        ArticleData articleData = new ArticleData();
        //从这开始改
        if (StringUtils.isBlank(article.getId())) {
            //避开createDate与updateDate相等，重新写preInsert里的方法
            //article.preInsert();
            article.setId(IdGen.uuid());
            User user = UserUtils.getUser();
            if (StringUtils.isNotBlank(user.getId())) {
                article.setUpdateBy(user);
                article.setCreateBy(user);
            }
            article.setUpdateDate(new Date());
            //结束
            String contentOld = article.getArticleData().getContent();
            String contentNew = UploadFileUtils.addChangeImage(contentOld, request);
            if (contentNew != null && !"".equals(contentNew)) {
                article.getArticleData().setContent(contentNew);
            } else {
                article.getArticleData().setContent(contentOld);
            }
            articleData = article.getArticleData();
            articleData.setId(article.getId());
            dao.insert(article);
            articleDataDao.insert(articleData);
        } else {
            List<Article> articleOld = dao.findJiangTangContent(article);
            String textNew = article.getArticleData().getContent();
            String contentOld = articleOld.get(0).getArticleData().getContent();
            textNew = UploadFileUtils.updateChangeImage(textNew, contentOld, request);
            articleData = article.getArticleData();
            articleData.setContent(textNew);
            article.preUpdate();
            articleData.setId(article.getId());
            dao.update(article);
            articleDataDao.update(article.getArticleData());
        }
    }

    @Transactional(readOnly = false)
    public void delete(Article article, Boolean isRe) {
//		dao.updateDelFlag(id, isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
        // 使用下面方法，以便更新索引。
        //Article article = dao.get(id);
        //article.setDelFlag(isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
        //dao.insert(article);
        super.delete(article);
    }

    /**
     * 通过编号获取内容标题
     *
     * @return new Object[]{栏目Id,文章Id,文章标题}
     */
    public List<Object[]> findByIds(String ids) {
        if (ids == null) {
            return new ArrayList<Object[]>();
        }
        List<Object[]> list = Lists.newArrayList();
        String[] idss = StringUtils.split(ids, ",");
        Article e = null;
        for (int i = 0; (idss.length - i) > 0; i++) {
            e = dao.get(idss[i]);
            list.add(new Object[]{e.getCategory().getId(), e.getId(), StringUtils.abbr(e.getTitle(), 50)});
        }
        return list;
    }

    /**
     * 点击数加一
     */
    @Transactional(readOnly = false)
    public void updateHitsAddOne(String id) {
        dao.updateHitsAddOne(id);
    }

    /**
     * 更新索引
     */
    public void createIndex() {
        //dao.createIndex();
    }

    /**
     * 全文检索
     */
    //FIXME 暂不提供检索功能
    public Page<Article> search(Page<Article> page, String q, String categoryId, String beginDate, String endDate) {

        // 设置查询条件
//		BooleanQuery query = dao.getFullTextQuery(q, "title","keywords","description","articleData.content");
//		
//		// 设置过滤条件
//		List<BooleanClause> bcList = Lists.newArrayList();
//
//		bcList.add(new BooleanClause(new TermQuery(new Term(Article.FIELD_DEL_FLAG, Article.DEL_FLAG_NORMAL)), Occur.MUST));
//		if (StringUtils.isNotBlank(categoryId)){
//			bcList.add(new BooleanClause(new TermQuery(new Term("category.ids", categoryId)), Occur.MUST));
//		}
//		
//		if (StringUtils.isNotBlank(beginDate) && StringUtils.isNotBlank(endDate)) {   
//			bcList.add(new BooleanClause(new TermRangeQuery("updateDate", beginDate.replaceAll("-", ""),
//					endDate.replaceAll("-", ""), true, true), Occur.MUST));
//		}   

        //BooleanQuery queryFilter = dao.getFullTextQuery((BooleanClause[])bcList.toArray(new BooleanClause[bcList.size()]));

//		System.out.println(queryFilter);

        // 设置排序（默认相识度排序）
        //FIXME 暂时不提供lucene检索
        //Sort sort = null;//new Sort(new SortField("updateDate", SortField.DOC, true));
        // 全文检索
        //dao.search(page, query, queryFilter, sort);
        // 关键字高亮
        //dao.keywordsHighlight(query, page.getList(), 30, "title");
        //dao.keywordsHighlight(query, page.getList(), 130, "description","articleData.content");

        return page;
    }

    public List<Article> findPaList(Article article) {

        return articleDao.findPaList(article);
    }

//	public Page<Article> findPaList(Page<Article> page, Article article) {
//		article.setPage(page);
//		page.setList(articleDao.findPaList(article));
//		return page; 
//	}  

    public List<Article> findPaListCredit() {
        return articleDao.findPaListCredit();
    }

    public List<Article> findArticleAccName(Category category) {
        return articleDao.findArticleAccName(category);
    }


    public List<Article> findArticleDfName(Map<String, String> map) {
        return articleDao.findArticleDfName(map);
    }

    public List<Article> findArticleAccName1(Category category) {
        return articleDao.findArticleAccName1(category);
    }

    @Transactional(readOnly = false)
    public void baocun(Article article) {
        articleDao.update1(article);
    }

    @Transactional(readOnly = false)
    public void reviewtime(Article article) {
        articleDao.update5(article);
    }

    @Transactional(readOnly = false)
    public void tianjia(Article article) {
        articleDao.update2(article);
    }

    @Transactional(readOnly = false)
    public void fushen(Article article) {
        articleDao.update3(article);
    }

    @Transactional(readOnly = false)
    public void fabu(Article article) {
        articleDao.update4(article);
    }

    //对进行中活动进行报名填写
    @Transactional(readOnly = false)
    public Article findSignUpActivities(Article article) {
        return articleDao.findSignUpActivities(article);
    }

    //查询已完成的活动详情
    @Transactional(readOnly = false)
    public Article findcompletedActivities(Article article) {
        return articleDao.findcompletedActivities(article);
    }

    //查询已经发布的教育讲堂文章信息
    public List<Article> findPublishArticle(Article article, Integer size) {
        return articleDao.findPublishArticle(article, size);
    }

    //查询教育讲堂内容详情
    public List<Article> findJiangTangContent(Article article) {
        return articleDao.findJiangTangContent(article);
    }

    //查询进行中教育活动内容详情
    public List<Article> findJxActivityContent(Article article) {
        return articleDao.findJxActivityContent(article);
    }

    //查询已完成教育活动内容详情
    public List<Article> findWcActivityContent(Article article) {
        return articleDao.findWcActivityContent(article);
    }

    //查询公告内容详情
    public List<Article> findgonggaoContent(Article article) {
        return articleDao.findgonggaoContent(article);
    }

    //查询教育活动进行中内容
    public List<Article> findJingXingList(Article article) {
        return articleDao.findJingXingList(article);
    }

    public Page<Article> findJingXingListLieBiao(Page<Article> page, Article article) {
        article.setPage(page);
        page.setList(articleDao.findJingXingListLieBiao(article));
        return page;
    }

    //查询已完成教育活动已完成
    public Page<Article> findWanChengList(Page<Article> page, Article article) {
        // TODO Auto-generated method stub
        article.setPage(page);
        page.setList(articleDao.findWanChengList(article));
        return page;
    }

    //查询教育活动进行中内容
    public List<Article> findWanChengLists(Article article) {
        return articleDao.findWanChengLists(article);
    }

    public List<Article> findgonggaoList(Article article, Integer size) {
        return articleDao.findgonggaoList(article, size);
    }

    //新闻动态列表
    public List<Article> findNewsList(Article article) {
        return articleDao.findNewsList(article);
    }

    /**
     * 返回具有焦点图的新闻动态
     *
     * @return
     */
    public List<Article> findImageNewsList(Integer size) {
        List<Article> newsList = articleDao.findImageNewsList(size);
        for (Article a : newsList) {
            //将上传的图片地址转化
            if (a.getImage() != null && !"".equals(a.getImage())) {
                a.setImage(UploadFileUtils.viewUrl(a.getImage()));
            }
        }
        return newsList;
    }
}




