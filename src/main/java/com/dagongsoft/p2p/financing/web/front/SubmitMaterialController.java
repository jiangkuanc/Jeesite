package com.dagongsoft.p2p.financing.web.front;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.financing.entity.P2pAssetValuationRecord;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.entity.P2pGuaranteeRecord;
import com.dagongsoft.p2p.financing.service.P2pAssetValuationRecordService;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.financing.service.P2pFinancingRatingInfoService;
import com.dagongsoft.p2p.financing.service.P2pGuaranteeRecordService;
import com.dagongsoft.p2p.financing.service.front.SupplyCreditService;
import com.dagongsoft.p2p.financing.service.front.ViewDebtDetailsService;
import com.dagongsoft.p2p.user.entity.P2pAssetValuation;
import com.dagongsoft.p2p.user.entity.P2pGuarantee;
import com.dagongsoft.p2p.user.service.P2pAssetValuationService;
import com.dagongsoft.p2p.user.service.P2pGuaranteeService;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.PermissionUtils;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.interceptor.Token;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 前台提交补信材料资料业务Controller
 *
 * @author Sora
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/submitMaterial")
public class SubmitMaterialController extends BaseController {
    @Autowired
    private P2pGuaranteeRecordService p2pGuaranteeRecordService;
    @Autowired
    private P2pAssetValuationRecordService p2pAssetValuationRecordService;
    @Autowired
    private P2pFinancingRatingInfoService p2pFinancingRatingInfoService;
    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Autowired
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Autowired
    private P2pGuaranteeService p2pGuaranteeService;
    @Autowired
    private P2pAssetValuationService p2pAssetValuationService;
    @Autowired
    private SupplyCreditService supplyCreditService;
    @Autowired
    private ViewDebtDetailsService viewDebtDetailsService;

    /**
     * 前台提交补信材料信息
     *
     * @param financingInformationId
     * @param p2pGuaranteeRecord
     * @param p2pAssetValuationRecord
     * @param multipartRequest
     * @param session
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "submitMaterial")
    @Transactional(readOnly = false)
    @Token(remove = true)
    public String submitMaterial(String financingInformationId, P2pGuaranteeRecord p2pGuaranteeRecord, P2pAssetValuationRecord p2pAssetValuationRecord, MultipartHttpServletRequest multipartRequest, HttpSession session) {
        try {
            User user = (User) session.getAttribute("user");
            //进行上传操作
            List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);//上传操作
            List<String> list2 = UploadFileUtils.getAllFileNames(multipartRequest);
            P2pFinancingRatingInfo p2pFinancingRatingInfo = p2pFinancingRatingInfoService.getByFiId(financingInformationId);
            P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.getById(financingInformationId);
            //如果补信额度小于批复额度待流标901
            if (p2pAssetValuationRecord.getAssetValuation().doubleValue() < Double.parseDouble(p2pFinancingRatingInfo.getRecommendedAmount())) {
                p2pFinancingInformationService.updateCurrentStageById(financingInformationId, FinancingState.FINANCING_EXPIRED + "");
                //新建债项状态进展轨迹
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());//轨迹编号
                p2pBeforeMatchDebtState.setFinacingInformationId(financingInformationId);//融资编号
                p2pBeforeMatchDebtState.setProgressStage(FinancingState.FINANCING_EXPIRED + "");//进展状态
                p2pBeforeMatchDebtState.setStateTime(new Date());//状态时间
                p2pBeforeMatchDebtState.setOperatorId(UserUtils.getUser().getName());//操作人
                p2pBeforeMatchDebtState.setHandleResult("债项已流标");//处理意见
                p2pBeforeMatchDebtState.setIsNewRecord(true);//是新数据
                p2pBeforeMatchDebtStateService.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);//保存轨迹信息
            }
            //如果补信额度大于批复额度
            else if (p2pAssetValuationRecord.getAssetValuation().doubleValue() > Double.parseDouble(p2pFinancingRatingInfo.getRecommendedAmount())) {
                //交评级费
                if (1 == p2pFinancingInformation.getIsHandRateCost()) {
                    //待确认债项
                    p2pFinancingInformationService.updateCurrentStageById(financingInformationId, FinancingState.CREDIT_RATING_SUCCESS + "");
                    //新建债项状态进展轨迹
                    P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                    p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());//轨迹编号
                    p2pBeforeMatchDebtState.setFinacingInformationId(financingInformationId);//融资编号
                    p2pBeforeMatchDebtState.setProgressStage(FinancingState.CREDIT_RATING_SUCCESS + "");//进展状态
                    p2pBeforeMatchDebtState.setStateTime(new Date());//状态时间
                    p2pBeforeMatchDebtState.setOperatorId(UserUtils.getUser().getName());//操作人
                    p2pBeforeMatchDebtState.setHandleResult("待确认债项");//处理意见
                    p2pBeforeMatchDebtState.setIsNewRecord(true);//是新数据
                    p2pBeforeMatchDebtStateService.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);//保存轨迹信息
                }
                //没交评级费
                else if (0 == p2pFinancingInformation.getIsHandRateCost()) {
                    //市场待确认
                    p2pFinancingInformationService.updateCurrentStageById(financingInformationId, FinancingState.MARKET_STAFF_CONFIRMED + "");
                    //新建债项状态进展轨迹
                    P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                    p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());//轨迹编号
                    p2pBeforeMatchDebtState.setFinacingInformationId(financingInformationId);//融资编号
                    p2pBeforeMatchDebtState.setProgressStage(FinancingState.MARKET_STAFF_CONFIRMED + "");//进展状态
                    p2pBeforeMatchDebtState.setStateTime(new Date());//状态时间
                    p2pBeforeMatchDebtState.setOperatorId(UserUtils.getUser().getName());//操作人
                    p2pBeforeMatchDebtState.setHandleResult("市场待确认");//处理意见
                    p2pBeforeMatchDebtState.setIsNewRecord(true);//是新数据
                    p2pBeforeMatchDebtStateService.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);//保存轨迹信息
                }
            }
            //判断标的类型
            //机构标
            if (1 == p2pFinancingInformation.getMarkType()) {
                /*
                 * 进行资产评估新增
				 */
                p2pAssetValuationRecord.setId(UUID.randomUUID().toString());//资产评估记录编号
                p2pAssetValuationRecord.setFinancingInformationId(financingInformationId);//融资信息编号
                //p2pAssetValuationRecord.setAssetCompanyNum(guaranteeCompanyName);//评估公司编号
                //评估公司名称
                //p2pAssetValuationRecord.setAssetCompanyName(DictUtils.getDictLabel(guaranteeCompanyName,"asset_company_name",""));
                p2pAssetValuationRecord.setAssessmentReport(list.get(0));//评估报告路径
                p2pAssetValuationRecord.setAssessmentReportName(list2.get(0));//评估报告名
                p2pAssetValuationRecord.setEvaluationContract(list.get(1));//评估合同路径
                p2pAssetValuationRecord.setEvaluationContractName(list2.get(1));//评估合同名
                p2pAssetValuationRecord.setCommitTime(new Date());//提交时间
                p2pAssetValuationRecord.setRejectPerson(UserUtils.getUser().getName());//操作人
                p2pAssetValuationRecord.setIsNewRecord(true);
                p2pAssetValuationRecordService.save(p2pAssetValuationRecord);
            }
            //个人标
            if (2 == p2pFinancingInformation.getMarkType()) {
                /*
				 * 进行资产评估新增
				 */
                p2pAssetValuationRecord.setId(UUID.randomUUID().toString());//资产评估记录编号
                p2pAssetValuationRecord.setFinancingInformationId(financingInformationId);//融资信息编号
                //p2pAssetValuationRecord.setAssetCompanyNum(guaranteeCompanyName);//评估公司编号
                //评估公司名称
                //p2pAssetValuationRecord.setAssetCompanyName(DictUtils.getDictLabel(guaranteeCompanyName,"asset_company_name",""));
                p2pAssetValuationRecord.setAssessmentReport(list.get(0));//评估报告路径
                p2pAssetValuationRecord.setAssessmentReportName(list2.get(0));//评估报告名
                p2pAssetValuationRecord.setEvaluationContract(list.get(1));//评估合同路径
                p2pAssetValuationRecord.setEvaluationContractName(list2.get(1));//评估合同名
                p2pAssetValuationRecord.setCommitTime(new Date());//提交时间
                p2pAssetValuationRecord.setRejectPerson(UserUtils.getUser().getName());//操作人
                p2pAssetValuationRecord.setIsNewRecord(true);
                p2pAssetValuationRecordService.save(p2pAssetValuationRecord);
				/*
				 * 进行担保记录新增
				 */
                p2pGuaranteeRecord.setId(UUID.randomUUID().toString());//担保记录编号
                p2pGuaranteeRecord.setFinancingInformationId(financingInformationId);//融资信息编号
                //p2pGuaranteeRecord.setGuaranteeCompanyNum(assetCompanyName);//担保公司编号
                p2pGuaranteeRecord.setLetterIntent(list.get(2));//担保意向书路径
                p2pGuaranteeRecord.setLetterIntentName(list2.get(2));//担保意向书名
                p2pGuaranteeRecord.setGuaranteeContract(list.get(3));//担保合同路径
                p2pGuaranteeRecord.setGuaranteeContractName(list2.get(3));//担保合同名
                p2pGuaranteeRecord.setCommitTime(new Date());//提交时间
                p2pGuaranteeRecord.setRejectPerson(UserUtils.getUser().getName());//操作人
                //担保公司名称
                //p2pGuaranteeRecord.setGuaranteeCompanyName(DictUtils.getDictLabel(p2pGuaranteeRecord.getGuaranteeCompanyName(),"guarantee_company_name",""));
                p2pGuaranteeRecord.setIsNewRecord(true);
                p2pGuaranteeRecordService.save(p2pGuaranteeRecord);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=myFinancApp";
    }

    /**
     * 选择补信公司
     *
     * @param p2pGuaranteeRecord
     * @param p2pAssetValuationRecord
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "chooseCompany")
    @Token(remove = true)
    public String chooseCompany(HttpSession session, P2pGuaranteeRecord p2pGuaranteeRecord, P2pAssetValuationRecord p2pAssetValuationRecord) {
        try {
            if (!PermissionUtils.ctrlPermission(session, null, FinancingState.SUPPLY_CREDIT)) {
                return "redirect:" + frontPath;
            }
            supplyCreditService.chooseCompany(p2pAssetValuationRecord, p2pGuaranteeRecord);
            return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=myFinancApp";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 加载补信页面
     *
     * @param financingInformationId
     * @param request
     * @param response
     * @param model
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "submitView")
    @Token(save = true)
    public String submitView(String financingInformationId, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.getById(financingInformationId);
            model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
            List<P2pAssetValuation> list1 = p2pAssetValuationService.loadAllList();
            List<P2pGuarantee> list2 = p2pGuaranteeService.loadAllList();
            P2pFinancingRatingInfo p2pFinancingRatingInfo = viewDebtDetailsService.findRatingInfoByFid(financingInformationId);
            model.addAttribute("rating", p2pFinancingRatingInfo);
            model.addAttribute("list1", list1);
            model.addAttribute("list2", list2);
            model.addAttribute("list1Json", JsonMapper.toJsonString(list1));
            model.addAttribute("list2Json", JsonMapper.toJsonString(list2));
            return "modules/front/financing/submitBuxinMaterial";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
