package com.dagongsoft.p2p.user.web.front.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.investment.service.P2pInvestmentInformationService;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 个人投资控制器基类
 * 注意:不能实例化该类或者修改此类,只能继承或者复用
 *
 * @author Joe
 */
public class P2pUserInfomationPersonBaseController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(P2pUserInfomationPersonBaseController.class);

    protected static String adminPath = Global.getAdminPath();
    @Autowired
    protected P2pUserInformationService p2pUserInformationService;                    //用户信息服务类
    @Autowired
    protected P2pFinancingInformationService p2pFinancingInformationService;        //融资信息服务类
    @Autowired
    protected P2pRegUserCertifyService p2pRegUserCertifyService;                    //实名认证服务类
    @Autowired
    protected P2pInvestmentInformationService p2pInvestmentInformationService;        //投资信息服务类

    /**
     * P2pUserInfomationPersonBaseController构造器
     *
     * @author Joe
     */
    protected P2pUserInfomationPersonBaseController() {

        logger.info(P2pUserInfomationPersonBaseController.class.getName() + ">>>>>>>>>>>>>>初始构造");
        Assert.isNull(p2pUserInformationService);
        Assert.isNull(p2pFinancingInformationService);
        Assert.isNull(p2pRegUserCertifyService);
        Assert.isNull(p2pInvestmentInformationService);

        logger.info(P2pUserInfomationPersonBaseController.class.getName());
        Assert.isNull(p2pUserInformationService);
        Assert.isNull(p2pFinancingInformationService);
        Assert.isNull(p2pRegUserCertifyService);
        Assert.isNull(p2pInvestmentInformationService);

    }

    /**
     * ModelAttribute判断P2pUserInformation是否来自数据库还是客户端创建的对象
     *
     * @param id
     * @return
     * @author Joe
     */
    @ModelAttribute
    public P2pUserInformation get(@RequestParam(required = false) String id) {
        P2pUserInformation entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pUserInformationService.get(id);
        }
        if (entity == null) {
            entity = new P2pUserInformation();
        }
        return entity;
    }


}
