package com.dagongsoft.p2p.creditreport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.creditreport.dao.P2pReportInformationAuditDao;
import com.dagongsoft.p2p.creditreport.entity.P2pReportInformationAudit;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;


/**
 * 举报信息审核表ServiceImpl
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class P2pReportInformationAuditService extends CrudService<P2pReportInformationAuditDao, P2pReportInformationAudit> {
    @Autowired
    private P2pReportInformationAuditDao p2pReportInformationAuditDao;

    public P2pReportInformationAudit get(String id) {
        return super.get(id);
    }

    public List<P2pReportInformationAudit> findList(P2pReportInformationAudit p2pReportInformationAudit) {
        return super.findList(p2pReportInformationAudit);
    }

    public Page<P2pReportInformationAudit> findPage(Page<P2pReportInformationAudit> page, P2pReportInformationAudit p2pReportInformationAudit) {
        return super.findPage(page, p2pReportInformationAudit);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pReportInformationAudit p2pReportInformationAudit) {
        super.save(p2pReportInformationAudit);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pReportInformationAudit p2pReportInformationAudit) {
        super.delete(p2pReportInformationAudit);
    }

    //查询当前企业举报记录
    public List<P2pReportInformationAudit> ssList(String userId) {
        List<P2pReportInformationAudit> ssList = p2pReportInformationAuditDao.ssList(userId);
        return ssList;
    }

    ;

}