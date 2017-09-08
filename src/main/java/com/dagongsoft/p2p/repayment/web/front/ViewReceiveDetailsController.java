package com.dagongsoft.p2p.repayment.web.front;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.financing.service.front.ViewDebtDetailsService;
import com.dagongsoft.p2p.investment.service.front.InvestmentRecordService;
import com.dagongsoft.p2p.repayment.service.front.RepaymentOperationService;
import com.dagongsoft.p2p.repayment.service.front.ViewReceiveDetailsService;

/**
 * 收款明细Controller
 *
 * @author Quincy
 */
@Controller
@RequestMapping(value = "${adminPath}/repayment/viewReceive")
public class ViewReceiveDetailsController {

    @Autowired
    private ViewReceiveDetailsService viewReceiveDetailsService;

    @Autowired
    private RepaymentOperationService repaymentOperationService;

    @Autowired
    private ViewDebtDetailsService viewDebtDetailsService;

    @Autowired
    private InvestmentRecordService investmentRecordService;

    /**
     * 加载每期还款款项信息
     *
     * @param financingInformationId
     * @param phase
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "paymentDetails")
    public String paymentDetails(Model model, HttpSession session, String financingInformationId, String phase) {
        try {
            model.addAttribute("list", viewReceiveDetailsService.findIncomeDetails(financingInformationId, phase));//收款明细列表
            model.addAttribute("plan", repaymentOperationService.findPaymentDetailsByPhase(financingInformationId, phase));//款项明细
            model.addAttribute("p2p", viewDebtDetailsService.findDebtDetailsByFid(financingInformationId));//债项信息
            model.addAttribute("fullTime", viewDebtDetailsService.findFullBidTimeByFid(financingInformationId));//满标时间
            model.addAttribute("investmentCount", investmentRecordService.findAllRecordCountByFid(financingInformationId));//投标人次
            model.addAttribute("mode", "paymentDetails");
            return "p2p/front/financing/paymentDetails";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
