package com.dagongsoft.p2p.creditmanage.service;

import java.util.List;


import com.dagongsoft.p2p.creditmanage.entity.CreditOverdueInfo;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 信用记录维护Service
 *
 * @author Zazh
 * @version 2017-02-20
 */
public interface CreditOverdueInfoService {

    public CreditOverdueInfo get(String id);

    public List<CreditOverdueInfo> findList(CreditOverdueInfo creditOverdueInfo);

    public Page<CreditOverdueInfo> findPage(Page<CreditOverdueInfo> page, CreditOverdueInfo creditOverdueInfo);

    public void save(CreditOverdueInfo creditOverdueInfo);

    public void delete(CreditOverdueInfo creditOverdueInfo);

}