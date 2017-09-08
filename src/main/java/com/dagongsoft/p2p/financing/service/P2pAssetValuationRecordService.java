package com.dagongsoft.p2p.financing.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pAssetValuationRecordDao;
import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pAssetValuationRecord;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * 资产评估记录ServiceImpl
 *
 * @author Sora
 * @version 2016-11-08
 */
@Transactional(readOnly = true)
@Service("p2pAssetValuationRecordService")
public class P2pAssetValuationRecordService extends CrudService<P2pAssetValuationRecordDao, P2pAssetValuationRecord> {
    @Autowired
    private P2pAssetValuationRecordDao p2pAssetValuationRecordDao;
    @Autowired
    private P2pFinancingInformationDao p2pFinancingInformationDao;
    @Autowired
    private P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao;

    public P2pAssetValuationRecord get(String id) {
        return super.get(id);
    }

    public List<P2pAssetValuationRecord> findList(P2pAssetValuationRecord p2pAssetValuationRecord) {
        return super.findList(p2pAssetValuationRecord);
    }

    public Page<P2pAssetValuationRecord> findPage(Page<P2pAssetValuationRecord> page, P2pAssetValuationRecord p2pAssetValuationRecord) {
        return super.findPage(page, p2pAssetValuationRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pAssetValuationRecord p2pAssetValuationRecord) {
        super.save(p2pAssetValuationRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pAssetValuationRecord p2pAssetValuationRecord) {
        super.delete(p2pAssetValuationRecord);
    }

    public P2pAssetValuationRecord findByFinancingId(String id) {
        P2pAssetValuationRecord info = p2pAssetValuationRecordDao.findByFinancingId(id);
        info.setAssessmentReport(UploadFileUtils.viewUrl(info.getAssessmentReport()));
        info.setEvaluationContract(UploadFileUtils.viewUrl(info.getEvaluationContract()));
        return info;
    }

    public P2pAssetValuationRecord getByFiId(String fiId) {
        P2pAssetValuationRecord info = p2pAssetValuationRecordDao.getByFiId(fiId);
        info.setAssessmentReport(UploadFileUtils.viewUrl(info.getAssessmentReport()));
        info.setEvaluationContract(UploadFileUtils.viewUrl(info.getEvaluationContract()));
        return info;
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void saveAudit(P2pAssetValuationRecord p2pAssetValuationRecord, String markType, String userId) {
        p2pAssetValuationRecordDao.saveAudit(p2pAssetValuationRecord);
        //机构标
        if ("1".equals(markType)) {
            //补信时修改债项当前状态
            buxinUpdateCurrentState(p2pAssetValuationRecord, userId);
        }
//		//个人标
//		if("2".equals(markType)) {
//			//判断资产评估和担保是否都审核完成
//		}
    }

    //补信时修改债项当前状态
    public void buxinUpdateCurrentState(P2pAssetValuationRecord p2pAssetValuationRecord, String userId) {
        String fiId = p2pAssetValuationRecord.getFinancingInformationId();
        //补信状态
        String state = p2pAssetValuationRecord.getIsReject();

        P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationDao.getDebtDetails(fiId);
        //补信额度
        Double bxed = Double.valueOf(p2pFinancingInformation.getP2pFinancingRatingInfo().getRepCount());
        //资产评估额度
        Double zcpged = Double.valueOf(p2pAssetValuationRecord.getAssetValuation().toString());
        //是否交评级费
        Integer isHandRateCoString = p2pFinancingInformation.getIsHandRateCost();
        //查询发消息所需信息
        P2pFinancingInformation p2p = p2pFinancingInformationDao.findForMsg(p2pFinancingInformation);
        int currentStage = 0;
        //审核意见通过
        if ("1".equals(state)) {
            //审核意见通过，资产评估额度大于补信额度
            if (zcpged >= bxed) {
                //审核意见通过，资产评估额度大于补信额度且未交评级费-->current_satge:250市场待确认
                if (isHandRateCoString == 0) {
                    p2pFinancingInformationDao.updateCurrentStageById(fiId, Integer.toString(FinancingState.MARKET_STAFF_CONFIRMED));
                    currentStage = FinancingState.MARKET_STAFF_CONFIRMED;
                    Map<String, String> map = MsgLetterTemplate.getZxclshtg();
                    String content = MsgSmsTemplate.getZxclshtg();
                    MsgUtils.sendLetter(p2p.getApplicantsId(), map);
                    MsgUtils.sendSMS(p2p.getApplicantsId(), content);
                }
                //审核意见通过，资产评估额度大于补信额度且已交评级费-->current_satge:302待确认债项
                if (isHandRateCoString == 1) {
                    p2pFinancingInformationDao.updateCurrentStageById(fiId, Integer.toString(FinancingState.CREDIT_RATING_SUCCESS));
                    currentStage = FinancingState.CREDIT_RATING_SUCCESS;
                    //发送站内信和短信
                    Map<String, String> map = MsgLetterTemplate.getJdcpxxqr(p2p.getId());
                    MsgUtils.sendLetter(p2p.getApplicantsId(), map);
                    String content = MsgSmsTemplate.getJdcpxxqr();
                    MsgUtils.sendSMS(p2p.getApplicantsId(), content);
                }
            } else {
                //审核意见通过，资产评估额度小于补信额度-->current_satge:902结项
                p2pFinancingInformationDao.updateCurrentStageById(fiId, Integer.toString(FinancingState.PROJECT_KNOT));
                currentStage = FinancingState.PROJECT_KNOT;
                Map<String, String> map = MsgLetterTemplate.getZxclshwtgjx(p2p.getFinacingName());
                String content = MsgSmsTemplate.getZxclshwtgjx();
                MsgUtils.sendLetter(p2p.getApplicantsId(), map);
                MsgUtils.sendSMS(p2p.getApplicantsId(), content);
            }
        }
        if ("3".equals(state)) {
            //审核意见债项结束-->current_satge:902结项
            p2pFinancingInformationDao.updateCurrentStageById(fiId, Integer.toString(FinancingState.PROJECT_KNOT));
            currentStage = FinancingState.PROJECT_KNOT;
            Map<String, String> map = MsgLetterTemplate.getZxclshwtgjx(p2p.getFinacingName());
            String content = MsgSmsTemplate.getZxclshwtgjx();
            MsgUtils.sendLetter(p2p.getApplicantsId(), map);
            MsgUtils.sendSMS(p2p.getApplicantsId(), content);

        }
        //审核意见不通过，重新提交材料-->current_satge不变 ，不进行操作
        if ("2".equals(state)) {
            Map<String, String> map = MsgLetterTemplate.getZxclshwtg();
            String content = MsgSmsTemplate.getZxclshwtg();
            MsgUtils.sendLetter(p2p.getApplicantsId(), map);
            MsgUtils.sendSMS(p2p.getApplicantsId(), content);
        }
        if (currentStage != 0) {
            //在撮合前债项状态进展表添加一条记录
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
            p2pBeforeMatchDebtState.setId(IdGen.uuid());
            p2pBeforeMatchDebtState.setFinacingInformationId(fiId);//记录当前项目编号
            p2pBeforeMatchDebtState.setProgressStage(Integer.toString(currentStage));//记录当前融资项目阶段
            p2pBeforeMatchDebtState.setStateTime(new Date());//记录时间
            p2pBeforeMatchDebtState.setOperatorId(userId);
            p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
            ;
        }
    }
}