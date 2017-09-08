package com.dagongsoft.p2p.financing.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dagongsoft.p2p.financing.entity.RateDataWriteTime;
import com.dagongsoft.p2p.financing.entity.RateEnterpriseFinancialData;
import com.dagongsoft.p2p.financing.entity.RateFinancialIndicator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.EnterpriseDataBaseService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.dagongsoft.p2p.utils.FormatData2Json;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * Created by xiashucheng on 2017/6/27.
 */
@Controller
@RequestMapping(value = "${adminPath}/enterpriseDatabase")
public class EnterpriseDatabaseController extends BaseController {
    @Resource
    EnterpriseDataBaseService enterpriseDatabaseService;
    @Resource
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Resource
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;

    @RequestMapping(value = {"list", ""})
    public String list(HttpServletRequest request, HttpServletResponse response, Model model) {
        User u = (User) request.getSession().getAttribute("user");
        if (u != null) {
            model.addAttribute("financingInformationId", request.getParameter("financingInformationId"));
            model.addAttribute("enterpriseName", enterpriseDatabaseService.findP2pEnterpriseCertify(request.getParameter("financingInformationId")));
            model.addAttribute("enterprisePhoto", enterpriseDatabaseService.findP2pEnterpriseCertifyById(request.getParameter("financingInformationId")));
            model.addAttribute("financingRatingInfo", enterpriseDatabaseService.findP2pFinancingRatingInfoByFinancingInformationId(request.getParameter("financingInformationId")));
            model.addAttribute("photo", enterpriseDatabaseService.findEnterpriseDataBaseByProjectId(request.getParameter("financingInformationId"), "entBase"));
            return "modules/financing/enterpriseDataBase/enterpriseDatabase";
        } else {
            return "modules/front/user/userLogin";
        }
    }

    @RequestMapping(value = {"financial"})
    public String financial(HttpServletRequest request, HttpServletResponse response, Model model) {
        User u = (User) request.getSession().getAttribute("user");
        if (u != null) {
            model.addAttribute("financingInformationId", request.getParameter("financingInformationId"));
            model.addAttribute("enterprisePhoto", enterpriseDatabaseService.findP2pEnterpriseCertifyById(request.getParameter("financingInformationId")));
            model.addAttribute("enterpriseName", enterpriseDatabaseService.findP2pEnterpriseCertify(request.getParameter("financingInformationId")));
            model.addAttribute("financingRatingInfo", enterpriseDatabaseService.findP2pFinancingRatingInfoByFinancingInformationId(request.getParameter("financingInformationId")));
            String companyId = p2pFinancingInformationService.get(request.getParameter("financingInformationId")).getApplicantsId();
            String projectId = request.getParameter("financingInformationId").toString();
            String OperatingSystemId = enterpriseDatabaseService.getOperatingSystemSelection(projectId);
            if ("F".equals(OperatingSystemId) || "L".equals(OperatingSystemId) || "M".equals(OperatingSystemId) || "C".equals(OperatingSystemId)) {
                List<RateFinancialIndicator> allData = new ArrayList<RateFinancialIndicator>();
                List<RateFinancialIndicator> bstyle = new ArrayList<RateFinancialIndicator>();
                List<RateFinancialIndicator> profitData = new ArrayList<RateFinancialIndicator>();
                List<RateEnterpriseFinancialData> rateEnterpriseFinancialDatas = enterpriseDatabaseService.findFinancalTime(projectId, companyId);
                //查询出财务指标对应公式
                //资产负债表
                allData = enterpriseDatabaseService.findIndicatorList(projectId, companyId, "%NON000100%", "yes");
                //利润表
                profitData = enterpriseDatabaseService.findIndicatorList(projectId, companyId, "%NON000200%", "yes");
                //现金流量表
                bstyle = enterpriseDatabaseService.findIndicatorList(projectId, companyId, "%NON000300%", "yes");
                String method = request.getParameter("method");
                allData = enterpriseDatabaseService.check(method, allData);
                profitData = enterpriseDatabaseService.check(method, profitData);
                bstyle = enterpriseDatabaseService.check(method, bstyle);

                if (allData == null) {
                    allData = new ArrayList<RateFinancialIndicator>();
                }
                if (profitData == null) {
                    profitData = new ArrayList<RateFinancialIndicator>();
                }
                if (bstyle == null) {
                    bstyle = new ArrayList<RateFinancialIndicator>();
                }
                if (rateEnterpriseFinancialDatas == null) {
                    rateEnterpriseFinancialDatas = new ArrayList<RateEnterpriseFinancialData>();
                }
                model.addAttribute("allData", allData);
                model.addAttribute("profitData", profitData);
                model.addAttribute("bstyle", bstyle);
                model.addAttribute("rateEnterpriseFinancialDatas", rateEnterpriseFinancialDatas);
                List<RateFinancialIndicator> rateFinancialIndicatorsR = enterpriseDatabaseService.findIndicatorList(projectId, companyId, "%NON000101%", "yes");
                rateFinancialIndicatorsR = enterpriseDatabaseService.check(method, rateFinancialIndicatorsR);
                if (rateFinancialIndicatorsR == null) {
                    rateFinancialIndicatorsR = new ArrayList<RateFinancialIndicator>();
                }
                model.addAttribute("rateFinancialIndicatorsR", rateFinancialIndicatorsR);
                return "modules/financing/enterpriseDataBase/enterpriseFinancialDataFourIndustry";
            } else {
                List<RateFinancialIndicator> allData = new ArrayList<RateFinancialIndicator>();
                List<RateFinancialIndicator> bstyle = new ArrayList<RateFinancialIndicator>();
                List<RateFinancialIndicator> profitData = new ArrayList<RateFinancialIndicator>();
                //企业编号
                List<RateEnterpriseFinancialData> rateEnterpriseFinancialDatas = enterpriseDatabaseService.findFinancalTime(projectId, companyId);
                allData = enterpriseDatabaseService.findIndicatorList(projectId, companyId, "%FIN000100%", "yes");
                profitData = enterpriseDatabaseService.findIndicatorList(projectId, companyId, "%FIN000200%", "yes");
                bstyle = enterpriseDatabaseService.findIndicatorList(projectId, companyId, "%FIN000300%", "yes");

                String method = request.getParameter("method");
                allData = enterpriseDatabaseService.check(method, allData);
                if (allData == null) {
                    allData = new ArrayList<RateFinancialIndicator>();
                }
                if (profitData == null) {
                    profitData = new ArrayList<RateFinancialIndicator>();
                }
                if (bstyle == null) {
                    bstyle = new ArrayList<RateFinancialIndicator>();
                }
                if (rateEnterpriseFinancialDatas == null) {
                    rateEnterpriseFinancialDatas = new ArrayList<RateEnterpriseFinancialData>();
                }
                model.addAttribute("projectId", projectId);
                model.addAttribute("allData", allData);
                model.addAttribute("profitData", profitData);
                model.addAttribute("bstyle", bstyle);
                model.addAttribute("rateEnterpriseFinancialDatas", rateEnterpriseFinancialDatas);
                List<RateFinancialIndicator> rateFinancialIndicatorsR = enterpriseDatabaseService.findIndicatorList(projectId, companyId, "%FIN000101%", "yes");
                model.addAttribute("rateFinancialIndicatorsR", rateFinancialIndicatorsR);
                model.addAttribute("message", request.getParameter("message"));
                return "modules/financing/enterpriseDataBase/enterpriseFinancialData";
            }
        } else {
            return "modules/front/user/userLogin";
        }
    }

    /**
     * 根据债项编号查改债项项目下企业的信用记录
     * 首页 - 我要投资 - 产品详情 - 基本数据 - 信用记录模块
     *
     * @param request
     * @return
     * @author dingguolei
     */
    @RequestMapping("creditRecord4Ent")
    public String creditRecord(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            //服务平台债项编号/评级管理平台评级项目编号
            String financingInformationId = request.getParameter("financingInformationId");

            if (StringUtils.isNotBlank(financingInformationId)) {
                P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.get(financingInformationId);
                P2pEnterpriseCertify p2pEnterpriseCertify = new P2pEnterpriseCertify();
                //债项申请人ID即企业认证表中的用户ID
                p2pEnterpriseCertify.setUserId(p2pFinancingInformation.getApplicantsId());
                //调用ArticleController 中的“xinyongjlDetails”接口-已经需求方确认
                p2pEnterpriseCertify = p2pEnterpriseCertifyService.findCreditByUserId(p2pEnterpriseCertify);
                model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
                model.addAttribute("countDagong", p2pEnterpriseCertify.getDagongList().size());
                model.addAttribute("countOther", p2pEnterpriseCertify.getOtherList().size());
                model.addAttribute("countBank", p2pEnterpriseCertify.getBankList().size());
                model.addAttribute("dagongList", p2pEnterpriseCertify.getDagongList());
                model.addAttribute("otherList", p2pEnterpriseCertify.getOtherList());
                model.addAttribute("bankList", p2pEnterpriseCertify.getBankList());
                model.addAttribute("user", user);
                model.addAttribute("reportUserId", p2pEnterpriseCertify.getUserId());
                model.addAttribute("enterprisePhoto", enterpriseDatabaseService.findP2pEnterpriseCertifyById(request.getParameter("financingInformationId")));

                model.addAttribute("financingInformationId", financingInformationId);
                model.addAttribute("enterpriseName", enterpriseDatabaseService.findP2pEnterpriseCertify(request.getParameter("financingInformationId")));
                model.addAttribute("financingRatingInfo", enterpriseDatabaseService.findP2pFinancingRatingInfoByFinancingInformationId(request.getParameter("financingInformationId")));
                return "modules/financing/enterpriseDataBase/creditRecord4Ent";
            }
        } else {
            return "modules/front/user/userLogin";
        }
        return null;
    }

    /**
     * 根据债项编号/评级项目编号查询该债项项目下企业的行业分析和区域分析
     * 首页 - 我要投资 - 产品详情 - 基本数据 - 行业和区域分析模块
     *
     * @param request
     * @author dingguolei
     */
    @RequestMapping("induAreaAnalysisByFinacId")
    public String getIndustryAndAreaAnalysisByRateProjectId(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            Map<String, Object> resultMap = Maps.newHashMap();
            //服务平台债项编号/评级管理平台评级项目编号
            String rateProjectId = request.getParameter("financingInformationId");
            String analysisType = request.getParameter("analysisType");
            if (StringUtils.isNotBlank(rateProjectId)) {
                //根据根据债项编号/评级项目编号查询该项目的行业分析和区域分析数据
                resultMap = enterpriseDatabaseService.getIndustryAreaAnalysisByProjectId(rateProjectId);
                //根据债项编号/评级项目编号查询该债项项目下企业的行业分析和区域分析
//				resultMap =  enterpriseDatabaseService.getIndustryAndAreaAnalysisByRateProjectId(rateProjectId);

                model.addAttribute("enterpriseId", resultMap.get("enterpriseId"));//企业编号
                model.addAttribute("enterpriseName", resultMap.get("enterpriseName"));//企业名称
                model.addAttribute("enterprisePhoto", enterpriseDatabaseService.findP2pEnterpriseCertifyById(request.getParameter("financingInformationId")));

                model.addAttribute("financingInformationId", rateProjectId);
                if (analysisType.equals("1")) {//行业分析
                    model.addAttribute("industryAnalysis", resultMap.get("industryAnalysis"));//行业分析
                }
                if (analysisType.equals("2")) {//区域分析
                    model.addAttribute("areaAnalysis", resultMap.get("areaAnalysis"));//区域分析
                }
                model.addAttribute("enterpriseName", enterpriseDatabaseService.findP2pEnterpriseCertify(request.getParameter("financingInformationId")));
                model.addAttribute("financingRatingInfo", enterpriseDatabaseService.findP2pFinancingRatingInfoByFinancingInformationId(request.getParameter("financingInformationId")));
                return "modules/financing/enterpriseDataBase/industryAreaAnalysis";
            }
        } else {
            return "modules/front/user/userLogin";
        }
        return null;
    }

}



