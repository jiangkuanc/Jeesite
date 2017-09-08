package com.dagongsoft.p2p.investment.web.back;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.investment.service.back.InvestmentIncomeService;
import com.dagongsoft.p2p.investment.service.back.SubscribeRecordService;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.dagongsoft.p2p.utils.ZMath;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户管理：投资收益Controller
 *
 * @author Zeus
 * @2016-11-4
 */
@Controller
@RequestMapping(value = "${adminPath}/investment/investmentIncome")
public class InvestmentIncomeController extends BaseController {

    @Resource
    private InvestmentIncomeService investmentIncomeService;
    @Resource
    private MoneyService moneyService;
    @Resource
    private SubscribeRecordService subscribeRecordService;

    /**
     * 投资收益
     *
     * @param user
     * @param request
     * @param response
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "investmentIncomeList")
    public String investmentIncomeList(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<User> page = investmentIncomeService.getInvestmentIncomePage(new Page<User>(request, response), user);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "p2p/back/investment/investmentIncome/p2pInvestmentIncomeList";
    }

    /**
     * 投资债项列表
     *
     * @param userId
     * @param model
     * @return
     * @author Zeus
     */
    @RequestMapping(value = "investmentDebtList")
    public String investmentDebtList(String userId, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            User user = investmentIncomeService.getUserById(userId);
            Double realSumIncome = moneyService.accumulativeIncome(userId);
            Integer accumulativeAmount = moneyService.accumulativeAmount(userId);

            model.addAttribute("user", user);
            model.addAttribute("accumulativeAmount", accumulativeAmount);
            model.addAttribute("realSumIncome", realSumIncome);


            //认购记录
            P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
            p2pInvestmentInformation.setUserId(userId);
            Page<P2pInvestmentInformation> page = subscribeRecordService.getSubscribeRecordPage(new Page<P2pInvestmentInformation>(request, response), p2pInvestmentInformation);
            model.addAttribute("page", page);
            //投资人投资债项预计总收益（利息）（包含未放款、已放款、流标所有债项）
            List<P2pInvestmentInformation> list = subscribeRecordService.getSubscribeRecordList(p2pInvestmentInformation);
            Double planSumIncome = 0.0;
            for (P2pInvestmentInformation p : list) {
                planSumIncome = ZMath.add(planSumIncome, p.getExpectEarn());
            }
            model.addAttribute("planSumIncome", planSumIncome);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "p2p/back/investment/investmentIncome/p2pInvestmentDebtList";
    }


}
