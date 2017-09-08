package com.dagongsoft.p2p.financing.web.front;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.config.service.front.IndustryConfigService;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.front.ViewDebtDetailsService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.utils.AreaUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.interceptor.Token;

@Controller
@RequestMapping(value = "${adminPath}/application")
public class FinancingApplicationController extends BaseController {

    @Autowired
    private ViewDebtDetailsService viewRatingReportService;
    @Autowired
    private IndustryConfigService industryConfigService;

    @RequestMapping(value = "preUpdateApp")
    @Token(save = true)
    public String preUpdateApp(Model model, String financingInformationId, String rateDocumentId) {
        P2pFinancingInformation p2pFinancingInformation = viewRatingReportService.findFinancingAppInfo(financingInformationId);
        model.addAttribute("p2p", p2pFinancingInformation);
        model.addAttribute("provincialAreaList", AreaUtils.loadProvincialArea());//加载省级区域
        model.addAttribute("industryList", industryConfigService.findTopCategory());
        model.addAttribute("rateDocumentId", rateDocumentId);
        return "modules/front/financing/updateFinancingApplication";
    }

    @RequestMapping(value = "updateAppInfo")
    @Token(remove = false)
    public String updateAppInfo(P2pFinancingInformation p2pFinancingInformation, P2pEnterpriseCertify p2pEnterpriseCertify,
                                HttpSession session, String rateDocumentId) {
        User user = (User) session.getAttribute("user");
        p2pEnterpriseCertify.setId(null);
        viewRatingReportService.updateAppInfo(p2pFinancingInformation, p2pEnterpriseCertify, user, rateDocumentId);
        return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=myFinancApp";
    }

    /**
     * 查看融资申请信息
     *
     * @param model
     * @param financingInformationId
     * @param rateDocumentId
     * @return
     */
    @RequestMapping(value = "viewAppInfo")
    public String viewAppInfo(Model model, String financingInformationId, String rateDocumentId) {
        P2pFinancingInformation p2pFinancingInformation = viewRatingReportService.findFinancingAppInfo(financingInformationId);
        P2pEnterpriseCertify enterprise = p2pFinancingInformation.getP2pEnterpriseCertify();
        enterprise.setProvincialArea(AreaUtils.findById(enterprise.getProvincialArea()).getName());
        enterprise.setMunicipalArea(AreaUtils.findById(enterprise.getMunicipalArea()).getName());
        model.addAttribute("p2p", p2pFinancingInformation);
        return "modules/front/financing/viewFinancingApplication";
    }
}
