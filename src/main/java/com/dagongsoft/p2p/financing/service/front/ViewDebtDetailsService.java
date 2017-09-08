package com.dagongsoft.p2p.financing.service.front;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.document.dao.P2pRateDocumentUploadDao;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.dao.P2pDebtOverdueRecordDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingRatingInfoDao;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pDebtOverdueRecord;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.user.dao.P2pEnterpriseCertifyDao;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.RatingLevelUtils;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 前台评级信息查看Service
 *
 * @author Quincy
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class ViewDebtDetailsService {

    @Autowired
    private P2pFinancingRatingInfoDao p2pFinancingRatingInfoDao;

    @Autowired
    private P2pFinancingInformationDao p2pFinancingInformationDao;

    @Autowired
    private P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao;

    @Autowired
    private P2pEnterpriseCertifyDao p2pEnterpriseCertifyDao;

    @Autowired
    private P2pRateDocumentUploadDao p2pRateDocumentUploadDao;

    @Autowired
    private P2pDebtOverdueRecordDao p2pDebtOverdueRecordDao;

    /**
     * 根据债项ID查询评级信息
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public P2pFinancingRatingInfo findRatingInfoByFid(String financingInformationId) {
        return p2pFinancingRatingInfoDao.findRatingInfoByFid(financingInformationId);
    }

    /**
     * 根据债项ID查询债项详情
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public P2pFinancingInformation findDebtDetailsByFid(String financingInformationId) {
        return p2pFinancingInformationDao.findDebtDetailsByFid(financingInformationId);
    }

    /**
     * 根据债项ID将债项状态修改为流标
     *
     * @param financingInformationId
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void modifyStageIsExpired(String financingInformationId) {
        P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation(financingInformationId);
        p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.PROJECT_KNOT));
        p2pFinancingInformationDao.updateCurrentStageByFid(p2pFinancingInformation);
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
        p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());// 记录当前项目编号
        p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());// 记录当前融资项目阶段
        p2pBeforeMatchDebtState.setStateTime(new Date());// 记录时间
        p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
    }

    /**
     * 加载募集中债项信息
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public P2pFinancingInformation findMiddleMatchDebtInfo(String userId) {
        return p2pFinancingInformationDao.findMiddleMatchDebtInfo(userId);
    }

    /**
     * 加载还款中债项信息
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public P2pFinancingInformation findAfterMatchDebtInfo(String userId) {
        return p2pFinancingInformationDao.findAfterMatchDebtInfo(userId);
    }

    /**
     * 前台加载已完成或已流标债项列表	stage	0:已流标	1:已完成
     *
     * @param userId
     * @param beginTime
     * @param endTime
     * @param stage
     * @return
     * @author Quincy
     */
    public List<P2pFinancingInformation> findHasEndedDebts(String userId, Date beginTime, Date endTime, Integer stage) {
        P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
        p2pFinancingInformation.setApplicantsId(userId);
        p2pFinancingInformation.setBeginTime(beginTime);
        p2pFinancingInformation.setEndTime(endTime);
        if (stage == 0) {
            return p2pFinancingInformationDao.findExpiredDebtList(p2pFinancingInformation);
        }
        if (stage == 1) {
            return p2pFinancingInformationDao.findFinishedDebtList(p2pFinancingInformation);
        }
        return null;
    }

    /**
     * 前台加载撮合中、撮合后以及以结项的债项列表
     *
     * @param userId
     * @param beginTime
     * @param endTime
     * @param currentStage
     * @return
     * @author Quincy
     */
    public List<P2pFinancingInformation> loadApplySuccessDebts(String userId, Date beginTime, Date endTime, String currentStage) {
        P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
        p2pFinancingInformation.setApplicantsId(userId);
        p2pFinancingInformation.setCurrentStage(currentStage);
        p2pFinancingInformation.setBeginTime(beginTime);
        p2pFinancingInformation.setEndTime(endTime);
        return p2pFinancingInformationDao.loadApplySuccessDebts(p2pFinancingInformation);
    }

    /**
     * 将评级信息与债项信息表进行同步
     *
     * @author Quincy
     */
    @Scheduled(cron = "0 0/1 * * * ? ")
    @Transactional(readOnly = false)
    public void refreshRatingInfo() {
        //查询信用评级阶段并且有评级信息的债项
        List<P2pFinancingInformation> list = p2pFinancingInformationDao.refreshRatingInfo1();
        P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
        //循环债项信息进行同步操作
        if (list != null) {
            for (P2pFinancingInformation p2p : list) {
                //判断评级信息是否已经刷新
                if (p2p.getP2pFinancingRatingInfo() != null) {
                    p2pFinancingInformation.setId(p2p.getId());
                    p2pFinancingInformation.setFinancingAmount(Integer.parseInt(p2p.getP2pFinancingRatingInfo().getRecommendedAmount()));//设置批复金额
                    p2pFinancingInformation.setRecommendedRate(Double.parseDouble(p2p.getP2pFinancingRatingInfo().getRecommendedRate()));//设置批复利率
                    p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.RATING_RESULTS_TO_BE_CONFIRMED));//设置债项阶段,确认评级结果
                    p2pFinancingInformationDao.refreshRatingInfo2(p2pFinancingInformation);//完成更新
                    //修改增信信息（是否增信、增信额度）
                    P2pFinancingRatingInfo p2pFinancingRatingInfo = new P2pFinancingRatingInfo();
                    p2pFinancingRatingInfo.setFinancingInformationId(p2p.getId());
                    p2pFinancingRatingInfo.setWetherRep(RatingLevelUtils.isRepByLevel(p2p.getP2pFinancingRatingInfo().getRatingLevel()));
                    p2pFinancingRatingInfo.setRepCount("0");
                    if (p2pFinancingRatingInfo.getWetherRep().equals("1")) {
                        if (p2p.getApplicationAmount() < Integer.valueOf(p2p.getP2pFinancingRatingInfo().getRecommendedAmount())) {
                            p2pFinancingRatingInfo.setRepCount(Integer.toString(p2p.getApplicationAmount()));
                        } else {
                            p2pFinancingRatingInfo.setRepCount(p2p.getP2pFinancingRatingInfo().getRecommendedAmount());
                        }
                    }
                    p2pFinancingRatingInfoDao.updateRepInfo(p2pFinancingRatingInfo);
                    //添加债项进展信息
                    P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
                    p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());
                    p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());
                    p2pBeforeMatchDebtState.setStateTime(new Date());
                    p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
                    //站內信
                    Map<String, String> map = MsgLetterTemplate.getPjjgqrtz(p2p.getFinacingName());
                    MsgUtils.sendLetter(p2p.getApplicantsId(), map);
                    //短信
                    String content = MsgSmsTemplate.getPjjgqrtz();
                    MsgUtils.sendSMS(p2p.getApplicantsId(), content);
                }
            }
        }
    }

    /**
     * 查询满标时间
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public Date findFullBidTimeByFid(String financingInformationId) {
        return p2pFinancingInformationDao.findFullBidTimeByFid(financingInformationId);
    }

    /**
     * 根据融资信息ID查询融资申请信息
     *
     * @param id
     * @return
     */
    public P2pFinancingInformation findFinancingAppInfo(String id) {
        return p2pFinancingInformationDao.findFinancingAppInfo(id);
    }

    @Transactional(readOnly = false)
    public void updateAppInfo(P2pFinancingInformation p2pFinancingInformation, P2pEnterpriseCertify p2pEnterpriseCertify,
                              User user, String rateDocumentId) {
        p2pFinancingInformation.setApplicantsId(user.getId());
        p2pFinancingInformation.setCommitTime(new Date());
        p2pFinancingInformationDao.updateP2pFinancingInformation(p2pFinancingInformation);
        p2pEnterpriseCertify.setUser(user);
        p2pEnterpriseCertifyDao.updateEnterpriseOtherInfo(p2pEnterpriseCertify);
        P2pRateDocumentUpload p2pRateDocumentUpload = new P2pRateDocumentUpload(rateDocumentId);
        p2pRateDocumentUpload.setIsReject(null);
        p2pRateDocumentUpload.setRejectReason(null);
        p2pRateDocumentUploadDao.updateIsReject(p2pRateDocumentUpload);
    }

    /**
     * 根据评级项目ID查询评级信息
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public P2pFinancingRatingInfo findRatingInfoByRid(String ratingServiceInfoId) {
        return p2pFinancingRatingInfoDao.findRatingInfoByRid(ratingServiceInfoId);
    }

    public String findOverdueDaysByFid(String financingInformationId) {
        P2pDebtOverdueRecord p2pDebtOverdueRecord = p2pDebtOverdueRecordDao.getByFid(financingInformationId);
        if (p2pDebtOverdueRecord != null && p2pDebtOverdueRecord.getTotalOverdueDays() != null) {
            return Integer.toString(p2pDebtOverdueRecord.getTotalOverdueDays());
        }
        return "0";
    }
}
