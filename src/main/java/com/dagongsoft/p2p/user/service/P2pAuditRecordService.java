/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.user.dao.P2pAuditRecordDao;
import com.dagongsoft.p2p.user.entity.P2pAuditRecord;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;


/**
 * 认证审核记录，包含个人身份认证、企业身份认证Service
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Service
@Transactional(readOnly = true)
public class P2pAuditRecordService extends CrudService<P2pAuditRecordDao, P2pAuditRecord> {
    @Autowired
    private P2pAuditRecordDao p2pAuditRecordDao;

    public P2pAuditRecord get(String id) {
        return super.get(id);
    }

    public List<P2pAuditRecord> findList(P2pAuditRecord p2pAuditRecord) {
        return super.findList(p2pAuditRecord);
    }

    public Page<P2pAuditRecord> findPage(Page<P2pAuditRecord> page, P2pAuditRecord p2pAuditRecord) {
        return super.findPage(page, p2pAuditRecord);
    }

    @Transactional(readOnly = false)
    public void save(P2pAuditRecord p2pAuditRecord) {
        super.save(p2pAuditRecord);
    }

    @Transactional(readOnly = false)
    public void delete(P2pAuditRecord p2pAuditRecord) {
        super.delete(p2pAuditRecord);
    }

    public Page<P2pAuditRecord> findAuditRecordListByIdAndType(Page<P2pAuditRecord> page, P2pAuditRecord p2pAuditRecord) {
        p2pAuditRecord.setPage(page);
        List<P2pAuditRecord> list = p2pAuditRecordDao.findAuditRecordListByIdAndType(p2pAuditRecord);
        for (P2pAuditRecord info : list) {
            if (info.getAuditType() == 1) {
                info.setIdCardInhand(UploadFileUtils.viewUrl(info.getIdCardInhand()));
                info.setIdCardFront(UploadFileUtils.viewUrl(info.getIdCardFront()));
                info.setIdCardBack(UploadFileUtils.viewUrl(info.getIdCardBack()));
                if (info.getPowerOfAttorney() != null && !"".equals(info.getPowerOfAttorney())) {
                    info.setPowerOfAttorney(UploadFileUtils.viewUrl(info.getPowerOfAttorney()));
                }
            }
            if (info.getAuditType() == 2) {
                info.setBusinessLicense(UploadFileUtils.viewUrl(info.getBusinessLicense()));
                if (info.getIdCardFront() != null && info.getIdCardBack() != null) {
                    info.setIdCardFront(UploadFileUtils.viewUrl(info.getIdCardFront()));
                    info.setIdCardBack(UploadFileUtils.viewUrl(info.getIdCardBack()));
                }
            }

        }
        page.setList(list);
        return page;
    }

    public List<P2pAuditRecord> findAuditRecordListByIdAndType(P2pAuditRecord p2pAuditRecord) {
        return p2pAuditRecordDao.findAuditRecordListByIdAndType(p2pAuditRecord);
    }

    public List<P2pAuditRecord> findById(String id) {
        return p2pAuditRecordDao.findById(id);
    }
}