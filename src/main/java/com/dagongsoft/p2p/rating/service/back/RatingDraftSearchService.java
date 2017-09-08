/**
 *
 */
package com.dagongsoft.p2p.rating.service.back;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.feedback.dao.P2pRatingResultViewDao;
import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.rating.dao.P2pRatingServiceInfoDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * @author Zeus
 * @2017-3-2
 */
@Service
@Transactional(readOnly = true)
public class RatingDraftSearchService {

    @Resource
    private P2pRatingServiceInfoDao p2pRatingServiceInfoDao;
    @Resource
    private P2pRatingResultViewDao p2pRatingResultViewDao;

    public Page<P2pRatingServiceInfo> getRatingDraftSearchPage(Page<P2pRatingServiceInfo> page, P2pRatingServiceInfo p2pRatingServiceInfo) {
        p2pRatingServiceInfo.setPage(page);
        page.setList(p2pRatingServiceInfoDao.getRatingDraftSearchList(p2pRatingServiceInfo));
        return page;
    }

    public P2pRatingResultView getUserObjectionView(String rsiId) {
        return p2pRatingResultViewDao.findOneByFid(rsiId);
    }
}
