package com.dagongsoft.p2p.document.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.document.entity.P2pDocumentUploadRecord;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentTemplate;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.document.entity.P2pSupplyDocumentUpload;
import com.dagongsoft.p2p.document.service.DocumentUploadService;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.PermissionUtils;
import com.dagongsoft.p2p.utils.RatingState;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.interceptor.Token;

/**
 * 融资材料上传Controller
 *
 * @author qichao
 */
@Controller
@RequestMapping(value = "${adminPath}/document")
public class DocumentUploadController extends BaseController {

    @Autowired
    private DocumentUploadService documentUploadService;
    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Autowired
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Autowired
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;

    /**
     * 处理评级材料上传
     *
     * @param session
     * @param multipartRequest
     * @param p2pRateDocumentUpload
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "documentUpload")
    @ResponseBody
    public String documentUpload(HttpSession session, MultipartHttpServletRequest multipartRequest, P2pRateDocumentUpload p2pRateDocumentUpload) {
        try {
            List<Integer> list2 = new ArrayList<Integer>();
            list2.add(FinancingState.COMMITED_NON_FINANC_DOCUMENTS);
            list2.add(FinancingState.DOCUMENTS_AUDIT_FAILURE);
            list2.add(FinancingState.FINANCING_APPLICATION_FINISHED);
            List<Integer> list1 = new ArrayList<Integer>();
            list1.add(RatingState.FINISH_RATING_APPLICATION);
            list1.add(RatingState.FINISH_ENTERPRISE_DOCUMENTS);
            list1.add(RatingState.RATING_DOCUMENTS_FAIL);
            if (!PermissionUtils.ctrlPermission(session, null, list2) && !PermissionUtils.ctrlPermission3(session, list1)) {
                return "redirect:" + frontPath;
            }
            List<String> list = new ArrayList<String>();
            User user = (User) session.getAttribute("user");
            List<P2pDocumentUploadRecord> list0 = documentUploadService.documentUpload(multipartRequest, p2pRateDocumentUpload, user);
            for (P2pDocumentUploadRecord doc : list0) {
                list.add(doc.getFileId());
            }
            return JsonMapper.toJsonString(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 处理融资材料提交申请
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "doDocApp")
    @Token(remove = true)
    public String doDocApp(HttpSession session, String financingInformationId, Integer stage) {
        try {
            List<Integer> list2 = new ArrayList<Integer>();
            list2.add(FinancingState.COMMITED_NON_FINANC_DOCUMENTS);
            list2.add(FinancingState.FINANCING_APPLICATION_FINISHED);
            if (!PermissionUtils.ctrlPermission(session, null, list2)) {
                return "redirect:" + frontPath;
            }
            P2pFinancingInformation p2p = new P2pFinancingInformation(financingInformationId);
            p2p.setCurrentStage(Integer.toString(FinancingState.DOCUMENTS_AUDIT));
            if (stage != null && stage == 1) {
                p2p.setCurrentStage(Integer.toString(FinancingState.COMMITED_NON_FINANC_DOCUMENTS));
                p2pFinancingInformationService.updateCurrentStage(p2p);
                return "redirect:" + Global.getAdminPath() + "/user/p2pUserInformation/accountPermission?mode=myFinancApp";
            } else {
                p2pFinancingInformationService.updateCurrentStage(p2p);
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
     * 通过ID删除材料
     *
     * @param id
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "delDocById")
    @ResponseBody
    public String delDocById(@RequestParam String fileId, HttpSession session) {
        try {
            List<Integer> list2 = new ArrayList<Integer>();
            list2.add(FinancingState.COMMITED_NON_FINANC_DOCUMENTS);
            list2.add(FinancingState.DOCUMENTS_AUDIT_FAILURE);
            list2.add(FinancingState.FINANCING_APPLICATION_FINISHED);
            list2.add(FinancingState.CREDIT_RATING_ING);
            List<Integer> list = new ArrayList<Integer>();
            list.add(RatingState.FINISH_RATING_APPLICATION);
            list.add(RatingState.FINISH_ENTERPRISE_DOCUMENTS);
            list.add(RatingState.RATING_DOCUMENTS_FAIL);
            list.add(RatingState.CREDIT_RATING_ING);
            if (!PermissionUtils.ctrlPermission(session, null, list2) &&
                    !PermissionUtils.ctrlPermission3(session, list)) {
                return "redirect:" + frontPath;
            }
            documentUploadService.delDocById(fileId);
            return JsonMapper.toJsonString(Boolean.TRUE);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过ID修改材料驳回状态
     *
     * @param id
     * @author Quincy
     */
    @RequestMapping(value = "updateIsReject")
    @ResponseBody
    public String updateIsReject(@RequestParam String id, HttpSession session) {
        try {
            List<Integer> list = new ArrayList<Integer>();
            list.add(RatingState.RATING_DOCUMENTS_FAIL);
            if (!PermissionUtils.ctrlPermission(session, null, FinancingState.DOCUMENTS_AUDIT_FAILURE) &&
                    !PermissionUtils.ctrlPermission3(session, list)) {
                return "redirect:" + frontPath;
            }
            documentUploadService.updateIsReject(id);
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 修改债项状态为待审核，审核失败时调用
     *
     * @param id
     * @author Quincy
     */
    @RequestMapping(value = "updateFinancState")
    @ResponseBody
    public String updateFinancState(@RequestParam(value = "id") String id, HttpSession session) {
        try {
            if (!PermissionUtils.ctrlPermission(session, null, FinancingState.DOCUMENTS_AUDIT_FAILURE)) {
                return "redirect:" + frontPath;
            }
            P2pFinancingInformation p2p = new P2pFinancingInformation(id);
            p2p.setCurrentStage(Integer.toString(FinancingState.DOCUMENTS_AUDIT));
            p2pFinancingInformationService.updateCurrentStage(p2p);
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
     * 跳转到提交补充材料页面
     *
     * @param session
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "preSupplyDocument")
    @Token(save = true)
    public String preSupplyDocument(HttpSession session, Model model, String financingInformationId) {
        try {
            List<Integer> list1 = new ArrayList<>();
            list1.add(FinancingState.CREDIT_RATING_ING);
            list1.add(FinancingState.REVIEW_ING);
            if (!PermissionUtils.ctrlPermission(session, null, list1)) {
                return "redirect:" + frontPath;
            }
            model.addAttribute("financingInformationId", financingInformationId);
            return "modules/front/financing/supplyDocuments";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 上传补充材料
     *
     * @param session
     * @param multipartHttpServletRequest
     * @param p2pSupplyDocumentUpload
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "uploadSupply")
    @ResponseBody
    public String uploadSupply(HttpSession session, MultipartHttpServletRequest multipartHttpServletRequest,
                               P2pSupplyDocumentUpload p2pSupplyDocumentUpload) {
        try {
            List<Integer> list1 = new ArrayList<Integer>();
            list1.add(FinancingState.CREDIT_RATING_ING);
            list1.add(FinancingState.REVIEW_ING);
            List<Integer> list2 = new ArrayList<Integer>();
            list2.add(RatingState.CREDIT_RATING_ING);
            list2.add(RatingState.REVIEW_RATING);
            if (!PermissionUtils.ctrlPermission(session, null, list1) && !PermissionUtils.ctrlPermission3(session, list2)) {
                return null;
            }
            User user = (User) session.getAttribute("user");
            List<P2pDocumentUploadRecord> list0 = documentUploadService.supplyUpload(multipartHttpServletRequest, p2pSupplyDocumentUpload, user);
            List<String> list = new ArrayList<String>();
            for (P2pDocumentUploadRecord doc : list0) {
                list.add(doc.getFileId());
            }
            return JsonMapper.toJsonString(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 提交补充材料
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "submitSupply")
    @Token(remove = true)
    public String submitSupply(HttpSession session, String financingInformationId) {
        try {
            List<Integer> list1 = new ArrayList<Integer>();
            list1.add(FinancingState.CREDIT_RATING_ING);
            list1.add(FinancingState.REVIEW_ING);
            if (PermissionUtils.ctrlPermission(session, null, list1) == false) {
                return "redirect:" + frontPath;
            }
            P2pFinancingInformation p2p = new P2pFinancingInformation(financingInformationId);
            p2p.setIsSupply(0);
            documentUploadService.supplySubmit(p2p, null);
            return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=myFinancApp";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 加载材料模板
     *
     * @param financingInformationId
     * @param type
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "loadDocumentTemp")
    @ResponseBody
    public String loadDocumentTemp(HttpSession session, String type) {
        List<Integer> list1 = new ArrayList<Integer>();
        list1.add(FinancingState.COMMITED_NON_FINANC_DOCUMENTS);
        list1.add(FinancingState.FINANCING_APPLICATION_FINISHED);
        List<Integer> list2 = new ArrayList<Integer>();
        list2.add(RatingState.FINISH_RATING_APPLICATION);
        list2.add(RatingState.FINISH_ENTERPRISE_DOCUMENTS);
        if (!PermissionUtils.ctrlPermission(session, null, list1) && !PermissionUtils.ctrlPermission3(session, list2)) {
            return null;
        }
        User user = (User) session.getAttribute("user");
        P2pEnterpriseCertify enterprise = p2pEnterpriseCertifyService.findP2pEnterpriseCertifyByUid(user);
        String industryCode = enterprise.getIndustryCode();
        if (!"C".equals(industryCode) && !"F".equals(industryCode) && !"L".equals(industryCode) && !"M".equals(industryCode)) {
            industryCode = "0";
        }
        List<P2pRateDocumentTemplate> list = documentUploadService.findListByTypeAndIndustry(Integer.valueOf(type), industryCode);

        return JsonMapper.toJsonString(list);
    }

    /**
     * 加载已上传材料
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "loadRateDocumentList")
    @ResponseBody
    public String loadRateDocumentList(HttpSession session, String financingInformationId) {
        List<Integer> list1 = new ArrayList<Integer>();
        list1.add(FinancingState.COMMITED_NON_FINANC_DOCUMENTS);
        list1.add(FinancingState.FINANCING_APPLICATION_FINISHED);
        List<Integer> list2 = new ArrayList<Integer>();
        list2.add(RatingState.FINISH_RATING_APPLICATION);
        list2.add(RatingState.FINISH_ENTERPRISE_DOCUMENTS);
        if (!PermissionUtils.ctrlPermission(session, null, list1) && !PermissionUtils.ctrlPermission3(session, list2)) {
            return null;
        }
        List<P2pRateDocumentUpload> list = documentUploadService.findRateDocumentList(financingInformationId);
        return JsonMapper.toJsonString(list);
    }

    /**
     * 加载补充材料模板
     *
     * @param financingInformationId
     * @param type
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "loadSupplyTemp")
    @ResponseBody
    public String loadSupplyTemp(HttpSession session, String financingInformationId) {
        List<Integer> list1 = new ArrayList<Integer>();
        list1.add(FinancingState.CREDIT_RATING_ING);
        list1.add(FinancingState.REVIEW_ING);
        List<Integer> list2 = new ArrayList<Integer>();
        list2.add(RatingState.CREDIT_RATING_ING);
        list2.add(RatingState.REVIEW_RATING);
        if (!PermissionUtils.ctrlPermission(session, null, list1) && !PermissionUtils.ctrlPermission3(session, list2)) {
            return null;
        }
        String industryCode = documentUploadService.findSupplyIndustryByProjectId(financingInformationId);
        industryCode = industryCode.substring(0, 1);
        if (!"C".equals(industryCode) && !"F".equals(industryCode) && !"L".equals(industryCode) && !"M".equals(industryCode)) {
            industryCode = "0";
        }
        List<P2pRateDocumentTemplate> list = documentUploadService.findListByTypeAndIndustry(industryCode);

        return JsonMapper.toJsonString(list);
    }
}
