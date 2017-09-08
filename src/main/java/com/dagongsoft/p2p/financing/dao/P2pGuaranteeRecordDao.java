package com.dagongsoft.p2p.financing.dao;

import java.util.List;

import com.dagongsoft.p2p.financing.entity.P2pGuaranteeRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 担保记录表DAO接口
 *
 * @author Sora
 * @version 2016-11-08
 */
@MyBatisDao
public interface P2pGuaranteeRecordDao extends CrudDao<P2pGuaranteeRecord> {
    public P2pGuaranteeRecord findByFinancingId(String id);

    /**
     * 查询前台担保任务列表
     *
     * @return
     * @author Quincy
     */
    public List<P2pGuaranteeRecord> findGuaranteeTaskList(String userId);

    /**
     * 修改担保信息
     *
     * @param p2pAssetValuationRecord
     * @author Quincy
     */
    public void updateGuaranteeInfo(P2pGuaranteeRecord p2pGuaranteeRecord);

    /**
     * 根据fiId 获取担保信息
     *
     * @param fiId
     */
    public P2pGuaranteeRecord getByFiId(String fiId);

    /**
     * 保存担保审核信息
     *
     * @param p2pAssetValuationRecord
     */
    public void saveAudit(P2pGuaranteeRecord p2pGuaranteeRecord);
}