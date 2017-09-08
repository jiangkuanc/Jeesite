package com.dagongsoft.p2p.operation.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.operation.entity.P2pPlatformOperationDataStatistics;

/**
 * 平台数据统计DAO接口
 *
 * @author Sora
 * @version 2016-11-22
 */
@MyBatisDao
public interface P2pPlatformOperationDataStatisticsDao extends CrudDao<P2pPlatformOperationDataStatistics> {
    public List<P2pPlatformOperationDataStatistics> findAllList();

    /**
     * 查询运营数据分析
     *
     * @param
     * @return
     * @author Chace
     */
    public List<P2pPlatformOperationDataStatistics> findByTimes(P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics);
}