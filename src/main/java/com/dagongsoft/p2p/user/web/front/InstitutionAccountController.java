package com.dagongsoft.p2p.user.web.front;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.creditreport.entity.P2pReportInformationAudit;
import com.dagongsoft.p2p.creditreport.service.P2pReportInformationAuditService;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.financing.service.front.ViewDebtDetailsService;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.investment.service.P2pInvestmentInformationService;
import com.dagongsoft.p2p.investment.service.front.InvestmentRecordService;
import com.dagongsoft.p2p.msg.entity.MsgLetterRecord;
import com.dagongsoft.p2p.msg.service.MsgLetterRecordService;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.dagongsoft.p2p.repayment.service.P2pReceivePlanService;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentPlanService;
import com.dagongsoft.p2p.risk.entity.P2pRiskRecord;
import com.dagongsoft.p2p.risk.service.P2pRiskRecordService;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 投资机构账户中心相关
 *
 * @author Quincy
 */
@Controller
@RequestMapping(value = "${adminPath}/user/Institution")
public class InstitutionAccountController extends BaseController {

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
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;

    @Autowired
    private ViewDebtDetailsService viewDebtDetailsService;

    @Autowired
    private P2pRepaymentPlanService p2pRepaymentPlanService;

    @Autowired
    private P2pReceivePlanService p2pReceivePlanService;
    @Autowired
    private P2pReportInformationAuditService p2pReportInformationAuditService;
    @Autowired
    private MsgLetterRecordService msgLetterRecordService;
    @Autowired
    private P2pRiskRecordService p2pRiskRecordService;

    @RequestMapping(value = "ctrlMenu")
    public String ctrlMenu(HttpSession session, Model model, String mode, Date beginTime, Date endTime, String msgId) {
        User user = (User) session.getAttribute("user");
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
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        String roleId = user.getRoleList().get(0).getId();
        //判断当前用户类型
        if (roleId != null && "101".equals(roleId)) {
            if ("updatePhone".equals(mode)) {
                return "forward:" + adminPath + "/msg/msgSmsRecord/showSmsPage2";//绑定手机
            } else if ("investmentGeneral".equals(mode)) {
                loadInvestmentGeneral(user, model, beginTime, endTime);
                return "modules/front/investment/investmentGeneral2";//投资总览
            } else if ("investmentIncome".equals(mode)) {
                loadInvestmentIncome(user, model, beginTime, endTime);
                return "modules/front/investment/investmentIncome2";//投资收益
            } else if ("investmentRecord".equals(mode)) {
                loadInvestmentRecord(user, model, beginTime, endTime);
                return "modules/front/investment/investmentRecord";//投资记录
            } else if ("riskRecord".equals(mode)) {
                return "modules/front/account/riskRecord";//风险测评
            } else if ("reportRecord".equals(mode)) {
                return "modules/front/account/reportRecord";//举报管理
            } else if ("pwdManager".equals(mode)) {
                Integer certificateState = p2pUserInformationService.findCertificateState(user.getId());
                if (certificateState != null && !"".equals(certificateState)) {
                    model.addAttribute("certificateState", certificateState);
                }
                return "modules/front/account/pwdManager";//密码管理
            } else if ("accountSet".equals(mode)) {
                return "forward:" + adminPath + "/financing/myAccount/accountSet";//账户设置
            } else if ("setUserpic".equals(mode)) {
                return "modules/front/account/userpicSetUp";//修改头像
            } else if ("msgCenter".equals(mode)) {
                return "forward:" + adminPath + "/msg/msgLetterRecord/getMsgList2";//消息中心
            } else if ("msgContent".equals(mode)) {
                model.addAttribute("msgId", msgId);
                return "forward:" + adminPath + "/msg/msgLetterRecord/getById";//消息详情
            } else {
                loadInvestmentAccount(user, model);
                String newPhone = user.getPhone().replaceAll("(\\d{3})\\d{4}(\\d{4})", "$1****$2");
                user.setPhone(newPhone);
                return "modules/front/investment/investmentAccount";//投资账户总览
            }
        }
        return null;
    }


    @RequestMapping(value = "ctrlMenuPerson")
    public String ctrlMenuPerson(HttpSession session, Model model, String mode, Date beginTime, Date endTime) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
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
            } else if ("investmentRecord".equals(mode)) {
                loadInvestmentRecord(user, model, beginTime, endTime);
                return "modules/front/investment/investmentRecord";//投资记录
            } else if ("riskRecord".equals(mode)) {
                P2pRiskRecord p2pRiskRecord = new P2pRiskRecord();
                p2pRiskRecord.setUser(user);
                List<P2pRiskRecord> p2pRiskRecords = p2pRiskRecordService.findList(p2pRiskRecord);
                if (!p2pRiskRecords.isEmpty()) {
                    model.addAttribute("totalScore", p2pRiskRecords.get(0).getTotalScore());
                } else {
                    model.addAttribute("totalScore", null);
                }
                return "modules/front/account/riskRecord";//风险测评
            } else if ("pwdManager".equals(mode)) {
                return "modules/front/account/pwdManager";//密码管理
            } else if ("accountSet".equals(mode)) {
                return "redirect:" + adminPath + "/financing/myAccount/accountSet";//账户设置
            } else if ("setUserpic".equals(mode)) {
                return "modules/front/account/userpicSetUp";//修改头像
            } else if ("msgCenter".equals(mode)) {
                return "forward:" + adminPath + "/msg/msgLetterRecord/getMsgList";//消息中心
            } else if ("reportRecord".equals(mode)) {
                User user1 = (User) session.getAttribute("user");
                P2pReportInformationAudit p2pReportInformationAudit = new P2pReportInformationAudit();
                p2pReportInformationAudit.setUser(user1);
                List<P2pReportInformationAudit> p2pReportInformationAuditList = p2pReportInformationAuditService.ssList(user1.getId());
                model.addAttribute("p2pReportInformationAuditList", p2pReportInformationAuditList);
                return "modules/front/account/reportRecord";//举报管理
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
        try {
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
            paramMap.put("currentStage", "500");
            paramMap.put("markType", 1);
            List<P2pFinancingInformation> list = p2pFinancingInformationService.findAllFinancingList(paramMap);
            String json = JsonMapper.toJsonString(list);
            model.addAttribute("user", user);
            model.addAttribute("p2pUserInformation", p2pUserInformation);
            model.addAttribute("p2pUserPic", findUserPicByUserId(user));
            model.addAttribute("sumAmount", sumAmount);
            model.addAttribute("list", list);
            model.addAttribute("json", json);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
        p2pUserInformation = p2pUserInformationService.findUserPicByUserId(p2pUserInformation);
        if (p2pUserInformation != null) {
            p2pUserInformation.setUserpic(UploadFileUtils.viewUrl(p2pUserInformation.getUserpic()));
        }
        return p2pUserInformation;
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
                unReceived += p2pReceivePlan2.getPlanReceiveInterest() + p2pReceivePlan2.getPlanReceiveFine();
            }
        }
        p2pReceivePlan.setReceiveState("2");//已逾期
        List<P2pReceivePlan> listSum2 = p2pReceivePlanService.findPlanByUserId(p2pReceivePlan);
        if (listSum2 != null && listSum2.size() != 0) {
            for (P2pReceivePlan p2pReceivePlan3 : listSum2) {
                unReceived += p2pReceivePlan3.getPlanReceiveInterest() + p2pReceivePlan3.getPlanReceiveFine();
            }
        }
        double hasReceived = investmentRecordService.findIncomeSumByUid(user.getId());
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
     * 加载投资记录
     *
     * @param user
     * @param model
     * @param beginTime
     * @param endTime
     */
    public void loadInvestmentRecord(User user, Model model, Date beginTime, Date endTime) {

    }

    /**
     * 录入划款时间并生成还款和收款计划
     *
     * @param session
     * @param multipartHttpServletRequest
     * @param p2pFinancingInformation
     * @return
     */
    @RequestMapping(value = "entryTime")
    @Transactional(readOnly = false)
    public String entryTime(HttpSession session, MultipartHttpServletRequest multipartHttpServletRequest, P2pFinancingInformation p2pFinancingInformation) {
        User user = (User) session.getAttribute("user");
        //上传放款凭证
        List<String> list = UploadFileUtils.fdfsUpload(multipartHttpServletRequest);
        p2pFinancingInformation.setGivingOutVoucher(list.get(0));
        p2pFinancingInformation.setGivingOutState("2");
        //修改债项信息（放款凭证，放款时间，放款状态）
        p2pFinancingInformationService.saveOrUpdateP2pFinancingInformation(p2pFinancingInformation, null);

        return "redirect:" + adminPath + "/user/Institution/ctrlMenu?mode=investmentGeneral";
    }

    /**
     * 根据userId个债项id查询投资收益明细
     *
     * @param
     * @author Chace
     * getRepaymentRecordById
     */
    @RequestMapping("getRepaymentRecordByIdAndUserId")
    public void getRepaymentRecordByIdAndUserId(P2pFinancingInformation p2pFinancingInformation, HttpSession session, Model model, HttpServletResponse response) {
        User user = (User) session.getAttribute("user");
        p2pFinancingInformation.setUserId(user.getId());
        List<P2pFinancingInformation> financinfList = p2pFinancingInformationService.getRepaymentRecordByIdAndUserId(p2pFinancingInformation);
        model.addAttribute("financinfList", financinfList);
        try {
            String json = JsonMapper.toJsonString(financinfList);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 下载模板文件
     *
     * @param address
     * @param request
     * @param response
     * @author Quincy
     */
    @RequestMapping(value = "downloadTemp")
    public void downloadTemp(String address, HttpServletRequest request, HttpServletResponse response) {
        UploadFileUtils.download(address, request, response);
    }

    /**
     * 添加联系人/对接人信息
     *
     * @param p2pUserInformation
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "addContactInfo")
    @ResponseBody
    public String addContactInfo(HttpSession session, P2pUserInformation p2pUserInformation, String name) {
        try {
            User user = (User) session.getAttribute("user");
            if ("101".equals(user.getRoleList().get(0).getId())) {
                user.setName(name);
                p2pUserInformation.setUser(user);
                p2pUserInformationService.updateDockedInfo(user, p2pUserInformation);
                session.setAttribute("user", user);
                return name;
            }
            if ("102".equals(user.getRoleList().get(0).getId())) {
                p2pUserInformation.setUser(user);
                p2pUserInformationService.updateContactInfo(p2pUserInformation);
                return null;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 删除消息
     *
     * @param msgLetterRecord
     * @author Chace
     */
    @RequestMapping("deleteMsg")
    @ResponseBody
    public String deleteMsg(MsgLetterRecord msgLetterRecord) {
        try {
            msgLetterRecordService.delete(msgLetterRecord);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }

    /**
     * 标记为已读
     */
    @RequestMapping("markRead")
    @ResponseBody
    public String markRead(MsgLetterRecord msgLetterRecord) {
        try {
            msgLetterRecordService.markRead(msgLetterRecord);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }

    /**
     * 判断机构投资前准备
     */
    @RequestMapping("berforInvestment")
    public String berforInvestment(String certificateState) {
        if ("101".equals(certificateState)) {
            return "redirect:" + Global.getAdminPath() + "/sys/user/signAgreementPage";
        }
        if ("200".equals(certificateState)) {
            return "redirect:" + Global.getAdminPath() + "/user/Institution/ctrlMenu?mode=pwdManager";
        }
        return null;
    }
}
