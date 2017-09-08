package com.dagongsoft.p2p.user.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.user.entity.P2pAssetValuation;

/**
 * 资产评估表DAO接口
 *
 * @author Sora
 * @version 2016-11-15
 */
@MyBatisDao
public interface P2pAssetValuationDao extends CrudDao<P2pAssetValuation> {

    /**
     * 加载资产评估公司列表
     *
     * @return
     * @author Quincy
     */
    public List<P2pAssetValuation> loadAllList();

}