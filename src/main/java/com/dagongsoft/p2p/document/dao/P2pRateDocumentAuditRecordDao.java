package com.dagongsoft.p2p.document.dao;

import java.util.List;

import com.dagongsoft.p2p.document.entity.P2pRateDocumentAuditRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 评级材料历史审核记录DAO接口
 *
 * @author Sora
 * @version 2016-11-01
 */
@MyBatisDao
public interface P2pRateDocumentAuditRecordDao extends CrudDao<P2pRateDocumentAuditRecord> {
    public List<P2pRateDocumentAuditRecord> findById(String id);

    public List<P2pRateDocumentAuditRecord> findById2(String id);
}