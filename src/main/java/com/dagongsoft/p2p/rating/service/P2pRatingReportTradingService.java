package com.dagongsoft.p2p.rating.service;

import java.util.List;


import com.dagongsoft.p2p.rating.entity.P2pRatingReportTrading;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 评级报告交易记录Service
 *
 * @author Chace
 * @version 2017-03-06
 */
public interface P2pRatingReportTradingService {

    public P2pRatingReportTrading get(String id);

    public List<P2pRatingReportTrading> findList(P2pRatingReportTrading p2pRatingReportTrading);

    public Page<P2pRatingReportTrading> findPage(Page<P2pRatingReportTrading> page, P2pRatingReportTrading p2pRatingReportTrading);

    public void save(P2pRatingReportTrading p2pRatingReportTrading);

    public void delete(P2pRatingReportTrading p2pRatingReportTrading);

    /**
     * 根据用户ID查询评级报告列表
     *
     * @param p2pRatingReportTrading
     * @return
     * @author Quincy
     */
    public List<P2pRatingReportTrading> findListByUid(P2pRatingReportTrading p2pRatingReportTrading);

}