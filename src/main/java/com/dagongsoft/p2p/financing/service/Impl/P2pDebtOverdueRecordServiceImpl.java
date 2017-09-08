package com.dagongsoft.p2p.financing.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pDebtOverdueRecordDao;
import com.dagongsoft.p2p.financing.entity.P2pDebtOverdueRecord;
import com.dagongsoft.p2p.financing.service.P2pDebtOverdueRecordService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 债项逾期记录表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-11
 */
@Transactional(readOnly = true)
@Service("p2pDebtOverdueRecordService")
public class P2pDebtOverdueRecordServiceImpl extends CrudService<P2pDebtOverdueRecordDao, P2pDebtOverdueRecord> implements P2pDebtOverdueRecordService {
    @Resource
    private P2pDebtOverdueRecordDao P2pDebtOverdueRecordDao;

    public P2pDebtOverdueRecord get(String id) {
        return super.get(id);
    }

    public List<P2pDebtOverdueRecord> findList(P2pDebtOverdueRecord p2pDebtOverdueRecord) {
        return super.findList(p2pDebtOverdueRecord);
    }

    public Page<P2pDebtOverdueRecord> findPage(Page<P2pDebtOverdueRecord> page, P2pDebtOverdueRecord p2pDebtOverdueRecord) {
        return super.findPage(page, p2pDebtOverdueRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pDebtOverdueRecord p2pDebtOverdueRecord) {
        super.save(p2pDebtOverdueRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pDebtOverdueRecord p2pDebtOverdueRecord) {
        super.delete(p2pDebtOverdueRecord);
    }

    @Override
    public Integer numberProjectsLimit() {
        return P2pDebtOverdueRecordDao.numberProjectsLimit();
    }

}