package com.dagongsoft.p2p.user.web.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dagongsoft.p2p.user.service.front.P2pAccountMoneyRecordService;
import com.dagongsoft.p2p.user.web.front.consts.PersonalInvestmentConst;

/**
 * 账户金额记录Controller
 *
 * @author Joe
 * @since 2016-11-04
 */

@Controller
@RequestMapping(value = "${adminPath}/user/p2pUserInformation")
public class CapitalRecordController extends CapitalRecordBaseController {

    // 注册服务类
    @Autowired
    public P2pAccountMoneyRecordService p2pAccountMoneyRecordService;                        //注册账户金额记录服务

    /**
     * @param p2pAccountMoneyRecordId
     * @param modelMap
     * @return 费用记录的视图页面
     * @author Joe
     */
    @RequestMapping(value = "spendRecord")
    public ModelAndView spendRecord(@RequestParam(value = "p2pAccountMoneyRecordId", required = false) String p2pAccountMoneyRecordId) {
        ModelAndView spendRecordModelAndView = new ModelAndView();
        if (p2pAccountMoneyRecordService == null) {
            spendRecordModelAndView.addObject("moneyRecordErrors", P2pAccountMoneyRecordService.class.getName() + "服务未启动");
        }
        /**
         * 业务逻辑
         */
        //TODO
        //计算累计投资总收益
        //p2pAccountMoneyRecordService.findList(p2pAccountMoneyRecord);

        spendRecordModelAndView.addObject("p2pUserInformation", p2pAccountMoneyRecordService.get(p2pAccountMoneyRecordId));            //从数据库获取相应Id值p2pAccountMoneyRecord
        spendRecordModelAndView.setViewName(PersonalInvestmentConst.spendRecord);                                                    //跳转到费用记录页面
        return spendRecordModelAndView;
    }

    /**
     * @param p2pAccountMoneyRecordId
     * @param modelMap
     * @return 充值记录的视图页面
     * @author Joe
     */
    @RequestMapping(value = "chargeRecord")
    public ModelAndView chargeRecord(@RequestParam(value = "p2pAccountMoneyRecordId", required = false) String p2pAccountMoneyRecordId) {
        ModelAndView chargeRecordModelAndView = new ModelAndView();
        if (p2pAccountMoneyRecordService == null) {
            chargeRecordModelAndView.addObject("moneyRecordErrors", P2pAccountMoneyRecordService.class.getName() + "服务未启动");
        }
        /**
         * 业务逻辑
         */
        //TODO
        chargeRecordModelAndView.addObject("p2pUserInformation", p2pAccountMoneyRecordService.get(p2pAccountMoneyRecordId));            //从数据库获取相应Id值p2pAccountMoneyRecord
        chargeRecordModelAndView.setViewName(PersonalInvestmentConst.chargeRecord);                                                        //跳转到充值记录页面
        return chargeRecordModelAndView;
    }

    /**
     * @param p2pAccountMoneyRecordId
     * @param modelMap
     * @return 提现记录的视图页面
     * @author Joe
     */
    @RequestMapping(value = "cashRecord")
    public ModelAndView cashRecord(@RequestParam(value = "p2pAccountMoneyRecordId", required = false) String p2pAccountMoneyRecordId) {
        ModelAndView cashRecordModelAndView = new ModelAndView();
        if (p2pAccountMoneyRecordService == null) {
            cashRecordModelAndView.addObject("moneyRecordErrors", P2pAccountMoneyRecordService.class.getName() + "服务未启动");
        }
        /**
         * 业务逻辑
         */
        //TODO
        cashRecordModelAndView.addObject("p2pUserInformation", p2pAccountMoneyRecordService.get(p2pAccountMoneyRecordId));            //从数据库获取相应Id值p2pAccountMoneyRecord
        cashRecordModelAndView.setViewName(PersonalInvestmentConst.cashRecord);                                                //跳转到提现记录页面
        return cashRecordModelAndView;
    }

}
