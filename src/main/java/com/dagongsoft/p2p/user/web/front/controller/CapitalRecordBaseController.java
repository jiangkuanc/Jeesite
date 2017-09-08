package com.dagongsoft.p2p.user.web.front.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dagongsoft.p2p.user.service.front.P2pAccountMoneyRecordService;

/**
 * 我的账户-资金记录模块Controller基类
 *
 * @author Joe
 * @since 2011-11-04
 */
public abstract class CapitalRecordBaseController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(CapitalRecordBaseController.class);// 开启日志记录

    public CapitalRecordBaseController() {
        logger.info(CapitalRecordBaseController.class.getName() + "初始化");
    }


}	

