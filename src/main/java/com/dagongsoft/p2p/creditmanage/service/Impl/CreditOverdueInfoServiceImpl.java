package com.dagongsoft.p2p.creditmanage.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.creditmanage.entity.CreditOverdueInfo;
import com.dagongsoft.p2p.creditmanage.dao.CreditOverdueInfoDao;
import com.dagongsoft.p2p.creditmanage.service.CreditOverdueInfoService;

/**
 * 信用记录维护ServiceImpl
 *
 * @author Zazh
 * @version 2017-02-20
 */
@Transactional(readOnly = true)
@Service("creditOverdueInfoService")
public class CreditOverdueInfoServiceImpl extends CrudService<CreditOverdueInfoDao, CreditOverdueInfo> implements CreditOverdueInfoService {

    public CreditOverdueInfo get(String id) {
        return super.get(id);
    }

    public List<CreditOverdueInfo> findList(CreditOverdueInfo creditOverdueInfo) {
        return super.findList(creditOverdueInfo);
    }

    public Page<CreditOverdueInfo> findPage(Page<CreditOverdueInfo> page, CreditOverdueInfo creditOverdueInfo) {
        return super.findPage(page, creditOverdueInfo);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(CreditOverdueInfo creditOverdueInfo) {
        super.save(creditOverdueInfo);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(CreditOverdueInfo creditOverdueInfo) {
        super.delete(creditOverdueInfo);
    }

}