package com.dagongsoft.p2p.financing.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.financing.entity.P2pDebtorOverdueRecord;
import com.dagongsoft.p2p.financing.dao.P2pDebtorOverdueRecordDao;
import com.dagongsoft.p2p.financing.service.P2pDebtorOverdueRecordService;

/**
 * 债务人逾期记录表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-11
 */
@Transactional(readOnly = true)
@Service("p2pDebtorOverdueRecordService")
public class P2pDebtorOverdueRecordServiceImpl extends CrudService<P2pDebtorOverdueRecordDao, P2pDebtorOverdueRecord> implements P2pDebtorOverdueRecordService {

    public P2pDebtorOverdueRecord get(String id) {
        return super.get(id);
    }

    public List<P2pDebtorOverdueRecord> findList(P2pDebtorOverdueRecord p2pDebtorOverdueRecord) {
        return super.findList(p2pDebtorOverdueRecord);
    }

    public Page<P2pDebtorOverdueRecord> findPage(Page<P2pDebtorOverdueRecord> page, P2pDebtorOverdueRecord p2pDebtorOverdueRecord) {
        return super.findPage(page, p2pDebtorOverdueRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pDebtorOverdueRecord p2pDebtorOverdueRecord) {
        super.save(p2pDebtorOverdueRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pDebtorOverdueRecord p2pDebtorOverdueRecord) {
        super.delete(p2pDebtorOverdueRecord);
    }

}