/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.dao;

import java.util.List;

import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 评级材料上传DAO接口
 *
 * @author qichao
 * @version 2016-09-27
 */
@MyBatisDao
public interface P2pRateDocumentUploadDao extends CrudDao<P2pRateDocumentUpload> {

    public List<P2pRateDocumentUpload> getDocumentByFiId(String fiId);

    public void saveSingleDocument(P2pRateDocumentUpload p2pRateDocumentUpload);


    /**
     * 添加上传记录
     *
     * @param p2pRateDocumentUpload
     * @author Quincy
     */
    public void insertUploadRecord(P2pRateDocumentUpload p2pRateDocumentUpload);

    /**
     * 根据债项ID和模板ID查询记录
     *
     * @param p2pRateDocumentUpload
     * @return
     * @author Quincy
     */
    public P2pRateDocumentUpload findRecord(P2pRateDocumentUpload p2pRateDocumentUpload);

    /**
     * 修改上传时间
     *
     * @param p2pRateDocumentUpload
     * @author Quincy
     */
    public void updateUploadTime(P2pRateDocumentUpload p2pRateDocumentUpload);

    /**
     * 修改驳回状态
     *
     * @param p2pRateDocumentUpload
     * @author Quincy
     */
    public void updateIsReject(P2pRateDocumentUpload p2pRateDocumentUpload);

    /**
     * 根据债项ID查询材料列表
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<P2pRateDocumentUpload> findRateDocumentList(String financingInformationId);

    /**
     * 简单上传记录列表(全部)
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<P2pRateDocumentUpload> findSimpleList(String financingInformationId);

    /**
     * 简单上传记录列表(通过以及待审)
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<P2pRateDocumentUpload> findSimpleList1(String financingInformationId);

    /**
     * 简单上传记录列表(驳回)
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<P2pRateDocumentUpload> findSimpleList2(String financingInformationId);

    public P2pRateDocumentUpload findByIdAndName(String id, String id2);

    /**
     * 根据id查集合
     *
     * @param id
     * @return
     * @author Sora
     */
    public List<P2pRateDocumentUpload> findListById(String id);

    public int update(P2pRateDocumentUpload p2pRateDocumentUpload);

    /**
     * 根据债项id验证材料是否全部审核(返回未审核数据)
     *
     * @param fiId
     * @return
     */
    public List<P2pRateDocumentUpload> validateIfAuditAll(String fiId);

    public List<P2pRateDocumentUpload> findAll(String id);
}