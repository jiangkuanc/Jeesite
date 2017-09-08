package com.dagongsoft.p2p.repayment.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.repayment.dao.P2pReceiveRecordDao;
import com.dagongsoft.p2p.repayment.entity.P2pReceiveRecord;
import com.dagongsoft.p2p.repayment.service.P2pReceiveRecordService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 投资人收款记录表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-08
 */
@Transactional(readOnly = true)
@Service("p2pReceiveRecordService")
public class P2pReceiveRecordServiceImpl extends CrudService<P2pReceiveRecordDao, P2pReceiveRecord> implements P2pReceiveRecordService {

    @Autowired
    public P2pReceiveRecordDao p2pReceiveRecordDao;

    public P2pReceiveRecord get(String id) {
        return super.get(id);
    }

    public List<P2pReceiveRecord> findList(P2pReceiveRecord p2pReceiveRecord) {
        return super.findList(p2pReceiveRecord);
    }

    public Page<P2pReceiveRecord> findPage(Page<P2pReceiveRecord> page, P2pReceiveRecord p2pReceiveRecord) {
        return super.findPage(page, p2pReceiveRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pReceiveRecord p2pReceiveRecord) {
        super.save(p2pReceiveRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pReceiveRecord p2pReceiveRecord) {
        super.delete(p2pReceiveRecord);
    }

    /**
     * 查询累计投资收益
     */
    @Override
    public Double queryAccIncome(String userId) {
        return p2pReceiveRecordDao.queryAccIncome(userId);
    }

}