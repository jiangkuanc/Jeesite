/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.investment.dao;

import java.util.List;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentEarnRecord;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 投资信息DAO接口
 *
 * @author qichao
 * @version 2016-07-06
 */
@MyBatisDao
public interface P2pInvestmentInformationDao extends CrudDao<P2pInvestmentInformation> {

    /**
     * 根据投资信息ID查询投资总收益
     *
     * @return
     */
    public Integer findAllInvestmentIncome(String id);

    /**
     * 投资收益记录
     *
     * @return
     */
    public List<P2pInvestmentEarnRecord> investmentEarnRecord(P2pInvestmentEarnRecord p2pInvestmentEarnRecord);


    public P2pInvestmentInformation addP2pInvestmentRecord(P2pInvestmentInformation p2pInvestmentInformation);

    /**
     * 根据项目查询投资信息列表
     *
     * @param p2pFinancingInformation
     * @return
     */
    public List<P2pInvestmentInformation> findP2pInvestmentInformationListByFid(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据融资信息id查询
     *
     * @return
     */
    public P2pInvestmentInformation getByFiId(String fiId);

    /**
     * 根据userInformation的id查询投资人投资的所有项目id
     */
    public List<String> getInvestmentAllFinancingId(String userInformationId);

    //查询投资信息表中id的最大值
    public Integer findMaxId();

    /**
     * 根据债项ID查询投资记录
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<P2pInvestmentInformation> findInvestmentRecordByFid(P2pInvestmentInformation p2pInvestmentInformation);

    /**
     * 根据债项ID和用户id查询投资记录
     *
     * @param p2pInvestmentInformation
     * @return
     * @author Chace
     */
    public P2pInvestmentInformation findInvestmentByids(P2pInvestmentInformation p2pInvestmentInformation);

    /**
     * 根据债项ID和用户id修改个人投资记录
     *
     * @param p2pInvestmentInformation
     * @return
     * @author Chace
     */
    public void updateP2pInvestmentInformation(P2pInvestmentInformation p2pInvestmentInformation);

    /**
     * 根据债项ID查询投资总人数
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public Integer findAllRecordCountByFid(String financingInformationId);

    /**
     * 认购记录
     *
     * @param p2pInvestmentInformation
     * @return
     * @author Zeus
     */
    public List<P2pInvestmentInformation> getSubscribeRecordList(P2pInvestmentInformation p2pInvestmentInformation);

    /**
     * 投资人累计投资总数
     *
     * @param userId
     * @return
     * @author Zeus
     */
    public Integer getUserAccumulativeAmount(String userId);

    /**
     * 根据投资人ID查询投资总览列表
     *
     * @param p2pInvestmentInformation
     * @return
     * @author Quincy
     */
    public List<P2pInvestmentInformation> investmentGeneral(P2pInvestmentInformation p2pInvestmentInformation);

    /**
     * 根据投资人ID查询投资总额
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public Integer findInvestmentSumByUid(String userId);

    /**
     * 根据投资人ID和债项阶段查询投资债项总个数
     *
     * @param userId
     * @param currentStage
     * @return
     * @author Quincy
     */
    public Integer findInvestmentCountByUid(P2pInvestmentInformation p2pInvestmentInformation);

    /**
     * 根据用户id查询投资记录
     *
     * @param p2pInvestmentInformation
     * @return list
     * @author Chace
     */
    public List<P2pInvestmentInformation> findInvestmentByUserId(P2pInvestmentInformation p2pInvestmentInformation);

    /**
     * 保存投资信息
     *
     * @param p2pInvestmentInformation
     * @return
     * @author Chace
     */
    public void saveP2pInvestmentInformation(P2pInvestmentInformation p2pInvestmentInformation);

    /**
     * 投資記錄信息
     *
     * @param p2pInvestmentInformation
     * @return
     * @author lee ware
     */
    public List<P2pInvestmentInformation> getP2pInvestmentInformationList(P2pInvestmentInformation p2p);
}




