/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 撮合前债项状态进展表DAO接口
 *
 * @author zhengshuo
 * @version 2016-07-11
 */
@MyBatisDao
public interface P2pBeforeMatchDebtStateDao extends CrudDao<P2pBeforeMatchDebtState> {
    /**
     * 根据融资信息表id 查询撮合前债项状态进展情况表
     *
     * @return
     */
    public List<P2pBeforeMatchDebtState> findListByFid(P2pBeforeMatchDebtState p2pBeforeMatchDebtState);

    /**
     * 添加撮合前债项状态进展信息
     *
     * @param p2pBeforeMatchDebtState
     */
    public void saveP2pBeforeMatchDebtState(P2pBeforeMatchDebtState p2pBeforeMatchDebtState);

    /**
     * 查询发布信息记录
     *
     * @param p2pBeforeMatchDebtState
     */
    public List<P2pBeforeMatchDebtState> getDebtReleaseRecord(P2pBeforeMatchDebtState p2pBeforeMatchDebtState);

    /**
     * 根据融资信息id和融资状态查询单条记录
     *
     * @param fiId
     * @param state
     */
    public P2pBeforeMatchDebtState getRecordByFiIdAndState(@Param("fiId") String fiId, @Param("stage") String stage);

    public List<P2pBeforeMatchDebtState> findById(@Param("finacingInformationId") String finacingInformationId, @Param("progressStage") String progressStage);

    public List<P2pBeforeMatchDebtState> findById2(@Param("finacingInformationId") String finacingInformationId);

    public List<P2pBeforeMatchDebtState> findById3(@Param("finacingInformationId") String finacingInformationId);

    public P2pBeforeMatchDebtState findByIdOne(@Param("finacingInformationId") String finacingInformationId, @Param("progressStage") String progressStage);

    /**
     * 根据债项ID查询轨迹
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<Integer> findDebtOrbitByFid(String financingInformationId);

    /**
     * 根据债项ID和债项状态查询轨迹信息
     *
     * @param
     * @return
     * @author Chace
     */
    public P2pBeforeMatchDebtState findByIds(P2pBeforeMatchDebtState p2pBeforeMatchDebtState);

    /**
     * 根据债项id查询是否经过复评
     */
    public List<P2pBeforeMatchDebtState> isOrNoFuPing(String financingInformationId);
}