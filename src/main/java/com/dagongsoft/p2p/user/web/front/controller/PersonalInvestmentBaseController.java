package com.dagongsoft.p2p.user.web.front.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.investment.service.P2pInvestmentInformationService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;

/**
 * 个人投资模块-我的投资模块控制器基类
 * <p>
 * 我的账户中我的投资模块
 *
 * @author Joe
 * @since 2016-11-04
 */

public abstract class PersonalInvestmentBaseController extends BaseController {

    public static final Logger logger = LoggerFactory.getLogger(PersonalInvestmentBaseController.class);    //开启日志

    public PersonalInvestmentBaseController() {
        logger.info(PersonalInvestmentBaseController.class.getName() + "初始化");                            //父类初始化日志记录
    }

    @Autowired
    P2pUserInformationService p2pUserInformationService;                //个人信息服务类

    @Autowired
    P2pInvestmentInformationService p2pInvestmentInformationService;    //投资服务类

    @Autowired
    P2pFinancingInformationService p2pFinancingInformationService;        //融资信息服务类

    //投资服务详情服务类(未加载)


}
