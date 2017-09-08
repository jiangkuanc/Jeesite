package com.dagongsoft.p2p.creditreport.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.creditreport.entity.P2pCreditReportData;

/**
 * 信用报告指标数据表DAO接口
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@MyBatisDao
public interface P2pCreditReportDataDao extends CrudDao<P2pCreditReportData> {
    public List<P2pCreditReportData> getCreditReprotId(String id);
}