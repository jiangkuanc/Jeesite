package com.dagongsoft.p2p.risk.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.risk.entity.P2pMember;
import com.dagongsoft.p2p.risk.dao.P2pMemberDao;
import com.dagongsoft.p2p.risk.service.P2pMemberService;

/**
 * 会员表ServiceImpl
 *
 * @author Joe
 * @version 2016-12-02
 */
@Transactional(readOnly = true)
@Service("p2pMemberService")
public class P2pMemberServiceImpl extends CrudService<P2pMemberDao, P2pMember> implements P2pMemberService {

    public P2pMember get(String id) {
        return super.get(id);
    }

    public List<P2pMember> findList(P2pMember p2pMember) {
        return super.findList(p2pMember);
    }

    public Page<P2pMember> findPage(Page<P2pMember> page, P2pMember p2pMember) {
        return super.findPage(page, p2pMember);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pMember p2pMember) {
        super.save(p2pMember);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pMember p2pMember) {
        super.delete(p2pMember);
    }

}