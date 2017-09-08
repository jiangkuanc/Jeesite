package com.dagongsoft.p2p.document.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentAuditRecord;
import com.dagongsoft.p2p.document.dao.P2pRateDocumentAuditRecordDao;
import com.dagongsoft.p2p.document.service.P2pRateDocumentAuditRecordService;
import com.dagongsoft.p2p.user.dao.P2pEnterpriseCertifyDao;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;

/**
 * 评级材料历史审核记录ServiceImpl
 *
 * @author Sora
 * @version 2016-11-01
 */
@Transactional(readOnly = true)
@Service("p2pRateDocumentAuditRecordService")
public class P2pRateDocumentAuditRecordService extends CrudService<P2pRateDocumentAuditRecordDao, P2pRateDocumentAuditRecord> {
    @Autowired
    private P2pRateDocumentAuditRecordDao p2pRateDocumentAuditRecordDao;
    @Autowired
    private P2pEnterpriseCertifyDao p2pEnterpriseCertifyDao;

    public P2pRateDocumentAuditRecord get(String id) {
        return super.get(id);
    }

    public List<P2pRateDocumentAuditRecord> findList(P2pRateDocumentAuditRecord p2pRateDocumentAuditRecord) {
        return super.findList(p2pRateDocumentAuditRecord);
    }

    public Page<P2pRateDocumentAuditRecord> findPage(Page<P2pRateDocumentAuditRecord> page, P2pRateDocumentAuditRecord p2pRateDocumentAuditRecord) {
        return super.findPage(page, p2pRateDocumentAuditRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRateDocumentAuditRecord p2pRateDocumentAuditRecord) {
        p2pRateDocumentAuditRecord.setIsNewRecord(true);
        super.save(p2pRateDocumentAuditRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRateDocumentAuditRecord p2pRateDocumentAuditRecord) {
        super.delete(p2pRateDocumentAuditRecord);
    }

    public List<P2pRateDocumentAuditRecord> findById(String id) {
        return p2pRateDocumentAuditRecordDao.findById(id);
    }

    public List<P2pRateDocumentAuditRecord> findById2(String id) {
        return p2pRateDocumentAuditRecordDao.findById2(id);
    }

    public P2pEnterpriseCertify getDebtBaseInfoModal(String financingInformationId) {
        return p2pEnterpriseCertifyDao.getDebtBaseInfoModal(financingInformationId);
    }

    public P2pEnterpriseCertify getDebtBaseInfoModal2(String financingInformationId) {
        return p2pEnterpriseCertifyDao.getDebtBaseInfoModal2(financingInformationId);
    }
}