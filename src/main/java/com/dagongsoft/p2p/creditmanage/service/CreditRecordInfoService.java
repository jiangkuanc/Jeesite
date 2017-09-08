package com.dagongsoft.p2p.creditmanage.service;

import java.util.List;

import com.dagongsoft.p2p.creditmanage.entity.CreditRecordInfo;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 信用记录申诉管理Service
 *
 * @author Zazh
 * @version 2017-02-20
 */
public interface CreditRecordInfoService {

    public CreditRecordInfo get(String id);

    public List<CreditRecordInfo> findList(CreditRecordInfo creditRecordInfo);

    public Page<CreditRecordInfo> findPage(Page<CreditRecordInfo> page, CreditRecordInfo creditRecordInfo);

    public void save(CreditRecordInfo creditRecordInfo);

    public void delete(CreditRecordInfo creditRecordInfo);

}