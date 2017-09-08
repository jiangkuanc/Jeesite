package com.dagongsoft.p2p.repayment.service;

import java.util.List;

import com.dagongsoft.p2p.repayment.entity.P2pRepaymentRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 还款记录表Service
 *
 * @author Quincy
 * @version 2016-11-03
 */
public interface P2pRepaymentRecordService {

    public P2pRepaymentRecord get(String id);

    public List<P2pRepaymentRecord> findList(P2pRepaymentRecord p2pRepaymentRecord);

    public Page<P2pRepaymentRecord> findPage(Page<P2pRepaymentRecord> page, P2pRepaymentRecord p2pRepaymentRecord);

    public void save(P2pRepaymentRecord p2pRepaymentRecord);

    public void delete(P2pRepaymentRecord p2pRepaymentRecord);

    /**
     * 根据债项id查询还款凭证
     *
     * @author Chace
     */
    public List<P2pRepaymentRecord> getrepaymentVoucher(String financingInformationId);

}