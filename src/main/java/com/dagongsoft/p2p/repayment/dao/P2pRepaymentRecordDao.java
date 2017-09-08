package com.dagongsoft.p2p.repayment.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentRecord;

/**
 * 还款记录表DAO接口
 *
 * @author Quincy
 * @version 2016-11-03
 */
@MyBatisDao
public interface P2pRepaymentRecordDao extends CrudDao<P2pRepaymentRecord> {
    /**
     * 根据id查找
     *
     * @param id
     * @return
     */
    public P2pRepaymentRecord getRepaymentRecordById(String id);

    /**
     * 根据ID修改还款信息（还款凭证、还款时间、还款审核状态）
     *
     * @param p2pRepaymentRecord
     */
    public void updateRepayInfo(P2pRepaymentRecord p2pRepaymentRecord);

    /**
     * 根据ID修改还款凭证审核信息
     *
     * @param p2pRepaymentRecord
     */
    public void updateRepaymentVoucherAudit(P2pRepaymentRecord p2pRepaymentRecord);

    /**
     * 根据repaymentPlanId修改实际还款罚金
     *
     * @param repaymentPlanId
     * @param realRepaymentFine
     */
    public void updateFineByRepaymentPlanId(@Param("repaymentPlanId") String repaymentPlanId, @Param("realRepaymentFine") Double realRepaymentFine);

    /**
     * 根据债项id查询还款凭证
     *
     * @author Chace
     */
    public List<P2pRepaymentRecord> getrepaymentVoucher(String financingInformationId);

}