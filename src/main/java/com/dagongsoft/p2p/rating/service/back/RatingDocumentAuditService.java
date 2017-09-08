/**
 *
 */
package com.dagongsoft.p2p.rating.service.back;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.rating.dao.P2pRatingServiceInfoDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * @author Zeus
 * @2017-3-2
 */
@Service
@Transactional(readOnly = true)
public class RatingDocumentAuditService {
    @Resource
    private P2pRatingServiceInfoDao p2pRatingServiceInfoDao;

    public Page<P2pRatingServiceInfo> getRatingDocumnetAuditPage(Page<P2pRatingServiceInfo> page, P2pRatingServiceInfo p2pRatingServiceInfo) {
        p2pRatingServiceInfo.setPage(page);
        page.setList(p2pRatingServiceInfoDao.getRatingDocumnetAuditList(p2pRatingServiceInfo));
        return page;
    }

}
