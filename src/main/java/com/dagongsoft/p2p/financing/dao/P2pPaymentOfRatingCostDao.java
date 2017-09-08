/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.dao;

import java.util.List;
import java.util.Map;

import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 支付管理DAO接口
 *
 * @author qichao
 * @version 2016-07-27
 */
@MyBatisDao
public interface P2pPaymentOfRatingCostDao extends CrudDao<P2pPaymentOfRatingCost> {
    public P2pPaymentOfRatingCost getByFiId(String fiId);

    /**
     * 根据债项ID查询评级费订单信息
     *
     * @return
     * @author Quincy
     */
    public P2pPaymentOfRatingCost findOrderInfoByFid(String financingInformationId, String userId);

    /**
     * 根据债项ID修改评级费订单信息
     *
     * @param p2pPaymentOfRatingCost
     */
    public void updateOrderInfoByFid(P2pPaymentOfRatingCost p2pPaymentOfRatingCost);

    /**
     * 企业订单查询
     *
     * @author Chace
     */
    public List<P2pPaymentOfRatingCost> findBusinessOrderList(P2pPaymentOfRatingCost p2pPaymentOfRatingCost);

    /**
     * 订单详情查询
     */
    public P2pPaymentOfRatingCost findBusinessOrderDetail(String id);

    /**
     * 清算文件管理列表
     *
     * @author Chace
     */
    public List<P2pPaymentOfRatingCost> settlementDocumentList(P2pPaymentOfRatingCost p2pPaymentOfRatingCost);

    /**
     * 根据fiId查询评级费支付详情
     *
     * @param fiId
     * @return
     */
    public P2pPaymentOfRatingCost getRatingPaydetails(String fiId);

    /**
     * 插入一条数据
     */
    public int insert(P2pPaymentOfRatingCost p2pPaymentOfRatingCost);

    /**
     * 根据债项id修改订单支付状态
     *
     * @author Chace
     */
    public void updateStatusByFinancingId(P2pPaymentOfRatingCost p2pPaymentOfRatingCost);

    /**
     * 根据订单编号修改订单支付状态
     *
     * @param p2pPaymentOfRatingCost
     */
    public void updateStatusByorderNo(P2pPaymentOfRatingCost p2pPaymentOfRatingCost);

    /**
     * 根据订单编号查看订单信息
     *
     * @param orderNo
     * @return
     */
    public P2pPaymentOfRatingCost getInfoByOrderNo(String orderNo);

    /**
     * 根据收费类型，债项编号，支付状态查询信息
     *
     * @param p2pPaymentOfRatingCost
     * @return
     */
    public P2pPaymentOfRatingCost findIsPaying(P2pPaymentOfRatingCost p2pPaymentOfRatingCost);

    /**
     * 获取203，250，600的非删除状态(支付节点)，未支付债项的评级费的企业list
     *
     * @return
     * @author Frank Zhou
     */
    public List<Map<String, Object>> getPaymentPointProjectList();

    /**
     * 更改标识位，删除标识
     *
     * @param orderNo
     * @return
     */
    public Integer deleteFlag(String orderNo);

    /**
     * 订单列表，债项，过期还可以支付。
     *
     * @param financingInformationId
     * @param userId
     * @return
     */
    public List<P2pPaymentOfRatingCost> findOrderInfoListByFid(
            String financingInformationId, String userId);

}