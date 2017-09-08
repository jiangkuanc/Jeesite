package com.dagongsoft.p2p.user.web.front.controller;

import static java.lang.System.out;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.user.entity.P2pAccountMoneyRecord;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.front.P2pAccountMoneyRecordService;
import com.dagongsoft.p2p.user.web.front.consts.IndexConst;
import com.dagongsoft.p2p.user.web.front.consts.JsonAccountModelEnumConst;
import com.dagongsoft.p2p.user.web.front.consts.PageRegisterModelConst;
import com.dagongsoft.p2p.user.web.front.consts.PersonalInvestmentConst;
import com.dagongsoft.p2p.user.web.front.consts.ProcesStateConst;
import com.dagongsoft.p2p.user.web.front.model.AccountModel;
import com.dagongsoft.p2p.user.web.front.model.JsonAccountModel;
import com.dagongsoft.p2p.utils.FormatUtils;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 银行卡管理Controller
 *
 * @author Joe
 * @since 2016-11-08
 */
@Controller
@RequestMapping(value = "${adminPath}/user/bankManager")
public class RiskEvaluationPersonController extends P2pUserInfomationPersonBaseController {

    private static final Logger logger = LoggerFactory.getLogger(RiskEvaluationPersonController.class);

    /**
     * 风险测评路由
     *
     * @return 风险测评页面
     * @author Joe
     * @since 2016-11-08
     */
    @RequestMapping("/bankInfo")
    public String riskEvaluating() {
        return PageRegisterModelConst.riskEvaluationPage;   //进入风险测评页面
    }

}
