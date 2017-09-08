package com.dagongsoft.p2p.rating.web.front;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.config.service.front.IndustryConfigService;
import com.dagongsoft.p2p.document.entity.P2pSupplyDocumentUpload;
import com.dagongsoft.p2p.document.service.DocumentUploadService;
import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.feedback.service.front.RateReceiptService;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.financing.service.front.PayRatingFeeService;
import com.dagongsoft.p2p.financing.service.front.ViewDebtDetailsService;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.rating.service.P2pRatingServiceInfoService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.utils.AreaUtils;
import com.dagongsoft.p2p.utils.PermissionUtils;
import com.dagongsoft.p2p.utils.RatingState;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.interceptor.Token;

@Controller
@RequestMapping(value = "${adminPath}/rating/front")
public class FrontRatingController extends BaseController {

    @Resource
    private P2pRatingServiceInfoService p2pRatingServiceInfoService;
    @Resource
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Resource
    private DocumentUploadService documentUploadService;
    @Resource
    private PayRatingFeeService payRatingFeeService;
    @Resource
    private ViewDebtDetailsService viewDebtDetailsService;
    @Resource
    private RateReceiptService rateReceiptService;
    @Resource
    private IndustryConfigService industryConfigService;

    /**
     * 处理评级申请请求
     *
     * @param session
     * @param p2pEnterpriseCertify
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "saveRatingApplication")
    public String saveRatingApplication(HttpSession session, P2pEnterpriseCertify p2pEnterpriseCertify) {
        User user = (User) session.getAttribute("user");
        p2pRatingServiceInfoService.saveRatingApplication(p2pEnterpriseCertify, user);
        return "redirect:" + adminPath + "/rating/p2pRatingServiceInfo/ctrlRatingFlow";
    }

    /**
     * 处理评级材料提交申请
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "doDocApp")
//	@Token(remove = true)
    public String doDocApp(HttpSession session, String financingInformationId, Integer stage) {
        try {
            List<Integer> list2 = new ArrayList<Integer>();
            list2.add(RatingState.FINISH_ENTERPRISE_DOCUMENTS);
            list2.add(RatingState.FINISH_RATING_APPLICATION);
            if (!PermissionUtils.ctrlPermission3(session, list2)) {
                return "redirect:" + frontPath;
            }
            P2pRatingServiceInfo p2p = new P2pRatingServiceInfo(financingInformationId);
            p2p.setCurrentStage(Integer.toString(RatingState.FINISH_FINANCE_DOCUMENTS));
            if (stage != null && stage == 1) {
                p2p.setCurrentStage(Integer.toString(RatingState.FINISH_ENTERPRISE_DOCUMENTS));
                p2pRatingServiceInfoService.updateRatingServiceInfo(p2p);
                return "redirect:" + adminPath + "/rating/p2pRatingServiceInfo/ctrlRatingFlow";
            } else {
                p2pRatingServiceInfoService.updateRatingServiceInfo(p2p);
                //添加债项进展表信息
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
                p2pBeforeMatchDebtState.setFinacingInformationId(p2p.getId());
                p2pBeforeMatchDebtState.setProgressStage(p2p.getCurrentStage());
                p2pBeforeMatchDebtState.setStateTime(new Date());
                p2pBeforeMatchDebtStateService.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
                return "modules/front/financing/applicationDocumentsSuccess";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 查询评级申请填写的信息
     *
     * @param model
     * @param financingInformationId
     * @param rateDocumentId
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "preUpdateApp")
    @Token(save = true)
    public String preUpdateApp(Model model, String financingInformationId, String rateDocumentId) {
        P2pRatingServiceInfo p2pRatingServiceInfo = p2pRatingServiceInfoService.findAppInfoById(financingInformationId);
        model.addAttribute("p2p", p2pRatingServiceInfo);
        model.addAttribute("provincialAreaList", AreaUtils.loadProvincialArea());//加载省级区域
        model.addAttribute("industryList", industryConfigService.findTopCategory());
        model.addAttribute("rateDocumentId", rateDocumentId);
        return "p2p/front/rating/updateRatingApplication";
    }

    /**
     * 修改评级申请填写的信息
     *
     * @param p2pFinancingInformation
     * @param p2pEnterpriseCertify
     * @param session
     * @param rateDocumentId
     * @return
     */
    @RequestMapping(value = "updateAppInfo")
    @Token(remove = false)
    public String updateAppInfo(P2pEnterpriseCertify p2pEnterpriseCertify, HttpSession session, String rateDocumentId) {
        User user = (User) session.getAttribute("user");
        p2pEnterpriseCertify.setId(null);
        p2pRatingServiceInfoService.updateAppInfo(p2pEnterpriseCertify, user, rateDocumentId);
        return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=myFinancApp";
    }

    /**
     * 查看评级申请填写的信息
     *
     * @param model
     * @param financingInformationId
     * @param rateDocumentId
     * @return
     */
    @RequestMapping(value = "viewAppInfo")
    @Token(save = true)
    public String viewAppInfo(Model model, String financingInformationId, String rateDocumentId) {
        P2pRatingServiceInfo p2pRatingServiceInfo = p2pRatingServiceInfoService.findAppInfoById(financingInformationId);
        P2pEnterpriseCertify enterprise = p2pRatingServiceInfo.getP2pEnterpriseCertify();
        enterprise.setProvincialArea(AreaUtils.findById(enterprise.getProvincialArea()).getName());
        enterprise.setMunicipalArea(AreaUtils.findById(enterprise.getMunicipalArea()).getName());
        model.addAttribute("p2p", p2pRatingServiceInfo);
        model.addAttribute("industryList", industryConfigService.findTopCategory());
        return "p2p/front/rating/viewRatingApplication";
    }

    /**
     * 处理重新提交材料变更状态
     *
     * @param id
     * @author Quincy
     */
    @RequestMapping(value = "updateDocState")
    @ResponseBody
    public String updateDocState(@RequestParam String id, HttpSession session) {
        try {
            if (!PermissionUtils.ctrlPermission3(session, RatingState.RATING_DOCUMENTS_FAIL)) {
                return "redirect:" + frontPath;
            }
            P2pRatingServiceInfo p2p = new P2pRatingServiceInfo(id);
            p2p.setCurrentStage(Integer.toString(RatingState.FINISH_FINANCE_DOCUMENTS));
            p2pRatingServiceInfoService.updateRatingServiceInfo(p2p);
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
            p2pBeforeMatchDebtState.setFinacingInformationId(p2p.getId());
            p2pBeforeMatchDebtState.setProgressStage(p2p.getCurrentStage());
            p2pBeforeMatchDebtState.setStateTime(new Date());
            p2pBeforeMatchDebtStateService.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 处理支付评级费请求（评级流程）
     *
     * @param financingInformationId
     * @param session
     * @author Quincy
     */
    @RequestMapping(value = "payRatingFee")
    @ResponseBody
    public void payRatingFee(@RequestParam String financingInformationId, HttpSession session) {
        if (PermissionUtils.ctrlPermission3(session, RatingState.NEED_PAY_RATING_FEE)) {
            boolean flag = true;
            if (flag) {
                payRatingFeeService.payRatingFee2(financingInformationId);
            }
        }
    }

    /**
     * 跳转到提交补充材料页面（评级流程）
     *
     * @param session
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "preSupplyDocument")
    @Token(save = true)
    public String preSupplyDocument(HttpSession session, Model model, String financingInformationId) {
        try {
            List<Integer> list2 = new ArrayList<Integer>();
            list2.add(RatingState.CREDIT_RATING_ING);
            list2.add(RatingState.REVIEW_RATING);
            if (!PermissionUtils.ctrlPermission3(session, list2)) {
                return "redirect:" + frontPath;
            }
            model.addAttribute("financingInformationId", financingInformationId);
            return "p2p/front/rating/supplyDocuments";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 处理补充材料提交（评级流程）
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "submitSupply")
    @Token(remove = true)
    public String submitSupply(HttpSession session, String financingInformationId) {
        try {
            List<Integer> list2 = new ArrayList<Integer>();
            list2.add(RatingState.CREDIT_RATING_ING);
            list2.add(RatingState.REVIEW_RATING);
            if (!PermissionUtils.ctrlPermission3(session, list2)) {
                return "redirect:" + frontPath;
            }
            P2pRatingServiceInfo p2p = new P2pRatingServiceInfo(financingInformationId);
            p2p.setIsSupply(0);
            documentUploadService.supplySubmit(null, p2p);
            return "redirect:" + adminPath + "/rating/p2pRatingServiceInfo/ctrlRatingFlow";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 加载评级结果意见书（评级流程）
     *
     * @param financingInforamtionId
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "viewRatingFeedback")
    @Token(save = true)
    public String viewRatingFeedback(Model model, HttpSession session, String financingInformationId) {
        try {
            if (!PermissionUtils.ctrlPermission3(session, RatingState.NEED_CONFIRM_RESULT)) {
                return "redirect:" + frontPath;
            }
            P2pFinancingRatingInfo p2p = viewDebtDetailsService.findRatingInfoByRid(financingInformationId);
            model.addAttribute("rating", p2p);
            return "p2p/front/rating/ratingFeedback";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 处理上传复评材料请求（评级流程）
     *
     * @param model
     * @param multipartHttpServletRequest
     * @param session
     * @param p2pRatingResultView
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "uploadReviewDoc")
    public String uploadReviewDoc(Model model, MultipartHttpServletRequest multipartHttpServletRequest,
                                  HttpSession session, P2pRatingResultView p2pRatingResultView) {
        try {
            if (!PermissionUtils.ctrlPermission3(session, RatingState.NEED_CONFIRM_RESULT)) {
                return "redirect:" + frontPath;
            }
            User user = (User) session.getAttribute("user");
            rateReceiptService.uploadReviewDoc(multipartHttpServletRequest, user, p2pRatingResultView);
            return viewRatingFeedback(model, session, p2pRatingResultView.getFinancingInformationId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 提交评级意见反馈（评级流程）
     *
     * @param p2pRatingResultView
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "receiptRecord")
    @Token(remove = false)
    public String receiptRecord(HttpSession session, P2pRatingResultView p2pRatingResultView) {
        try {
            if (!PermissionUtils.ctrlPermission3(session, RatingState.NEED_CONFIRM_RESULT)) {
                return "redirect:" + frontPath;
            }
            p2pRatingServiceInfoService.receiptRecord(p2pRatingResultView);
            return "redirect:" + adminPath + "/rating/p2pRatingServiceInfo/ctrlRatingFlow";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 查看评级规则
     *
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "viewRatingRules")
    public String viewRatingRules() {
        return "p2p/front/rating/ratingRules";
    }
}
