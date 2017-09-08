package com.dagongsoft.p2p.document.service;

import java.util.List;


import com.dagongsoft.p2p.document.entity.P2pSupplyDocumentUpload;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 补充材料上传记录Service
 *
 * @author Quincy
 * @version 2017-02-17
 */
public interface P2pSupplyDocumentUploadService {

    public P2pSupplyDocumentUpload get(String id);

    public List<P2pSupplyDocumentUpload> findList(P2pSupplyDocumentUpload p2pSupplyDocumentUpload);

    public Page<P2pSupplyDocumentUpload> findPage(Page<P2pSupplyDocumentUpload> page, P2pSupplyDocumentUpload p2pSupplyDocumentUpload);

    public void save(P2pSupplyDocumentUpload p2pSupplyDocumentUpload);

    public void delete(P2pSupplyDocumentUpload p2pSupplyDocumentUpload);

}