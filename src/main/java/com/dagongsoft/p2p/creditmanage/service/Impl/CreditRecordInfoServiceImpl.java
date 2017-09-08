package com.dagongsoft.p2p.creditmanage.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.creditmanage.dao.CreditRecordInfoDao;
import com.dagongsoft.p2p.creditmanage.entity.CreditRecordInfo;
import com.dagongsoft.p2p.creditmanage.service.CreditRecordInfoService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 信用记录申诉管理ServiceImpl
 *
 * @author Zazh
 * @version 2017-02-20
 */
@Transactional(readOnly = true)
@Service("creditRecordInfoService")
public class CreditRecordInfoServiceImpl extends CrudService<CreditRecordInfoDao, CreditRecordInfo> implements CreditRecordInfoService {

    public CreditRecordInfo get(String id) {
        return super.get(id);
    }

    public List<CreditRecordInfo> findList(CreditRecordInfo creditRecordInfo) {
        return super.findList(creditRecordInfo);
    }

    public Page<CreditRecordInfo> findPage(Page<CreditRecordInfo> page, CreditRecordInfo creditRecordInfo) {
        return super.findPage(page, creditRecordInfo);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(CreditRecordInfo CreditRecordInfo) {
        super.save(CreditRecordInfo);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(CreditRecordInfo CreditRecordInfo) {
        super.delete(CreditRecordInfo);
    }

}