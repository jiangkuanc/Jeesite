package com.dagongsoft.p2p.creditmanage.dao;

import java.util.List;

import com.dagongsoft.p2p.creditmanage.entity.CreditReportInfo;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 信用记录举报管理DAO接口
 *
 * @author Zazh
 * @version 2017-02-20
 */
@MyBatisDao
public interface CreditReportInfoDao extends CrudDao<CreditReportInfo> {

    public void reportAudit(CreditReportInfo creditReportInfo);

    public List<CreditReportInfo> findListByReportId(CreditReportInfo creditReportInfo);

    /**
     * 信用记录举报列表
     *
     * @param creditReportInfo
     * @return
     */
    public List<CreditReportInfo> getReportList(CreditReportInfo creditReportInfo);

    /**
     * 信用记录举报详情（审核）
     */
    public CreditReportInfo getReportDetails(CreditReportInfo creditReportInfo);
}