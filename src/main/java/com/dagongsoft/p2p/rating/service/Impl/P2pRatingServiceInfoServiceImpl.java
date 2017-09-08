package com.dagongsoft.p2p.rating.service.Impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.document.dao.P2pRateDocumentUploadDao;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.feedback.dao.P2pRatingResultViewDao;
import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.dao.P2pPaymentOfRatingCostDao;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.rating.dao.P2pRatingServiceInfoDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.rating.service.P2pRatingServiceInfoService;
import com.dagongsoft.p2p.user.dao.P2pEnterpriseCertifyDao;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.utils.GenerateUserIdutils;
import com.dagongsoft.p2p.utils.RatingState;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 评级服务信息实体ServiceImpl
 *
 * @author Quincy
 * @version 2017-02-27
 */
@Transactional(readOnly = true)
@Service("p2pRatingServiceInfoService")
@Lazy(false)
public class P2pRatingServiceInfoServiceImpl extends CrudService<P2pRatingServiceInfoDao, P2pRatingServiceInfo> implements P2pRatingServiceInfoService {

    @Resource
    private P2pRatingServiceInfoDao p2pRatingServiceInfoDao;
    @Resource
    private P2pEnterpriseCertifyDao p2pEnterpriseCertifyDao;
    @Resource
    private P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao;
    @Resource
    private P2pRatingResultViewDao p2pRatingResultViewDao;
    @Resource
    private P2pRateDocumentUploadDao p2pRateDocumentUploadDao;
    @Resource
    private P2pPaymentOfRatingCostDao p2pPaymentOfRatingCostDao;

    public P2pRatingServiceInfo get(String id) {
        return super.get(id);
    }

    public List<P2pRatingServiceInfo> findList(P2pRatingServiceInfo p2pRatingServiceInfo) {
        return super.findList(p2pRatingServiceInfo);
    }

    public Page<P2pRatingServiceInfo> findPage(Page<P2pRatingServiceInfo> page, P2pRatingServiceInfo p2pRatingServiceInfo) {
        return super.findPage(page, p2pRatingServiceInfo);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRatingServiceInfo p2pRatingServiceInfo) {
        super.save(p2pRatingServiceInfo);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRatingServiceInfo p2pRatingServiceInfo) {
        super.delete(p2pRatingServiceInfo);
    }

    @Override
    public P2pRatingServiceInfo findInfoByApplicantsId(String applicantsId) {
        P2pRatingServiceInfo p2pRatingServiceInfo = p2pRatingServiceInfoDao.findInfoByApplicantsId(applicantsId);
        if (p2pRatingServiceInfo == null || p2pRatingServiceInfo.getCurrentStage() == null) {
            p2pRatingServiceInfo = new P2pRatingServiceInfo();
            p2pRatingServiceInfo.setCurrentStage("0");
        }
        return p2pRatingServiceInfo;
    }

    @Override
    @Transactional(readOnly = false)
    public void saveRatingApplication(P2pEnterpriseCertify p2pEnterpriseCertify, User user) {
        //增加评级申请记录
        P2pRatingServiceInfo p2pRatingServiceInfo = new P2pRatingServiceInfo(GenerateUserIdutils.createFinanInformationId("7"));
        p2pRatingServiceInfo.setRatingName(p2pEnterpriseCertify.getEnterpriseName() + p2pRatingServiceInfo.getId());
        p2pRatingServiceInfo.setApplicantsId(user.getId());
        p2pRatingServiceInfo.setCurrentStage(Integer.toString(RatingState.FINISH_RATING_APPLICATION));
        p2pRatingServiceInfo.setApplyTime(new Date());
        p2pRatingServiceInfo.setIsSupply(0);
        p2pRatingServiceInfo.setIsHandRateCost(0);
        p2pRatingServiceInfoDao.insert(p2pRatingServiceInfo);
        //评级申请作为一项材料进行材料审核
        P2pRateDocumentUpload p2pRateDocumentUpload = new P2pRateDocumentUpload(IdGen.uuid());
        p2pRateDocumentUpload.setFinancingInformationId(p2pRatingServiceInfo.getId());
        p2pRateDocumentUpload.setRateDocumentTempId("26");
        p2pRateDocumentUpload.setUploadTime(new Date());
        p2pRateDocumentUploadDao.insertUploadRecord(p2pRateDocumentUpload);
        //更新企业评级信息
        p2pEnterpriseCertify.setUser(user);
        p2pEnterpriseCertifyDao.updateEnterpriseOtherInfo(p2pEnterpriseCertify);
    }

    @Override
    @Transactional(readOnly = false)
    public void updateRatingServiceInfo(P2pRatingServiceInfo p2pRatingServiceInfo) {
        p2pRatingServiceInfoDao.updateInfoById(p2pRatingServiceInfo);
    }

    @Override
    @Transactional(readOnly = false)
    @Scheduled(cron = "0 0 11,23 * * ?")
    public void updateOverIfHandCost() {
        List<P2pRatingServiceInfo> list = p2pRatingServiceInfoDao.findDateByNoHandCost();
        if (list != null) {
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
            for (P2pRatingServiceInfo p2p : list) {
                Date beginDate = p2p.getP2pBeforeMatchDebtState().getStateTime();
                Date endDate = new Date();
                //如果24小时内没有支付评级费
                if (endDate.getTime() - beginDate.getTime() > 24 * 60 * 60 * 1000) {
                    //更新评级项目状态到结项
                    p2p.setCurrentStage(Integer.toString(RatingState.CANCEL_PROJECT));
                    p2pRatingServiceInfoDao.updateInfoById(p2p);
                    //更新订单状态
                    P2pPaymentOfRatingCost p2pPaymentOfRatingCost = new P2pPaymentOfRatingCost();
                    p2pPaymentOfRatingCost.setFinancingInformationId(p2p.getId());
                    p2pPaymentOfRatingCostDao.updateStatusByFinancingId(p2pPaymentOfRatingCost);
                    //添加债项进展信息
                    p2pBeforeMatchDebtState.setId(IdGen.uuid());
                    p2pBeforeMatchDebtState.setFinacingInformationId(p2p.getId());
                    p2pBeforeMatchDebtState.setProgressStage(p2p.getCurrentStage());
                    p2pBeforeMatchDebtState.setStateTime(new Date());
                    p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
                }
            }
        }
    }

    @Override
    @Transactional(readOnly = false)
    @Scheduled(cron = "0 0/1 * * * ?")
    public void refreshRatingInfo() {
        List<P2pRatingServiceInfo> list = p2pRatingServiceInfoDao.refreshRatingInfo();
        if (list != null) {
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
            for (P2pRatingServiceInfo p2p : list) {
                if (p2p.getP2pFinancingRatingInfo() != null) {
                    //更新评级项目状态到待确认评级结果
                    p2p.setCurrentStage(Integer.toString(RatingState.NEED_CONFIRM_RESULT));
                    p2pRatingServiceInfoDao.updateInfoById(p2p);
                    //添加债项进展信息
                    p2pBeforeMatchDebtState.setId(IdGen.uuid());
                    p2pBeforeMatchDebtState.setFinacingInformationId(p2p.getId());
                    p2pBeforeMatchDebtState.setProgressStage(p2p.getCurrentStage());
                    p2pBeforeMatchDebtState.setStateTime(new Date());
                    p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
                }
            }
        }
    }

    @Transactional(readOnly = false)
    @Override
    public void receiptRecord(P2pRatingResultView p2pRatingResultView) {
        P2pRatingServiceInfo p2pRatingServiceInfo = null;
        //设置意见反馈时间
        p2pRatingResultView.setViewTime(new Date());
        p2pRatingResultView.setAuditState("0");
        if ("1".equals(p2pRatingResultView.getViewType())) {
            //对内容有异议(*)
            p2pRatingResultView.setId(IdGen.uuid());
            p2pRatingResultViewDao.insertReceiptRecord(p2pRatingResultView);//添加意见反馈记录
            p2pRatingServiceInfo = new P2pRatingServiceInfo(p2pRatingResultView.getFinancingInformationId());
            p2pRatingServiceInfo.setCurrentStage(Integer.toString(RatingState.REVIEW_RATING));
            p2pRatingServiceInfoDao.updateInfoById(p2pRatingServiceInfo);//修改债项状态为内容修改中
        }
        if ("2".equals(p2pRatingResultView.getViewType())) {
            //对主体级别有异议
            p2pRatingResultViewDao.updateReceiptRecord(p2pRatingResultView);//修改审核状态
            p2pRatingServiceInfo = new P2pRatingServiceInfo(p2pRatingResultView.getFinancingInformationId());
            p2pRatingServiceInfo.setCurrentStage(Integer.toString(RatingState.REVIEW_RATING));
            p2pRatingServiceInfoDao.updateInfoById(p2pRatingServiceInfo);//修改债项状态为复评
        }
        if ("3".equals(p2pRatingResultView.getViewType())) {
            //无异议
            p2pRatingResultView.setId(IdGen.uuid());
            p2pRatingResultViewDao.insertReceiptRecord(p2pRatingResultView);//添加意见反馈记录
            p2pRatingServiceInfo = new P2pRatingServiceInfo(p2pRatingResultView.getFinancingInformationId());
            p2pRatingServiceInfo.setCurrentStage(Integer.toString(RatingState.NEED_PUBLISH_REPORT));
            p2pRatingServiceInfoDao.updateInfoById(p2pRatingServiceInfo);//修改债项状态
        }
        //添加债项进展信息
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
        p2pBeforeMatchDebtState.setFinacingInformationId(p2pRatingServiceInfo.getId());
        p2pBeforeMatchDebtState.setProgressStage(p2pRatingServiceInfo.getCurrentStage());
        p2pBeforeMatchDebtState.setStateTime(new Date());
        p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
    }

    @Override
    @Transactional(readOnly = false)
    @Scheduled(cron = "0 0/1 * * * ?")
    public void refreshReview() {
        //查询债项为复评阶段、内容修改中阶段并且复评审核状态为已审核的债项
        List<P2pRatingServiceInfo> list = p2pRatingResultViewDao.refreshReview2();
        //循环债项信息进行阶段推进操作
        if (list != null) {
            for (P2pRatingServiceInfo p2p : list) {
                if (p2p.getId() != null) {
                    //更新评级项目状态为待发布报告状态
                    p2p.setCurrentStage(Integer.toString(RatingState.NEED_PUBLISH_REPORT));
                    p2pRatingServiceInfoDao.updateInfoById(p2p);
                    //添加债项进展信息
                    P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
                    p2pBeforeMatchDebtState.setFinacingInformationId(p2p.getId());// 记录当前项目编号
                    p2pBeforeMatchDebtState.setProgressStage(p2p.getCurrentStage());// 记录当前融资项目阶段
                    p2pBeforeMatchDebtState.setStateTime(new Date());// 记录时间
                    p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
                }
            }
        }
    }

    @Override
    @Transactional(readOnly = false)
    @Scheduled(cron = "0 0 11,23 * * ?")
    public void updateFinishedProject() {
        List<P2pRatingServiceInfo> list = p2pRatingServiceInfoDao.findDateByFinished();
        if (list != null) {
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
            for (P2pRatingServiceInfo p2p : list) {
                if (p2p.getP2pBeforeMatchDebtState() != null) {
                    Date beginDate = p2p.getP2pBeforeMatchDebtState().getStateTime();
                    Date endDate = new Date();
                    //如果已进入待完成阶段24小时
                    if (endDate.getTime() - beginDate.getTime() > 24 * 60 * 60 * 1000) {
                        //更新评级项目状态到完成项目
                        p2p.setCurrentStage(Integer.toString(RatingState.FINISH_PROJECT));
                        p2pRatingServiceInfoDao.updateInfoById(p2p);
                        //添加债项进展信息
                        p2pBeforeMatchDebtState.setId(IdGen.uuid());
                        p2pBeforeMatchDebtState.setFinacingInformationId(p2p.getId());
                        p2pBeforeMatchDebtState.setProgressStage(p2p.getCurrentStage());
                        p2pBeforeMatchDebtState.setStateTime(new Date());
                        p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
                    }
                }
            }
        }
    }

    @Override
    public P2pRatingServiceInfo findAppInfoById(String id) {
        return p2pRatingServiceInfoDao.getRatingDetails(id);
    }

    @Override
    @Transactional(readOnly = false)
    public void updateAppInfo(P2pEnterpriseCertify p2pEnterpriseCertify,
                              User user, String rateDocumentId) {
        p2pEnterpriseCertify.setUser(user);
        p2pEnterpriseCertifyDao.updateEnterpriseOtherInfo(p2pEnterpriseCertify);
        P2pRateDocumentUpload p2pRateDocumentUpload = new P2pRateDocumentUpload(rateDocumentId);
        p2pRateDocumentUpload.setIsReject(null);
        p2pRateDocumentUpload.setRejectReason(null);
        p2pRateDocumentUploadDao.updateIsReject(p2pRateDocumentUpload);
    }

    @Override
    public Integer findProOrbitByFid(String financingInformationId) {
        List<Integer> list = p2pBeforeMatchDebtStateDao.findDebtOrbitByFid(financingInformationId);
        if (list.contains(RatingState.REVIEW_RATING)) {
            return 1;
        } else {
            return 0;
        }
    }
}