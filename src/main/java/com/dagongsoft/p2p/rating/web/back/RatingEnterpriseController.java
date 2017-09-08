/**
 *
 */
package com.dagongsoft.p2p.rating.web.back;

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
import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.investment.service.back.SubscribeRecordService;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.rating.service.back.RatingEnterpriseService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.service.AreaService;

/**
 * 评级企业列表
 *
 * @author Zeus
 * @2017-3-2
 */
@Controller
@RequestMapping(value = "${adminPath}/rating/ratingEnterprise")
public class RatingEnterpriseController extends BaseController {
    @Resource
    private RatingEnterpriseService ratingEnterpriseService;
    @Resource
    private P2pRateDocumentUploadService p2pRateDocumentUploadService;
    @Resource
    private P2pDocumentUploadRecordService p2pDocumentUploadRecordService;
    @Resource
    private P2pRateDocumentTemplateService p2pRateDocumentTemplateService;
    @Resource
    private AreaService areaService;

    /**
     * 评级企业列表
     *
     * @param p2pRatingServiceInfo
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = {"list", ""})
    public String list(P2pRatingServiceInfo p2pRatingServiceInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRatingServiceInfo> page = ratingEnterpriseService.getRatingEnterprisePage(new Page<P2pRatingServiceInfo>(request, response), p2pRatingServiceInfo);
        model.addAttribute("page", page);
        return "p2p/back/rating/ratingEnterpriseList";
    }

    /**
     * 评级支付详情
     *
     * @param rsiId
     * @param model
     * @return
     */
    @RequestMapping(value = {"ratingPaydetails"})
    public String ratingPaydetails(String rsiId, String financingName, Model model) {
        P2pPaymentOfRatingCost p2pPaymentOfRatingCost = ratingEnterpriseService.getRatingPaydetails(rsiId);
        model.addAttribute("p2pPaymentOfRatingCost", p2pPaymentOfRatingCost);
        model.addAttribute("financingName", financingName);
        return "p2p/back/rating/ratingPaydetails";
    }

    /**
     * 评级项目详情
     *
     * @param id(评级项目id)
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "ratingDetails")
    public String debtDetails(String id, Model model) {
        try {
            P2pRatingServiceInfo p2pRatingServiceInfo = ratingEnterpriseService.getRatingDetails(id);
            String area = null;
            if (p2pRatingServiceInfo.getP2pEnterpriseCertify() != null) {
                if (p2pRatingServiceInfo.getP2pEnterpriseCertify().getProvincialArea() != null) {
                    area = areaService.get(p2pRatingServiceInfo.getP2pEnterpriseCertify().getProvincialArea()).getName();
                }
                if (p2pRatingServiceInfo.getP2pEnterpriseCertify().getMunicipalArea() != null) {
                    area += areaService.get(p2pRatingServiceInfo.getP2pEnterpriseCertify().getMunicipalArea()).getName();
                }

            }
            model.addAttribute("area", area);
            model.addAttribute("p2pRatingServiceInfo", p2pRatingServiceInfo);

            //材料审核
            List<P2pRateDocumentUpload> list = p2pRateDocumentUploadService.findListById(id);
            Map<String, List> mapAll = new LinkedHashMap<String, List>();
            for (P2pRateDocumentUpload p : list) {
                List<P2pDocumentUploadRecord> p2pDocumentUploadRecord = p2pDocumentUploadRecordService.findById(p.getId());
                mapAll.put(p.getRateDocumentTempId(), p2pDocumentUploadRecord);
            }
            //List<P2pRateDocumentTemplate> list2 = p2pRateDocumentTemplateService.findAll();
            model.addAttribute("list", list).addAttribute("mapAll", mapAll);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/rating/ratingDetails";
    }
}
