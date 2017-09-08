/**
 *
 */
package com.dagongsoft.p2p.rating.web.back;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.dagongsoft.p2p.document.entity.P2pDocumentUploadRecord;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentTemplate;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.document.service.P2pDocumentUploadRecordService;
import com.dagongsoft.p2p.document.service.P2pRateDocumentTemplateService;
import com.dagongsoft.p2p.document.service.P2pRateDocumentUploadService;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.financing.service.P2pPaymentOfRatingCostService;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.rating.service.P2pRatingServiceInfoService;
import com.dagongsoft.p2p.rating.service.back.RatingDocumentAuditService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 评级材料审核
 *
 * @author Zeus
 * @2017-3-2
 */
@Controller
@RequestMapping(value = "${adminPath}/rating/ratingDocumnetAudit")
public class RatingDocumnetAuditController extends BaseController {
    @Resource
    private RatingDocumentAuditService ratingDocumentAuditService;
    @Resource
    private P2pRateDocumentTemplateService p2pRateDocumentTemplateService;
    @Resource
    private P2pRateDocumentUploadService p2pRateDocumentUploadService;
    @Resource
    private P2pDocumentUploadRecordService p2pDocumentUploadRecordService;
    @Resource
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Resource
    private P2pPaymentOfRatingCostService p2pPaymentOfRatingCostService;
    @Resource
    private P2pRatingServiceInfoService p2pRatingServiceInfoService;

    /**
     * 评级材料审核列表
     *
     * @param p2pRatingServiceInfo
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = {"list", ""})
    public String list(P2pRatingServiceInfo p2pRatingServiceInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRatingServiceInfo> page = ratingDocumentAuditService.getRatingDocumnetAuditPage(new Page<P2pRatingServiceInfo>(request, response), p2pRatingServiceInfo);
        model.addAttribute("page", page);
        return "p2p/back/rating/ratingDocumnetAuditList";
    }

    /**
     * 评级材料审核页
     *
     * @param id
     * @param paymentId
     * @param model
     * @return
     */
    @RequestMapping(value = "ratingDocumentAudit")
    public String ratingDocumentAudit(String id, String paymentId, Model model) {
        List<P2pRateDocumentUpload> list = p2pRateDocumentUploadService.findListById(id);
        Map<String, List> mapAll = new LinkedHashMap<String, List>();
        for (P2pRateDocumentUpload p : list) {
            List<P2pDocumentUploadRecord> p2pDocumentUploadRecord = p2pDocumentUploadRecordService.findById(p.getId());
            mapAll.put(p.getRateDocumentTempId(), p2pDocumentUploadRecord);
        }
        //List<P2pRateDocumentTemplate> list2 = p2pRateDocumentTemplateService.findAll();
        String json = JSON.toJSONString(list);
        model.addAttribute("list", list);
        //model.addAttribute("list2", list2);
        model.addAttribute("mapAll", mapAll);
        model.addAttribute("json", json);
        model.addAttribute("financingInformationId", id);
        model.addAttribute("paymentId", paymentId);
        return "p2p/back/rating/ratingDocumentAudit";
    }

    /**
     * 评级材料审核查看页
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "ratingDocumentAuditView")
    public String ratingDocumentAuditView(String id, Model model) {
        List<P2pRateDocumentUpload> list = p2pRateDocumentUploadService.findListById(id);
        Map<String, List> mapAll = new LinkedHashMap<String, List>();
        for (P2pRateDocumentUpload p : list) {
            List<P2pDocumentUploadRecord> p2pDocumentUploadRecord = p2pDocumentUploadRecordService.findById(p.getId());
            mapAll.put(p.getRateDocumentTempId(), p2pDocumentUploadRecord);
        }
        List<P2pBeforeMatchDebtState> p2pBeforeMatchDebtState = p2pBeforeMatchDebtStateService.findById3(id);
        /*List<P2pRateDocumentTemplate> list2 = p2pRateDocumentTemplateService.findAll();
        String prefix = id.substring(0, 3);
		if(list != null && list.size() > 0){
			for(P2pRateDocumentTemplate p2p : list2){
				if(prefix.equals("DG7") && ("借贷产品基本信息").equals(p2p.getTempName())){
					p2p.setTempName("评级项目基本信息");
				}
			}
		}*/
        model.addAttribute("list", list).addAttribute("mapAll", mapAll).addAttribute("list3", p2pBeforeMatchDebtState);
        model.addAttribute("financingInformationId", id);
        return "p2p/back/rating/ratingDocumentAuditView";
    }

    /**
     * 评级材料审核
     *
     * @param p2pBeforeMatchDebtState
     * @param yesOrNo
     * @param p2pFinancingInformation
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "audit")
    @Transactional(readOnly = false)
    public String audit(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, String progress_stage, String finacingInformationId, String paymentId, RedirectAttributes redirectAttributes) {
        Date date = new Date();
        //1是0否
        if ("1".equals(progress_stage)) {
            P2pRatingServiceInfo p2pRatingServiceInfo = new P2pRatingServiceInfo();
            p2pRatingServiceInfo.setId(finacingInformationId);
            p2pBeforeMatchDebtState.setStateTime(date);
            p2pRatingServiceInfo.setCurrentStage("300");//审核通过状态变为签约付费
            p2pRatingServiceInfoService.updateRatingServiceInfo(p2pRatingServiceInfo);

            //新建债项状态进展轨迹记录
            p2pBeforeMatchDebtState.setProgressStage("300");//审核通过状态变为签约付费
            p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            P2pPaymentOfRatingCost p2pPaymentOfRatingCost = new P2pPaymentOfRatingCost();
            p2pPaymentOfRatingCost.setId(IdGen.uuid());
            p2pPaymentOfRatingCost.setFinancingInformationId(finacingInformationId);
            p2pPaymentOfRatingCost.setPaymentId(paymentId);
            p2pPaymentOfRatingCost.setOrderNo(new SimpleDateFormat("yyyyMMddHHmmss").format(date));
            p2pPaymentOfRatingCost.setOrderTime(date);
            p2pPaymentOfRatingCost.setPaymentStatus(0);//付款状态
            p2pPaymentOfRatingCost.setChargingItem("1");
            double d = 5000.00;//评级费
            p2pPaymentOfRatingCost.setPaymentAmount(d);
            p2pPaymentOfRatingCost.setIsNewRecord(true);
            p2pPaymentOfRatingCostService.save(p2pPaymentOfRatingCost);
        }
        if ("0".equals(progress_stage)) {
            //新建债项状态进展轨迹记录
            p2pBeforeMatchDebtState.setStateTime(date);
            p2pBeforeMatchDebtState.setProgressStage("201");//审核不通过状态变为材料初审未通过
            p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            P2pRatingServiceInfo p2pRatingServiceInfo = new P2pRatingServiceInfo();
            p2pRatingServiceInfo.setId(finacingInformationId);
            p2pRatingServiceInfo.setCurrentStage("201");//审核不通过状态变为材料初审未通过
            p2pRatingServiceInfoService.updateRatingServiceInfo(p2pRatingServiceInfo);
        }
        addMessage(redirectAttributes, "操作成功");
        return "redirect:" + Global.getAdminPath() + "/rating/ratingDocumnetAudit/?repage";
    }
}
