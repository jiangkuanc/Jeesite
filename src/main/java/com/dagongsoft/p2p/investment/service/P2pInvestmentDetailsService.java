package com.dagongsoft.p2p.investment.service;

import java.util.List;

import com.dagongsoft.p2p.investment.entity.P2pInvestmentDetails;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 投资明细表Service
 *
 * @author Chace
 * @version 2016-11-08
 */
public interface P2pInvestmentDetailsService {

    public P2pInvestmentDetails get(String id);

    public List<P2pInvestmentDetails> findList(P2pInvestmentDetails p2pInvestmentDetails);

    public Page<P2pInvestmentDetails> findPage(Page<P2pInvestmentDetails> page, P2pInvestmentDetails p2pInvestmentDetails);

    public void save(P2pInvestmentDetails p2pInvestmentDetails);

    public void delete(P2pInvestmentDetails p2pInvestmentDetails);

}