package com.dagongsoft.p2p.user.web.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.user.web.front.consts.PersonalInvestmentConst;

/**
 * 个人投资模块-我的投资模块控制器类实现类
 * <p>
 * 我的账户中我的投资模块
 *
 * @author Joe
 * @since 2016-11-04
 */

@Controller
@RequestMapping(value = "${adminPath}/user/p2pUserInformation")
public class PersonalInvestmentController extends PersonalInvestmentBaseController {

    /**
     * @param p2pUserInformationId
     * @param modelMap
     * @return 投资总览的视图页面
     * @author Joe
     */
    @RequestMapping(value = "overview")
    public ModelAndView investmentOverview(@RequestParam(value = "p2pUserInformationId", required = false) String p2pUserInformationId) {
        ModelAndView investmentModelAndView = new ModelAndView();
        if (p2pUserInformationService == null) {
            investmentModelAndView.addObject("investmentErrors", P2pUserInformationService.class.getName() + "服务未启动");

        }
        investmentModelAndView.addObject("p2pUserInformation", p2pUserInformationService.get(p2pUserInformationId));//从数据库获取相应Id值p2pUserInformation
        investmentModelAndView.setViewName(PersonalInvestmentConst.investmentOverview);
        return investmentModelAndView;
    }

    /**
     * @param p2pUserInformationId
     * @param modelMap
     * @return 投资收益的视图页面
     * @author Joe
     */
    @RequestMapping(value = "income")
    public ModelAndView investmentIncome(@RequestParam(value = "p2pUserInformationId", required = false) String p2pUserInformationId) {
        ModelAndView investmentModelAndView = new ModelAndView();
        if (p2pUserInformationService == null) {
            investmentModelAndView.addObject("investmentErrors", P2pUserInformationService.class.getName() + "服务未启动");

        }

        investmentModelAndView.addObject("p2pUserInformation", p2pUserInformationService.get(p2pUserInformationId));//从数据库获取相应Id值p2pUserInformation
        investmentModelAndView.setViewName(PersonalInvestmentConst.investmentIncome);
        return investmentModelAndView;
    }

    /**
     * @param p2pUserInformationId
     * @param modelMap
     * @return 投资收益的视图页面
     * @author Joe
     */
    @RequestMapping(value = "record")
    public ModelAndView investmentRecord(@RequestParam(value = "p2pUserInformationId", required = false) String p2pUserInformationId) {
        ModelAndView investmentModelAndView = new ModelAndView();
        if (p2pUserInformationService == null) {
            investmentModelAndView.addObject("investmentErrors", P2pUserInformationService.class.getName() + "服务未启动");

        }

        investmentModelAndView.addObject("p2pUserInformation", p2pUserInformationService.get(p2pUserInformationId));//从数据库获取相应Id值p2pUserInformation
        investmentModelAndView.setViewName(PersonalInvestmentConst.investmentRecord);
        return investmentModelAndView;
    }

}
