package com.dagongsoft.p2p.repayment.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentVoucherAudit;

/**
 * 还款凭证审核记录DAO接口
 *
 * @author zeus
 * @version 2017-02-16
 */
@MyBatisDao
public interface P2pRepaymentVoucherAuditDao extends CrudDao<P2pRepaymentVoucherAudit> {
    /**
     * 根据repaymentRecordId 获取历史审核记录
     *
     * @param repaymentRecordId
     * @return
     */
    public List<P2pRepaymentVoucherAudit> getByRepaymentRecordId(String repaymentRecordId);
}