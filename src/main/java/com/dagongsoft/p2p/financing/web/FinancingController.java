package com.dagongsoft.p2p.financing.web;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.document.entity.P2pRateDocumentTemplate;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.document.service.P2pRateDocumentTemplateService;
import com.dagongsoft.p2p.document.service.P2pRateDocumentUploadService;
import com.dagongsoft.p2p.financing.entity.P2pApplicationDocuments;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.entity.P2pGivingOutLoans;
import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.financing.service.FinancingService;
import com.dagongsoft.p2p.financing.service.P2pApplicationDocumentsService;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.financing.service.P2pFinancingRatingInfoService;
import com.dagongsoft.p2p.financing.service.P2pGivingOutLoansService;
import com.dagongsoft.p2p.financing.service.P2pPaymentOfRatingCostService;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.investment.service.P2pInvestmentInformationService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.utils.FileDownLoad;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.RatingLevelUtils;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.Encodes;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 融资管理Controller
 *
 * @author zhengshuo
 * @version 2016-07-13
 */
@Controller
@RequestMapping(value = "${adminPath}/financing")
public class FinancingController extends BaseController {
    @Autowired
    private FinancingService financingService;
    @Autowired
    private P2pApplicationDocumentsService p2pApplicationDocumentsService;
    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Autowired
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Autowired
    private P2pPaymentOfRatingCostService p2pPaymentOfRatingCostService;
    @Autowired
    private P2pInvestmentInformationService p2pInvestmentInformationService;
    @Autowired
    private P2pGivingOutLoansService p2pGivingOutLoansService;
    @Autowired
    private P2pRateDocumentUploadService p2pRateDocumentUploadService;
    @Autowired
    private P2pRateDocumentTemplateService p2pRateDocumentTemplateService;
    @Autowired
    private P2pFinancingRatingInfoService p2pFinancingRatingInfoService;

    /*
     * *********************************************************
     *
     *  撮合前
     *
     * **********************************************************
     */
    //材料审核list页面
    //@RequiresPermissions("financing:financing:view")
    @RequestMapping(value = "findDocumentAuditList")
    public String findDocumentAuditList(P2pEnterpriseCertify p2pEnterpriseCertify, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pEnterpriseCertify> page = financingService.findListByFid(new Page<P2pEnterpriseCertify>(request, response), p2pEnterpriseCertify);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/financing/before/documentAudit";
    }

    //材料审核详情页
    @RequiresPermissions("financing:financing:view")
    @RequestMapping(value = "getEnterpriseBaseInfo")
    public String getEnterpriseBaseInfo(@RequestParam String userId, @RequestParam String fiId, @RequestParam String flag, Model model) {

        P2pApplicationDocuments p2pApplicationDocuments = p2pApplicationDocumentsService.getByFiId(fiId);
        P2pEnterpriseCertify p2pEnterpriseCertify = financingService.getEnterpriseBaseInfo(userId);
        //根据userid得到用户上传的材料
        List<P2pRateDocumentUpload> p2pRateDocumentUploadList = p2pRateDocumentUploadService.getDocumentByFiId(fiId);
        //获得所有要上传的材料
        List<P2pRateDocumentTemplate> p2pRateDocumentTemplateList = p2pRateDocumentTemplateService.findList(new P2pRateDocumentTemplate());

        model.addAttribute("p2pApplicationDocuments", p2pApplicationDocuments);
        model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
        model.addAttribute("p2pRateDocumentUploadList", p2pRateDocumentUploadList);
        model.addAttribute("p2pRateDocumentTemplateList", p2pRateDocumentTemplateList);
        model.addAttribute("flag", flag);
        return "modules/financing/beforeMatch/documentAuditDetail";
    }

    //材料下载
    @RequestMapping(value = "download")
    public String download(@RequestParam String address, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        UploadFileUtils.fdfsDownload(Encodes.urlDecode(address), response);
        return null;
    }

    //下载评级报告（保留原文件名）
    @RequestMapping(value = "download2")
    public String download2(String id, String type, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        P2pFinancingRatingInfo p2pFinancingRatingInfo = p2pFinancingRatingInfoService.getAddressANDName(id);
        String address = "";
        String fileName = "";
        if (p2pFinancingRatingInfo != null) {
            if ("1".equals(type)) {
                if (p2pFinancingRatingInfo.getCommitReport() != null && p2pFinancingRatingInfo.getCommitReportName() != null) {
                    address = p2pFinancingRatingInfo.getCommitReport();
                    fileName = p2pFinancingRatingInfo.getCommitReportName();
                }
            }
            if ("2".equals(type)) {
                if (p2pFinancingRatingInfo.getCreditReport() != null && p2pFinancingRatingInfo.getCreditReportName() != null) {
                    address = p2pFinancingRatingInfo.getCreditReport();
                    fileName = p2pFinancingRatingInfo.getCreditReportName();
                }
            }
        }
        UploadFileUtils.fdfsDownload(address, fileName, response);
        return null;
    }

    /**
     * 评级材料批量下载
     *
     * @param financingInformationId
     * @param rateDocumentTempId
     * @param response
     * @return
     */
    @RequestMapping(value = "downloads")
    public String downloads(String zipName, String fileName[], String filePath[], HttpServletResponse response) {
        FileDownLoad.createZip(zipName, fileName, filePath, response);
        return null;
    }

    /**
     * 复评材料批量下载
     *
     * @param financingInformationId
     * @param rateDocumentTempId
     * @param response
     * @return
     */
    @RequestMapping(value = "reviewDownloads")
    public String reviewDownloads(String rateResultViewId, HttpServletResponse response) {
        UploadFileUtils.reviewDownloads(rateResultViewId, response);
        return null;
    }

    //材料审核
    @RequestMapping(value = "documentsAudit")
    @Transactional(readOnly = false)
    public String documentsAudit(P2pApplicationDocuments p2pApplicationDocuments, RedirectAttributes redirectAttributes) {


        P2pApplicationDocuments p2pAD = null;
        if (p2pApplicationDocuments.getId() != null && !"".equals(p2pApplicationDocuments.getId())) {
            //申请材料添加审核信息
            p2pAD = p2pApplicationDocumentsService.get(p2pApplicationDocuments.getId());
            p2pAD.setAuditOpinion(p2pApplicationDocuments.getAuditOpinion());    //审核意见
            p2pAD.setAuditPersonId(p2pApplicationDocuments.getAuditPersonId());    //审核人
            p2pAD.setAuditReason(p2pApplicationDocuments.getAuditReason());        //原因
            p2pAD.setAuditTime(p2pApplicationDocuments.getAuditTime());            //审核时间
            p2pApplicationDocumentsService.save(p2pAD);
            //修改融资信息表当前阶段
            P2pFinancingInformation p2pFI = p2pFinancingInformationService.get(p2pApplicationDocuments.getFinancingInformationId());
            p2pFI.setCurrentStage(p2pApplicationDocuments.getAuditOpinion());
            p2pFinancingInformationService.save(p2pFI);
            //债项状态进展表添加记录
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
            p2pBeforeMatchDebtState.setFinacingInformationId(p2pApplicationDocuments.getFinancingInformationId());
            p2pBeforeMatchDebtState.setProgressStage(p2pApplicationDocuments.getAuditOpinion());
            p2pBeforeMatchDebtState.setStateTime(p2pApplicationDocuments.getAuditTime());
            p2pBeforeMatchDebtState.setOperatorId(p2pApplicationDocuments.getAuditPersonId());
            p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            addMessage(redirectAttributes, "操作成功");
            return "redirect:" + Global.getAdminPath() + "/financing/findDocumentAuditList/?repage";
        } else {
            addMessage(redirectAttributes, "操作失败");
            return "redirect:" + Global.getAdminPath() + "/financing/findDocumentAuditList/?repage";
        }
    }

    //材料单独保存
    @RequestMapping(value = "saveSingleDocument")
    @ResponseBody
    public String saveSingleDocument(P2pRateDocumentUpload p2pRateDocumentUpload, HttpServletRequest request, HttpServletResponse response, Model model) {

        p2pRateDocumentUploadService.saveSingleDocument(p2pRateDocumentUpload);

        return "success";
    }

    //债项发布list页面
    @RequiresPermissions("financing:financing:view")
    @RequestMapping(value = "findDebtReleaseList")
    public String findDebtReleaseList(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = financingService.findDebtReleaseList(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "modules/financing/beforeMatch/debtRelease";
    }

    //债项发布
    @RequestMapping(value = "debtReleaseSubmit")
    @Transactional(readOnly = false)
    public String debtReleaseSubmit(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, RedirectAttributes redirectAttributes) {

        //添加发布记录
        p2pBeforeMatchDebtState.setProgressStage(String.valueOf(FinancingState.FINANCING_PUBLISHED));
        p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
        //融资信息表更改状态为已发布和添加发布时间
        P2pFinancingInformation p2pFI = p2pFinancingInformationService.get(p2pBeforeMatchDebtState.getFinacingInformationId());
        p2pFI.setPublishTime(p2pBeforeMatchDebtState.getStateTime());
        p2pFI.setCurrentStage(String.valueOf(FinancingState.FINANCING_PUBLISHED));
        p2pFinancingInformationService.save(p2pFI);
        addMessage(redirectAttributes, "发布成功");
        return "redirect:" + Global.getAdminPath() + "/financing/findDebtReleaseList/?repage";
    }

	/*
     * *********************************************************
	 * 
	 *  撮合中
	 * 
	 * **********************************************************
	 */

    //撮合中list
    @RequiresPermissions("financing:financing:view")
    @RequestMapping(value = "middleMatchList")
    public String middleMatchList(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = financingService.findMiddleMatchList(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "modules/financing/middleMatch/p2pMiddleMatchDebtList";
    }

    //撮合中债项详情
    @RequiresPermissions("financing:financing:view")
    @RequestMapping(value = "middleDebtDetails")
    public String middleDebtDetails(@RequestParam String fiId, Model model) {
        P2pFinancingInformation fi = p2pFinancingInformationService.get(fiId);

        model.addAttribute("fi", fi);
        return "modules/financing/middleMatch/debtDetails";
    }

    //缴费页面
    @RequiresPermissions("financing:financing:view")
    @RequestMapping(value = "confirmPayment")
    public String confirmPayment(@RequestParam String fiId, @RequestParam String flag, Model model) {
        P2pFinancingInformation fi = p2pFinancingInformationService.get(fiId);
        //查看
        if ("1".equals(flag)) {
            P2pPaymentOfRatingCost porc = p2pPaymentOfRatingCostService.getByFiId(fiId);
            model.addAttribute("porc", porc);
        }
        model.addAttribute("fi", fi);
        model.addAttribute("flag", flag);
        return "modules/financing/middleMatch/confirmPayment";
    }

    //确认缴费
    @RequestMapping(value = "confirmPaymentSubmit")
    @Transactional(readOnly = false)
    public String confirmPaymentSubmit(P2pPaymentOfRatingCost p2pPaymentOfRatingCost, RedirectAttributes redirectAttributes) {
        //评级缴费表添加缴费数据
        p2pPaymentOfRatingCostService.save(p2pPaymentOfRatingCost);
        //债项状态表添加已缴费记录
        P2pBeforeMatchDebtState bmds = new P2pBeforeMatchDebtState();
        bmds.setFinacingInformationId(p2pPaymentOfRatingCost.getFinancingInformationId());
        bmds.setProgressStage(String.valueOf(FinancingState.PAID_RATING));
        Date date = new Date();
        bmds.setStateTime(date);
        bmds.setOperatorId(p2pPaymentOfRatingCost.getOperatorId());
        p2pBeforeMatchDebtStateService.save(bmds);
        //融资信息表更改状态为已缴评级费
        P2pFinancingInformation p2pFI = p2pFinancingInformationService.get(p2pPaymentOfRatingCost.getFinancingInformationId());
        p2pFI.setCurrentStage(String.valueOf(FinancingState.PAID_RATING));
        p2pFinancingInformationService.save(p2pFI);
        addMessage(redirectAttributes, "确认缴费成功");
        return "redirect:" + Global.getAdminPath() + "/financing/middleMatchList/?repage";

    }

    //满标确标页面
    @RequiresPermissions("financing:financing:view")
    @RequestMapping(value = "confirmFullDebt")
    public String confirmFullDebt(@RequestParam String id, @RequestParam(required = false) String flag, Model model, HttpServletRequest request, HttpServletResponse response) {
        //债项统计查询
        P2pFinancingInformation fi = financingService.getMiddleMatchForm(id);
        //操作信息
        if ("1".equals(flag)) {
            P2pBeforeMatchDebtState bmds = new P2pBeforeMatchDebtState();
            bmds.setFinacingInformationId(id);
            List<P2pBeforeMatchDebtState> list = p2pBeforeMatchDebtStateService.getDebtReleaseRecord(bmds);
            for (P2pBeforeMatchDebtState p : list) {
                if (String.valueOf(FinancingState.MAKE_LOAN).equals(p.getProgressStage())) {
                    model.addAttribute("p2pBeforeMatchDebtState", p);
                }
            }
        }
        //投资记录查询
        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setFinancingInformationId(id);
        Page<P2pInvestmentInformation> page = p2pInvestmentInformationService.findPage(new Page<P2pInvestmentInformation>(request, response), p2pInvestmentInformation);

        model.addAttribute("fi", fi);
        model.addAttribute("page", page);
        model.addAttribute("flag", flag);
        return "modules/financing/middleMatch/confirmFullDebt";
    }

    //满标确标
    @RequestMapping(value = "confirmFullDebtSubmit")
    @Transactional(readOnly = false)
    public String confirmFullDebtSubmit(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, P2pGivingOutLoans p2pGivingOutLoans, RedirectAttributes redirectAttributes) {

        //添加记录
        p2pBeforeMatchDebtState.setProgressStage(String.valueOf(FinancingState.MAKE_LOAN));
        p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
        //贷款发放表添加放款信息
        p2pGivingOutLoansService.save(p2pGivingOutLoans);
        //融资信息表更改状态为已满标确标（待放款），待还款总额为返款金额
        P2pFinancingInformation p2pFI = p2pFinancingInformationService.get(p2pBeforeMatchDebtState.getFinacingInformationId());
        p2pFI.setCurrentStage(String.valueOf(FinancingState.MAKE_LOAN));
//			p2pFI.setRestRepaymetMoney(RepaymentPlanUtils.getRepaymentAmount(p2pFI));
        p2pFinancingInformationService.save(p2pFI);
        addMessage(redirectAttributes, "确标成功");
        return "redirect:" + Global.getAdminPath() + "/financing/middleMatchList/?repage";

    }

    //流标结项审核页面
    @RequiresPermissions("financing:financing:view")
    @RequestMapping(value = "flowDebt")
    public String flowDebt(@RequestParam String id, @RequestParam(required = false) String flag, Model model, HttpServletRequest request, HttpServletResponse response) {
        //债项统计查询
        P2pFinancingInformation fi = financingService.getMiddleMatchForm(id);
        //操作信息
        if ("1".equals(flag)) {
            P2pBeforeMatchDebtState bmds = new P2pBeforeMatchDebtState();
            bmds.setFinacingInformationId(id);
            List<P2pBeforeMatchDebtState> list = p2pBeforeMatchDebtStateService.getDebtReleaseRecord(bmds);
            for (P2pBeforeMatchDebtState p : list) {
                if (String.valueOf(FinancingState.FINANCING_FAILURE).equals(p.getProgressStage())) {
                    model.addAttribute("p2pBeforeMatchDebtState", p);
                }
            }
        }
        //投资记录查询
        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setFinancingInformationId(id);
        Page<P2pInvestmentInformation> page = p2pInvestmentInformationService.findPage(new Page<P2pInvestmentInformation>(request, response), p2pInvestmentInformation);

        model.addAttribute("fi", fi);
        model.addAttribute("page", page);
        model.addAttribute("flag", flag);
        return "modules/financing/middleMatch/flowDebt";
    }

    //流标结项
    @RequestMapping(value = "flowDebtSubmit")
    @Transactional(readOnly = false)
    public String flowDebtSubmit(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, RedirectAttributes redirectAttributes) {

        //添加流标结项记录
        p2pBeforeMatchDebtState.setProgressStage(String.valueOf(FinancingState.FINANCING_FAILURE));
        p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
        //融资信息表更改状态为失败
        P2pFinancingInformation p2pFI = p2pFinancingInformationService.get(p2pBeforeMatchDebtState.getFinacingInformationId());
        p2pFI.setCurrentStage(String.valueOf(FinancingState.FINANCING_FAILURE));
        p2pFinancingInformationService.save(p2pFI);
        addMessage(redirectAttributes, "流标结项成功");
        return "redirect:" + Global.getAdminPath() + "/financing/middleMatchList/?repage";

    }

	
	/*
	 * *********************************************************
	 * 
	 *  撮合后
	 * 
	 * **********************************************************
	 */

    //撮合后list
    @RequiresPermissions("financing:financing:view")
    @RequestMapping(value = "afterMatchList")
    public String afterMatchList(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = financingService.findAfterMatchList(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "modules/financing/afterMatch/p2pAfterMatchDebtList";
    }

    /**
     * 撮合前---评级结果查询
     *
     * @author Chace
     */
    @RequestMapping("findLevelResult")
    public String findLevelResult(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = p2pFinancingInformationService.findLevelResultPage(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "/p2p/back/financing/before/levelResultList";
    }

    /**
     * 撮合前--报告发布页面
     *
     * @author Chace
     */
    @RequestMapping("toRecordPublicPage")
    public String toRecordPublicPage(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        p2pFinancingInformation = p2pFinancingInformationService.recordPublishPage(p2pFinancingInformation);
        model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        return "/p2p/back/financing/before/recordPublishPage";
    }

    /**
     * 撮合前--报告发布
     *
     * @author Chace
     */
    @RequestMapping("publicRecord")
    public String publicRecord(P2pFinancingInformation p2pFinancingInformation) {
        P2pFinancingRatingInfo p2pFinancingRatingInfo = new P2pFinancingRatingInfo();
        User user = UserUtils.getUser();
        p2pFinancingRatingInfo = p2pFinancingInformation.getP2pFinancingRatingInfo();
        p2pFinancingInformation.setCurrentStage(String.valueOf(RatingLevelUtils.determineRatingLevel(p2pFinancingRatingInfo.getRatingLevel(), p2pFinancingInformation.getIsHandRateCost())));
        p2pFinancingInformationService.publishRecord(p2pFinancingInformation);
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
        p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());
        p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());
        p2pBeforeMatchDebtState.setStateTime(new Date());
        p2pBeforeMatchDebtState.setOperatorId(user.getId());
        p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
        return "redirect:" + Global.getAdminPath() + "/financing/findLevelResult/?repage";
    }

}
