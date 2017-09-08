package com.dagongsoft.p2p.rating.service;

import java.util.List;


import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 评级服务信息实体Service
 *
 * @author Quincy
 * @version 2017-02-27
 */
public interface P2pRatingServiceInfoService {

    public P2pRatingServiceInfo get(String id);

    public List<P2pRatingServiceInfo> findList(P2pRatingServiceInfo p2pRatingServiceInfo);

    public Page<P2pRatingServiceInfo> findPage(Page<P2pRatingServiceInfo> page, P2pRatingServiceInfo p2pRatingServiceInfo);

    public void save(P2pRatingServiceInfo p2pRatingServiceInfo);

    public void delete(P2pRatingServiceInfo p2pRatingServiceInfo);

    /**
     * 根据评级项目ID查询评级申请信息
     *
     * @param id
     * @return
     */
    public P2pRatingServiceInfo findAppInfoById(String id);

    /**
     * 根据申请人ID查询未完成的评级项目
     *
     * @param applicantsId
     * @return
     * @author Quincy
     */
    public P2pRatingServiceInfo findInfoByApplicantsId(String applicantsId);

    /**
     * 处理评级申请业务
     *
     * @param p2pEnterpriseCertify
     * @author Quincy
     */
    public void saveRatingApplication(P2pEnterpriseCertify p2pEnterpriseCertify, User user);

    /**
     * 修改评级项目信息
     *
     * @param p2pRatingServiceInfo
     * @author Quincy
     */
    public void updateRatingServiceInfo(P2pRatingServiceInfo p2pRatingServiceInfo);

    /**
     * 定时器：在待缴费的评级项目如果24小时没有进行缴费则自动结项
     *
     * @author Quincy
     */
    public void updateOverIfHandCost();

    /**
     * 定时器：在信用评级阶段的评级项目如果完成评级，则自动进入待确认评级结果阶段
     *
     * @author Quincy
     */
    public void refreshRatingInfo();

    /**
     * 增加评级意见反馈
     *
     * @param p2pRatingResultView
     * @author Quincy
     */
    public void receiptRecord(P2pRatingResultView p2pRatingResultView);

    /**
     * 定时器：在复评阶段的评级项目如果完成复评，则自动进入待发布报告阶段
     *
     * @author Quincy
     */
    public void refreshReview();

    /**
     * 定时器：在待完成阶段的评级项目，如果进入此阶段已超过24小时则重置流程
     *
     * @author Quincy
     */
    public void updateFinishedProject();

    /**
     * 修改评级申请信息
     *
     * @param p2pEnterpriseCertify
     * @param user
     * @param rateDocumentId
     * @author Quincy
     */
    public void updateAppInfo(P2pEnterpriseCertify p2pEnterpriseCertify, User user, String rateDocumentId);

    /**
     * 根据项目ID查询轨迹是否经过复评
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public Integer findProOrbitByFid(String financingInformationId);
}