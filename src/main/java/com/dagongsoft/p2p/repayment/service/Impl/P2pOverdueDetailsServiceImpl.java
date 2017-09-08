package com.dagongsoft.p2p.repayment.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.repayment.entity.P2pOverdueDetails;
import com.dagongsoft.p2p.repayment.dao.P2pOverdueDetailsDao;
import com.dagongsoft.p2p.repayment.service.P2pOverdueDetailsService;

/**
 * 逾期明细表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-16
 */
@Transactional(readOnly = true)
@Service("p2pOverdueDetailsService")
public class P2pOverdueDetailsServiceImpl extends CrudService<P2pOverdueDetailsDao, P2pOverdueDetails> implements P2pOverdueDetailsService {

    public P2pOverdueDetails get(String id) {
        return super.get(id);
    }

    public List<P2pOverdueDetails> findList(P2pOverdueDetails p2pOverdueDetails) {
        return super.findList(p2pOverdueDetails);
    }

    public Page<P2pOverdueDetails> findPage(Page<P2pOverdueDetails> page, P2pOverdueDetails p2pOverdueDetails) {
        return super.findPage(page, p2pOverdueDetails);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pOverdueDetails p2pOverdueDetails) {
        super.save(p2pOverdueDetails);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pOverdueDetails p2pOverdueDetails) {
        super.delete(p2pOverdueDetails);
    }

}