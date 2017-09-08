/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.entity.AccountStrategic;
import com.thinkgem.jeesite.modules.sys.dao.AccountStrategicDao;

/**
 * 账户策略管理Service
 *
 * @author system
 * @version 2016-06-30
 */
@Service
@Transactional(readOnly = true)
public class AccountStrategicService extends CrudService<AccountStrategicDao, AccountStrategic> {

    public AccountStrategic get(String id) {
        return super.get(id);
    }

    public List<AccountStrategic> findList(AccountStrategic accountStrategic) {
        return super.findList(accountStrategic);
    }

    public Page<AccountStrategic> findPage(Page<AccountStrategic> page, AccountStrategic accountStrategic) {
        return super.findPage(page, accountStrategic);
    }

    @Transactional(readOnly = false)
    public void save(AccountStrategic accountStrategic) {
        super.save(accountStrategic);
    }

    @Transactional(readOnly = false)
    public void delete(AccountStrategic accountStrategic) {
        super.delete(accountStrategic);
    }

}