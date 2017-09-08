/**
 *
 */
package com.dagongsoft.p2p.financing.web.back.after;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.service.back.after.AfterFinancingService;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.dagongsoft.p2p.utils.ZMath;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 撮合后债项列表Controller
 *
 * @author Zeus
 * @2016-11-10
 */
@Controller
@RequestMapping(value = "${adminPath}/after/financing")
public class AfterFinancingController extends BaseController {

    @Autowired
    private AfterFinancingService afterFinancingService;
    @Resource
    private MoneyService moneyService;

    /**
     * 撮合后债项列表
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "afterFinancingList")
    public String afterFinancingList(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            P2pFinancingRatingInfo p2pFinancingRatingInfo = new P2pFinancingRatingInfo();
            p2pFinancingRatingInfo = p2pFinancingInformation.getP2pFinancingRatingInfo();
            if (p2pFinancingRatingInfo != null) {
                p2pFinancingRatingInfo.setRecommendedRate(ZMath.changeRate(p2pFinancingRatingInfo.getRecommendedRate()));
            }
            p2pFinancingInformation.setP2pFinancingRatingInfo(p2pFinancingRatingInfo);

            Page<P2pFinancingInformation> page = afterFinancingService.getAfterFinancingPage(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
            model.addAttribute("page", page);

            List<P2pFinancingInformation> list = page.getList();
            String json = JsonMapper.toJsonString(list);
            model.addAttribute("json", json);

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return "/p2p/back/financing/after/p2pAfterFinancingList";
    }

    /**
     * 还款计划
     *
     * @param 债项id
     * @param model
     * @return
     */
    @RequestMapping(value = "repaymentPlan")
    public String repaymentPlan(String id, Model model) {
        P2pFinancingInformation p2pFinancingInformation = afterFinancingService.getRepaymentPlanDebtDetails(id);
        List<P2pRepaymentPlan> list = afterFinancingService.getRepaymentPlan(id);
        model.addAttribute("list", list);
        model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        return "/p2p/back/financing/after/p2pRepaymentPlan";
    }

    /**
     * 还款记录
     *
     * @param 债项id
     * @param model
     * @return
     */
    @RequestMapping(value = "repaymentRecord")
    public String repaymentRecord(String id, Model model) {
        try {
            List<P2pRepaymentPlan> list = afterFinancingService.getRepaymentRecord(id);
            model.addAttribute("list", list);

            P2pFinancingInformation p2pFinancingInformation = afterFinancingService.getRepaymentPlanDebtDetails(id);
            model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
            //应还款总额（元）(从表中查出)
            Double a1 = 0.0;
            for (P2pRepaymentPlan p : list) {
                a1 = ZMath.add(a1, p.getPlanRepaymentPrincipal());
                a1 = ZMath.add(a1, p.getPlanRepaymentInterest());
                a1 = ZMath.add(a1, p.getFine());
            }
            a1 = ZMath.round(a1, 2);
            model.addAttribute("a1", a1);
            //已还金额（元）
            Double a2 = moneyService.DebtHasRepayment(id);
            model.addAttribute("a2", a2);
            //剩余还款总额（元）
            Double a3 = ZMath.sub(a1, a2);
            model.addAttribute("a3", a3);
            //逾期次数
            Integer a4 = moneyService.DebtOverdueNum(id);
            model.addAttribute("a4", a4);
            //逾期累计金额（元）
            Double a5 = moneyService.DebtOverdueAmount(id);
            model.addAttribute("a5", a5);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/p2p/back/financing/after/p2pRepaymentRecord";
    }

    /**
     * 当期还款金额分配
     *
     * @param financingInformationId
     * @param phase
     * @param model
     * @return
     */
    @RequestMapping(value = "currentRepaymentDetails")
    public String currentRepaymentDetails(String financingInformationId, String phase, Model model) {
        try {
            List<P2pReceivePlan> currentRepaymentDetailslist = afterFinancingService.getCurrentRepaymentDetails(financingInformationId, phase);
            model.addAttribute("currentRepaymentDetailslist", currentRepaymentDetailslist);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/p2p/back/financing/after/p2pCurrentRepaymentDetails";
    }
}
