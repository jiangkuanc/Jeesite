package com.dagongsoft.p2p.repayment.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentVoucherAudit;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentVoucherAuditDao;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentVoucherAuditService;

/**
 * 还款凭证审核记录ServiceImpl
 *
 * @author zeus
 * @version 2017-02-16
 */
@Transactional(readOnly = true)
@Service("p2pRepaymentVoucherAuditService")
public class P2pRepaymentVoucherAuditServiceImpl extends CrudService<P2pRepaymentVoucherAuditDao, P2pRepaymentVoucherAudit> implements P2pRepaymentVoucherAuditService {

    public P2pRepaymentVoucherAudit get(String id) {
        return super.get(id);
    }

    public List<P2pRepaymentVoucherAudit> findList(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit) {
        return super.findList(p2pRepaymentVoucherAudit);
    }

    public Page<P2pRepaymentVoucherAudit> findPage(Page<P2pRepaymentVoucherAudit> page, P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit) {
        return super.findPage(page, p2pRepaymentVoucherAudit);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit) {
        super.save(p2pRepaymentVoucherAudit);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit) {
        super.delete(p2pRepaymentVoucherAudit);
    }

}