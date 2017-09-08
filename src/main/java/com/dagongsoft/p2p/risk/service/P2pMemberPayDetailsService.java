package com.dagongsoft.p2p.risk.service;

import java.util.List;


import com.dagongsoft.p2p.risk.entity.P2pMemberPayDetails;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 会员付费详情表Service
 *
 * @author Joe
 * @version 2016-12-02
 */
public interface P2pMemberPayDetailsService {

    public P2pMemberPayDetails get(String id);

    public List<P2pMemberPayDetails> findList(P2pMemberPayDetails p2pMemberPayDetails);

    public Page<P2pMemberPayDetails> findPage(Page<P2pMemberPayDetails> page, P2pMemberPayDetails p2pMemberPayDetails);

    public void save(P2pMemberPayDetails p2pMemberPayDetails);

    public void delete(P2pMemberPayDetails p2pMemberPayDetails);

}