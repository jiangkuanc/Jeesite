package com.dagongsoft.p2p.feedback.web.front;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.feedback.service.front.RateReceiptService;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.service.front.ViewDebtDetailsService;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.PermissionUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.interceptor.Token;

@Controller
@RequestMapping(value = "${adminPath}/feedback/RateReceipt")
public class RateReceiptController extends BaseController {

    @Autowired
    private ViewDebtDetailsService viewDebtDetailsService;

    @Autowired
    private RateReceiptService rateReceiptService;

    /**
     * 加载评级结果意见书
     *
     * @param financingInforamtionId
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "viewRatingFeedback")
    @Token(save = true)
    public String viewRatingFeedback(Model model, HttpSession session, String financingInformationId) {
        try {
            if (PermissionUtils.ctrlPermission(session, null, FinancingState.RATING_RESULTS_TO_BE_CONFIRMED) == false) {
                return "redirect:" + frontPath;
            }
            P2pFinancingRatingInfo p2p = viewDebtDetailsService.findRatingInfoByFid(financingInformationId);
            model.addAttribute("rating", p2p);
            return "p2p/front/feedback/ratingFeedback";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 提交评级意见反馈
     *
     * @param p2pRatingResultView
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "receiptRecord")
    @Token(remove = false)
    public String receiptRecord(HttpSession session, P2pRatingResultView p2pRatingResultView) {
        try {
            if (PermissionUtils.ctrlPermission(session, null, FinancingState.RATING_RESULTS_TO_BE_CONFIRMED) == false) {
                return "redirect:" + frontPath;
            }
            rateReceiptService.receiptRecord(p2pRatingResultView);
            return "redirect:" + Global.getAdminPath() + "/user/p2pUserInformation/accountPermission?mode=myFinancApp";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 处理上传复评材料请求
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
            if (PermissionUtils.ctrlPermission(session, null, FinancingState.RATING_RESULTS_TO_BE_CONFIRMED) == false) {
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
}
