/**
 *
 */
package com.dagongsoft.p2p.creditreport.service.back;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.creditreport.dao.P2pInformationAppealDao;
import com.dagongsoft.p2p.creditreport.entity.P2pInformationAppeal;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 申诉复审Service
 *
 * @author Zeus
 * @version 2016-11-28
 */
@Service
@Transactional(readOnly = true)
public class AppealReviewAuditService {

    @Resource
    private P2pInformationAppealDao p2pInformationAppealDao;

    /**
     * 申诉复审列表查询
     *
     * @param p2pReportInformationAudit
     * @return
     */
    public List<P2pInformationAppeal> getAppealReviewAuditList(P2pInformationAppeal p2pInformationAppeal) {
        return p2pInformationAppealDao.getAppealReviewAuditList(p2pInformationAppeal);
    }

    /**
     * 申诉复审列表分页
     *
     * @param page
     * @param p2pReportInformationAudit
     * @return
     */
    public Page<P2pInformationAppeal> getAppealReviewAuditPage(Page<P2pInformationAppeal> page, P2pInformationAppeal p2pInformationAppeal) {
        p2pInformationAppeal.setPage(page);
        List<P2pInformationAppeal> list = getAppealReviewAuditList(p2pInformationAppeal);
        return page.setList(list);
    }
}
