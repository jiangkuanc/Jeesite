/**
 *
 */
package com.dagongsoft.p2p.config.web.back;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dagongsoft.p2p.config.service.back.HomePageService;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.FinancingService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentPlanService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.listener.SingleSignOnListener;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.user.service.back.CertifyManageService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.service.UserService;

/**
 * 后台首页Controller
 *
 * @author Zeus
 * @version 2016-11-21
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/config/homePage")
public class HomePageController extends BaseController {
    @Resource
    private HomePageService homePageService;
    @Resource
    private FinancingService financingService;
    @Resource
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Resource
    private UserService userService;
    @Resource
    private P2pUserInformationService p2pUserInformationService;
    @Resource
    private P2pRepaymentPlanService p2pRepaymentPlanService;
    @Resource
    private CertifyManageService certifyManageService;


    /**
     * 后台用户登录后展示首页查询  wlcomeToBackPage
     *
     * @return
     */
    @RequestMapping(value = "p2pHomePage")
    public String p2pHomePage(Model model) {
        //累计注册会员
        Integer mCount = userService.findAllCountMembers();
        model.addAttribute("mCount", mCount);
        //统计满标债项数量
        Integer aCount = p2pRepaymentPlanService.findAllCountDistinctFid();
        model.addAttribute("aCount", aCount);
        //统计债项融资总额
        BigDecimal fCount = p2pRepaymentPlanService.findAllPlanRepaymentPrincipal();
        model.addAttribute("fCount", fCount);
        //统计待还总额
        BigDecimal pCount = p2pRepaymentPlanService.SumPlanRepaymentPrincipal();
        model.addAttribute("pCount", pCount);

        //统计今日注册用户数
        Integer rCount = p2pUserInformationService.selectTodayRegUsersCount();
        model.addAttribute("rCount", rCount);
        //统计今日登录的用户数目
        Integer tCount = userService.selectTodayLoginedUsersCount();
        model.addAttribute("tCount", tCount);
        //统计历史注册用户数
        Integer uCount = userService.selectUsersCount();
        model.addAttribute("uCount", uCount);
        //统计当前在线用户数
        Integer sCount = SingleSignOnListener.calcOnlineCount();
        model.addAttribute("sCount", sCount);

        //材料审核任务池
        List<P2pEnterpriseCertify> p2pEnterpriseCertifyList = financingService.findDocumentAuditList2();
        model.addAttribute("p2pEnterpriseCertifyList", p2pEnterpriseCertifyList);
        //查询处于募集预警状态的的融资项目(3天)
        List<P2pFinancingInformation> raiseFrontList = p2pFinancingInformationService.findFronRaiseAndWarning();
        model.addAttribute("raiseFrontList", raiseFrontList);
        //查询处于还款预警状态的融资项目(5天)

        List<P2pRepaymentPlan> p2pRepaymentPlanList = homePageService.findRepaymentAndWarning();
        model.addAttribute("p2pRepaymentPlanList", p2pRepaymentPlanList);
        return "p2p/back/config/p2pHomePage";
    }

    /**
     * 材料审核任务池
     *
     * @param p2pEnterpriseCertify
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pHomePageList1")
    public String p2pHomePageList1(P2pEnterpriseCertify p2pEnterpriseCertify, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pEnterpriseCertify> page = homePageService.p2pHomePageList1(new Page<P2pEnterpriseCertify>(request, response), p2pEnterpriseCertify);
        page.setCount(financingService.findDocumentAuditList2().size());
        model.addAttribute("page", page);
        return "p2p/back/config/p2pHomePageList1";
    }

    /**
     * 募集期债项预警信息
     *
     * @param p2pEnterpriseCertify
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pHomePageList2")
    public String p2pHomePageList2(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = homePageService.p2pHomePageList2(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        page.setCount(p2pFinancingInformationService.findFronRaiseAndWarning().size());
        model.addAttribute("page", page);
        return "p2p/back/config/p2pHomePageList2";
    }

    /**
     * 还款期债项预警信息
     *
     * @param p2pEnterpriseCertify
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "p2pHomePageList3")
    public String p2pHomePageList3(P2pRepaymentPlan p2pRepaymentPlan, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRepaymentPlan> page = homePageService.p2pHomePageList3(new Page<P2pRepaymentPlan>(request, response), p2pRepaymentPlan);
        page.setCount(homePageService.findRepaymentAndWarning().size());
        model.addAttribute("page", page);
        return "p2p/back/config/p2pHomePageList3";
    }

    /**
     * 异步查询待办事项
     *
     * @param session
     * @param password
     * @param phoneNumber
     * @param model
     * @return
     */
    @RequestMapping(value = "selectTodos")
    @ResponseBody
    public Map<String, Integer> selectTodos() {
        Map<String, Integer> map = new HashMap<String, Integer>();
        //个人认证
        Integer personalCertifyNum = certifyManageService.getPersonalCertifyNum();
        //企业认证
        Integer enterpriseAgentCertifyNum = certifyManageService.getEnterpriseIdentityCertifyNum();//代理人身份认证数量
        Integer enterpriseCertifyNum = certifyManageService.getEnterpriseCertifyNum();//企业认证数量
        //评级材料审核
        Integer rateDocumentNum = homePageService.getCurrentStageNum("202");
        //立项市场确认
        Integer lixiangNum = homePageService.getCurrentStageNum("203");
        //补信材料审核
        Integer buxinNum = null;
        //债项发布
        Integer fabuNum = homePageService.getCurrentStageNum("400");
        //发布市场确认
        Integer fabuquerenNum = homePageService.getCurrentStageNum("250");
        //满标审核
        Integer manbiaoNum = homePageService.getCurrentStageNum("600");
        //流标审核
        Integer liubiaoNum = homePageService.getCurrentStageNum("901");

        map.put("personalCertifyNum", personalCertifyNum);
        map.put("enterpriseAgentCertifyNum", enterpriseAgentCertifyNum);
        map.put("enterpriseCertifyNum", enterpriseCertifyNum);
        map.put("rateDocumentNum", rateDocumentNum);
        map.put("lixiangNum", lixiangNum);
        map.put("buxinNum", buxinNum);
        map.put("fabuNum", fabuNum);
        map.put("fabuquerenNum", fabuquerenNum);
        map.put("manbiaoNum", manbiaoNum);
        map.put("liubiaoNum", liubiaoNum);
        return map;

    }


}
