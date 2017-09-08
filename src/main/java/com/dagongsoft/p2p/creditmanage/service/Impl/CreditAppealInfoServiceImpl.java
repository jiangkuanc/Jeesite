package com.dagongsoft.p2p.creditmanage.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.creditmanage.dao.CreditAppealInfoDao;
import com.dagongsoft.p2p.creditmanage.entity.CreditAppealInfo;
import com.dagongsoft.p2p.creditmanage.service.CreditAppealInfoService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 信用记录申诉管理ServiceImpl
 *
 * @author Zazh
 * @version 2017-02-20
 */
@Transactional(readOnly = true)
@Service("creditAppealInfoService")
public class CreditAppealInfoServiceImpl extends CrudService<CreditAppealInfoDao, CreditAppealInfo> implements CreditAppealInfoService {

    @Resource
    private CreditAppealInfoDao creditAppealInfoDao;

    public CreditAppealInfo get(String id) {
        return super.get(id);
    }

    public List<CreditAppealInfo> findList(CreditAppealInfo creditAppealInfo) {
        return super.findList(creditAppealInfo);
    }

    public Page<CreditAppealInfo> findPage(Page<CreditAppealInfo> page, CreditAppealInfo creditAppealInfo) {
        return super.findPage(page, creditAppealInfo);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(CreditAppealInfo creditAppealInfo) {
        super.save(creditAppealInfo);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(CreditAppealInfo creditAppealInfo) {
        super.delete(creditAppealInfo);
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void appealAudit(CreditAppealInfo creditAppealInfo) {
        creditAppealInfoDao.appealAudit(creditAppealInfo);
    }

}