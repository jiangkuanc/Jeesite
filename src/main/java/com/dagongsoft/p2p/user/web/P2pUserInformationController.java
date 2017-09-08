/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.web;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.dagongsoft.p2p.config.service.front.IndustryConfigService;
import com.dagongsoft.p2p.creditmanage.entity.CreditAppealInfo;
import com.dagongsoft.p2p.creditmanage.entity.CreditReportInfo;
import com.dagongsoft.p2p.creditmanage.service.CreditAppealInfoService;
import com.dagongsoft.p2p.creditmanage.service.CreditReportInfoService;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportDataService;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportIndexService;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportService;
import com.dagongsoft.p2p.creditreport.service.P2pInformationAppealService;
import com.dagongsoft.p2p.creditreport.service.P2pReportInformationAuditService;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.document.service.DocumentUploadService;
import com.dagongsoft.p2p.financing.entity.P2pApplicationDocuments;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.financing.service.P2pApplicationDocumentsService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.financing.service.P2pPaymentOfRatingCostService;
import com.dagongsoft.p2p.financing.service.front.FinancingRecordService;
import com.dagongsoft.p2p.financing.service.front.PayRatingFeeService;
import com.dagongsoft.p2p.financing.service.front.ViewDebtDetailsService;
import com.dagongsoft.p2p.investment.service.front.InvestmentRecordService;
import com.dagongsoft.p2p.msg.entity.MsgLetterRecord;
import com.dagongsoft.p2p.msg.service.MsgLetterRecordService;
import com.dagongsoft.p2p.rating.entity.P2pRatingReportTrading;
import com.dagongsoft.p2p.rating.service.P2pRatingReportTradingService;
import com.dagongsoft.p2p.rating.web.P2pRatingServiceInfoController;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.repayment.service.front.RepaymentOperationService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.user.service.front.ViewUserDetailsService;
import com.dagongsoft.p2p.utils.AreaUtils;
import com.dagongsoft.p2p.utils.CertificateState;
import com.dagongsoft.p2p.utils.ExportExcel;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.FormatUtils;
import com.dagongsoft.p2p.utils.PermissionUtils;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.sun.tools.internal.ws.processor.model.Request;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.interceptor.Token;

/**
 * 用户信息表Controller
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/user/p2pUserInformation")
public class P2pUserInformationController extends BaseController {

    @Autowired
    private P2pUserInformationService p2pUserInformationService;

    @Autowired
    private DocumentUploadService documentUploadService;

    @Autowired
    private ViewDebtDetailsService viewDebtDetailsService;

    @Autowired
    private ViewUserDetailsService viewUserDetailsService;

    @Autowired
    private InvestmentRecordService investmentRecordService;

    @Autowired
    private RepaymentOperationService repaymentOperationService;

    @Autowired
    private FinancingRecordService financingRecordService;

    @Autowired
    private IndustryConfigService industryConfigService;
    @Autowired
    private P2pCreditReportService p2pCreditReportService;
    @Autowired
    private P2pCreditReportDataService p2pCreditReportDataService;
    @Autowired
    private P2pCreditReportIndexService p2pCreditReportIndexService;
    @Autowired
    private P2pInformationAppealService p2pInformationAppealService;
    @Autowired
    private MsgLetterRecordService msgLetterRecordService;
    @Autowired
    private P2pRatingServiceInfoController p2pRatingServiceInfoController;
    @Autowired
    private P2pRatingReportTradingService p2pRatingReportTradingService;
    @Autowired
    private P2pReportInformationAuditService p2pReportInformationAuditService;
    @Autowired
    private CreditAppealInfoService creditAppealInfoService;
    @Autowired
    private CreditReportInfoService creditReportInfoService;
    @Autowired
    private P2pPaymentOfRatingCostService p2pPaymentOfRatingCostService;

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

    //用户列表
    @RequiresPermissions("user:p2pUserInformation:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pUserInformation p2pUserInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pUserInformation> page = p2pUserInformationService.findPage(new Page<P2pUserInformation>(request, response, 10), p2pUserInformation);
        model.addAttribute("page", page);
        return "modules/user/p2pUserInformationList";
    }

    @RequiresPermissions("user:p2pUserInformation:view")
    @RequestMapping(value = "form")
    public String form(P2pUserInformation p2pUserInformation, Model model) {
        model.addAttribute("p2pUserInformation", p2pUserInformation);
        return "modules/user/p2pUserInformationForm";
    }

    @RequiresPermissions("user:p2pUserInformation:edit")
    @RequestMapping(value = "save")
    public String save(P2pUserInformation p2pUserInformation, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pUserInformation)) {
            return form(p2pUserInformation, model);
        }
        p2pUserInformationService.save(p2pUserInformation);
        addMessage(redirectAttributes, "保存用户信息表成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pUserInformation/?repage";
    }

    @RequiresPermissions("user:p2pUserInformation:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pUserInformation p2pUserInformation, RedirectAttributes redirectAttributes) {
        p2pUserInformationService.delete(p2pUserInformation);
        addMessage(redirectAttributes, "删除用户信息表成功");
        return "redirect:" + Global.getAdminPath() + "/user/p2pUserInformation/?repage";
    }

    //投资机构列表
    @RequiresPermissions("user:p2pUserInformation:view")
    @RequestMapping(value = {"bankList"})
    public String bankList(P2pUserInformation p2pUserInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pUserInformation> page = p2pUserInformationService.findBankPage(new Page<P2pUserInformation>(request, response), p2pUserInformation);
        model.addAttribute("page", page);
        return "modules/user/userList/p2pInvestmentBankList";
    }

    //投资机构详细信息
    @RequiresPermissions("user:p2pUserInformation:view")
    @RequestMapping(value = {"bankForm"})
    public String bankForm(P2pUserInformation p2pUserInformation, Model model) {
        model.addAttribute("p2pUserInformation", p2pUserInformation);
        return "modules/user/userList/p2pInvestmentBankForm";
    }

    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Autowired
    private P2pRegUserCertifyService p2pRegUserCertifyService;
    @Autowired
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;
    @Autowired
    private P2pApplicationDocumentsService p2pApplicationDocumentsService;
    @Autowired
    private PayRatingFeeService payRatingFeeService;

    /**
     * 融资资质介绍
     *
     * @return
     * @Quincy
     */
    @RequestMapping(value = "financingRule")
    public String financingRule(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            //获得当前用户的认证状态
            int certifyState = p2pUserInformationService.findCertificateState(user.getId());
            if ("102".equals(user.getRoleList().get(0).getId()) && certifyState != CertificateState.NEW_REGISTERED_USERS) {
                return "redirect:" + adminPath + "/user/p2pUserInformation/financingPermission";
            }
        }
        return "modules/front/financing/financingRules";
    }

    /**
     * 融资用户认证流程权限总控制器
     *
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "financingPermission")
    @Token(save = true)
    public String financingPermission(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        //判断当前用户是否为融资用户
        if (user.getRoleList().get(0).getId() == null || !"102".equals(user.getRoleList().get(0).getId())) {
            return "redirect:" + frontPath;//返回无权限页
        }
        //获得当前用户的认证状态
        int certifyState = p2pUserInformationService.findCertificateState(user.getId());
        //开始认证步骤前进行一次实名认证是否失败判断，保证在企业认证审核中可以重新提交实名认证信息
        P2pRegUserCertify pruc = findRegUserCertify(user);
        if (pruc != null) {
            int userCertifyState = pruc.getAuditState();
            if (userCertifyState == 2) {
                model.addAttribute("p2pRegUserCertify", findRegUserCertify(user));
                model.addAttribute("mode", "userCertify");
                return "modules/front/user/updateUserCertify";
            }
        }

        //判断当前用户认证状态
        switch (certifyState) {
            case CertificateState.NEW_REGISTERED_USERS:
                return "modules/front/user/userCertify";//实名认证页
            case CertificateState.IDENTITY_CERTIFICATION_FINISHED:
                model.addAttribute("mode", "enterpriseCertify");
                return "modules/front/user/enterpriseCertify";//企业认证页
            case CertificateState.ENTERPRISE_CERTIFICATION_FAILURE:
                P2pEnterpriseCertify p2pEnterpriseCertify = findEnterpriseCertify(user);
                model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
                model.addAttribute("json", JsonMapper.toJsonString(p2pEnterpriseCertify));
                return "modules/front/user/updateEnterpriseCertify";//回填企业认证表单
            case CertificateState.ENTERPRISE_CERTIFICATION:
                return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=enterpriseCertify";//等待审核页
            case CertificateState.ENTERPRISE_CERTIFICATION_SUCCESS:
                return "p2p/front/user/becomeMember";
            case CertificateState.BECOME_MEMBER:
                break;
        }
        //结束认证步骤后进行一次实名认证是否在审核中判断，保证在所有认证通过才可以进行融资步骤
        int userCertifyState = pruc.getAuditState();
        if (userCertifyState == 3) {
            return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=userCertify";//账户中心-实名认证
        }
        return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=myFinancApp";
    }

    //查询当前用户的实名认证信息
    public P2pRegUserCertify findRegUserCertify(User user) {
        P2pRegUserCertify p2pRegUserCertify = new P2pRegUserCertify();
        p2pRegUserCertify.setUser(user);
        P2pRegUserCertify info = p2pRegUserCertifyService.findP2pRegUserCertifyByProperty(p2pRegUserCertify);
        return info;
    }

    //查询当前用户的企业认证信息
    public P2pEnterpriseCertify findEnterpriseCertify(User user) {
        P2pEnterpriseCertify p2pEnterpriseCertify = new P2pEnterpriseCertify();
        p2pEnterpriseCertify.setUser(user);
        return p2pEnterpriseCertifyService.findP2pEnterpriseCertifyByProperty(p2pEnterpriseCertify);
    }

    //查询当前用户的融资项目信息
    public P2pFinancingInformation findP2pFinancingInformation(User user, Integer currentStage) {
        return p2pFinancingInformationService.findP2pFinancingInformationByApplicantsId(user.getId(), Integer.toString(currentStage));
    }

    //查询当前用户的融资材料信息FinancingState.FINANCING_APPLICATION_FINISHED
    public P2pApplicationDocuments findP2pApplicationDocuments(User user, Integer currentStage) {
        return p2pApplicationDocumentsService.findP2pApplicationDocumentsByFid(findP2pFinancingInformation(user, currentStage));
    }

    /**
     * 我要投资权限总控制器
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "investmentPermission")
    public String investmentPermission(HttpSession session, String mode) {
//		User user = (User) session.getAttribute("user");
//		//判断当前用户是否登录
//		if(user == null || "".equals(user.getId())){
//			return "modules/front/user/userLogin";//返回登录页
//		}
//		//判断当前用户是否为投资用户
//		if(user.getRoleList().get(0).getId() != null && ("101".equals(user.getRoleList().get(0).getId()) 
//				|| "104".equals(user.getRoleList().get(0).getId()))){
//			if("quickInvestment".equals(mode)){
//				return "redirect:"+adminPath+"/financing/p2pFinancingInformation/quickInvestment";//快速投资
//			}
        return "redirect:" + adminPath + "/financing/p2pFinancingInformation/preLoadFinancingList";//投资专区
//		}
//		return "redirect:"+frontPath;
    }

    /**
     * 我的账户权限总控制器
     *
     * @param session
     * @param mode         访问的功能
     * @param model
     * @param beginTime    开始时间，用于查询条件
     * @param endTime      结束时间，用于查询条件
     * @param state        小功能分类
     * @param flag         标识是否第一次融资
     * @param currentStage "账户总览"参数
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "accountPermission")
    @Token(save = true)
    public String accountPermission(HttpSession session, String mode, String msgId, Model model, Date beginTime, Date endTime, Integer state, String flag, String currentStage) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        String roleId = user.getRoleList().get(0).getId();
        //判断当前用户类型
        if (roleId != null && "102".equals(roleId)) {
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
            if ("userCertify".equals(mode)) {
                P2pRegUserCertify p2pRegUserCertify = findRegUserCertify(user);
                if (p2pRegUserCertify != null && p2pRegUserCertify.getRealName() != "") {
                    p2pRegUserCertify.setRealName(p2pRegUserCertify.getRealName().substring(0, 1) + "**");
                    p2pRegUserCertify.setIdNumber(p2pRegUserCertify.getIdNumber().substring(0, 4) + "********" + p2pRegUserCertify.getIdNumber().substring(12));
                }
                model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);
                return "modules/front/account/userCertifyIndex";//身份认证
            } else if ("enterpriseCertify".equals(mode)) {
                model.addAttribute("p2pEnterpriseCertify", findEnterpriseCertify(user));
                return "modules/front/account/enterpriseCertifyIndex";//企业认证
            } else if ("pwdManager".equals(mode)) {
                return "modules/front/account/pwdManager";//密码管理
            } else if ("msgCenter".equals(mode)) {
                return "forward:" + adminPath + "/msg/msgLetterRecord/getMsgList2";//消息中心
            } else if ("msgContent".equals(mode)) {
                model.addAttribute("msgId", msgId);
                return "forward:" + adminPath + "/msg/msgLetterRecord/getById";//消息详情
            } else if ("accSettings".equals(mode)) {
                loadAccountSettings(session, model);
                return "modules/front/account/accSettings";//账户设置
            } else if ("myFinancApp".equals(mode)) {
                return loadMyFinancApp(session, model, flag);//我的融资申请
            } else if ("myDebt".equals(mode)) {
                String url = loadMyDebts(session, model, beginTime, endTime, state);
                return url;//我的债项
            } else if ("myRepayment".equals(mode)) {
                return loadMyRepayment(model, session, state, beginTime, endTime);//我的还款
            } else if ("financRecord".equals(mode)) {
                loadFinancingRecord(session, model, beginTime, endTime);
                return "modules/front/account/financingRecord";//融资记录
            } else if ("setUserpic".equals(mode)) {
                return "modules/front/account/userpicSetUp";//修改头像
            } else if ("updatePhone".equals(mode)) {
                return "forward:" + adminPath + "/msg/msgSmsRecord/showSmsPage2";//绑定手机
            } else if ("creditRecord".equals(mode)) {
                return loadCreditReport(model, session, state, endTime, beginTime);//信用记录模块
            } else if ("withdrawRecord".equals(mode)) {
                return "forward:" + adminPath + "/p2p/user/p2pAccountWithdrawRecord/loadWithdrawRecord2";//提现记录
            } else if ("rechargeRecord".equals(mode)) {
                return "forward:" + adminPath + "/p2p/user/p2pAccountRechargeRecord/loadRechargeRecord2";//充值记录
            } else if ("memberManager".equals(mode)) {
                model.addAttribute("certifyState", p2pUserInformationService.findCertificateState(user.getId()));
                return "modules/front/account/memberManager";//会员管理
            } else {
                loadAccountIndex(session, model, beginTime, endTime, currentStage, state);//加载融资用户账户总览
                return "modules/front/account/accountIndex";//账户总览
            }
        }
        return "redirect:" + frontPath;
    }

    /**
     * 加载投资总金额
     *
     * @param userId
     * @return
     */
    public String loadAllInvestmentAmountByUserId(String userId) {
        Integer amount = p2pFinancingInformationService.loadAllInvestAmountByUserId(userId);
        if (amount != null) {
            return FormatUtils.amountFormat(amount);
        }
        return "0";
    }

    /**
     * 加载融资总个数
     *
     * @param applicantsId
     * @return
     */
    public String loadAllFinancingCountByApplicantsId(String applicantsId) {
        Integer count = p2pFinancingInformationService.loadAllFinancingCountByApplicantsId(applicantsId);
        if (count != null) {
            return Integer.toString(count);
        }
        return "0";
    }

    /**
     * 加载“我的债项”页面
     *
     * @param session
     * @param model
     * @author Quincy
     */
    public String loadMyDebts(HttpSession session, Model model, Date beginTime, Date endTime, Integer state) {
        User user = (User) session.getAttribute("user");
        List<P2pFinancingInformation> list = null;
        P2pFinancingInformation p2p = null;
        if (beginTime != null && endTime != null) {
            model.addAttribute("flag", "1");//是否进行条件查询标记
        }
        if (state != null && state == 1) {
            p2p = viewDebtDetailsService.findAfterMatchDebtInfo(user.getId());
            model.addAttribute("p2p", p2p);//加载还款中债项信息
            if (p2p != null) {
                model.addAttribute("investmentList", investmentRecordService.findInvestmentRecordByFid(p2p.getId(), beginTime, endTime));//投资记录
                model.addAttribute("investmentCount", investmentRecordService.findAllRecordCountByFid(p2p.getId()));//投标人次
                List<P2pRepaymentPlan> repaymentList = repaymentOperationService.findRepaymentDetailsByFid(p2p.getId());
                model.addAttribute("repaymentList", repaymentList);//还款明细
                model.addAttribute("json", JsonMapper.toJsonString(repaymentList));//还款明细JSON格式
                model.addAttribute("notPaid", repaymentOperationService.findRepaymentCountByFid(p2p.getId(), 1));
                model.addAttribute("hasPaid", repaymentOperationService.findRepaymentCountByFid(p2p.getId(), 2));
                model.addAttribute("overdueFine", repaymentOperationService.findRepaymentCountByFid(p2p.getId(), 3));
                model.addAttribute("overdueDays", viewDebtDetailsService.findOverdueDaysByFid(p2p.getId()));
            }
            return "modules/front/account/myDebts2";
        } else if (state != null && state == 2) {
            list = viewDebtDetailsService.findHasEndedDebts(user.getId(), beginTime, endTime, 1);
            model.addAttribute("list", list);//加载已完成债项列表
            return "modules/front/account/myDebts3";
        } else if (state != null && state == 3) {
            list = viewDebtDetailsService.findHasEndedDebts(user.getId(), beginTime, endTime, 0);
            model.addAttribute("list", list);//加载已流标债项列表
            return "modules/front/account/myDebts4";
        } else {
            p2p = viewDebtDetailsService.findMiddleMatchDebtInfo(user.getId());
            model.addAttribute("p2p", p2p);//加载募集中债项信息
            if (p2p != null) {
                model.addAttribute("investmentList", investmentRecordService.findInvestmentRecordByFid(p2p.getId(), beginTime, endTime));//投资记录
                model.addAttribute("investmentCount", investmentRecordService.findAllRecordCountByFid(p2p.getId()));//投标人次
            }
            return "modules/front/account/myDebts1";
        }
    }

    /**
     * 加载“融资记录”页面
     *
     * @param session
     * @param model
     * @author Quincy
     */
    public void loadFinancingRecord(HttpSession session, Model model, Date beginTime, Date endTime) {
        try {
            User user = (User) session.getAttribute("user");
//			List<P2pFinancingInformation> list = financingRecordService.findRepayRecordByUid(user.getId(), beginTime, endTime);
//			List<P2pFinancingInformation> list2 = financingRecordService.findLoanRecordByUid(user.getId(), beginTime, endTime);
            model.addAttribute("repayList", financingRecordService.findRepayRecordByUid(user.getId(), beginTime, endTime));//还款记录列表
            model.addAttribute("loanList", financingRecordService.findLoanRecordByUid(user.getId(), beginTime, endTime));//放款记录列表
            model.addAttribute("allFinancingAmount", p2pFinancingInformationService.loadAllFinancingAmountByApplicantsId(user.getId()));//融资总金额
            model.addAttribute("allFinancingCount", p2pFinancingInformationService.loadAllFinancingCountByApplicantsId(user.getId()));//融资总个数
            if (beginTime != null && endTime != null) {
                model.addAttribute("flag", "1");//是否进行条件查询标记
            }
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
        return p2pUserInformationService.findUserPicByUserId(p2pUserInformation);
    }

    /**
     * 加载“我的融资申请”页面
     *
     * @param user
     * @return
     * @author Quincy
     */
    public String loadMyFinancApp(HttpSession session, Model model, String flag) {
        String url = null;
        User user = (User) session.getAttribute("user");
        //获得当前用户的认证状态
        int certifyState = p2pUserInformationService.findCertificateState(user.getId());
        if (certifyState != 400) {
            return "redirect:" + adminPath + "/user/p2pUserInformation/financingPermission";//完成认证
        }
        P2pRegUserCertify pruc = findRegUserCertify(user);
        if (pruc != null) {
            int userCertifyState = pruc.getAuditState();
            if (userCertifyState == 2 || userCertifyState == 3) {
                return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=userCertify";
            }
        }
        //获得当前用户的融资项目的进展阶段
        int currentStage = p2pFinancingInformationService.findCurrentStage(user.getId());
        if ("1".equals(flag) && currentStage == 0) {
            Date operationPeriod = findEnterpriseCertify(user).getOperationPeriod();
            if (operationPeriod != null) {
                if (operationPeriod.getTime() - System.currentTimeMillis() < 31536000000L) {
                    model.addAttribute("isApply", 0);
                }
            }
        }
        if (flag == null && currentStage == 0) {
            Date operationPeriod = findEnterpriseCertify(user).getOperationPeriod();
            if (operationPeriod != null) {
                if (operationPeriod.getTime() - System.currentTimeMillis() < 31536000000L) {
                    model.addAttribute("isApply", 0);
                }
            }
            return "modules/front/financing/financingRules2";
        } else if (currentStage < 0) {
            return p2pRatingServiceInfoController.ctrlRatingFlow(session, model, currentStage);
        }
        P2pRegUserCertify p2pRegUserCertify = findRegUserCertify(user);
        p2pRegUserCertify.setRealName(p2pRegUserCertify.getRealName().substring(0, 1) + "**");
        model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);//加载实名认证信息
        P2pFinancingInformation p2p = null;
        switch (currentStage) {
            //填写融资申请
            case 0:
                model.addAttribute("p2pRegUserCertify", findRegUserCertify(user));
                model.addAttribute("p2pEnterpriseCertify", findEnterpriseCertify(user));
                model.addAttribute("provincialAreaList", AreaUtils.loadProvincialArea());//加载省级区域
                List<P2pIndustryclassi> list = industryConfigService.findTopCategory();
                model.addAttribute("industryList", list);//加载一级行业列表
                return "modules/front/financing/financingApplication";
            //上传非财务材料
            case FinancingState.FINANCING_APPLICATION_FINISHED:
                p2p = findP2pFinancingInformation(user, FinancingState.FINANCING_APPLICATION_FINISHED);
                model.addAttribute("p2pFinancingInformation", p2p);
                return "modules/front/financing/applicationDocuments";//非财务材料提交页
            //上传财务材料
            case FinancingState.COMMITED_NON_FINANC_DOCUMENTS:
                p2p = findP2pFinancingInformation(user, FinancingState.COMMITED_NON_FINANC_DOCUMENTS);
                model.addAttribute("p2pFinancingInformation", p2p);
                return "modules/front/financing/applicationDocuments2";//财务材料提交页
            //评级材料初审中
            case FinancingState.DOCUMENTS_AUDIT:
                url = "modules/front/account/myFinancingApp1";//等待材料审核
                InitDataList(model, FinancingState.DOCUMENTS_AUDIT, user, 1);
                break;
            //评级材料初审未通过
            case FinancingState.DOCUMENTS_AUDIT_FAILURE:
                url = "modules/front/account/myFinancingApp2";//材料审核失败
                InitDataList(model, FinancingState.DOCUMENTS_AUDIT_FAILURE, user, 2);
                break;
            //待立项
            case FinancingState.DOCUMENTS_AUDIT_SUCCESS:
                url = "modules/front/account/myFinancingApp3";//等待评级
                InitDataList(model, FinancingState.DOCUMENTS_AUDIT_SUCCESS, user, 3);
                break;

            //信用评级中
            case FinancingState.CREDIT_RATING_ING:
                url = "modules/front/account/myFinancingApp4";
                InitDataList(model, FinancingState.CREDIT_RATING_ING, user, 3);
                break;
            //待确认评级结果
            case FinancingState.RATING_RESULTS_TO_BE_CONFIRMED:
                url = "modules/front/account/myFinancingApp5";
                InitDataList(model, FinancingState.RATING_RESULTS_TO_BE_CONFIRMED, user, 4);
                break;
            //内容修改中
            case FinancingState.RATING_RESULTS_CONTENT_MODIFING:
                url = "modules/front/account/myFinancingApp6";
                InitDataList(model, FinancingState.RATING_RESULTS_CONTENT_MODIFING, user, 4);
                break;
            //复评
            case FinancingState.REVIEW_ING:
                url = "modules/front/account/myFinancingApp7";
                InitDataList(model, FinancingState.REVIEW_ING, user, 4);
                break;
            //评级报告发布
            case FinancingState.REPORT_AUDIT:
                url = "modules/front/account/myFinancingApp17";
                InitDataList(model, FinancingState.REPORT_AUDIT, user, 5);
                break;
            //补信
            case FinancingState.SUPPLY_CREDIT:
                url = "modules/front/account/myFinancingApp8";
                InitDataList(model, FinancingState.SUPPLY_CREDIT, user, 4);
                break;
            //补信公司处理中
            case FinancingState.SUBMIT_CREDIT_CERTIFY:
                url = "modules/front/account/myFinancingApp9";
                InitDataList(model, FinancingState.SUBMIT_CREDIT_CERTIFY, user, 4);
                break;
            //市场人员待确认
            case FinancingState.MARKET_STAFF_CONFIRMED:
                url = "modules/front/account/myFinancingApp10";
                InitDataList(model, FinancingState.MARKET_STAFF_CONFIRMED, user, 4);
                break;
            //待确认债项
            case FinancingState.CREDIT_RATING_SUCCESS:
                url = "modules/front/account/myFinancingApp11";//等待确认债项
                InitDataList(model, FinancingState.CREDIT_RATING_SUCCESS, user, 4);
                break;
            //发布审核
            case FinancingState.CONFIRM_RESULT:
                url = "modules/front/account/myFinancingApp12";//等待发布审核
                InitDataList(model, FinancingState.CONFIRM_RESULT, user, 4);
                break;
            //债项募集期
            case FinancingState.FINANCING_PUBLISHED:
                url = "modules/front/account/myFinancingApp13";//募集期
                InitDataList(model, FinancingState.FINANCING_PUBLISHED, user, 4);
                break;
            //满标审核
            case FinancingState.INVESTED:
                url = "modules/front/account/myFinancingApp14";//发布审核
                InitDataList(model, FinancingState.INVESTED, user, 4);
                break;
            //待放款（机构投债项特有状态）
            case FinancingState.PAID_RATING:
                url = "modules/front/account/myFinancingApp15";//发布审核
                InitDataList(model, FinancingState.PAID_RATING, user, 4);
                break;
            //还款中
            case FinancingState.MAKE_LOAN:
                url = "modules/front/account/myFinancingApp16";//还款中
                InitDataList(model, FinancingState.MAKE_LOAN, user, 4);
                break;
            case FinancingState.FINANCING_EXPIRED:
                url = "modules/front/account/myFinancingApp18";//待确认流标
                InitDataList(model, FinancingState.FINANCING_EXPIRED, user, 4);
                break;
        }
        return url;
    }

    /**
     * 流程图页面数据列表初始化
     *
     * @param model        数据载体
     * @param currentStage 当前阶段
     * @param user         当前用户
     * @param mode         数据模式
     * @author Quincy
     */
    public void InitDataList(Model model, Integer currentStage, User user, int mode) {
        try {
            P2pFinancingInformation p2p = findP2pFinancingInformation(user, currentStage);
            if (mode == 1) {
                model.addAttribute("rateDocument0", documentUploadService.findSimpleList(p2p.getId(), 0));
            } else if (mode == 2) {
                model.addAttribute("rateDocument1", documentUploadService.findSimpleList(p2p.getId(), 1));
                List<P2pRateDocumentUpload> list = documentUploadService.findSimpleList(p2p.getId(), 2);
                model.addAttribute("rateDocument2", list);
                model.addAttribute("docList", JsonMapper.toJsonString(list));
                model.addAttribute("financingInformationId", p2p.getId());
            } else if (mode == 3) {
                model.addAttribute("rateDocument0", documentUploadService.findSimpleList(p2p.getId(), 0));//已提交材料列表
                // TODO 上线后需要更改金额
                //P2pPaymentOfRatingCost findOrderInfoByFid = payRatingFeeService.findOrderInfoByFid(p2p.getId());
                //findOrderInfoByFid.setPaymentAmount(1.00);
                model.addAttribute("orderInfo", payRatingFeeService.findOrderInfoByFid(p2p.getId(), user.getId()));//评级费订单
                //立项后，还可以交费
                List<P2pPaymentOfRatingCost> findOrderInfoListByFid = payRatingFeeService.findOrderInfoListByFid(p2p.getId(), user.getId());//评级费订单列表
                //遍历查看是否有过期的订单
                for (P2pPaymentOfRatingCost p2pPaymentOfRatingCost : findOrderInfoListByFid) {
                    //如果不等于1，需要查看一下，是否订单过期，过期了需要重新生成订单，在支付。变成了两步操作。
                    if (!"1".equals(p2pPaymentOfRatingCost.getDelFlag())) {
                        Date dateOld = p2pPaymentOfRatingCost.getOrderTime();
                        Date dateNew = new Date();
                        long difference = dateNew.getTime() - dateOld.getTime();
                        if (difference > 24 * 60 * 60 * 1000) {
                            //订单过期，修改bean
                            p2pPaymentOfRatingCost.setDelFlag("1");
                            //修改数据库
                            p2pPaymentOfRatingCostService.deleteFlag(p2pPaymentOfRatingCost.getOrderNo());
                        }
                    }
                }
                model.addAttribute("orderList", findOrderInfoListByFid);

                model.addAttribute("financingInformationId", p2p.getId());
                model.addAttribute("isSupply", p2p.getIsSupply());
            } else if (mode == 4) {
                model.addAttribute("rateDocument0", documentUploadService.findSimpleList(p2p.getId(), 0));//已提交材料列表
                model.addAttribute("orderInfo", payRatingFeeService.findOrderInfoByFid(p2p.getId(), user.getId()));//评级费订单
                model.addAttribute("financingInformationId", p2p.getId());
                //债项缴费，评级费封装和数据处理
                List<P2pPaymentOfRatingCost> findOrderInfoListByFid = payRatingFeeService.findOrderInfoListByFid(p2p.getId(), user.getId());//评级费订单列表
                //遍历查看是否有过期的订单
                for (P2pPaymentOfRatingCost p2pPaymentOfRatingCost : findOrderInfoListByFid) {
                    //如果不等于1，需要查看一下，是否订单过期，过期了需要重新生成订单，在支付。变成了两步操作。
                    if (!"1".equals(p2pPaymentOfRatingCost.getDelFlag())) {
                        Date dateOld = p2pPaymentOfRatingCost.getOrderTime();
                        Date dateNew = new Date();
                        long difference = dateNew.getTime() - dateOld.getTime();
                        if (difference > 24 * 60 * 60 * 1000) {
                            //订单过期，修改bean
                            p2pPaymentOfRatingCost.setDelFlag("1");
                            //修改数据库
                            p2pPaymentOfRatingCostService.deleteFlag(p2pPaymentOfRatingCost.getOrderNo());
                        }
                    }
                }
                model.addAttribute("orderList", findOrderInfoListByFid);

                model.addAttribute("ratingInfo", viewDebtDetailsService.findRatingInfoByFid(p2p.getId()));//评级信息
                model.addAttribute("page", financingRecordService.findDebtOrbitByFid(p2p.getId()));//轨迹模型
                model.addAttribute("isSupply", p2p.getIsSupply());
            } else if (mode == 5) {
                model.addAttribute("rateDocument0", documentUploadService.findSimpleList(p2p.getId(), 0));//已提交材料列表
                model.addAttribute("orderInfo", payRatingFeeService.findOrderInfoByFid(p2p.getId(), user.getId()));//评级费订单

                //债项缴费，评级费封装和数据处理
                List<P2pPaymentOfRatingCost> findOrderInfoListByFid = payRatingFeeService.findOrderInfoListByFid(p2p.getId(), user.getId());//评级费订单列表
                //遍历查看是否有过期的订单
                for (P2pPaymentOfRatingCost p2pPaymentOfRatingCost : findOrderInfoListByFid) {
                    //如果不等于1，需要查看一下，是否订单过期，过期了需要重新生成订单，在支付。变成了两步操作。
                    if (!"1".equals(p2pPaymentOfRatingCost.getDelFlag())) {
                        Date dateOld = p2pPaymentOfRatingCost.getOrderTime();
                        Date dateNew = new Date();
                        long difference = dateNew.getTime() - dateOld.getTime();
                        if (difference > 24 * 60 * 60 * 1000) {
                            //订单过期，修改bean
                            p2pPaymentOfRatingCost.setDelFlag("1");
                            //修改数据库
                            p2pPaymentOfRatingCostService.deleteFlag(p2pPaymentOfRatingCost.getOrderNo());
                        }
                    }
                }
                model.addAttribute("orderList", findOrderInfoListByFid);


                model.addAttribute("financingInformationId", p2p.getId());
                model.addAttribute("ratingInfo", viewDebtDetailsService.findRatingInfoByFid(p2p.getId()));//评级信息
                model.addAttribute("page", financingRecordService.findDebtOrbitByFid2(p2p.getId()));//轨迹模型
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 加载“我的还款”页面
     *
     * @param model
     * @param session
     */
    public String loadMyRepayment(Model model, HttpSession session, Integer state, Date beginTime, Date endTime) {
        try {
            User user = (User) session.getAttribute("user");
            P2pFinancingInformation p2p = findP2pFinancingInformation(user, FinancingState.MAKE_LOAN);
            if (state != null && state == 1) {
                List<P2pRepaymentPlan> list = repaymentOperationService.findRepaymentListByFid(user.getId(), beginTime, endTime, 2);
                model.addAttribute("list", list);
                return "modules/front/account/myRepay2";
            }
            if (state != null && state == 2) {
                model.addAttribute("list", repaymentOperationService.findOverdueListByUserId(user.getId()));
                return "modules/front/account/myRepay3";
            }
            if (state != null && state == 0) {
                if (p2p != null) {
                    model.addAttribute("p2p", p2p);
                    model.addAttribute("list", repaymentOperationService.findRepaymentListByFid(user.getId(), beginTime, endTime, 1));
                }
                return "modules/front/account/myRepay1";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 加载“账户总览”页面
     *
     * @param session
     * @param model
     * @author Quincy
     */
    public void loadAccountIndex(HttpSession session, Model model, Date beginTime, Date endTime, String currentStage, Integer state) {
        User user = (User) session.getAttribute("user");
        P2pFinancingInformation p2p = findP2pFinancingInformation(user, FinancingState.MAKE_LOAN);
        P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
        if (p2pUserInformation.getUserpic() != null && !"".equals(p2pUserInformation.getUserpic())) {
            p2pUserInformation.setUserpic(UploadFileUtils.viewUrl(p2pUserInformation.getUserpic()));
        }
        model.addAttribute("p2pRegUserCertify", findRegUserCertify(user));//实名认证信息
        model.addAttribute("p2pEnterpriseCertify", findEnterpriseCertify(user));//企业认证信息
        model.addAttribute("p2pUserInformation", p2pUserInformation);//用户其他信息
        model.addAttribute("allFinancingAmount", p2pFinancingInformationService.loadAllFinancingAmountByApplicantsId(user.getId()));//融资总金额
        model.addAttribute("notPaid", "");
        if (p2p != null) {
            model.addAttribute("notPaid", repaymentOperationService.findRepaymentCountByFid(p2p.getId(), 1));
        }
        List<P2pFinancingInformation> list = viewDebtDetailsService.loadApplySuccessDebts(user.getId(), beginTime, endTime, currentStage);
        P2pRatingReportTrading p2pRatingReportTrading = new P2pRatingReportTrading();
        p2pRatingReportTrading.setUserId(user.getId());
        List<P2pRatingReportTrading> list2 = p2pRatingReportTradingService.findListByUid(p2pRatingReportTrading);
        if (currentStage != null) {
            model.addAttribute("flag", "1");//是否进行条件查询标记
        }
        model.addAttribute("list", list);
        model.addAttribute("list2", list2);
    }

    /**
     * 加载“账户设置”页面
     *
     * @param session
     * @param model
     */
    public void loadAccountSettings(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("p2pUserInformation", p2pUserInformationService.findP2pUserInformationByUser(user));
    }

    /**
     * 确认债项前加载债项和企业详情
     *
     * @param session
     * @param model
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "loadDebtDetails")
    public String loadDebtDetails(HttpSession session, String financingInformationId, Model model) {
        if (PermissionUtils.ctrlPermission(session, null, FinancingState.CREDIT_RATING_SUCCESS) == false) {
            return "modules/front/state/error";
        }
        User user = (User) session.getAttribute("user");
        P2pEnterpriseCertify p2pEnterpriseCertify = viewUserDetailsService.findUserDetailsByUid(user.getId());
        p2pEnterpriseCertify.setNameOf(p2pEnterpriseCertify.getNameOf().substring(0, 1) + "**");
        p2pEnterpriseCertify.getP2pRegUserCertify().setRealName(p2pEnterpriseCertify.getP2pRegUserCertify().getRealName().substring(0, 1) + "**");
        model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);//加载企业信息
        model.addAttribute("p2pFinancingInformation", viewDebtDetailsService.findDebtDetailsByFid(financingInformationId));//加载债项信息
        return "modules/front/financing/debtDetails";
    }

    /**
     * 地区级联查询
     *
     * @param parentId
     * @return
     */
    @RequestMapping(value = "loadMunicipalArea")
    @ResponseBody
    public List<Area> loadMunicipalArea(@RequestParam String parentId) {
        return AreaUtils.loadMunicipalArea(parentId);
    }

    //导出excel
    @RequestMapping(value = "exportExcel")
    public String exportExcel(HttpServletRequest request, HttpServletResponse response, Model model) {
        String jsonStr = request.getParameter("json");
        String headers = request.getParameter("headers");
        String title = request.getParameter("fileName");
        String fileName = request.getParameter("fileName") + ".xls";
        ExportExcel ex = new ExportExcel();
        ex.export(jsonStr, headers, fileName, title, response, request);
        return null;
    }

    /**
     * 首页广告图片跳转页面
     * <p>
     * 我要融资
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "applyFinancing")
    public String applyFinancing(HttpServletRequest request, HttpServletResponse response, Model model) {

        return "modules/front/financing/financingRules";
    }


    /**
     * 加载“信用”页面
     *
     * @param model
     * @param session
     */
    public String loadCreditReport(Model model, HttpSession session, Integer state, Date beginTime, Date endTime) {
        User user = (User) session.getAttribute("user");
        if (state != null && state == 1) {
            CreditAppealInfo creditAppealInfo = new CreditAppealInfo();
            creditAppealInfo.setAppealId(user.getId());
            List<CreditAppealInfo> creditAppealInfoList = creditAppealInfoService.findList(creditAppealInfo);
            model.addAttribute("creditAppealInfoList", creditAppealInfoList);
            return "modules/front/account/appealRecord";//申诉
        }
        if (state != null && state == 2) {
            CreditReportInfo creditReportInfo = new CreditReportInfo();
            creditReportInfo.setReportId(user.getId());
            List<CreditReportInfo> creditReportInfoList = creditReportInfoService.findListByReportId(creditReportInfo);
            model.addAttribute("creditReportInfoList", creditReportInfoList);
            return "modules/front/account/reportRecord";//举报
        }
        if (state != null && state == 0) {

            try {
                P2pEnterpriseCertify p2pEnterpriseCertify = new P2pEnterpriseCertify();
                p2pEnterpriseCertify.setUserId(user.getId());
                p2pEnterpriseCertify = p2pEnterpriseCertifyService.findCreditByUserId(p2pEnterpriseCertify);
                model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
                model.addAttribute("countDagong", p2pEnterpriseCertify.getDagongList().size());
                model.addAttribute("countOther", p2pEnterpriseCertify.getOtherList().size());
                model.addAttribute("countBank", p2pEnterpriseCertify.getBankList().size());
                model.addAttribute("dagongList", p2pEnterpriseCertify.getDagongList());
                model.addAttribute("otherList", p2pEnterpriseCertify.getOtherList());
                model.addAttribute("bankList", p2pEnterpriseCertify.getBankList());
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "modules/front/account/creditRecord";
        }

        return null;
    }

    /**
     * 处理成为会员请求
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "becomeMember")
    public String becomeMember(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (!PermissionUtils.ctrlPermission(session, CertificateState.ENTERPRISE_CERTIFICATION_SUCCESS, null)) {
            return "redirect:" + adminPath + "/user/p2pUserInformation/financingPermission";
        }
        /*
         * 改变账号准备状态，改变为"已成为会员"
		 */
        P2pUserInformation p2pUserInformation = new P2pUserInformation();
        p2pUserInformation.setUser(user);
        p2pUserInformation.setCertificateState(CertificateState.BECOME_MEMBER);
        p2pUserInformationService.updateCertificateState(p2pUserInformation);
        return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=memberManager";
    }

    /**
     * 评级方法介绍
     *
     * @return
     * @Chace
     */
    @RequestMapping("ratingMethod")
    public String ratingMethod(HttpSession session) {
        return "modules/front/financing/financingRules";
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
     * 查询融资企业联系人信息
     *
     * @param userId
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "findContactInfo")
    @ResponseBody
    public String findContactInfo(@RequestParam String userId) {
        return JsonMapper.toJsonString(p2pUserInformationService.findContactInfo(userId));
    }
}








