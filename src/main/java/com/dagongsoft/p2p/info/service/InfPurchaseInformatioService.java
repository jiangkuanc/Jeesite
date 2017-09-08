/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.info.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.info.dao.InfPurchaseInformatioDao;
import com.dagongsoft.p2p.info.entity.InfPurchaseInformatio;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 用户求购信息Service
 *
 * @author dagong
 * @version 2016-09-23
 */
@Service
@Transactional(readOnly = true)
public class InfPurchaseInformatioService extends CrudService<InfPurchaseInformatioDao, InfPurchaseInformatio> {

    public InfPurchaseInformatio get(String id) {
        return super.get(id);
    }

    public List<InfPurchaseInformatio> findList(InfPurchaseInformatio infPurchaseInformatio) {
        return super.findList(infPurchaseInformatio);
    }

    public Page<InfPurchaseInformatio> findPage(Page<InfPurchaseInformatio> page, InfPurchaseInformatio infPurchaseInformatio) {
        return super.findPage(page, infPurchaseInformatio);
    }

    @Transactional(readOnly = false)
    public void save(InfPurchaseInformatio infPurchaseInformatio) {
        super.save(infPurchaseInformatio);
    }

    @Transactional(readOnly = false)
    public void delete(InfPurchaseInformatio infPurchaseInformatio) {
        super.delete(infPurchaseInformatio);
    }

}