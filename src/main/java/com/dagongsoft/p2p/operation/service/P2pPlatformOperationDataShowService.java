package com.dagongsoft.p2p.operation.service;

import java.util.List;


import com.dagongsoft.p2p.operation.entity.P2pPlatformOperationDataShow;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 平台运营数据披露表Service
 *
 * @author Zeus
 * @version 2016-11-25
 */
public interface P2pPlatformOperationDataShowService {

    public P2pPlatformOperationDataShow get(String id);

    public List<P2pPlatformOperationDataShow> findList(P2pPlatformOperationDataShow p2pPlatformOperationDataShow);

    public Page<P2pPlatformOperationDataShow> findPage(Page<P2pPlatformOperationDataShow> page, P2pPlatformOperationDataShow p2pPlatformOperationDataShow);

    public void save(P2pPlatformOperationDataShow p2pPlatformOperationDataShow);

    public void delete(P2pPlatformOperationDataShow p2pPlatformOperationDataShow);

    /**
     * 获取运营数据披露信息
     *
     * @return p2pPlatformOperationDataShow
     * @author Chace
     */
    public P2pPlatformOperationDataShow findData(P2pPlatformOperationDataShow p2pPlatformOperationDataShow);

}