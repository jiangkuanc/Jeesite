package com.dagongsoft.p2p.financing.web.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.financing.service.front.ViewDebtDetailsService;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 前台评级信息查看Controller
 *
 * @author Quincy
 */
@Controller
@RequestMapping(value = "${adminPath}/DebtDetails")
public class ViewDebtDetailsController extends BaseController {

    @Autowired
    private ViewDebtDetailsService viewRatingReportService;

    /**
     * 根据债项ID将债项状态修改为流标
     *
     * @param financingInformationId
     * @author Quincy
     */
    @RequestMapping(value = "modifyStageIsExpired")
    public String modifyStageIsExpired(String financingInformationId) {
        viewRatingReportService.modifyStageIsExpired(financingInformationId);
        return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission";
    }
}
