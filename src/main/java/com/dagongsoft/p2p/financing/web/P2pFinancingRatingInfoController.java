/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.dagongsoft.p2p.config.service.P2pIndustryclassiService;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.financing.service.P2pFinancingRatingInfoService;
import com.dagongsoft.p2p.financing.service.front.PayRatingFeeService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.RatingState;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.UserService;

/**
 * 融资评级信息Controller
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/p2pFinancingRatingInfo")
public class P2pFinancingRatingInfoController extends BaseController {
    @Autowired
    P2pFinancingInformationService p2pFinancingInformationService;
    @Autowired
    private P2pFinancingRatingInfoService p2pFinancingRatingInfoService;
    @Autowired
    UserService userService;
    @Autowired
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Autowired
    private PayRatingFeeService payRatingFeeService;
    @Autowired
    private P2pIndustryclassiService p2pIndustryclassiService;

    @ModelAttribute
    public P2pFinancingRatingInfo get(@RequestParam(required = false) String id) {
        P2pFinancingRatingInfo entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pFinancingRatingInfoService.get(id);
        }
        if (entity == null) {
            entity = new P2pFinancingRatingInfo();
        }
        return entity;
    }

    @RequiresPermissions("financing:p2pFinancingRatingInfo:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pFinancingRatingInfo p2pFinancingRatingInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingRatingInfo> page = p2pFinancingRatingInfoService.findPage(new Page<P2pFinancingRatingInfo>(request, response), p2pFinancingRatingInfo);
        model.addAttribute("page", page);
        return "modules/financing/p2pFinancingRatingInfoList";
    }

    @RequiresPermissions("financing:p2pFinancingRatingInfo:view")
    @RequestMapping(value = "form")
    public String form(P2pFinancingRatingInfo p2pFinancingRatingInfo, Model model) {
        model.addAttribute("p2pFinancingRatingInfo", p2pFinancingRatingInfo);
        return "modules/financing/p2pFinancingRatingInfoForm";
    }

    @RequiresPermissions("financing:p2pFinancingRatingInfo:edit")
    @RequestMapping(value = "save")
    public String save(P2pFinancingRatingInfo p2pFinancingRatingInfo, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pFinancingRatingInfo)) {
            return form(p2pFinancingRatingInfo, model);
        }
        p2pFinancingRatingInfoService.save(p2pFinancingRatingInfo);
        addMessage(redirectAttributes, "保存融资评级信息成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pFinancingRatingInfo/?repage";
    }

    @RequiresPermissions("financing:p2pFinancingRatingInfo:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pFinancingRatingInfo p2pFinancingRatingInfo, RedirectAttributes redirectAttributes) {
        p2pFinancingRatingInfoService.delete(p2pFinancingRatingInfo);
        addMessage(redirectAttributes, "删除融资评级信息成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pFinancingRatingInfo/?repage";
    }

    /**
     * 跳转到评级信息录入页面
     *
     * @param p2pFinancingRatingInfo
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "toCreditFormPage")
    public String toCreditFormPage(HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) {
        String pid = request.getParameter("pid");//融资信息id
        P2pFinancingRatingInfo p2pFinancingRatingInfo = p2pFinancingRatingInfoService.getByFiId(pid);//获得评级信息
        P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.get(pid);//获得企业、评级、债项等相关信息
        if (p2pFinancingRatingInfo == null) {
            p2pFinancingRatingInfo = new P2pFinancingRatingInfo();
        }
        User user = new User();
        user.setName("准入分析师");
        /*List<User> listCommit=userService.findThePersonNameList(user);
        User user1=new User();
		user1.setName("偿债分析师");
		List<User> listCredit=userService.findThePersonNameList(user1);*/

        //model.addAttribute("listCommit",listCommit);
        //model.addAttribute("listCredit",listCredit);
        model.addAttribute("pid", pid);
        model.addAttribute("p2pFinancingRatingInfo", p2pFinancingRatingInfo);
        model.addAttribute("voes", p2pFinancingInformation);
        return "modules/financing/CreditEnteringForm";
    }

    /**
     * 跳转到评级信息修改页面
     *
     * @param p2pFinancingRatingInfo
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "toCreditRepPage")
    public String toCreditRepPage(HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) {
        String pid = request.getParameter("pid");//融资信息id
        String id = request.getParameter("id");//融资信息id

        P2pFinancingRatingInfo p2pFinancingRatingInfo = p2pFinancingRatingInfoService.getByFiId(pid);
        User user = new User();
        user.setName("准入分析师");
        List<User> listCommit = userService.findThePersonNameList(user);
        User user1 = new User();
        user1.setName("偿债分析师");
        List<User> listCredit = userService.findThePersonNameList(user1);

        model.addAttribute("listCommit", listCommit);
        model.addAttribute("listCredit", listCredit);
        model.addAttribute("voes", p2pFinancingRatingInfo);
        model.addAttribute("pid", pid);
        model.addAttribute("id", id);
        return "modules/financing/CreditRepForm";
    }

    /**
     * 跳转到评级信息详情页
     */
    @RequestMapping(value = "showTheCredit")
    public String showTheCredit(P2pFinancingInformation financingInformation, Model model) {
        P2pFinancingInformation p2pFinancingInformation1 = p2pFinancingInformationService.get(financingInformation.getId());
        model.addAttribute("voes", p2pFinancingInformation1);
        return "modules/financing/showCreditDetailInfo";

    }

    /**
     * 保存录入的评级信息
     *
     * @param p2pFinancingRatingInfo
     * @param redirectAttributes
     * @param model
     * @return
     */

    @RequestMapping(value = "saveCreditInfo")
    public String saveCreditInfo(HttpServletRequest request, P2pFinancingRatingInfo p2pFinancingRatingInfo, RedirectAttributes redirectAttributes, Model model) {


        String pid = request.getParameter("pid");//融资信息ID
        p2pFinancingRatingInfo.setFinancingInformationId(pid);//为关联FinancingInformationId赋值
        double reom = Double.parseDouble(p2pFinancingRatingInfo.getRecommendedRate()) / 100;
        java.text.DecimalFormat df = new java.text.DecimalFormat("#0.000");  //百分号 1位小数
        String reo = df.format(reom);
        p2pFinancingRatingInfo.setRecommendedRate(reo);
        p2pFinancingRatingInfoService.save(p2pFinancingRatingInfo);//保存评级信息
        P2pFinancingInformation p2pFinancingInformation1 = new P2pFinancingInformation();
        p2pFinancingInformation1.setId(pid);
        p2pFinancingInformation1.setCurrentStage("302");
        p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation1);//添加评级信息成功后更改融资状态
        return "redirect:" + Global.getAdminPath() + "/financing/p2pFinancingInformation/findAllcredit/?repage";

		    
		    /* String currentStage=request.getParameter("currentStage");//准入评级结果是否通过
	    P2pFinancingInformation p2pFinancingInformation1=new P2pFinancingInformation();
	    p2pFinancingInformation1.setId(pid);
	    
	    P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
	    p2pFinancingRatingInfo.setPublishTime(new Date());
	    if (currentStage.equals("noPass")) {
	    
	    	p2pFinancingInformation1.setCurrentStage("301");
	    	p2pFinancingRatingInfo.setCreditState("3");//评级状态为不通过
	    	p2pBeforeMatchDebtState.setProgressStage("301");
	        //准入评级不通过
		}else{
			double reom=Double.parseDouble(p2pFinancingRatingInfo.getRecommendedRate())/100;
			   java.text.DecimalFormat   df   =new   java.text.DecimalFormat("#0.0000");  
			  String reo= df.format(reom);
			   p2pFinancingRatingInfo.setRecommendedRate(reo);
			p2pFinancingInformation1.setCurrentStage("302");//准入评级通过
			p2pBeforeMatchDebtState.setProgressStage("302");
			p2pFinancingRatingInfo.setCreditState("1");//评级状态为通过
		}
		p2pFinancingRatingInfo.setFinancingInformationId(pid);//为关联FinancingInformationId赋值
		p2pFinancingRatingInfoService.save(p2pFinancingRatingInfo);//保存评级信息
		 p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation1);//添加评级信息成功后更改融资状态
		//债项状态进展表添加记录
			p2pBeforeMatchDebtState.setFinacingInformationId(pid);
			p2pBeforeMatchDebtState.setStateTime(new Date());
			
			P2pFinancingInformation p2pFinancingInformation=p2pFinancingInformationService.findOneP2pFinancingInfo(pid);//鏌ヨ褰撳墠铻嶈祫鐢ㄦ埛
		    User user=userService.findOneUserFromId(p2pFinancingInformation.getApplicantsId());
			p2pBeforeMatchDebtState.setOperatorId(user.getId());
			p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
		return "redirect:"+Global.getAdminPath()+"/financing/p2pFinancingInformation/findAllcredit/?repage";*/

    }


    /**
     * 修改评级信息
     */
    @RequestMapping(value = "repCreditInfo")
    public String repCreditInfo(HttpServletRequest request, P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        String pid = request.getParameter("pid");//融资信息ID;
        P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.findOneP2pFinancingInfo(pid);//查询当前融资用户
        String currentStage = request.getParameter("currentState");//准入评级结果是否通过
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
        p2pFinancingRatingInfo.setPublishTime(new Date());
        if (currentStage.equals("noPass")) {
            p2pFinancingInformation.setCurrentStage("301");
            //p2pFinancingRatingInfo.setCreditState("3");//评级状态为不通过
            p2pFinancingRatingInfo.setRatingLevel(null);//不通过时将其余数据设为空
            //p2pFinancingRatingInfo.setCreditPerson(null);
            p2pFinancingRatingInfo.setRecommendedRate(null);
            p2pFinancingRatingInfo.setCreditReport(null);
            p2pBeforeMatchDebtState.setProgressStage("301");
            //准入评级不通过
        }
        if (currentStage.equals("pass")) {
            double reom = Double.parseDouble(p2pFinancingRatingInfo.getRecommendedRate()) / 100;
            java.text.DecimalFormat df = new java.text.DecimalFormat("#0.0000");
            String reo = df.format(reom);
            p2pFinancingRatingInfo.setRecommendedRate(reo);
            p2pFinancingInformation.setCurrentStage("302");//准入评级通过
            p2pBeforeMatchDebtState.setProgressStage("302");
            //p2pFinancingRatingInfo.setCreditState("1");//评级状态为通过
        }

        p2pFinancingRatingInfoService.updateCreitRes(p2pFinancingRatingInfo);//更新评级数据

        p2pFinancingInformation.setId(pid);

        p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);//评级信息修改成功后更改融资状态

        //债项状态进展表添加记录
        p2pBeforeMatchDebtState.setFinacingInformationId(pid);
        p2pBeforeMatchDebtState.setStateTime(new Date());

        P2pFinancingInformation p2pFinancingInformation1 = p2pFinancingInformationService.findOneP2pFinancingInfo(pid);
        User user = userService.findOneUserFromId(p2pFinancingInformation1.getApplicantsId());
        p2pBeforeMatchDebtState.setOperatorId(user.getId());
        p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);

        return "redirect:" + Global.getAdminPath() + "/financing/p2pFinancingInformation/findAllcredit/?repage";

    }


    /**
     * 融资项目前台下载评级报告
     *
     * @param address
     * @param request
     * @param response
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "downLoadCreditReport")
    public String downLoadCreditReport(String fid, HttpServletRequest request,
                                       HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
        try {
            P2pFinancingRatingInfo p2p = payRatingFeeService.findRatingReportByFid(fid);
            Integer currentStage = Integer.parseInt(p2p.getP2pFinancingInformation().getCurrentStage());
            if (currentStage > FinancingState.CREDIT_RATING_ING) {
                if ("1".equals(p2p.getIsFinalized())) {
                    UploadFileUtils.fdfsDownload(p2p.getCreditReport(), p2p.getCreditReportName(), response);
                } else {
                    UploadFileUtils.fdfsDownload(p2p.getCommitReport(), p2p.getCommitReportName(), response);
                }
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 评级项目前台下载评级报告
     *
     * @param address
     * @param request
     * @param response
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "downLoadCreditReport2")
    public String downLoadCreditReport2(String fid, HttpServletRequest request,
                                        HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
        try {
            P2pFinancingRatingInfo p2p = payRatingFeeService.findRatingReportByRid(fid);
            Integer currentStage = Integer.parseInt(p2p.getP2pRatingServiceInfo().getCurrentStage());
            if (currentStage > RatingState.CREDIT_RATING_ING) {
                if ("1".equals(p2p.getIsFinalized())) {
                    UploadFileUtils.fdfsDownload(p2p.getCreditReport(), p2p.getCreditReportName(), response);
                } else {
                    UploadFileUtils.fdfsDownload(p2p.getCommitReport(), p2p.getCommitReportName(), response);
                }
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 前台获取评级报告列表
     *
     * @author Chace
     */
    @RequestMapping("getRatingList")
    public String getRatingList(HttpServletResponse response, P2pFinancingRatingInfo p2pFinancingRatingInfo, String ratingType, Model model, String industryCode, String enterpriseName) {
        P2pEnterpriseCertify p2pEnterpriseCertify = new P2pEnterpriseCertify();
        p2pEnterpriseCertify.setEnterpriseName(enterpriseName);
        p2pEnterpriseCertify.setIndustryCode(industryCode);
        p2pFinancingRatingInfo.setP2pEnterpriseCertify(p2pEnterpriseCertify);
        List<P2pFinancingRatingInfo> list = p2pFinancingRatingInfoService.getRatingList(p2pFinancingRatingInfo, ratingType);
        List<P2pIndustryclassi> industryList = p2pIndustryclassiService.findTopCategory();
        model.addAttribute("count", list.size());
        model.addAttribute("industryList", industryList);
        model.addAttribute("list", list);
        model.addAttribute("enterpriseName", enterpriseName);
        model.addAttribute("industryCode", industryCode);
        model.addAttribute("mainCreditGrade", p2pFinancingRatingInfo.getMainCreditGrade());
        model.addAttribute("ratingType", ratingType);
        return "/p2p/front/rating/ratingReportList";
    }


    /**
     * 评级报告购买页
     *
     * @author Chace
     */
    @RequestMapping("ratingReportDetails")
    public String ratingReportDetails(HttpSession session, HttpServletResponse response, P2pFinancingRatingInfo p2pFinancingRatingInfo, Model model) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        String userId = "";
        if (user != null && !"".equals(user.getId())) {
            userId = user.getId();
        }
        p2pFinancingRatingInfo = p2pFinancingRatingInfoService.ratingReportDetails(p2pFinancingRatingInfo, userId);

        //roleList中的101 机构 用户，可以查看权限放开 start
        if (user != null && !"".equals(user.getId())) {
            List<String> roleIdList = user.getRoleIdList();
            if (roleIdList.size() > 0) {
                String string = roleIdList.get(0);
                if ("101".equals(string)) {
                    P2pFinancingRatingInfo info = p2pFinancingRatingInfoService.get(p2pFinancingRatingInfo);
//					p2pFinancingRatingInfo = p2pFinancingRatingInfoService.get(p2pFinancingRatingInfo);
                    String commitReport0 = info.getCommitReport();
//					String commitReport0 = p2pFinancingRatingInfo.getCommitReport();
                    String commitReport = UploadFileUtils.viewUrl(commitReport0);
                    p2pFinancingRatingInfo.setCommitReport(commitReport);
                }
            }
        }
        //roleList中的101 机构 用户，可以查看权限放开 end

        //fdfs图片回显 by周红涛start
        P2pEnterpriseCertify p2pEnterpriseCertify = p2pFinancingRatingInfo.getP2pEnterpriseCertify();
        String businessLicense0 = null;
        if (p2pEnterpriseCertify != null && p2pEnterpriseCertify.getBusinessLicense() != null) {
            businessLicense0 = p2pEnterpriseCertify.getBusinessLicense();
            if (businessLicense0 != null) {
                String businessLicense = UploadFileUtils.viewUrl(businessLicense0);
                p2pEnterpriseCertify.setBusinessLicense(businessLicense);
                p2pEnterpriseCertify.setNameOf(p2pEnterpriseCertify.getNameOf().substring(0, 1) + "**");
                p2pEnterpriseCertify.setIdNumberOf(p2pEnterpriseCertify.getIdNumberOf().substring(0, 4) + "***********" + p2pEnterpriseCertify.getIdNumberOf().substring(15));
                p2pEnterpriseCertify.setTelephoneNumOf(p2pEnterpriseCertify.getTelephoneNumOf().substring(0, 3) + "*****" + p2pEnterpriseCertify.getTelephoneNumOf().substring(8));
            }
        }

        //fdfs图片回显 by周红涛end

        String prefix = p2pFinancingRatingInfo.getFinancingInformationId();
        prefix = prefix.substring(0, 3);
        model.addAttribute("prefix", prefix);
        model.addAttribute("p2pFinancingRatingInfo", p2pFinancingRatingInfo);
        model.addAttribute("user", user);
        return "/p2p/front/rating/ratingReportDetails";
    }

    /**
     * 评级报告购买操作（废弃方法）
     *
     * @author Chace
     */
    @RequestMapping("ratingReportBuy")
    public String ratingReportBuy(Double payAmount, String reportId, String financingInformationId, String userId, Integer reportType, Model model) {
        boolean flag = p2pFinancingRatingInfoService.ratingReportBuy(payAmount, financingInformationId, userId, reportType);
        if (!flag) {
            return "/p2p/front/rating/buyingFailure";
        }
        model.addAttribute("reportId", reportId);
        return "/p2p/front/rating/buyingSuccess";
    }


    /**
     * 首页评级报告查询
     *
     * @author Chace
     */
    @RequestMapping("findFiveList")
    public void findFiveList(HttpServletResponse response) {
        Map<String, List<P2pFinancingRatingInfo>> map = p2pFinancingRatingInfoService.findFiveList();
        String json = JsonMapper.toJsonString(map);
        try {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}