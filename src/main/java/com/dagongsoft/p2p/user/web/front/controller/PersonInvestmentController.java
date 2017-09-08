package com.dagongsoft.p2p.user.web.front.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.financing.service.front.ViewDebtDetailsService;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.investment.service.P2pInvestmentInformationService;
import com.dagongsoft.p2p.investment.service.front.InvestmentRecordService;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.dagongsoft.p2p.repayment.service.P2pReceivePlanService;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentPlanService;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

@Controller
@RequestMapping(value = "${adminPath}/user/personInvestment")
public class PersonInvestmentController extends BaseController {


    @Autowired
    private InvestmentRecordService investmentRecordService;
    @Autowired
    protected P2pUserInformationService p2pUserInformationService;                    //用户信息服务类
    @Autowired
    private P2pInvestmentInformationService p2pInvestmentInformationService;
    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Autowired
    private MoneyService moneyService;


    @Autowired
    private ViewDebtDetailsService viewDebtDetailsService;

    @Autowired
    private P2pRepaymentPlanService p2pRepaymentPlanService;

    @Autowired
    private P2pReceivePlanService p2pReceivePlanService;


    @RequestMapping(value = "ctrlMenuPerson")
    public String ctrlMenuPerson(HttpSession session, Model model, String mode, Date beginTime, Date endTime) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        String roleId = user.getRoleList().get(0).getId();
        try {
            if (endTime != null) {
                Calendar cal = Calendar.getInstance();
                cal.setTime(endTime);
                cal.add(Calendar.DATE, 1);
                endTime = cal.getTime();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //判断当前用户类型
        if (roleId != null && "104".equals(roleId)) {
            if ("updatePhone".equals(mode)) {
                return "redirect:" + adminPath + "/financing/myAccount/bindingPhone";//绑定手机
            } else if ("investmentGeneral".equals(mode)) {
                loadInvestmentGeneral(user, model, beginTime, endTime);
                return "modules/front/investment/investmentGeneral";//投资总览
            } else if ("investmentIncome".equals(mode)) {
                loadInvestmentIncome(user, model, beginTime, endTime);
                return "modules/front/investment/investmentIncome";//投资收益
            } else if ("pwdManager".equals(mode)) {
                return "modules/front/account/pwdManager";//密码管理
            } else if ("accountSet".equals(mode)) {
                return "redirect:" + adminPath + "/financing/myAccount/accountSet";//账户设置
            } else if ("setUserpic".equals(mode)) {
                return "modules/front/account/userpicSetUp";//修改头像
            } else {
                loadInvestmentAccount(user, model);
                return "modules/front/investment/investmentAccount";//投资账户总览
            }
        }
        return null;
    }


    @RequestMapping("/loadInfo")
    public String preLoadInvestment(HttpSession session, Model model, String mode, Date beginTime, Date endTime) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        try {
            if (endTime != null) {
                Calendar cal = Calendar.getInstance();
                cal.setTime(endTime);
                cal.add(Calendar.DATE, 1);
                endTime = cal.getTime();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String roleId = user.getRoleList().get(0).getId();
        //判断当前用户类型
        if (roleId != null && "104".equals(roleId)) {
            if ("updatePhone".equals(mode)) {
                return "redirect:" + adminPath + "/financing/myAccount/bindingPhone";//绑定手机
            } else if ("investmentGeneral".equals(mode)) {
                loadInvestmentGeneral(user, model, beginTime, endTime);
                return "modules/front/investment/investmentGeneral";//投资总览
            } else if ("investmentIncome".equals(mode)) {
                loadInvestmentIncome(user, model, beginTime, endTime);
                return "modules/front/investment/investmentIncome";//投资收益
            } else if ("pwdManager".equals(mode)) {
                return "modules/front/account/pwdManager";//密码管理
            } else if ("accountSet".equals(mode)) {
                return "redirect:" + adminPath + "/financing/myAccount/accountSet";//账户设置
            } else if ("setUserpic".equals(mode)) {
                return "modules/front/account/userpicSetUp";//修改头像
            } else {
                loadInvestmentAccount(user, model);
                return "modules/front/investment/investmentAccount";//投资账户总览
            }
        }
        return null;
    }

    /**
     * 加载机构账户总览
     *
     * @param user
     * @param model
     */
    public void loadInvestmentAccount(User user, Model model) {
        List<P2pInvestmentInformation> InvestmentList = new ArrayList<P2pInvestmentInformation>();
        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setUserId(user.getId());
        InvestmentList = p2pInvestmentInformationService.findInvestmentByUserId(p2pInvestmentInformation);
        int sumAmount = 0;
        if (InvestmentList != null && InvestmentList.size() > 0) {
            for (P2pInvestmentInformation investment : InvestmentList) {
                sumAmount += investment.getInvestmentSumAmount();
            }
        }
        P2pUserInformation p2pUserInformation = new P2pUserInformation();
        p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        List<P2pFinancingInformation> list = p2pFinancingInformationService.findAllFinancingList(paramMap);
        String json = JsonMapper.toJsonString(list);
        model.addAttribute("user", user);
        model.addAttribute("p2pUserInformation", p2pUserInformation);
        model.addAttribute("p2pUserPic", findUserPicByUserId(user));
        model.addAttribute("sumAmount", sumAmount);
        model.addAttribute("list", list);
        model.addAttribute("json", json);
    }

    /**
     * 加载用户头像
     *
     * @param session
     * @param p2pUserInformation
     * @return
     */
    public P2pUserInformation findUserPicByUserId(User user) {
        P2pUserInformation p2pUserInformation = new P2pUserInformation();
        p2pUserInformation.setUser(user);
        return p2pUserInformationService
                .findUserPicByUserId(p2pUserInformation);
    }

    /**
     * 加载投资总览
     *
     * @param user
     * @param model
     * @param beginTime
     * @param endTime
     */
    public void loadInvestmentGeneral(User user, Model model, Date beginTime, Date endTime) {
        model.addAttribute("list", investmentRecordService.investmentGeneral(user, beginTime, endTime));//投资总览列表
        model.addAttribute("investmentSum", investmentRecordService.findInvestmentSumByUid(user.getId()));//投资总金额
        model.addAttribute("incomeSum", investmentRecordService.findIncomeSumByUid(user.getId()));//投资总收益
        model.addAttribute("middle", investmentRecordService.findInvestmentCountByUid(user.getId(), Integer.toString(FinancingState.FINANCING_PUBLISHED)));
        model.addAttribute("back", investmentRecordService.findInvestmentCountByUid(user.getId(), Integer.toString(FinancingState.MAKE_LOAN)));
        model.addAttribute("finish", investmentRecordService.findInvestmentCountByUid(user.getId(), Integer.toString(FinancingState.PAID_OFF_LOAN)));
        model.addAttribute("defaut", investmentRecordService.findInvestmentCountByUid(user.getId(), Integer.toString(FinancingState.FINANCING_FAILURE)));
    }

    /**
     * 加载投资收益
     *
     * @param user
     * @param model
     * @param beginTime
     * @param endTime
     */
    public void loadInvestmentIncome(User user, Model model, Date beginTime, Date endTime) {
        P2pReceivePlan p2pReceivePlan = new P2pReceivePlan();
        p2pReceivePlan.setUserId(user.getId());
        p2pReceivePlan.setReceiveState("1");//未收款
        List<P2pReceivePlan> listSum1 = p2pReceivePlanService.findPlanByUserId(p2pReceivePlan);
        double unReceived = 0;
        if (listSum1 != null && listSum1.size() != 0) {
            for (P2pReceivePlan p2pReceivePlan2 : listSum1) {
                unReceived += p2pReceivePlan2.getPlanReceiveInterest();
            }
        }
        p2pReceivePlan.setReceiveState("2");//已逾期
        List<P2pReceivePlan> listSum2 = p2pReceivePlanService.findPlanByUserId(p2pReceivePlan);
        p2pReceivePlan.setReceiveState("3");//已收款
        List<P2pReceivePlan> listSum3 = p2pReceivePlanService.findPlanByUserId(p2pReceivePlan);
        double hasReceived = 0;
        if (listSum3 != null && listSum3.size() != 0) {
            for (P2pReceivePlan p2pReceivePlan2 : listSum3) {
                hasReceived += p2pReceivePlan2.getPlanReceiveInterest();
            }
        }
        P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
        p2pFinancingInformation.setUserId(user.getId());
        p2pFinancingInformation.setBeginTime(beginTime);
        p2pFinancingInformation.setEndTime(endTime);
        List<P2pFinancingInformation> list = p2pFinancingInformationService.getEarningsList(p2pFinancingInformation);

        model.addAttribute("unReceived", unReceived);
        model.addAttribute("hasReceived", hasReceived);
        model.addAttribute("list", list);
    }

    /**
     * 计算预期还款/收益
     *
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "calcRepayment")
    @ResponseBody
    public String calcRepayment(Double amount, Double rate, Date date, String way, int term) {
        try {
            List<Map<String, Object>> plan = moneyService.getRepaymentPlan(date, amount, rate / 100, way, term);
            List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
            Map<String, Object> map2 = null;
            for (Map<String, Object> map : plan) {
                map2 = new HashMap<String, Object>();
                map2.put("phase", map.get("phase"));
                map2.put("amount", (Double) map.get("interest") + (Double) map.get("principal"));
                map2.put("rate", rate);
                map2.put("time", map.get("time"));
                list.add(map2);
            }
            return JsonMapper.toJsonString(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
