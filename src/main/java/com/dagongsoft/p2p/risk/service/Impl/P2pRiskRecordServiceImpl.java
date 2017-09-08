package com.dagongsoft.p2p.risk.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.risk.entity.P2pRiskRecord;
import com.dagongsoft.p2p.risk.dao.P2pRiskRecordDao;
import com.dagongsoft.p2p.risk.service.P2pRiskRecordService;

/**
 * 风险测评记录表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Transactional(readOnly = true)
@Service("p2pRiskRecordService")
public class P2pRiskRecordServiceImpl extends CrudService<P2pRiskRecordDao, P2pRiskRecord> implements P2pRiskRecordService {

    public P2pRiskRecord get(String id) {
        return super.get(id);
    }

    public List<P2pRiskRecord> findList(P2pRiskRecord p2pRiskRecord) {
        return super.findList(p2pRiskRecord);
    }

    public Page<P2pRiskRecord> findPage(Page<P2pRiskRecord> page, P2pRiskRecord p2pRiskRecord) {
        return super.findPage(page, p2pRiskRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRiskRecord p2pRiskRecord) {
        super.save(p2pRiskRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRiskRecord p2pRiskRecord) {
        super.delete(p2pRiskRecord);
    }

}