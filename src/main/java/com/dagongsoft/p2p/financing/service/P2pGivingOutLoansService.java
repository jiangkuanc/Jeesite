/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pGivingOutLoansDao;
import com.dagongsoft.p2p.financing.entity.P2pGivingOutLoans;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 贷款发放记录Service
 *
 * @author zhengshuo
 * @version 2016-07-12
 */
@Service
@Transactional(readOnly = true)
public class P2pGivingOutLoansService extends CrudService<P2pGivingOutLoansDao, P2pGivingOutLoans> {

    public P2pGivingOutLoans get(String id) {
        return super.get(id);
    }

    public List<P2pGivingOutLoans> findList(P2pGivingOutLoans p2pGivingOutLoans) {
        return super.findList(p2pGivingOutLoans);
    }

    public Page<P2pGivingOutLoans> findPage(Page<P2pGivingOutLoans> page, P2pGivingOutLoans p2pGivingOutLoans) {
        return super.findPage(page, p2pGivingOutLoans);
    }

    @Transactional(readOnly = false)
    public void save(P2pGivingOutLoans p2pGivingOutLoans) {
        super.save(p2pGivingOutLoans);
    }

    @Transactional(readOnly = false)
    public void delete(P2pGivingOutLoans p2pGivingOutLoans) {
        super.delete(p2pGivingOutLoans);
    }

    @Autowired
    private P2pGivingOutLoansDao p2pGivingOutLoansDao;

    /**
     * 根据申请人ID查询放款信息
     *
     * @return
     */
    public List<P2pGivingOutLoans> findP2pGivingOutLoansByUser(User user) {
        return p2pGivingOutLoansDao.findP2pGivingOutLoansByUser(user);
    }
}