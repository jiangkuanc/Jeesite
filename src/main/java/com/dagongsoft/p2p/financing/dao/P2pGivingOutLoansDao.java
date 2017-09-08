/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.dao;

import java.util.List;

import com.dagongsoft.p2p.financing.entity.P2pGivingOutLoans;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 贷款发放记录DAO接口
 *
 * @author zhengshuo
 * @version 2016-07-12
 */
@MyBatisDao
public interface P2pGivingOutLoansDao extends CrudDao<P2pGivingOutLoans> {
    /**
     * 根据申请人ID查询放款信息
     *
     * @return
     */
    public List<P2pGivingOutLoans> findP2pGivingOutLoansByUser(User user);
}