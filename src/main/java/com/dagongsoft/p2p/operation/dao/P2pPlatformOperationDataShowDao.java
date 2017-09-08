package com.dagongsoft.p2p.operation.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.operation.entity.P2pPlatformOperationDataShow;

/**
 * 平台运营数据披露表DAO接口
 *
 * @author Zeus
 * @version 2016-11-25
 */
@MyBatisDao
public interface P2pPlatformOperationDataShowDao extends CrudDao<P2pPlatformOperationDataShow> {
    /**
     * 获取运营数据披露信息
     *
     * @return p2pPlatformOperationDataShow
     * @author Chace
     */
    public P2pPlatformOperationDataShow findData(P2pPlatformOperationDataShow p2pPlatformOperationDataShow);
}