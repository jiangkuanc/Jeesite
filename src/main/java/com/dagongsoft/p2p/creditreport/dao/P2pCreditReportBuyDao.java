package com.dagongsoft.p2p.creditreport.dao;

import java.util.List;

import com.dagongsoft.p2p.creditreport.entity.P2pCreditReportBuy;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;


/**
 * 信用信息购买表DAO接口
 *
 * @author wangbignqi
 * @version 2016-11-07
 */
@MyBatisDao
public interface P2pCreditReportBuyDao extends CrudDao<P2pCreditReportBuy> {

    public List<P2pCreditReportBuy> getCreditReprotId(String id, String idd);

    //显示已购买记录
    public List<P2pCreditReportBuy> tableList(P2pCreditReportBuy p2pCreditReportBuy);
}