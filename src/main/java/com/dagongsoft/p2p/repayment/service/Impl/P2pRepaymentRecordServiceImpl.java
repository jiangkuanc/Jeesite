package com.dagongsoft.p2p.repayment.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentRecord;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentRecordDao;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentRecordService;

/**
 * 还款记录表ServiceImpl
 *
 * @author Quincy
 * @version 2016-11-03
 */
@Transactional(readOnly = true)
@Service("p2pRepaymentRecordService")
public class P2pRepaymentRecordServiceImpl extends CrudService<P2pRepaymentRecordDao, P2pRepaymentRecord> implements P2pRepaymentRecordService {

    @Autowired
    private P2pRepaymentRecordDao p2pRepaymentRecordDao;

    public P2pRepaymentRecord get(String id) {
        return super.get(id);
    }

    public List<P2pRepaymentRecord> findList(P2pRepaymentRecord p2pRepaymentRecord) {
        return super.findList(p2pRepaymentRecord);
    }

    public Page<P2pRepaymentRecord> findPage(Page<P2pRepaymentRecord> page, P2pRepaymentRecord p2pRepaymentRecord) {
        return super.findPage(page, p2pRepaymentRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRepaymentRecord p2pRepaymentRecord) {
        super.save(p2pRepaymentRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRepaymentRecord p2pRepaymentRecord) {
        super.delete(p2pRepaymentRecord);
    }

    /**
     * 根据债项id查询还款凭证
     *
     * @author Chace
     */
    public List<P2pRepaymentRecord> getrepaymentVoucher(String financingInformationId) {
        return p2pRepaymentRecordDao.getrepaymentVoucher(financingInformationId);
    }

}