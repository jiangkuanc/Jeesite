/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.document.dao.P2pRateDocumentUploadDao;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 评级材料上传Service
 *
 * @author qichao
 * @version 2016-09-27
 */
@Service
@Transactional(readOnly = true)
public class P2pRateDocumentUploadService extends CrudService<P2pRateDocumentUploadDao, P2pRateDocumentUpload> {
    @Autowired
    private P2pRateDocumentUploadDao p2pRateDocumentUploadDao;

    public P2pRateDocumentUpload get(String id) {
        return super.get(id);
    }

    public List<P2pRateDocumentUpload> findList(P2pRateDocumentUpload p2pRateDocumentUpload) {
        return super.findList(p2pRateDocumentUpload);
    }

    public Page<P2pRateDocumentUpload> findPage(Page<P2pRateDocumentUpload> page, P2pRateDocumentUpload p2pRateDocumentUpload) {
        return super.findPage(page, p2pRateDocumentUpload);
    }

    @Transactional(readOnly = false)
    public void save(P2pRateDocumentUpload p2pRateDocumentUpload) {
        super.save(p2pRateDocumentUpload);
    }

    @Transactional(readOnly = false)
    public void delete(P2pRateDocumentUpload p2pRateDocumentUpload) {
        super.delete(p2pRateDocumentUpload);
    }

    public List<P2pRateDocumentUpload> getDocumentByFiId(String fiId) {
        return p2pRateDocumentUploadDao.getDocumentByFiId(fiId);
    }

    @Transactional(readOnly = false)
    public void saveSingleDocument(P2pRateDocumentUpload p2pRateDocumentUpload) {
        p2pRateDocumentUploadDao.saveSingleDocument(p2pRateDocumentUpload);
    }

    public P2pRateDocumentUpload findByIdAndName(String id, String id2) {
        return p2pRateDocumentUploadDao.findByIdAndName(id, id2);
    }

    /*
     * 根据id查集合
     */
    public List<P2pRateDocumentUpload> findListById(String id) {
        return p2pRateDocumentUploadDao.findListById(id);
    }

    @Transactional(readOnly = false)
    public void update(P2pRateDocumentUpload p2pRateDocumentUpload) {
        p2pRateDocumentUploadDao.update(p2pRateDocumentUpload);

    }

    /**
     * 根据债项id验证材料是否全部审核(返回未审核数据)
     *
     * @param fiId
     * @return
     */
    public List<P2pRateDocumentUpload> validateIfAuditAll(String fiId) {
        return p2pRateDocumentUploadDao.validateIfAuditAll(fiId);
    }

    public List<P2pRateDocumentUpload> findAll(String id) {
        return p2pRateDocumentUploadDao.findAll(id);
    }
}