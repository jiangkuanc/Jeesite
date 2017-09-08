/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.dao;

import java.util.List;

import com.dagongsoft.p2p.document.entity.P2pDocumentUploadRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 材料上传记录DAO接口
 *
 * @author Quincy
 * @version 2016-10-25
 */
@MyBatisDao
public interface P2pDocumentUploadRecordDao extends CrudDao<P2pDocumentUploadRecord> {

    /**
     * 添加附件上传记录
     *
     * @param p2pDocumentUploadRecord
     * @author Quincy
     */
    public void insertAttachment(P2pDocumentUploadRecord p2pDocumentUploadRecord);

    /**
     * 删除附件上传记录
     *
     * @param id
     * @author Quincy
     */
    public void deleteAttachment(String fileId);

    public List<P2pDocumentUploadRecord> findById(String id);

    /**
     * 根据债项ID和rateDocumentTempId查询需下载的文件路径集合
     *
     * @param p2pDocumentUploadRecord
     * @return list
     * @author Chace
     */
    public List<String> getAddress(P2pDocumentUploadRecord p2pDocumentUploadRecord);

    /**
     * 根据文件路径获取保存的原文件名
     *
     * @param address
     * @return name
     * @author Chace
     */

    public String getNameByAddress(String address);

    public List<P2pDocumentUploadRecord> getAddresses(
            String financingInformationId, String rateDocumentTempId);
}