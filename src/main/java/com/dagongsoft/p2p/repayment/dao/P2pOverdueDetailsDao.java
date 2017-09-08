package com.dagongsoft.p2p.repayment.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.repayment.entity.P2pOverdueDetails;

/**
 * 逾期明细表DAO接口
 *
 * @author Zeus
 * @version 2016-11-16
 */
@MyBatisDao
public interface P2pOverdueDetailsDao extends CrudDao<P2pOverdueDetails> {
    //删除逾期明细表中该期逾期日期超过实际还款日期的记录
    public void deleteLessRealRepaymentDate(@Param("p2pRepaymentPlanId") String p2pRepaymentPlanId, @Param("realRepaymentDate") Date realRepaymentDate);
}