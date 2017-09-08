/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.document.dao.P2pRateDocumentTemplateDao;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentTemplate;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 评级材料模板Service
 *
 * @author qichao
 * @version 2016-09-27
 */
@Service
@Transactional(readOnly = true)
public class P2pRateDocumentTemplateService extends CrudService<P2pRateDocumentTemplateDao, P2pRateDocumentTemplate> {
    @Autowired
    P2pRateDocumentTemplateDao p2pRateDocumentTemplateDao;

    public P2pRateDocumentTemplate get(String id) {
        return super.get(id);
    }

    public List<P2pRateDocumentTemplate> findList(P2pRateDocumentTemplate p2pRateDocumentTemplate) {
        return super.findList(p2pRateDocumentTemplate);
    }

    public Page<P2pRateDocumentTemplate> findPage(Page<P2pRateDocumentTemplate> page, P2pRateDocumentTemplate p2pRateDocumentTemplate) {
        return super.findPage(page, p2pRateDocumentTemplate);
    }

    @Transactional(readOnly = false)
    public void save(P2pRateDocumentTemplate p2pRateDocumentTemplate) {
        super.save(p2pRateDocumentTemplate);
    }

    @Transactional(readOnly = false)
    public void delete(P2pRateDocumentTemplate p2pRateDocumentTemplate) {
        super.delete(p2pRateDocumentTemplate);
    }

    public P2pRateDocumentTemplate findByName(String name) {
        return p2pRateDocumentTemplateDao.findByName(name);
    }

    public List<P2pRateDocumentTemplate> findAll() {
        return p2pRateDocumentTemplateDao.findAll();
    }
}