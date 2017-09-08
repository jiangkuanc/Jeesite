package com.dagongsoft.p2p.rating.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;

/**
 * 评级服务信息实体DAO接口
 *
 * @author Quincy
 * @version 2017-02-27
 */
@MyBatisDao
public interface P2pRatingServiceInfoDao extends CrudDao<P2pRatingServiceInfo> {

    /**
     * 根据ID修改对象信息
     *
     * @param p2pRatingServiceInfo
     * @author Quincy
     */
    public void updateInfoById(P2pRatingServiceInfo p2pRatingServiceInfo);

    /**
     * 根据申请人ID查询未完成的评级项目
     *
     * @param applicantsId
     * @return
     * @author Quincy
     */
    public P2pRatingServiceInfo findInfoByApplicantsId(String applicantsId);

    /**
     * 查询处于待缴费状态的评级项目
     *
     * @return
     * @author Quincy
     */
    public List<P2pRatingServiceInfo> findDateByNoHandCost();

    /**
     * 查询已完成评级并且仍处于信用评级阶段的评级项目
     *
     * @return
     * @author Quincy
     */
    public List<P2pRatingServiceInfo> refreshRatingInfo();

    /**
     * 评级企业列表
     *
     * @return
     * @author Zeus
     */
    public List<P2pRatingServiceInfo> getRatingEnterpriseList(P2pRatingServiceInfo p2pRatingServiceInfo);

    /**
     * 评级材料审核列表
     *
     * @return
     * @author Zeus
     */
    public List<P2pRatingServiceInfo> getRatingDocumnetAuditList(P2pRatingServiceInfo p2pRatingServiceInfo);

    /**
     * 查询处于待完成状态的评级项目
     *
     * @return
     */
    public List<P2pRatingServiceInfo> findDateByFinished();

    /**
     * 评级初稿查询列表
     *
     * @return
     * @author Zeus
     */
    public List<P2pRatingServiceInfo> getRatingDraftSearchList(P2pRatingServiceInfo p2pRatingServiceInfo);


    /**
     * 评级报告发布列表
     *
     * @return
     * @author Zeus
     */
    public List<P2pRatingServiceInfo> getRatingReportPublishList(P2pRatingServiceInfo p2pRatingServiceInfo);

    /**
     * 评级项目详情
     *
     * @param id
     * @return
     */
    public P2pRatingServiceInfo getRatingDetails(String id);

    /**
     * 获取前缀为prefix的最大的ID
     */
    public String getMaxId(@Param("prefix") String prefix);
}