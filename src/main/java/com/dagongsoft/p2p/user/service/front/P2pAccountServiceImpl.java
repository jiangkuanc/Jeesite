package com.dagongsoft.p2p.user.service.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.user.dao.P2pAccountDao;
import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 账户表ServiceImpl
 *
 * @author Joe
 * @version 2016-11-07
 */
@Transactional(readOnly = true)
@Service("p2pAccountService")
public class P2pAccountServiceImpl extends CrudService<P2pAccountDao, P2pAccount> implements P2pAccountService {

    @Autowired
    public P2pAccountDao p2pAccountDao;


    public P2pAccount getAccountByUserId(String userId) {
        return p2pAccountDao.getAccountByUserId(userId);
    }

    public P2pAccount get(String id) {
        return super.get(id);
    }

    public List<P2pAccount> findList(P2pAccount p2pAccount) {
        return super.findList(p2pAccount);
    }

    public Page<P2pAccount> findPage(Page<P2pAccount> page, P2pAccount p2pAccount) {
        return super.findPage(page, p2pAccount);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pAccount p2pAccount) {
        super.save(p2pAccount);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pAccount p2pAccount) {
        super.delete(p2pAccount);
    }

}