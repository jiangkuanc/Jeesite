package com.dagongsoft.p2p.document.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.document.entity.P2pSupplyDocumentUpload;
import com.dagongsoft.p2p.document.dao.P2pSupplyDocumentUploadDao;
import com.dagongsoft.p2p.document.service.P2pSupplyDocumentUploadService;

/**
 * 补充材料上传记录ServiceImpl
 *
 * @author Quincy
 * @version 2017-02-17
 */
@Transactional(readOnly = true)
@Service("p2pSupplyDocumentUploadService")
public class P2pSupplyDocumentUploadServiceImpl extends CrudService<P2pSupplyDocumentUploadDao, P2pSupplyDocumentUpload> implements P2pSupplyDocumentUploadService {

    public P2pSupplyDocumentUpload get(String id) {
        return super.get(id);
    }

    public List<P2pSupplyDocumentUpload> findList(P2pSupplyDocumentUpload p2pSupplyDocumentUpload) {
        return super.findList(p2pSupplyDocumentUpload);
    }

    public Page<P2pSupplyDocumentUpload> findPage(Page<P2pSupplyDocumentUpload> page, P2pSupplyDocumentUpload p2pSupplyDocumentUpload) {
        return super.findPage(page, p2pSupplyDocumentUpload);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pSupplyDocumentUpload p2pSupplyDocumentUpload) {
        super.save(p2pSupplyDocumentUpload);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pSupplyDocumentUpload p2pSupplyDocumentUpload) {
        super.delete(p2pSupplyDocumentUpload);
    }

}