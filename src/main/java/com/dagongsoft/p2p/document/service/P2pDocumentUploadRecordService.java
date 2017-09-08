/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.document.dao.P2pDocumentUploadRecordDao;
import com.dagongsoft.p2p.document.entity.P2pDocumentUploadRecord;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 材料上传记录Service
 *
 * @author Quincy
 * @version 2016-10-25
 */
@Service
@Transactional(readOnly = true)
public class P2pDocumentUploadRecordService extends CrudService<P2pDocumentUploadRecordDao, P2pDocumentUploadRecord> {

    @Autowired
    private P2pDocumentUploadRecordDao p2pDocumentUploadRecordDao;

    public P2pDocumentUploadRecord get(String id) {
        return super.get(id);
    }

    public List<P2pDocumentUploadRecord> findList(P2pDocumentUploadRecord p2pDocumentUploadRecord) {
        return super.findList(p2pDocumentUploadRecord);
    }

    public Page<P2pDocumentUploadRecord> findPage(Page<P2pDocumentUploadRecord> page, P2pDocumentUploadRecord p2pDocumentUploadRecord) {
        return super.findPage(page, p2pDocumentUploadRecord);
    }

    @Transactional(readOnly = false)
    public void save(P2pDocumentUploadRecord p2pDocumentUploadRecord) {
        super.save(p2pDocumentUploadRecord);
    }

    @Transactional(readOnly = false)
    public void delete(P2pDocumentUploadRecord p2pDocumentUploadRecord) {
        super.delete(p2pDocumentUploadRecord);
    }

    public List<P2pDocumentUploadRecord> findById(String id) {
        return p2pDocumentUploadRecordDao.findById(id);
    }

    /**
     * 根据债项ID和rateDocumentTempId查询需下载的文件路径集合
     *
     * @param p2pDocumentUploadRecord
     * @return list
     * @author Chace
     */
    public List<String> getAddress(P2pDocumentUploadRecord p2pDocumentUploadRecord) {
        return p2pDocumentUploadRecordDao.getAddress(p2pDocumentUploadRecord);
    }

    /**
     * 根据文件路径获取保存的原文件名
     *
     * @param address
     * @return name
     * @author Chace
     */

    public String getNameByAddress(String address) {
        return p2pDocumentUploadRecordDao.getNameByAddress(address);
    }

    public List<P2pDocumentUploadRecord> getAddresses(
            String financingInformationId, String rateDocumentTempId) {
        return p2pDocumentUploadRecordDao.getAddresses(financingInformationId, rateDocumentTempId);
    }
}