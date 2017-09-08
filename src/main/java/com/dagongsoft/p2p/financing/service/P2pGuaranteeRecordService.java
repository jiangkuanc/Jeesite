package com.dagongsoft.p2p.financing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.entity.P2pAssetValuationRecord;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pGuaranteeRecord;
import com.dagongsoft.p2p.financing.dao.P2pAssetValuationRecordDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.dao.P2pGuaranteeRecordDao;
import com.dagongsoft.p2p.financing.service.P2pGuaranteeRecordService;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.UploadFileUtils;

/**
 * 担保记录表ServiceImpl
 *
 * @author Sora
 * @version 2016-11-08
 */
@Transactional(readOnly = true)
@Service("p2pGuaranteeRecordService")
public class P2pGuaranteeRecordService extends CrudService<P2pGuaranteeRecordDao, P2pGuaranteeRecord> {
    @Autowired
    private P2pGuaranteeRecordDao p2pGuaranteeRecordDao;
    @Autowired
    private P2pAssetValuationRecordDao p2pAssetValuationRecordDao;
    @Autowired
    private P2pFinancingInformationDao p2pFinancingInformationDao;

    public P2pGuaranteeRecord get(String id) {
        return super.get(id);
    }

    public List<P2pGuaranteeRecord> findList(P2pGuaranteeRecord p2pGuaranteeRecord) {
        return super.findList(p2pGuaranteeRecord);
    }

    public Page<P2pGuaranteeRecord> findPage(Page<P2pGuaranteeRecord> page, P2pGuaranteeRecord p2pGuaranteeRecord) {
        return super.findPage(page, p2pGuaranteeRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pGuaranteeRecord p2pGuaranteeRecord) {
        super.save(p2pGuaranteeRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pGuaranteeRecord p2pGuaranteeRecord) {
        super.delete(p2pGuaranteeRecord);
    }

    public P2pGuaranteeRecord findByFinancingId(String id) {
        return p2pGuaranteeRecordDao.findByFinancingId(id);
    }

    public P2pGuaranteeRecord getByFiId(String fiId) {
        P2pGuaranteeRecord info = p2pGuaranteeRecordDao.getByFiId(fiId);
        info.setLetterIntent(UploadFileUtils.viewUrl(info.getLetterIntent()));
        info.setGuaranteeContract(UploadFileUtils.viewUrl(info.getGuaranteeContract()));
        return info;
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void saveAudit(P2pGuaranteeRecord p2pGuaranteeRecord, P2pAssetValuationRecord p2pAssetValuationRecord) {

        p2pGuaranteeRecordDao.saveAudit(p2pGuaranteeRecord);
        p2pAssetValuationRecordDao.saveAudit(p2pAssetValuationRecord);
        //补信时修改债项当前状态
        danbaoUpdateCurrentState(p2pGuaranteeRecord, p2pAssetValuationRecord);
    }

    //担保时修改债项当前状态
    public void danbaoUpdateCurrentState(P2pGuaranteeRecord p2pGuaranteeRecord, P2pAssetValuationRecord p2pAssetValuationRecord) {
        String fiId = p2pGuaranteeRecord.getFinancingInformationId();
        //补信状态
        String state = p2pGuaranteeRecord.getIsReject();

        P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationDao.getDebtDetails(fiId);
        //补信额度
        Double bxed = Double.valueOf(p2pFinancingInformation.getP2pFinancingRatingInfo().getRepCount());
        //资产评估额度
        Double zcpged = Double.valueOf(p2pAssetValuationRecord.getAssetValuation().toString());
        //是否交评级费
        Integer isHandRateCoString = p2pFinancingInformation.getIsHandRateCost();
        //审核意见通过
        if ("1".equals(state)) {
            //审核意见通过，资产评估额度大于补信额度
            if (zcpged >= bxed) {
                //审核意见通过，资产评估额度大于补信额度且未交评级费-->current_satge:250市场待确认
                if (isHandRateCoString == 0) {
                    p2pFinancingInformationDao.updateCurrentStageById(fiId, Integer.toString(FinancingState.MARKET_STAFF_CONFIRMED));
                }
                //审核意见通过，资产评估额度大于补信额度且已交评级费-->current_satge:302待确认债项
                if (isHandRateCoString == 1) {
                    p2pFinancingInformationDao.updateCurrentStageById(fiId, Integer.toString(FinancingState.CREDIT_RATING_SUCCESS));
                }
            } else {
                //审核意见通过，资产评估额度小于补信额度-->current_satge:902结项
                p2pFinancingInformationDao.updateCurrentStageById(fiId, Integer.toString(FinancingState.PROJECT_KNOT));
            }
        }
        if ("3".equals(state)) {
            //审核意见债项结束-->current_satge:902结项
            p2pFinancingInformationDao.updateCurrentStageById(fiId, Integer.toString(FinancingState.PROJECT_KNOT));
        }
        //审核意见不通过，重新提交材料-->current_satge不变 ，不进行操作
    }
}