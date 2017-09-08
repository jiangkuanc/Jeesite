/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pApplicationDocumentsDao;
import com.dagongsoft.p2p.financing.entity.P2pApplicationDocuments;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * 融资申请材料Service
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Service
@Transactional(readOnly = true)
public class P2pApplicationDocumentsService extends CrudService<P2pApplicationDocumentsDao, P2pApplicationDocuments> {

    public P2pApplicationDocuments get(String id) {
        return super.get(id);
    }

    public List<P2pApplicationDocuments> findList(P2pApplicationDocuments p2pApplicationDocuments) {
        return super.findList(p2pApplicationDocuments);
    }

    public Page<P2pApplicationDocuments> findPage(Page<P2pApplicationDocuments> page, P2pApplicationDocuments p2pApplicationDocuments) {
        return super.findPage(page, p2pApplicationDocuments);
    }

    @Transactional(readOnly = false)
    public void save(P2pApplicationDocuments p2pApplicationDocuments) {
        super.save(p2pApplicationDocuments);
    }

    @Transactional(readOnly = false)
    public void delete(P2pApplicationDocuments p2pApplicationDocuments) {
        super.delete(p2pApplicationDocuments);
    }

    @Autowired
    private P2pApplicationDocumentsDao p2pApplicationDocumentsDao;

    public P2pApplicationDocuments getByFiId(String financingInformationId) {
        return p2pApplicationDocumentsDao.getByFiId(financingInformationId);
    }

    /**
     * 添加或修改融资材料信息
     *
     * @param p2pApplicationDocuments
     */
    @Transactional(readOnly = false)
    public void saveOrUpdateP2pApplicationDocuments(P2pApplicationDocuments p2pApplicationDocuments) {
        //根据ID判断该信息是否是第一次添加
        if (p2pApplicationDocuments.getId() == null || "".equals(p2pApplicationDocuments.getId())) {
            p2pApplicationDocuments.setId(IdGen.uuid());
            p2pApplicationDocumentsDao.saveP2pApplicationDocuments(p2pApplicationDocuments);
        } else {
            p2pApplicationDocumentsDao.updateP2pApplicationDocuments(p2pApplicationDocuments);
        }
    }

    /**
     * 通过融资项目ID单挑查询
     *
     * @param p2pFinancingInformation
     * @return
     */
    public P2pApplicationDocuments findP2pApplicationDocumentsByFid(P2pFinancingInformation p2pFinancingInformation) {
        return p2pApplicationDocumentsDao.findP2pApplicationDocumentsByFid(p2pFinancingInformation);
    }
}