package com.dagongsoft.p2p.creditmanage.service;

import java.util.List;


import com.dagongsoft.p2p.creditmanage.entity.CreditAppealInfo;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 信用记录申诉管理Service
 *
 * @author Zazh
 * @version 2017-02-20
 */
public interface CreditAppealInfoService {

    public CreditAppealInfo get(String id);

    public List<CreditAppealInfo> findList(CreditAppealInfo creditAppealInfo);

    public Page<CreditAppealInfo> findPage(Page<CreditAppealInfo> page, CreditAppealInfo creditAppealInfo);

    public void save(CreditAppealInfo creditAppealInfo);

    public void delete(CreditAppealInfo creditAppealInfo);

    public void appealAudit(CreditAppealInfo creditAppealInfo);
}