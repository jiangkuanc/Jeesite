package com.dagongsoft.p2p.rating.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingReportTrading;

/**
 * 评级报告交易记录DAO接口
 *
 * @author Chace
 * @version 2017-03-06
 */
@MyBatisDao
public interface P2pRatingReportTradingDao extends CrudDao<P2pRatingReportTrading> {

    /**
     * 根据用户ID查询评级报告列表
     *
     * @param p2pRatingReportTrading
     * @return
     * @author Quincy
     */
    public List<P2pRatingReportTrading> findListByUid(P2pRatingReportTrading p2pRatingReportTrading);


    /**
     * 查询购买记录
     *
     * @author Chace
     */
    public List<P2pRatingReportTrading> findRecordByUid(P2pRatingReportTrading p2pRatingReportTrading);
}