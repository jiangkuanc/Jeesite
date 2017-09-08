package com.dagongsoft.p2p.feedback.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;

/**
 * 评级结果意见表DAO接口
 *
 * @author Quincy
 * @version 2016-11-10
 */
@MyBatisDao
public interface P2pRatingResultViewDao extends CrudDao<P2pRatingResultView> {
    /**
     * 添加反馈记录
     *
     * @param p2pRatingResultView
     * @author Quincy
     */
    public void insertReceiptRecord(P2pRatingResultView p2pRatingResultView);

    /**
     * 根据债项ID查询单条记录
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public P2pRatingResultView findOneByFid(String financingInformationId);

    /**
     * 修改审核状态
     *
     * @param p2pRatingResultView
     * @author Quincy
     */
    public void updateReceiptRecord(P2pRatingResultView p2pRatingResultView);

    /**
     * 融资项目刷新复评状态
     *
     * @return
     * @author Quincy
     */
    public List<P2pFinancingInformation> refreshReview1();

    /**
     * 评级项目刷新复评状态
     *
     * @return
     * @author Quincy
     */
    public List<P2pRatingServiceInfo> refreshReview2();

    /**
     * 根据债项ID删除记录
     *
     * @param financingInformationId
     */
    public void deleteReceiptRecord(String financingInformationId);

}