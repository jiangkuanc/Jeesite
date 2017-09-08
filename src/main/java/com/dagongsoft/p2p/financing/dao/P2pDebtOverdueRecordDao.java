package com.dagongsoft.p2p.financing.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.financing.entity.P2pDebtOverdueRecord;

/**
 * 债项逾期记录表DAO接口
 *
 * @author Zeus
 * @version 2016-11-11
 */
@MyBatisDao
public interface P2pDebtOverdueRecordDao extends CrudDao<P2pDebtOverdueRecord> {
    //债项逾期记录表
    public List<P2pDebtOverdueRecord> getDebtOverdueList(P2pDebtOverdueRecord p2pDebtOverdueRecord);

    //根据债项id计算当前债项累计逾期次数、累计逾期金额、累计逾期天数、已还逾期金额
    public P2pDebtOverdueRecord calculateDebt(String financingInformationId);

    //根据债项id查询当前债项逾期记录
    public P2pDebtOverdueRecord getByFid(String financingInformationId);

    //项目逾期数量
    public Integer numberProjectsLimit();
}