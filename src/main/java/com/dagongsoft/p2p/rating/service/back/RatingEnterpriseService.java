/**
 *
 */
package com.dagongsoft.p2p.rating.service.back;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pPaymentOfRatingCostDao;
import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.rating.dao.P2pRatingServiceInfoDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * @author Zeus
 * @2017-3-2
 */
@Service
@Transactional(readOnly = true)
public class RatingEnterpriseService {
    @Resource
    private P2pRatingServiceInfoDao p2pRatingServiceInfoDao;
    @Resource
    private P2pPaymentOfRatingCostDao p2pPaymentOfRatingCostDao;

    public Page<P2pRatingServiceInfo> getRatingEnterprisePage(Page<P2pRatingServiceInfo> page, P2pRatingServiceInfo p2pRatingServiceInfo) {
        p2pRatingServiceInfo.setPage(page);
        page.setList(p2pRatingServiceInfoDao.getRatingEnterpriseList(p2pRatingServiceInfo));
        return page;
    }

    public P2pPaymentOfRatingCost getRatingPaydetails(String rsiId) {
        return p2pPaymentOfRatingCostDao.getRatingPaydetails(rsiId);
    }

    public P2pRatingServiceInfo getRatingDetails(String id) {
        return p2pRatingServiceInfoDao.getRatingDetails(id);
    }
}
