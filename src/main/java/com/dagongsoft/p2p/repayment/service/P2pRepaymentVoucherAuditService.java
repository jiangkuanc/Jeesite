package com.dagongsoft.p2p.repayment.service;

import java.util.List;


import com.dagongsoft.p2p.repayment.entity.P2pRepaymentVoucherAudit;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 还款凭证审核记录Service
 *
 * @author zeus
 * @version 2017-02-16
 */
public interface P2pRepaymentVoucherAuditService {

    public P2pRepaymentVoucherAudit get(String id);

    public List<P2pRepaymentVoucherAudit> findList(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit);

    public Page<P2pRepaymentVoucherAudit> findPage(Page<P2pRepaymentVoucherAudit> page, P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit);

    public void save(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit);

    public void delete(P2pRepaymentVoucherAudit p2pRepaymentVoucherAudit);

}