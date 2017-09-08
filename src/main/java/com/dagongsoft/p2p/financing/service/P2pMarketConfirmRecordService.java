package com.dagongsoft.p2p.financing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.financing.entity.P2pMarketConfirmRecord;
import com.dagongsoft.p2p.financing.dao.P2pMarketConfirmRecordDao;
import com.dagongsoft.p2p.financing.service.P2pMarketConfirmRecordService;

/**
 * 市场人员审核记录ServiceImpl
 *
 * @author Sora
 * @version 2016-11-07
 */
@Transactional(readOnly = true)
@Service("p2pMarketConfirmRecordService")
public class P2pMarketConfirmRecordService extends CrudService<P2pMarketConfirmRecordDao, P2pMarketConfirmRecord> {

    @Autowired
    private P2pMarketConfirmRecordDao p2pMarketConfirmRecordDao;

    public P2pMarketConfirmRecord get(String id) {
        return super.get(id);
    }

    public List<P2pMarketConfirmRecord> findList(P2pMarketConfirmRecord p2pMarketConfirmRecord) {
        return super.findList(p2pMarketConfirmRecord);
    }

    public Page<P2pMarketConfirmRecord> findPage(Page<P2pMarketConfirmRecord> page, P2pMarketConfirmRecord p2pMarketConfirmRecord) {
        return super.findPage(page, p2pMarketConfirmRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pMarketConfirmRecord p2pMarketConfirmRecord) {
        super.save(p2pMarketConfirmRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pMarketConfirmRecord p2pMarketConfirmRecord) {
        super.delete(p2pMarketConfirmRecord);
    }

    public P2pMarketConfirmRecord findById(String id) {
        return p2pMarketConfirmRecordDao.findById(id);
    }

    public P2pMarketConfirmRecord findByIdTwo(String id) {
        return p2pMarketConfirmRecordDao.findByIdTwo(id);
    }

}