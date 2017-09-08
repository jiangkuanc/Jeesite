/**
 *
 */
package com.dagongsoft.p2p.creditreport.service.back;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.creditreport.dao.P2pReportInformationAuditDao;
import com.dagongsoft.p2p.creditreport.entity.P2pReportInformationAudit;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 举报初审Service
 *
 * @author Zeus
 * @version 2016-11-28
 */
@Service
@Transactional(readOnly = true)
public class ReportFirstAuditService {

    @Resource
    private P2pReportInformationAuditDao p2pReportInformationAuditDao;

    /**
     * 举报初审列表查询
     *
     * @param p2pReportInformationAudit
     * @return
     */
    public List<P2pReportInformationAudit> getReportFirstAuditList(P2pReportInformationAudit p2pReportInformationAudit) {
        return p2pReportInformationAuditDao.getReportFirstAuditList(p2pReportInformationAudit);
    }

    /**
     * 举报初审列表分页
     *
     * @param page
     * @param p2pReportInformationAudit
     * @return
     */
    public Page<P2pReportInformationAudit> getReportFirstAuditListPage(Page<P2pReportInformationAudit> page, P2pReportInformationAudit p2pReportInformationAudit) {
        p2pReportInformationAudit.setPage(page);
        List<P2pReportInformationAudit> list = getReportFirstAuditList(p2pReportInformationAudit);
        return page.setList(list);
    }


}
