package com.dagongsoft.p2p.creditreport.dao;

import java.util.List;

import com.dagongsoft.p2p.creditreport.entity.P2pCreditReport;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 企业信用报告表DAO接口
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@MyBatisDao
public interface P2pCreditReportDao extends CrudDao<P2pCreditReport> {

    /**
     * 查询所有企业信用报告信息
     *
     * @param paramMap
     * @return
     */
    /*public List<P2pCreditReport> findAllFinancingList(Map paramMap);*/
    public List<P2pCreditReport> findList(P2pCreditReport p2pCreditReport);

    public P2pCreditReport getByUserId(String id);

}