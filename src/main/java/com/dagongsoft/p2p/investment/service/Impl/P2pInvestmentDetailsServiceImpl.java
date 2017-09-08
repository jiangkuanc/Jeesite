package com.dagongsoft.p2p.investment.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentDetails;
import com.dagongsoft.p2p.investment.dao.P2pInvestmentDetailsDao;
import com.dagongsoft.p2p.investment.service.P2pInvestmentDetailsService;

/**
 * 投资明细表ServiceImpl
 *
 * @author Chace
 * @version 2016-11-08
 */
@Transactional(readOnly = true)
@Service("p2pInvestmentDetailsService")
public class P2pInvestmentDetailsServiceImpl extends CrudService<P2pInvestmentDetailsDao, P2pInvestmentDetails> implements P2pInvestmentDetailsService {

    public P2pInvestmentDetails get(String id) {
        return super.get(id);
    }

    public List<P2pInvestmentDetails> findList(P2pInvestmentDetails p2pInvestmentDetails) {
        return super.findList(p2pInvestmentDetails);
    }

    public Page<P2pInvestmentDetails> findPage(Page<P2pInvestmentDetails> page, P2pInvestmentDetails p2pInvestmentDetails) {
        return super.findPage(page, p2pInvestmentDetails);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pInvestmentDetails p2pInvestmentDetails) {
        super.save(p2pInvestmentDetails);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pInvestmentDetails p2pInvestmentDetails) {
        super.delete(p2pInvestmentDetails);
    }

}