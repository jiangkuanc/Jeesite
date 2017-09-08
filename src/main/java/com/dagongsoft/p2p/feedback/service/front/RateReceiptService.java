package com.dagongsoft.p2p.feedback.service.front;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.feedback.dao.P2pRatingResultViewDao;
import com.dagongsoft.p2p.feedback.dao.P2pReviewDocumentDao;
import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.feedback.entity.P2pReviewDocument;
import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingRatingInfoDao;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.RatingLevelUtils;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;

@Service
@Transactional(readOnly = true)
@Lazy(false)
public class RateReceiptService {

    @Autowired
    private P2pRatingResultViewDao p2pRatingResultViewDao;

    @Autowired
    private P2pReviewDocumentDao p2pReviewDocumentDao;

    @Autowired
    private P2pFinancingInformationDao p2pFinancingInformationDao;

    @Autowired
    private P2pFinancingRatingInfoDao p2pFinancingRatingInfoDao;

    @Autowired
    private P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao;

    /**
     * 评级意见反馈
     *
     * @param p2pRatingResultView
     * @return
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void receiptRecord(P2pRatingResultView p2pRatingResultView) {
        P2pFinancingInformation p2pFinancingInformation = null;
        //设置意见反馈时间
        p2pRatingResultView.setViewTime(new Date());
        p2pRatingResultView.setAuditState("0");
        if ("1".equals(p2pRatingResultView.getViewType())) {
            p2pRatingResultViewDao.deleteReceiptRecord(p2pRatingResultView.getFinancingInformationId());
            //对内容有异议(*)
            p2pRatingResultView.setId(IdGen.uuid());
            p2pRatingResultViewDao.insertReceiptRecord(p2pRatingResultView);//添加意见反馈记录
            p2pFinancingInformation = new P2pFinancingInformation(p2pRatingResultView.getFinancingInformationId());
            p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.RATING_RESULTS_CONTENT_MODIFING));
            p2pFinancingInformationDao.updateCurrentStageByFid(p2pFinancingInformation);//修改债项状态为内容修改中
        }
        if ("2".equals(p2pRatingResultView.getViewType())) {
            //对主体级别有异议
            p2pRatingResultViewDao.updateReceiptRecord(p2pRatingResultView);//修改审核状态
            p2pFinancingInformation = new P2pFinancingInformation(p2pRatingResultView.getFinancingInformationId());
            p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.REVIEW_ING));
            p2pFinancingInformationDao.updateCurrentStageByFid(p2pFinancingInformation);//修改债项状态为复评
        }
        if ("3".equals(p2pRatingResultView.getViewType())) {
            p2pRatingResultViewDao.deleteReceiptRecord(p2pRatingResultView.getFinancingInformationId());
            //无异议
            p2pRatingResultView.setId(IdGen.uuid());
            p2pRatingResultViewDao.insertReceiptRecord(p2pRatingResultView);//添加意见反馈记录
            P2pFinancingRatingInfo p2p = p2pFinancingRatingInfoDao.findRatingInfoByFid(p2pRatingResultView.getFinancingInformationId());
            //判断级别
            int currentStage = RatingLevelUtils.firstDetermineLevel(p2p.getRatingLevel());
            if (currentStage == FinancingState.PROJECT_KNOT) {
                Map<String, String> map = MsgLetterTemplate.getWyyjbBB(p2p.getP2pFinancingInformation().getFinacingName(), p2p.getRatingLevel());
                MsgUtils.sendLetter(p2p.getP2pFinancingInformation().getApplicantsId(), map);
                String content = MsgSmsTemplate.getWyyjbBB(p2p.getRatingLevel());
                MsgUtils.sendSMS(p2p.getP2pFinancingInformation().getApplicantsId(), content);
            }
            p2pFinancingInformation = new P2pFinancingInformation(p2pRatingResultView.getFinancingInformationId());
            p2pFinancingInformation.setCurrentStage(Integer.toString(currentStage));
            p2pFinancingInformationDao.updateCurrentStageByFid(p2pFinancingInformation);//修改债项状态
        }
        /*
         * 添加债项进展信息
		 */
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
        p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());
        p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());
        p2pBeforeMatchDebtState.setStateTime(new Date());
        p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
    }

    /**
     * 复评材料上传
     *
     * @param multipartHttpServletRequest
     * @param user
     * @param p2pRatingResultView
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void uploadReviewDoc(MultipartHttpServletRequest multipartHttpServletRequest, User user, P2pRatingResultView p2pRatingResultView) {
        List<String> list = UploadFileUtils.fdfsUpload(multipartHttpServletRequest);//上传操作
        P2pReviewDocument p2pReviewDocument = new P2pReviewDocument(IdGen.uuid());
        P2pRatingResultView p2p = p2pRatingResultViewDao.findOneByFid(p2pRatingResultView.getFinancingInformationId());
        if (p2p != null) {
            p2pReviewDocument.setRateResultViewId(p2p.getId());
        } else {
            p2pRatingResultView.setId(IdGen.uuid());
            p2pRatingResultViewDao.insertReceiptRecord(p2pRatingResultView);
            p2pReviewDocument.setRateResultViewId(p2pRatingResultView.getId());
        }
        p2pReviewDocument.setFileAddress(list.get(0));
        p2pReviewDocument.setFileName(multipartHttpServletRequest.getFile("file").getOriginalFilename());
        p2pReviewDocumentDao.insert(p2pReviewDocument);
    }

    /**
     * 刷新复评状态
     *
     * @author Quincy
     */
    @Scheduled(cron = "0 0/1 * * * ? ")
    @Transactional(readOnly = false)
    public void refreshReview() {
        //查询债项为复评阶段、内容修改中阶段并且复评审核状态为已审核的债项
        List<P2pFinancingInformation> list = p2pRatingResultViewDao.refreshReview1();
        //循环债项信息进行阶段推进操作
        if (list != null) {
            for (P2pFinancingInformation p2p : list) {
                if (p2p.getId() != null) {
                    //同步更改完的债项信息
                    P2pFinancingRatingInfo ratingInfo = p2pFinancingRatingInfoDao.findRatingInfoByFid(p2p.getId());
                    p2p.setFinancingAmount(Integer.parseInt(ratingInfo.getRecommendedAmount()));//设置批复金额
                    p2p.setRecommendedRate(Double.parseDouble(ratingInfo.getRecommendedRate()));//设置批复利率
                    //判断级别
                    int currentStage = RatingLevelUtils.firstDetermineLevel(p2p.getP2pFinancingRatingInfo().getRatingLevel());
                    p2p.setCurrentStage(Integer.toString(currentStage));
                    p2pFinancingInformationDao.refreshRatingInfo2(p2p);//修改债项状态以及更新信息
                    //修改增信信息（是否增信、增信额度）
                    ratingInfo.setWetherRep(RatingLevelUtils.isRepByLevel(p2p.getP2pFinancingRatingInfo().getRatingLevel()));
                    ratingInfo.setRepCount("0");
                    if (ratingInfo.getWetherRep().equals("1")) {
                        if (ratingInfo.getP2pFinancingInformation().getApplicationAmount() < Integer.valueOf(ratingInfo.getRecommendedAmount())) {
                            ratingInfo.setRepCount(Integer.toString(ratingInfo.getP2pFinancingInformation().getApplicationAmount()));
                        } else {
                            ratingInfo.setRepCount(ratingInfo.getRecommendedAmount());
                        }
                    }
                    ratingInfo.setFinancingInformationId(ratingInfo.getP2pFinancingInformation().getId());
                    p2pFinancingRatingInfoDao.updateRepInfo(ratingInfo);
                    //添加债项进展信息
                    P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
                    p2pBeforeMatchDebtState.setFinacingInformationId(p2p.getId());// 记录当前项目编号
                    p2pBeforeMatchDebtState.setProgressStage(p2p.getCurrentStage());// 记录当前融资项目阶段
                    p2pBeforeMatchDebtState.setStateTime(new Date());// 记录时间
                    p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
                    if (currentStage == FinancingState.PROJECT_KNOT) {
                        Map<String, String> map = MsgLetterTemplate.getYyyjbBB(p2p.getFinacingName(), p2p.getP2pFinancingRatingInfo().getRatingLevel());
                        MsgUtils.sendLetter(p2p.getApplicantsId(), map);
                        String content = MsgSmsTemplate.getYyyjbBB(p2p.getP2pFinancingRatingInfo().getRatingLevel());
                        MsgUtils.sendSMS(p2p.getApplicantsId(), content);
                    }
                }
            }
        }
    }
}
