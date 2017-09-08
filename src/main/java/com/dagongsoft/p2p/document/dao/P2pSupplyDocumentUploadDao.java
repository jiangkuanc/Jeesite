package com.dagongsoft.p2p.document.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.document.entity.P2pSupplyDocumentUpload;

/**
 * 补充材料上传记录DAO接口
 *
 * @author Quincy
 * @version 2017-02-17
 */
@MyBatisDao
public interface P2pSupplyDocumentUploadDao extends CrudDao<P2pSupplyDocumentUpload> {

    public P2pSupplyDocumentUpload findRecord(P2pSupplyDocumentUpload p2pSupplyDocumentUpload);

    public void updateUploadTime(P2pSupplyDocumentUpload p2pSupplyDocumentUpload);

    public void updateUploadFlag();

    public List<P2pSupplyDocumentUpload> findSupplyDocumentList(String financingInformationId);
}