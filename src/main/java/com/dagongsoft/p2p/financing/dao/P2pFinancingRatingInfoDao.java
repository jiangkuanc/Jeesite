/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.dao;

import java.util.List;

import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 融资评级信息DAO接口
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@MyBatisDao
public interface P2pFinancingRatingInfoDao extends CrudDao<P2pFinancingRatingInfo> {
    public P2pFinancingRatingInfo getByFiId(String financingInformationId);


    public int updateCreitRes(P2pFinancingRatingInfo p2pFinancingRatingInfo);

    /**
     * 根据债项ID查询评级信息
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public P2pFinancingRatingInfo findRatingInfoByFid(String financingInformationId);

    public P2pFinancingRatingInfo findById(String id);

    /**
     * 根据债项ID查询评级报告地址
     *
     * @param financingInformationId
     * @return
     */
    public P2pFinancingRatingInfo findRatingReportByFid(String financingInformationId);

    /**
     * 修改批复利率
     *
     * @param p2pFinancingRatingInfo
     * @author Quincy
     */
    public void updateRecommendedRate(P2pFinancingRatingInfo p2pFinancingRatingInfo);

    /**
     * 查询融资项目初评报告发布时间
     *
     * @return
     * @author Quincy
     */
    public List<P2pFinancingRatingInfo> findReportPublishTime1();

    /**
     * 修改产品类型
     *
     * @author Chace
     */
    public void updateMarkType(P2pFinancingRatingInfo p2pFinancingRatingInfo);

    /**
     * 根据债项ID修改增信信息（是否增信、增信额度）
     *
     * @author Quincy
     */
    public void updateRepInfo(P2pFinancingRatingInfo p2pFinancingRatingInfo);

    /**
     * 根据评级项目ID查询评级信息
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public P2pFinancingRatingInfo findRatingInfoByRid(String financingInformationId);

    /**
     * 查询评级项目初评报告发布时间
     *
     * @return
     * @author Quincy
     */
    public List<P2pFinancingRatingInfo> findReportPublishTime2();

    /**
     * 查询借贷评级列表
     *
     * @author Chace
     */
    public List<P2pFinancingRatingInfo> getFinancingRatingList(P2pFinancingRatingInfo p2pFinancingRatingInfo);

    /**
     * 查询主体评级列表
     *
     * @author Chace
     */
    public List<P2pFinancingRatingInfo> getMainRatingList(P2pFinancingRatingInfo p2pFinancingRatingInfo);

    /**
     * 根据id查询报告名及地址
     */
    public P2pFinancingRatingInfo getAddressANDName(String id);

    /**
     * 评级报告购买页详情
     *
     * @author Chace
     */
    public P2pFinancingRatingInfo ratingReportDetails(P2pFinancingRatingInfo p2pFinancingRatingInfo);

    /**
     * 查询五条债项评级信息
     *
     * @author Chace
     */
    public List<P2pFinancingRatingInfo> findFiveFinancing();

    /**
     * 查询五条评级信息
     *
     * @author Chace
     */
    public List<P2pFinancingRatingInfo> findFiveRating();

    /**
     * 根据评级ID查询评级报告地址
     *
     * @param financingInformationId
     * @return
     */
    public P2pFinancingRatingInfo findRatingReportByRid(String RatingServiceInfoId);

    /**
     * 信用評級結果
     *
     * @param P2pFinancingRatingInfo
     * @return
     */
    public List<P2pFinancingRatingInfo> getP2pFinancingRatingInfoList(
            P2pFinancingRatingInfo p2pFinancingRatingInfo);
}