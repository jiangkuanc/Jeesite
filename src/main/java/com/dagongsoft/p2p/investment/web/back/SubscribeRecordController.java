package com.dagongsoft.p2p.investment.web.back;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.document.entity.P2pDocumentUploadRecord;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentTemplate;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.document.service.P2pDocumentUploadRecordService;
import com.dagongsoft.p2p.document.service.P2pRateDocumentTemplateService;
import com.dagongsoft.p2p.document.service.P2pRateDocumentUploadService;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.investment.service.back.SubscribeRecordService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.service.AreaService;

/**
 * 投资管理：认购记录Controller
 *
 * @author Zeus
 * @2016-11-4
 */
@Controller
@RequestMapping(value = "${adminPath}/investment/subscribeRecord")
public class SubscribeRecordController extends BaseController {

    @Resource
    private SubscribeRecordService subscribeRecordService;
    @Resource
    private P2pRateDocumentUploadService p2pRateDocumentUploadService;
    @Resource
    private P2pDocumentUploadRecordService p2pDocumentUploadRecordService;
    @Resource
    private P2pRateDocumentTemplateService p2pRateDocumentTemplateService;
    @Resource
    private AreaService areaService;

    /**
     * 认购记录
     *
     * @param p2pInvestmentInformation
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "subscribeRecordList")
    public String subscribeRecordList(P2pInvestmentInformation p2pInvestmentInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pInvestmentInformation> page = subscribeRecordService.getSubscribeRecordPage(new Page<P2pInvestmentInformation>(request, response), p2pInvestmentInformation);

            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/investment/subscribeRecord/p2pSubscribeRecordList";
    }


    /**
     * 债项详情
     *
     * @param id(融资信息id)
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "debtDetails")
    public String debtDetails(String id, Model model) {
        try {
            P2pFinancingInformation p2pFinancingInformation = subscribeRecordService.getDebtDetails(id);
            String area = null;
            if (p2pFinancingInformation.getP2pEnterpriseCertify() != null) {
                if (p2pFinancingInformation.getP2pEnterpriseCertify().getProvincialArea() != null) {
                    area = areaService.get(p2pFinancingInformation.getP2pEnterpriseCertify().getProvincialArea()).getName();
                }
                if (p2pFinancingInformation.getP2pEnterpriseCertify().getMunicipalArea() != null) {
                    area += areaService.get(p2pFinancingInformation.getP2pEnterpriseCertify().getMunicipalArea()).getName();
                }

            }
            model.addAttribute("area", area);
            model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);

            //材料审核
            List<P2pRateDocumentUpload> list = p2pRateDocumentUploadService.findListById(id);
            Map<String, List> mapAll = new LinkedHashMap<String, List>();
            for (P2pRateDocumentUpload p : list) {
                List<P2pDocumentUploadRecord> p2pDocumentUploadRecord = p2pDocumentUploadRecordService.findById(p.getId());
                mapAll.put(p.getRateDocumentTempId(), p2pDocumentUploadRecord);
            }
//			List<P2pRateDocumentTemplate> list2 = p2pRateDocumentTemplateService.findAll();
            model.addAttribute("list", list).addAttribute("mapAll", mapAll);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/investment/subscribeRecord/p2pDebtDetails";
    }
}
