/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.user.dao.P2pUserResourceDao;
import com.dagongsoft.p2p.user.entity.P2pUserResource;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 用户权限控制表，配置用户能访问的功能Service
 *
 * @author qichao
 * @version 2016-07-06
 */
@Service
@Transactional(readOnly = true)
public class P2pUserResourceService extends CrudService<P2pUserResourceDao, P2pUserResource> {

    public P2pUserResource get(String id) {
        return super.get(id);
    }

    public List<P2pUserResource> findList(P2pUserResource p2pUserResource) {
        return super.findList(p2pUserResource);
    }

    public Page<P2pUserResource> findPage(Page<P2pUserResource> page, P2pUserResource p2pUserResource) {
        return super.findPage(page, p2pUserResource);
    }

    @Transactional(readOnly = false)
    public void save(P2pUserResource p2pUserResource) {
        super.save(p2pUserResource);
    }

    @Transactional(readOnly = false)
    public void delete(P2pUserResource p2pUserResource) {
        super.delete(p2pUserResource);
    }

}