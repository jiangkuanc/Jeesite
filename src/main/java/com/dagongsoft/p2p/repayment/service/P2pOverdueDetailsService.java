package com.dagongsoft.p2p.repayment.service;

import java.util.List;

import com.dagongsoft.p2p.repayment.entity.P2pOverdueDetails;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 逾期明细表Service
 *
 * @author Zeus
 * @version 2016-11-16
 */
public interface P2pOverdueDetailsService {

    public P2pOverdueDetails get(String id);

    public List<P2pOverdueDetails> findList(P2pOverdueDetails p2pOverdueDetails);

    public Page<P2pOverdueDetails> findPage(Page<P2pOverdueDetails> page, P2pOverdueDetails p2pOverdueDetails);

    public void save(P2pOverdueDetails p2pOverdueDetails);

    public void delete(P2pOverdueDetails p2pOverdueDetails);

}