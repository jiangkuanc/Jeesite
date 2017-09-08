package com.dagongsoft.p2p.financing.service.front;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.financing.dao.P2pAssetValuationRecordDao;
import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.dao.P2pGuaranteeRecordDao;
import com.dagongsoft.p2p.financing.entity.P2pAssetValuationRecord;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pGuaranteeRecord;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * 补信操作Service
 *
 * @author Quincy
 */
@Service
@Transactional(readOnly = true)
public class SupplyCreditService {
    @Autowired
    private P2pAssetValuationRecordDao p2pAssetValuationRecordDao;
    @Autowired
    private P2pGuaranteeRecordDao p2pGuaranteeRecordDao;
    @Autowired
    private P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao;
    @Autowired
    private P2pFinancingInformationDao p2pFinancingInformationDao;

    /**
     * 处理选择补信公司业务
     *
     * @param p2pAssetValuation
     * @param p2pGuarantee
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void chooseCompany(P2pAssetValuationRecord p2pAssetValuationRecord,
                              P2pGuaranteeRecord p2pGuaranteeRecord) {
        //添加资产评估记录
        p2pAssetValuationRecord.setId(IdGen.uuid());
//		p2pAssetValuationRecord.setIsReject("2");
        p2pAssetValuationRecordDao.insert(p2pAssetValuationRecord);
        //如果需要担保，添加担保记录
        if (p2pGuaranteeRecord != null) {
            p2pGuaranteeRecord.setId(IdGen.uuid());
//			p2pGuaranteeRecord.setIsReject("2");
            p2pGuaranteeRecordDao.insert(p2pGuaranteeRecord);
        }
        //修改债项进展状态
        P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation(p2pAssetValuationRecord.getFinancingInformationId());
        p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.SUBMIT_CREDIT_CERTIFY));
        p2pFinancingInformationDao.updateCurrentStageByFid(p2pFinancingInformation);
        //添加债项轨迹记录
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
        p2pBeforeMatchDebtState.setProgressStage(Integer.toString(FinancingState.SUBMIT_CREDIT_CERTIFY));
        p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());
        p2pBeforeMatchDebtState.setStateTime(new Date());
        p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
    }

    /**
     * 查询前台资产评估任务列表
     *
     * @return
     * @author Quincy
     */
    public List<P2pAssetValuationRecord> findAssetValuationTaskList(String userId) {
        List<P2pAssetValuationRecord> list = p2pAssetValuationRecordDao.findAssetValuationTaskList(userId);
        for (P2pAssetValuationRecord entity : list) {
            entity.setAssessmentReport(UploadFileUtils.viewUrl(entity.getAssessmentReport()));
            entity.setEvaluationContract(UploadFileUtils.viewUrl(entity.getEvaluationContract()));
        }
        return list;
    }

    /**
     * 查询前台担保任务列表
     *
     * @return
     * @author Quincy
     */
    public List<P2pGuaranteeRecord> findGuaranteeTaskList(String userId) {
        List<P2pGuaranteeRecord> list = p2pGuaranteeRecordDao.findGuaranteeTaskList(userId);
        for (P2pGuaranteeRecord entity : list) {
            entity.setLetterIntent(UploadFileUtils.viewUrl(entity.getLetterIntent()));
            entity.setGuaranteeContract(UploadFileUtils.viewUrl(entity.getGuaranteeContract()));
        }
        return list;
    }

    /**
     * 完成资产评估任务
     *
     * @param p2pAssetValuationRecord
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void finishAssetValuationTask(MultipartHttpServletRequest multipartHttpServletRequest,
                                         P2pAssetValuationRecord p2pAssetValuationRecord, String applicantsId) {
        List<String> list = UploadFileUtils.fdfsUpload(multipartHttpServletRequest);//上传资产评估证明和资产评估合同
        List<String> names = UploadFileUtils.getAllFileNames(multipartHttpServletRequest);//获得资产评估证明和资产评估合同文件原名
        p2pAssetValuationRecord.setAssessmentReport(list.get(0));//保存资产评估证明路径
        p2pAssetValuationRecord.setAssessmentReportName(names.get(0));
        p2pAssetValuationRecord.setEvaluationContract(list.get(1));//保存资产评估合同路径
        p2pAssetValuationRecord.setEvaluationContractName(names.get(1));
        p2pAssetValuationRecord.setIsReject("0");//设置审核状态
        p2pAssetValuationRecordDao.updateAssetValuationInfo(p2pAssetValuationRecord);
    }

    /**
     * 完成担保任务
     *
     * @param multipartHttpServletRequest
     * @param p2pAssetValuationRecord
     * @param applicantsId
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void finishGuaranteeTask(MultipartHttpServletRequest multipartHttpServletRequest,
                                    P2pGuaranteeRecord p2pGuaranteeRecord, String applicantsId) {
        List<String> list = UploadFileUtils.fdfsUpload(multipartHttpServletRequest);//上传担保函和担保合同
        List<String> names = UploadFileUtils.getAllFileNames(multipartHttpServletRequest);//获得担保函和担保合同文件原名
        p2pGuaranteeRecord.setLetterIntent(list.get(0));//保存担保函路径
        p2pGuaranteeRecord.setLetterIntentName(names.get(0));
        p2pGuaranteeRecord.setGuaranteeContract(list.get(1));//保存担保合同路径
        p2pGuaranteeRecord.setGuaranteeContractName(names.get(1));
        p2pGuaranteeRecord.setIsReject("0");//设置审核状态
        p2pGuaranteeRecord.setCommitTime(new Date());
        p2pGuaranteeRecordDao.updateGuaranteeInfo(p2pGuaranteeRecord);
    }
}
