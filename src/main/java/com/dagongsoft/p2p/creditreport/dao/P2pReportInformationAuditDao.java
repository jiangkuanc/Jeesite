package com.dagongsoft.p2p.creditreport.dao;

import java.util.List;

import com.dagongsoft.p2p.creditreport.entity.P2pReportInformationAudit;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 举报信息审核表DAO接口
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@MyBatisDao
public interface P2pReportInformationAuditDao extends CrudDao<P2pReportInformationAudit> {
    //举报初审列表
    public List<P2pReportInformationAudit> getReportFirstAuditList(P2pReportInformationAudit p2pReportInformationAudit);

    //举报复审列表
    public List<P2pReportInformationAudit> getReportReviewAuditList(P2pReportInformationAudit p2pReportInformationAudit);

    //查询当前企业举报记录
    public List<P2pReportInformationAudit> ssList(String userId);

}