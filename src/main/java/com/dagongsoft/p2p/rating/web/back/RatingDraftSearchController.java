/**
 *
 */
package com.dagongsoft.p2p.rating.web.back;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.rating.service.back.RatingDraftSearchService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 评级初稿查询
 *
 * @author Zeus
 * @2017-3-2
 */
@Controller
@RequestMapping(value = "${adminPath}/rating/ratingDraftSearch")
public class RatingDraftSearchController extends BaseController {
    @Resource
    private RatingDraftSearchService ratingDraftSearchService;

    /**
     * 评级初稿查询页面
     *
     * @param p2pRatingServiceInfo
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = {"list", ""})
    public String list(P2pRatingServiceInfo p2pRatingServiceInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRatingServiceInfo> page = ratingDraftSearchService.getRatingDraftSearchPage(new Page<P2pRatingServiceInfo>(request, response), p2pRatingServiceInfo);
        model.addAttribute("page", page);
        return "p2p/back/rating/ratingDraftSearchList";
    }

    /**
     * 用户异议查看
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "userObjectionView")
    public String userObjectionView(String rsiId, Model model) {
        P2pRatingResultView p2pRatingResultView = ratingDraftSearchService.getUserObjectionView(rsiId);
        model.addAttribute("p2pRatingResultView", p2pRatingResultView);
        return "p2p/back/rating/userObjectionView";
    }
}
