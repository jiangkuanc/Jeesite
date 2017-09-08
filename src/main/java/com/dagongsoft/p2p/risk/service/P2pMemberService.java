package com.dagongsoft.p2p.risk.service;

import java.util.List;


import com.dagongsoft.p2p.risk.entity.P2pMember;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 会员表Service
 *
 * @author Joe
 * @version 2016-12-02
 */
public interface P2pMemberService {

    public P2pMember get(String id);

    public List<P2pMember> findList(P2pMember p2pMember);

    public Page<P2pMember> findPage(Page<P2pMember> page, P2pMember p2pMember);

    public void save(P2pMember p2pMember);

    public void delete(P2pMember p2pMember);

}