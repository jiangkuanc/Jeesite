package com.dagongsoft.p2p.feedback.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.feedback.entity.P2pReviewDocument;

/**
 * 复评材料表DAO接口
 *
 * @author Quincy
 * @version 2016-11-10
 */
@MyBatisDao
public interface P2pReviewDocumentDao extends CrudDao<P2pReviewDocument> {

    /**
     * 根据意见反馈ID删除材料记录
     *
     * @param rateResultViewId
     * @author Quincy
     */
    public void deleteReviewDocument(String rateResultViewId);

    public List<P2pReviewDocument> getByRateResultViewId(String rateResultViewId);
}