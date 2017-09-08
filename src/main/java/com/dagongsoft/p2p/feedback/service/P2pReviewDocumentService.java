package com.dagongsoft.p2p.feedback.service;

import java.util.List;


import com.dagongsoft.p2p.feedback.entity.P2pReviewDocument;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 复评材料表Service
 *
 * @author Quincy
 * @version 2016-11-10
 */
public interface P2pReviewDocumentService {

    public P2pReviewDocument get(String id);

    public List<P2pReviewDocument> findList(P2pReviewDocument p2pReviewDocument);

    public Page<P2pReviewDocument> findPage(Page<P2pReviewDocument> page, P2pReviewDocument p2pReviewDocument);

    public void save(P2pReviewDocument p2pReviewDocument);

    public void delete(P2pReviewDocument p2pReviewDocument);

}