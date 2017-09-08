package com.dagongsoft.p2p.financing.dao;

import java.util.List;

import com.dagongsoft.p2p.financing.entity.P2pAssetValuationRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 资产评估记录DAO接口
 *
 * @author Sora
 * @version 2016-11-08
 */
@MyBatisDao
public interface P2pAssetValuationRecordDao extends CrudDao<P2pAssetValuationRecord> {
    public P2pAssetValuationRecord findByFinancingId(String id);

    /**
     * 查询前台资产评估任务列表
     *
     * @return
     * @author Quincy
     */
    public List<P2pAssetValuationRecord> findAssetValuationTaskList(String userId);

    /**
     * 修改资产评估信息
     *
     * @param p2pAssetValuationRecord
     * @author Quincy
     */
    public void updateAssetValuationInfo(P2pAssetValuationRecord p2pAssetValuationRecord);

    /**
     * 根据fiId 获取资产评估信息
     *
     * @param fiId
     */
    public P2pAssetValuationRecord getByFiId(String fiId);

    /**
     * 保存资产评估审核信息
     *
     * @param p2pAssetValuationRecord
     */
    public void saveAudit(P2pAssetValuationRecord p2pAssetValuationRecord);
}