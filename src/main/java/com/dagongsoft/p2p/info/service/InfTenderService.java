/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.info.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.info.dao.InfTenderDao;
import com.dagongsoft.p2p.info.entity.InfTender;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 用户招商Service
 *
 * @author dagong
 * @version 2016-09-23
 */
@Service
@Transactional(readOnly = true)
public class InfTenderService extends CrudService<InfTenderDao, InfTender> {
    @Autowired
    private InfTenderDao infTenderDao;

    public InfTender get(String id) {
        return super.get(id);
    }

    public List<InfTender> findList(InfTender infTender) {
        return super.findList(infTender);
    }

    public Page<InfTender> findPage(Page<InfTender> page, InfTender infTender) {
        return super.findPage(page, infTender);
    }

    @Transactional(readOnly = false)
    public void save(InfTender infTender) {
        super.save(infTender);
    }

    @Transactional(readOnly = false)
    public void delete(InfTender infTender) {
        super.delete(infTender);
    }

    public Page<InfTender> findTenderinfoList(Page<InfTender> page, InfTender infTender) {
        infTender.setPage(page);
        page.setList(infTenderDao.findTenderinfoList(infTender));
        return page;
    }


    @Transactional(readOnly = false)
    public void updateInfoStage(InfTender infTender) {
        infTenderDao.updateInfoStage(infTender);
    }

}