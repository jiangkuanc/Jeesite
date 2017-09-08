package com.dagongsoft.p2p.financing.web.back;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.config.entity.P2pGivingOutRecord;
import com.dagongsoft.p2p.config.service.P2pGivingOutRecordService;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.financing.entity.P2pRiskControlRecord;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.financing.service.P2pPaymentOfRatingCostService;
import com.dagongsoft.p2p.financing.service.P2pRiskControlRecordService;
import com.dagongsoft.p2p.financing.service.back.InFinancingService;
import com.dagongsoft.p2p.financing.service.front.ViewDebtDetailsService;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.investment.service.back.SubscribeRecordService;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.dagongsoft.p2p.repayment.service.P2pReceivePlanService;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentPlanService;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.ZMath;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.UserService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 融资管理Controller
 *
 * @author Chace
 * @version 2016-11-09
 */
@Controller
@RequestMapping(value = "${adminPath}/inFinancing")
public class InFinancingController extends BaseController {
    @Autowired
    private InFinancingService inFinancingService;
    @Autowired
    private SubscribeRecordService subscribeRecordService;
    @Autowired
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Autowired
    private MoneyService moneyService;
    @Autowired
    private P2pRepaymentPlanService p2pRepaymentPlanService;
    @Autowired
    private P2pReceivePlanService p2pReceivePlanService;
    @Autowired
    private P2pRiskControlRecordService p2pRiskControlRecordService;
    @Autowired
    private UserService userService;
    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Autowired
    private P2pGivingOutRecordService p2pGivingOutRecordService;
    @Autowired
    private ViewDebtDetailsService viewDebtDetailsService;
    @Autowired
    private P2pPaymentOfRatingCostService p2pPaymentOfRatingCostService;

    /**
     * 返回撮合中债项列表
     */
    @RequestMapping(value = "getInFinancingPage")
    public String getInFinancingPage(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        P2pFinancingRatingInfo p2pFinancingRatingInfo = new P2pFinancingRatingInfo();
        p2pFinancingRatingInfo = p2pFinancingInformation.getP2pFinancingRatingInfo();
        if (p2pFinancingRatingInfo != null) {
            p2pFinancingRatingInfo.setRecommendedRate(ZMath.changeRate(p2pFinancingRatingInfo.getRecommendedRate()));
        }
        p2pFinancingInformation.setP2pFinancingRatingInfo(p2pFinancingRatingInfo);
        Page<P2pFinancingInformation> page = inFinancingService.getInFinancingPage(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        List<P2pFinancingInformation> list = page.getList();
        String json = JsonMapper.toJsonString(list);
        model.addAttribute("json", json);
        return "/p2p/back/financing/middle/p2pInfinancingList";
    }

    /**
     * 返回撮合中满标审核列表
     */
    @RequestMapping(value = "findFullAuditListPage")
    public String findFullAuditListPage(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        P2pFinancingRatingInfo p2pFinancingRatingInfo = new P2pFinancingRatingInfo();
        p2pFinancingRatingInfo = p2pFinancingInformation.getP2pFinancingRatingInfo();
        if (p2pFinancingRatingInfo != null) {
            p2pFinancingRatingInfo.setRecommendedRate(ZMath.changeRate(p2pFinancingRatingInfo.getRecommendedRate()));
        }
        p2pFinancingInformation.setP2pFinancingRatingInfo(p2pFinancingRatingInfo);
        Page<P2pFinancingInformation> page = inFinancingService.findFullAuditListPage(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        List<P2pFinancingInformation> list = page.getList();
        String json = JsonMapper.toJsonString(list);
        model.addAttribute("json", json);
        return "/p2p/back/financing/middle/P2pFullAuditList";
    }

    /**
     * 返回撮合中流标审核列表
     */
    @RequestMapping(value = "findStandardAuditListPage")
    public String findStandardAuditListPage(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            P2pFinancingRatingInfo p2pFinancingRatingInfo = new P2pFinancingRatingInfo();
            p2pFinancingRatingInfo = p2pFinancingInformation.getP2pFinancingRatingInfo();
            if (p2pFinancingRatingInfo != null) {
                p2pFinancingRatingInfo.setRecommendedRate(ZMath.changeRate(p2pFinancingRatingInfo.getRecommendedRate()));
            }
            p2pFinancingInformation.setP2pFinancingRatingInfo(p2pFinancingRatingInfo);
            Page<P2pFinancingInformation> page = inFinancingService.findStandardAuditListPage(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
            model.addAttribute("page", page);
            List<P2pFinancingInformation> list = page.getList();
            String json = JsonMapper.toJsonString(list);
            model.addAttribute("json", json);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/p2p/back/financing/middle/p2pFindStandardAuditList";
    }

    /**
     * 返回撮合中投资记录
     */
    @RequestMapping(value = "getInvestRecordPage")
    public String getInvestRecordPage(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setFinancingInformationId(p2pFinancingInformation.getId());
        p2pFinancingInformation = subscribeRecordService.getDebtDetails(p2pFinancingInformation.getId());
        Page<P2pInvestmentInformation> page = inFinancingService.getInvestRecordPage(new Page<P2pInvestmentInformation>(request, response), p2pInvestmentInformation);
        model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        model.addAttribute("page", page);
        return "/p2p/back/financing/middle/p2pInvestRecord";
    }

    /**
     * 返回满标审核页面
     */
    @RequestMapping(value = "getP2pFullAuditPage")
    public String getP2pFullAuditPage(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            if (!"600".equals(p2pFinancingInformation.getCurrentStage())) {
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());
                if (p2pFinancingInformation.getMarkType() == 1) {
                    p2pBeforeMatchDebtState.setProgressStage("700");
                } else if (p2pFinancingInformation.getMarkType() == 2) {
                    p2pBeforeMatchDebtState.setProgressStage("800");
                }
                p2pBeforeMatchDebtState = p2pBeforeMatchDebtStateService.findByIds(p2pBeforeMatchDebtState);
                model.addAttribute("p2pBeforeMatchDebtState", p2pBeforeMatchDebtState);
            }
            Date date = new Date();
            P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
            p2pInvestmentInformation.setFinancingInformationId(p2pFinancingInformation.getId());
            p2pFinancingInformation = subscribeRecordService.getDebtDetails(p2pFinancingInformation.getId());
            Page<P2pInvestmentInformation> page = inFinancingService.getInvestRecordPage(new Page<P2pInvestmentInformation>(request, response), p2pInvestmentInformation);
            model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
            model.addAttribute("page", page);
            model.addAttribute("date", date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/p2p/back/financing/middle/p2pFullAuditPage";
    }

    /**
     * 满标审核
     */
    @RequestMapping(value = "p2pFullAudit")
    public String p2pFullAudit(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        String financingInformationId = request.getParameter("financingInformationId");
        p2pFinancingInformation.setId(financingInformationId);
        p2pFinancingInformation = subscribeRecordService.getDebtDetails(financingInformationId);
        String userId = request.getParameter("userId");
        String opinion = request.getParameter("opinion");
        String marktype = request.getParameter("markType");
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setFinancingInformationId(financingInformationId);
        if (marktype.equals("1")) {
            p2pFinancingInformation.setCurrentStage("700");
        } else {
            p2pFinancingInformation.setCurrentStage("800");
            p2pFinancingInformation.setGivingOutTime(new Date());
            List<P2pInvestmentInformation> lists = inFinancingService.getInvestRecordByFid(p2pInvestmentInformation);
            Date date2 = new Date();
            List<Double> planRepaymentInterest = new ArrayList<Double>();
            if (lists != null && lists.size() > 0) {
                for (P2pInvestmentInformation p2pInvestmentInformation2 : lists) {
                    User user = new User();
                    user.setId(p2pInvestmentInformation2.getUserId());
                    Date date = new Date();
                    double amount = p2pInvestmentInformation2.getInvestmentSumAmount();
                    Double yearRate = Double.valueOf(p2pFinancingInformation.getP2pFinancingRatingInfo().getRecommendedRate());
                    String repaymentMode = p2pFinancingInformation.getRepaymentMode();
                    int phase = p2pFinancingInformation.getFinancingMaturity();
                    List<Map<String, Object>> listm = moneyService.getRepaymentPlan(date, amount, yearRate, repaymentMode, phase);
                    if (listm != null && listm.size() > 0) {
                        for (int i = 0; i < listm.size(); i++) {
                            P2pReceivePlan p2pReceivePlan = new P2pReceivePlan();
                            p2pReceivePlan.setFinancingInformationId(financingInformationId);
                            p2pReceivePlan.setUserId(user.getId());
                            p2pReceivePlan.setPhase((String) listm.get(i).get("phase"));
                            p2pReceivePlan.setPlanReceiveDate((Date) listm.get(i).get("time"));
                            p2pReceivePlan.setPlanReceivePrincipal((Double) listm.get(i).get("principal"));
                            p2pReceivePlan.setPlanReceiveInterest((Double) listm.get(i).get("interest"));
                            p2pReceivePlan.setReceiveState("1");
                            p2pReceivePlan.setPlanReceiveFine(0.0);
                            p2pReceivePlanService.save(p2pReceivePlan);
                        }
                    }
                }
            }
            planRepaymentInterest = p2pReceivePlanService.getSumByfinancingId(financingInformationId);
            List<Map<String, Object>> listm2 = moneyService.getRepaymentPlan(date2, (double) p2pFinancingInformation.getHasRaiseAmount(), p2pFinancingInformation.getRecommendedRate(), p2pFinancingInformation.getRepaymentMode(), p2pFinancingInformation.getFinancingMaturity());
            if (listm2 != null && listm2.size() > 0) {
                for (int i = 0; i < listm2.size(); i++) {
                    P2pRepaymentPlan p2pRepaymentPlan = new P2pRepaymentPlan();
                    p2pRepaymentPlan.setFinancingInformationId(financingInformationId);
                    p2pRepaymentPlan.setPhase((String) listm2.get(i).get("phase"));
                    p2pRepaymentPlan.setPlanRepaymentDate((Date) listm2.get(i).get("time"));
                    p2pRepaymentPlan.setPlanRepaymentPrincipal((Double) listm2.get(i).get("principal"));
                    p2pRepaymentPlan.setPlanRepaymentInterest(planRepaymentInterest.get(i));
                    p2pRepaymentPlan.setRepaymentState("1");
                    p2pRepaymentPlan.setFine(0.0);
                    p2pRepaymentPlanService.save(p2pRepaymentPlan);
                }
            }
        }
        try {
            inFinancingService.updateById(p2pFinancingInformation);
            if (marktype.equals("2")) {
                //发送站内信和短信
                Map<String, String> map = MsgLetterTemplate.getGrbfkytg(p2pFinancingInformation.getFinacingName(), (double) p2pFinancingInformation.getFinancingAmount());
                MsgUtils.sendLetter(p2pFinancingInformation.getApplicantsId(), map);
                String content = MsgSmsTemplate.getGrbfkytg((double) p2pFinancingInformation.getFinancingAmount());
                MsgUtils.sendSMS(p2pFinancingInformation.getApplicantsId(), content);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        p2pBeforeMatchDebtState.setFinacingInformationId(financingInformationId);
        p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());
        p2pBeforeMatchDebtState.setStateTime(new Date());
        p2pBeforeMatchDebtState.setOperatorId(userId);
        p2pBeforeMatchDebtState.setHandleResult(opinion);
        p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
        P2pFinancingInformation p2pFinancingInformation2 = new P2pFinancingInformation();
        return findFullAuditListPage(p2pFinancingInformation2, request, response, model);
    }

    /**
     * 返回流标审核页面
     */
    @RequestMapping(value = "getP2pStandardAuditPage")
    public String getP2pStandardAuditPage(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Date date = new Date();
        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setFinancingInformationId(p2pFinancingInformation.getId());
        p2pFinancingInformation = subscribeRecordService.getDebtDetails(p2pFinancingInformation.getId());
        model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        if ("901".equals(p2pFinancingInformation.getCurrentStage())) {
            model.addAttribute("date", date);
            return "/p2p/back/financing/middle/p2pFindStandardAuditPage";
        } else {
            try {
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());
                p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());
                p2pBeforeMatchDebtState = p2pBeforeMatchDebtStateService.findByIds(p2pBeforeMatchDebtState);
                model.addAttribute("p2pBeforeMatchDebtState", p2pBeforeMatchDebtState);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "/p2p/back/financing/middle/p2pFindStandardAuditPage2";
        }
    }

    /**
     * 流标审核
     */
    @RequestMapping(value = "p2pStandardAudit")
    public String p2pStandardAudit(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            String financingInformationId = request.getParameter("financingInformationId");
            p2pFinancingInformation.setId(financingInformationId);
            p2pFinancingInformation.setCurrentStage("999");
            inFinancingService.updateById(p2pFinancingInformation);
            String userId = request.getParameter("userId");
            String opinion = request.getParameter("opinion");
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
            p2pBeforeMatchDebtState.setFinacingInformationId(financingInformationId);
            p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());
            p2pBeforeMatchDebtState.setStateTime(new Date());
            p2pBeforeMatchDebtState.setOperatorId(userId);
            p2pBeforeMatchDebtState.setHandleResult(opinion);
            p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            P2pPaymentOfRatingCost p2pPaymentOfRatingCost = new P2pPaymentOfRatingCost();
            p2pPaymentOfRatingCost.setFinancingInformationId(financingInformationId);
            p2pPaymentOfRatingCostService.updateStatusByFinancingId(p2pPaymentOfRatingCost);
        } catch (Exception e) {
            e.printStackTrace();
        }
        P2pFinancingInformation p2pFinancingInformation2 = new P2pFinancingInformation();
        return findStandardAuditListPage(p2pFinancingInformation2, request, response, model);
    }

    /**
     * 返回募集期风控列表 RiskManagement
     */
    @RequestMapping(value = "getRiskManagementPage")
    public String getRiskManagementPage(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        P2pFinancingRatingInfo p2pFinancingRatingInfo = new P2pFinancingRatingInfo();
        p2pFinancingRatingInfo = p2pFinancingInformation.getP2pFinancingRatingInfo();
        if (p2pFinancingRatingInfo != null) {
            p2pFinancingRatingInfo.setRecommendedRate(ZMath.changeRate(p2pFinancingRatingInfo.getRecommendedRate()));
        }
        p2pFinancingInformation.setP2pFinancingRatingInfo(p2pFinancingRatingInfo);
        Page<P2pFinancingInformation> page = inFinancingService.findRiskManagementListPage(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        List<P2pFinancingInformation> list = page.getList();
        String json = JsonMapper.toJsonString(list);
        model.addAttribute("json", json);
        return "/p2p/back/financing/middle/p2pRiskManagementList";
    }

    /**
     * 返回募集期风控暂停页面
     */
    @RequestMapping(value = "p2pRiskManagementOff")
    public String p2pRiskManagementOff(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Date date = new Date();
        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setFinancingInformationId(p2pFinancingInformation.getId());
        p2pFinancingInformation = subscribeRecordService.getDebtDetails(p2pFinancingInformation.getId());
        Page<P2pInvestmentInformation> page = inFinancingService.getInvestRecordPage(new Page<P2pInvestmentInformation>(request, response), p2pInvestmentInformation);
        model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        model.addAttribute("page", page);
        model.addAttribute("date", date);
        return "/p2p/back/financing/middle/p2pRiskManagementOff";
    }

    /**
     * 募集期风控暂停
     */
    @RequestMapping(value = "RiskManagementOff")
    public String RiskManagementOff(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        User user = new User();
        String financingInformationId = request.getParameter("financingInformationId");
        String userId = request.getParameter("userId");
        String opinion = request.getParameter("opinion");
        user.setId(userId);
        p2pFinancingInformation = subscribeRecordService.getDebtDetails(financingInformationId);
        long t1 = Long.valueOf(p2pFinancingInformation.getHasRaiseTime());
        long t2 = p2pFinancingInformation.getLastPublishTime().getTime() / 1000;
        Date date = new Date();
        long t3 = date.getTime() / 1000;
        p2pFinancingInformation.setHasRaiseTime(String.valueOf(t3 - t2 + t1));
        p2pFinancingInformation.setInRaiseState("1");
        inFinancingService.updateById(p2pFinancingInformation);
        P2pRiskControlRecord p2pRiskControlRecord = new P2pRiskControlRecord();
        p2pRiskControlRecord.setFinancingInformationId(financingInformationId);
        p2pRiskControlRecord.setInRaiseState("1");
        p2pRiskControlRecord.setUser(user);
        p2pRiskControlRecord.setOperateExplain(opinion);
        p2pRiskControlRecord.setOperateTime(new Date());
        p2pRiskControlRecordService.save(p2pRiskControlRecord);
        P2pFinancingInformation p2pFinancingInformation2 = new P2pFinancingInformation();
        //发送站内信和短信
        //站内信
        String recId = p2pFinancingInformation.getApplicantsId();
        Map<String, String> map = MsgLetterTemplate.getMjzttz();
        MsgUtils.sendLetter(recId, map);
        //短信
        String content = MsgSmsTemplate.getMjzttz();
        try {
            MsgUtils.sendSMS(recId, content);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return getRiskManagementPage(p2pFinancingInformation2, request, response, model);
    }

    /**
     * 返回募集期风控恢复页面
     */
    @RequestMapping(value = "p2pRiskManagementRecover")
    public String p2pRiskManagementRecover(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        P2pRiskControlRecord p2pRiskControlRecord = new P2pRiskControlRecord();
        p2pRiskControlRecord.setFinancingInformationId(p2pFinancingInformation.getId());
        p2pRiskControlRecord.setInRaiseState("1");
        p2pRiskControlRecord = p2pRiskControlRecordService.getByFid(p2pRiskControlRecord);
        User user = new User();
        user = p2pRiskControlRecord.getUser();
        user = userService.getById(user);
        Date date = new Date();
        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setFinancingInformationId(p2pFinancingInformation.getId());
        p2pFinancingInformation = subscribeRecordService.getDebtDetails(p2pFinancingInformation.getId());
        Page<P2pInvestmentInformation> page = inFinancingService.getInvestRecordPage(new Page<P2pInvestmentInformation>(request, response), p2pInvestmentInformation);
        model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        model.addAttribute("page", page);
        model.addAttribute("date", date);
        model.addAttribute("p2pRiskControlRecord", p2pRiskControlRecord);
        model.addAttribute("user", user);
        return "/p2p/back/financing/middle/p2pRiskManagementRecover";
    }

    /**
     * 募集期风控暂停恢复
     */
    @RequestMapping(value = "RiskManagementRecover")
    public String RiskManagementRecover(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        User user = new User();
        String financingInformationId = request.getParameter("financingInformationId");
        String userId = request.getParameter("userId");
        String opinion = request.getParameter("opinion");
        user.setId(userId);
        p2pFinancingInformation.setId(financingInformationId);
        p2pFinancingInformation.setInRaiseState("0");
        p2pFinancingInformation.setLastPublishTime(new Date());
        inFinancingService.updateById(p2pFinancingInformation);
        P2pRiskControlRecord p2pRiskControlRecord = new P2pRiskControlRecord();
        p2pRiskControlRecord.setFinancingInformationId(financingInformationId);
        p2pRiskControlRecord.setInRaiseState("0");
        p2pRiskControlRecord.setUser(user);
        p2pRiskControlRecord.setOperateExplain(opinion);
        p2pRiskControlRecord.setOperateTime(new Date());
        p2pRiskControlRecordService.save(p2pRiskControlRecord);
        P2pFinancingInformation p2pFinancingInformation2 = new P2pFinancingInformation();
        //发送站内信和短信
        //站内信
        String recId = p2pFinancingInformation.getApplicantsId();
        Map<String, String> map = MsgLetterTemplate.getMjhftz();
        MsgUtils.sendLetter(recId, map);
        //短信
        String content = MsgSmsTemplate.getMjhftz();
        try {
            MsgUtils.sendSMS(recId, content);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return getRiskManagementPage(p2pFinancingInformation2, request, response, model);
    }

    /**
     * 返回募集期风控终止页面
     */
    @RequestMapping(value = "p2pRiskManagementEnd")
    public String p2pRiskManagementEnd(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        P2pRiskControlRecord p2pRiskControlRecord = new P2pRiskControlRecord();
        p2pRiskControlRecord.setFinancingInformationId(p2pFinancingInformation.getId());
        p2pRiskControlRecord.setInRaiseState("1");
        p2pRiskControlRecord = p2pRiskControlRecordService.getByFid(p2pRiskControlRecord);
        User user = new User();
        user = p2pRiskControlRecord.getUser();
        user = userService.getById(user);
        Date date = new Date();
        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setFinancingInformationId(p2pFinancingInformation.getId());
        p2pFinancingInformation = subscribeRecordService.getDebtDetails(p2pFinancingInformation.getId());
        Page<P2pInvestmentInformation> page = inFinancingService.getInvestRecordPage(new Page<P2pInvestmentInformation>(request, response), p2pInvestmentInformation);
        model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        model.addAttribute("page", page);
        model.addAttribute("date", date);
        model.addAttribute("p2pRiskControlRecord", p2pRiskControlRecord);
        model.addAttribute("user", user);
        return "/p2p/back/financing/middle/p2pRiskManagementEnd";
    }

    /**
     * 募集期风控暂停终止
     */
    @RequestMapping(value = "RiskManagementEnd")
    public String RiskManagementEnd(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        String financingInformationId = request.getParameter("financingInformationId");
        p2pFinancingInformation.setId(financingInformationId);
        p2pFinancingInformation.setCurrentStage("901");
        inFinancingService.updateById(p2pFinancingInformation);
        String userId = request.getParameter("userId");
        String opinion = request.getParameter("opinion");
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
        p2pBeforeMatchDebtState.setFinacingInformationId(financingInformationId);
        p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());
        p2pBeforeMatchDebtState.setStateTime(new Date());
        p2pBeforeMatchDebtState.setOperatorId(userId);
        p2pBeforeMatchDebtState.setHandleResult(opinion);
        p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
        //发送站内信和短信
        //站内信
        String recId = p2pFinancingInformation.getApplicantsId();
        Map<String, String> map = MsgLetterTemplate.getMjzztz();
        MsgUtils.sendLetter(recId, map);
        //短信
        String content = MsgSmsTemplate.getMjzztz();
        try {
            MsgUtils.sendSMS(recId, content);
        } catch (Exception e) {
            e.printStackTrace();
        }
        P2pFinancingInformation p2pFinancingInformation2 = new P2pFinancingInformation();
        return getRiskManagementPage(p2pFinancingInformation2, request, response, model);
    }

    /**
     * 机构放款审核列表
     *
     * @author Chace
     */
    @RequestMapping(value = "givingOutAuditPage")
    public String givingOutAuditPage(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        P2pFinancingRatingInfo p2pFinancingRatingInfo = new P2pFinancingRatingInfo();
        p2pFinancingRatingInfo = p2pFinancingInformation.getP2pFinancingRatingInfo();
        if (p2pFinancingRatingInfo != null) {
            p2pFinancingRatingInfo.setRecommendedRate(ZMath.changeRate(p2pFinancingRatingInfo.getRecommendedRate()));
        }
        p2pFinancingInformation.setP2pFinancingRatingInfo(p2pFinancingRatingInfo);
        Page<P2pFinancingInformation> page = inFinancingService.givingOutAuditPage(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        List<P2pFinancingInformation> list = page.getList();
        String json = JsonMapper.toJsonString(list);
        model.addAttribute("json", json);
        return "/p2p/back/financing/middle/givingOutAuditPage";
    }

    /**
     * 机构放款审核页
     *
     * @author Chace
     */
    @RequestMapping("givingOutAuditDetails")
    public String givingOutAuditDetails(P2pFinancingInformation p2pFinancingInformation, Model model) {
        try {
            p2pFinancingInformation = p2pFinancingInformationService.givingOutAuditDetails(p2pFinancingInformation);
            P2pGivingOutRecord p2pGivingOutRecord = new P2pGivingOutRecord();
            p2pGivingOutRecord.setFinancingInformationId(p2pFinancingInformation.getId());
            List<P2pGivingOutRecord> list = p2pGivingOutRecordService.findList(p2pGivingOutRecord);
            Date date = new Date();
            model.addAttribute("date", date);
            model.addAttribute("list", list);
            model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/p2p/back/financing/middle/givingOutAuditDetails";
    }

    /**
     * 机构放款审核
     *
     * @author Chace
     */
    @RequestMapping("givingOutAudit")
    public String givingOutAudit(P2pGivingOutRecord p2pGivingOutRecord, Date givingOutTime, String financingName, String investmentId) {
        P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
        p2pFinancingInformation.setId(p2pGivingOutRecord.getFinancingInformationId());
        User user = UserUtils.getUser();
        Date date = new Date();
        p2pFinancingInformation.setGivingOutTime(givingOutTime);
        p2pGivingOutRecord.setAuditor(user.getId());
        p2pGivingOutRecord.setAuditingTime(date);
        if ("0".equals(p2pGivingOutRecord.getGivingOutState())) {
            p2pFinancingInformation.setGivingOutState("3");
            //给机构发站内信和短信
            Map<String, String> map = MsgLetterTemplate.getFkpzshsb(financingName);
            MsgUtils.sendLetter(investmentId, map);
            String content = MsgSmsTemplate.getFkpzshsb(financingName);
            MsgUtils.sendSMS(investmentId, content);
        } else {
            p2pFinancingInformation.setGivingOutState("1");
            p2pFinancingInformation.setCurrentStage(String.valueOf(FinancingState.MAKE_LOAN));
            /*
             * 添加债项进展信息
			 */
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
            p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());// 记录当前项目编号
            p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());// 记录当前融资项目阶段
            p2pBeforeMatchDebtState.setStateTime(new Date());// 记录时间
            p2pBeforeMatchDebtStateService.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
            P2pFinancingInformation p2p = viewDebtDetailsService.findDebtDetailsByFid(p2pFinancingInformation.getId());
            //生成还款计划和收款计划
            double amount = 0.0;
            if (Double.valueOf(p2p.getP2pFinancingRatingInfo().getRecommendedAmount()) >= (double) p2p.getApplicationAmount()) {
                amount = (double) p2p.getApplicationAmount();
            } else {
                amount = Double.valueOf(p2p.getP2pFinancingRatingInfo().getRecommendedAmount());
            }
            List<Map<String, Object>> plan = moneyService.getRepaymentPlan(p2pFinancingInformation.getGivingOutTime(), amount,
                    Double.parseDouble(p2p.getP2pFinancingRatingInfo().getRecommendedRate()), p2p.getRepaymentMode(), p2p.getFinancingMaturity());

            for (Map<String, Object> map : plan) {
                P2pRepaymentPlan p2pRepaymentPlan = new P2pRepaymentPlan();
                P2pReceivePlan p2pReceivePlan = new P2pReceivePlan();
                //设置还款计划参数
                p2pRepaymentPlan.setFinancingInformationId(p2p.getId());
                p2pRepaymentPlan.setPhase(map.get("phase").toString());
                p2pRepaymentPlan.setPlanRepaymentDate((Date) map.get("time"));
                p2pRepaymentPlan.setPlanRepaymentInterest((Double) map.get("interest"));
                p2pRepaymentPlan.setPlanRepaymentPrincipal((Double) map.get("principal"));
                p2pRepaymentPlan.setRepaymentState("1");
                p2pRepaymentPlan.setFine((double) 0);
                p2pRepaymentPlanService.save(p2pRepaymentPlan);

                //设置收款计划参数
                p2pReceivePlan.setFinancingInformationId(p2p.getId());
                p2pReceivePlan.setPhase(map.get("phase").toString());
                p2pReceivePlan.setPlanReceiveDate((Date) map.get("time"));
                p2pReceivePlan.setPlanReceiveInterest((Double) map.get("interest"));
                p2pReceivePlan.setPlanReceivePrincipal((Double) map.get("principal"));
                p2pReceivePlan.setReceiveState("1");
                p2pReceivePlan.setPlanReceiveFine((double) 0);
                p2pReceivePlan.setUserId(investmentId);
                p2pReceivePlanService.save(p2pReceivePlan);
            }
        }
        p2pFinancingInformationService.saveOrUpdateP2pFinancingInformation(p2pFinancingInformation, null);
        p2pGivingOutRecordService.save(p2pGivingOutRecord);
        return "redirect:" + Global.getAdminPath() + "/inFinancing/givingOutAuditPage?repage";
    }

}
