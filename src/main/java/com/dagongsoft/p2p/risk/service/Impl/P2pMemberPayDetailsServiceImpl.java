package com.dagongsoft.p2p.risk.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.risk.entity.P2pMemberPayDetails;
import com.dagongsoft.p2p.risk.dao.P2pMemberPayDetailsDao;
import com.dagongsoft.p2p.risk.service.P2pMemberPayDetailsService;

/**
 * 会员付费详情表ServiceImpl
 *
 * @author Joe
 * @version 2016-12-02
 */
@Transactional(readOnly = true)
@Service("p2pMemberPayDetailsService")
public class P2pMemberPayDetailsServiceImpl extends CrudService<P2pMemberPayDetailsDao, P2pMemberPayDetails> implements P2pMemberPayDetailsService {

    public P2pMemberPayDetails get(String id) {
        return super.get(id);
    }

    public List<P2pMemberPayDetails> findList(P2pMemberPayDetails p2pMemberPayDetails) {
        return super.findList(p2pMemberPayDetails);
    }

    public Page<P2pMemberPayDetails> findPage(Page<P2pMemberPayDetails> page, P2pMemberPayDetails p2pMemberPayDetails) {
        return super.findPage(page, p2pMemberPayDetails);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pMemberPayDetails p2pMemberPayDetails) {
        super.save(p2pMemberPayDetails);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pMemberPayDetails p2pMemberPayDetails) {
        super.delete(p2pMemberPayDetails);
    }

}