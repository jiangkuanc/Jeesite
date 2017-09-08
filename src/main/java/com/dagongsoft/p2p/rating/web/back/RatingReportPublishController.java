/**
 *
 */
package com.dagongsoft.p2p.rating.web.back;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.rating.entity.P2pRatingReportTrading;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.rating.service.P2pRatingReportTradingService;
import com.dagongsoft.p2p.rating.service.P2pRatingServiceInfoService;
import com.dagongsoft.p2p.rating.service.back.RatingReportPublishService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 评级报告发布
 *
 * @author Zeus
 * @2017-3-2
 */
@Controller
@RequestMapping(value = "${adminPath}/rating/ratingReportPublish")
public class RatingReportPublishController extends BaseController {
    @Resource
    private RatingReportPublishService ratingReportPublishService;
    @Resource
    private P2pRatingServiceInfoService p2pRatingServiceInfoService;
    @Resource
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Resource
    private P2pRatingReportTradingService p2pRatingReportTradingService;

    /**
     * 评级报告发布列表页面
     *
     * @param p2pRatingServiceInfo
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = {"list", ""})
    public String list(P2pRatingServiceInfo p2pRatingServiceInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRatingServiceInfo> page = ratingReportPublishService.getRatingReportPublishPage(new Page<P2pRatingServiceInfo>(request, response), p2pRatingServiceInfo);
        model.addAttribute("page", page);
        return "p2p/back/rating/ratingReportPublishList";
    }

    /**
     * 发布
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "publish")
    @Transactional(readOnly = false)
    public String publish(String id) {
        Date date = new Date();

        P2pRatingServiceInfo p2pRatingServiceInfo = new P2pRatingServiceInfo();
        p2pRatingServiceInfo.setId(id);
        p2pRatingServiceInfo.setPublishId(UserUtils.getUser().getId());
        p2pRatingServiceInfo.setPublishTime(date);
        p2pRatingServiceInfo.setCurrentStage("800");
        p2pRatingServiceInfoService.updateRatingServiceInfo(p2pRatingServiceInfo);

        //新建债项状态进展轨迹记录
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
        p2pBeforeMatchDebtState.setProgressStage("800");//审核不通过状态变为材料初审未通过
        p2pBeforeMatchDebtState.setStateTime(date);
        p2pBeforeMatchDebtState.setFinacingInformationId(id);
        p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);

        //评级报告交易记录添加数据
        P2pRatingReportTrading p2pRatingReportTrading = new P2pRatingReportTrading();
        p2pRatingReportTrading.setUserId(p2pRatingServiceInfoService.get(id).getApplicantsId());
        p2pRatingReportTrading.setReportId(p2pRatingServiceInfo.getId());
        p2pRatingReportTrading.setTradingTime(date);
        p2pRatingReportTrading.setReportType(2);
        p2pRatingReportTradingService.save(p2pRatingReportTrading);
        return "redirect:" + Global.getAdminPath() + "/rating/ratingReportPublish/?repage";
    }
}
