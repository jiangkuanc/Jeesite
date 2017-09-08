package com.dagongsoft.p2p.investment.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentDetails;

/**
 * 投资明细表DAO接口
 *
 * @author Chace
 * @version 2016-11-08
 */
@MyBatisDao
public interface P2pInvestmentDetailsDao extends CrudDao<P2pInvestmentDetails> {

}