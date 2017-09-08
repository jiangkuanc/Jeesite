/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.info.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.info.dao.InfProvideServiceDao;
import com.dagongsoft.p2p.info.entity.InfProvideService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 用户提供服务Service
 *
 * @author dagong
 * @version 2016-09-23
 */
@Service
@Transactional(readOnly = true)
public class InfProvideServiceService extends CrudService<InfProvideServiceDao, InfProvideService> {

    public InfProvideService get(String id) {
        return super.get(id);
    }

    public List<InfProvideService> findList(InfProvideService infProvideService) {
        return super.findList(infProvideService);
    }

    public Page<InfProvideService> findPage(Page<InfProvideService> page, InfProvideService infProvideService) {
        return super.findPage(page, infProvideService);
    }

    @Transactional(readOnly = false)
    public void save(InfProvideService infProvideService) {
        super.save(infProvideService);
    }

    @Transactional(readOnly = false)
    public void delete(InfProvideService infProvideService) {
        super.delete(infProvideService);
    }

}