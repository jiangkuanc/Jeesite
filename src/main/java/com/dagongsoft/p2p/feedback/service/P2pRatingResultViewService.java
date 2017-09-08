package com.dagongsoft.p2p.feedback.service;

import java.util.List;


import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 评级结果意见表Service
 *
 * @author Quincy
 * @version 2016-11-10
 */
public interface P2pRatingResultViewService {

    public P2pRatingResultView get(String id);

    public List<P2pRatingResultView> findList(P2pRatingResultView p2pRatingResultView);

    public Page<P2pRatingResultView> findPage(Page<P2pRatingResultView> page, P2pRatingResultView p2pRatingResultView);

    public void save(P2pRatingResultView p2pRatingResultView);

    public void delete(P2pRatingResultView p2pRatingResultView);

}