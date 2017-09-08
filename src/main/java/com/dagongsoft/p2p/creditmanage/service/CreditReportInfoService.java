package com.dagongsoft.p2p.creditmanage.service;

import java.util.List;


import com.dagongsoft.p2p.creditmanage.entity.CreditReportInfo;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 信用记录举报管理Service
 *
 * @author Zazh
 * @version 2017-02-20
 */
public interface CreditReportInfoService {

    public CreditReportInfo get(String id);

    public List<CreditReportInfo> findList(CreditReportInfo creditReportInfo);

    public Page<CreditReportInfo> findPage(Page<CreditReportInfo> page, CreditReportInfo creditReportInfo);

    public void save(CreditReportInfo creditReportInfo);

    public void delete(CreditReportInfo creditReportInfo);

    public void reportAudit(CreditReportInfo creditReportInfo);

    public List<CreditReportInfo> findListByReportId(CreditReportInfo creditReportInfo);

    /**
     * 信用记录举报列表
     *
     * @param creditReportInfo
     * @return
     */
    public Page<CreditReportInfo> getReportPage(Page<CreditReportInfo> page, CreditReportInfo creditReportInfo);

    /**
     * 信用记录举报详情（审核）
     */
    public CreditReportInfo getReportDetails(CreditReportInfo creditReportInfo);
}