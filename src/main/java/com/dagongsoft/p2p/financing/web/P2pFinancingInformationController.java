/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.config.entity.P2pAgreement;
import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.dagongsoft.p2p.config.service.P2pAgreementService;
import com.dagongsoft.p2p.config.service.P2pIndustryclassiService;
import com.dagongsoft.p2p.document.service.DocumentUploadService;
import com.dagongsoft.p2p.financing.entity.P2pAssetValuationRecord;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.entity.P2pGuaranteeRecord;
import com.dagongsoft.p2p.financing.entity.P2pMarketConfirmRecord;
import com.dagongsoft.p2p.financing.service.P2pAssetValuationRecordService;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.financing.service.P2pFinancingRatingInfoService;
import com.dagongsoft.p2p.financing.service.P2pGuaranteeRecordService;
import com.dagongsoft.p2p.financing.service.P2pMarketConfirmRecordService;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentDetails;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.investment.service.P2pInvestmentDetailsService;
import com.dagongsoft.p2p.investment.service.P2pInvestmentInformationService;
import com.dagongsoft.p2p.investment.service.back.SubscribeRecordService;
import com.dagongsoft.p2p.msg.service.MsgLetterRecordService;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentRecord;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.dagongsoft.p2p.repayment.service.P2pRepaymentRecordService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.utils.AreaUtils;
import com.dagongsoft.p2p.utils.CertificateState;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.PermissionUtils;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.dao.AreaDao;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Area;
import com.thinkgem.jeesite.modules.sys.entity.Dict;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.interceptor.Token;
import com.thinkgem.jeesite.modules.sys.service.AreaService;

/**
 * 融资信息表，包含申请信息Controller
 *
 * @author
 * @version 2016-07-11
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/p2pFinancingInformation")
public class P2pFinancingInformationController extends BaseController {
    public static final String CACHE_DICT_MAP = "dictMap";
    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Autowired
    private P2pUserInformationService p2pUserInformationService;
    @Autowired
    private P2pAgreementService p2pAgreementService;
    @Autowired
    private AreaDao areaDao;
    @Autowired
    private P2pRegUserCertifyService p2pRegUserCertifyService;
    @Autowired
    private P2pInvestmentInformationService p2pInvestmentInformationService;
    @Autowired
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;
    @Autowired
    P2pInvestmentDetailsService p2pInvestmentDetailsService;
    @Autowired
    private DictDao dictDao;
    @Autowired
    private P2pMarketConfirmRecordService p2pMarketConfirmRecordService;
    @Autowired
    private P2pGuaranteeRecordService p2pGuaranteeRecordService;
    @Autowired
    private P2pAssetValuationRecordService p2pAssetValuationRecordService;
    @Autowired
    private MoneyService moneyService;
    @Autowired
    private P2pFinancingRatingInfoService p2pFinancingRatingInfoService;
    @Autowired
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Autowired
    private P2pIndustryclassiService p2pIndustryclassiService;
    @Autowired
    private SubscribeRecordService subscribeRecordService;
    @Autowired
    private AreaService areaService;
    @Autowired
    private MsgLetterRecordService msgLetterRecordService;
    @Autowired
    private P2pRepaymentRecordService p2pRepaymentRecordService;

    @Autowired
    private DocumentUploadService documentUploadService;

    @RequiresPermissions("financing:p2pFinancingInformation:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = p2pFinancingInformationService.findPage(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "p2p/back/financing/p2pFinancingInformationList.jsp";
    }

    @RequiresPermissions("financing:p2pFinancingInformation:view")
    @RequestMapping(value = "form")
    public String form(P2pFinancingInformation p2pFinancingInformation, Model model) {
        model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        return "modules/financing/p2pFinancingInformationForm";
    }

    @RequiresPermissions("financing:p2pFinancingInformation:edit")
    @RequestMapping(value = "save")
    public String save(P2pFinancingInformation p2pFinancingInformation, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pFinancingInformation)) {
            return form(p2pFinancingInformation, model);
        }


        p2pFinancingInformationService.save(p2pFinancingInformation);
        addMessage(redirectAttributes, "保存融资信息表成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pFinancingInformation/?repage";
    }

    @RequiresPermissions("financing:p2pFinancingInformation:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pFinancingInformation p2pFinancingInformation, RedirectAttributes redirectAttributes) {
        p2pFinancingInformationService.delete(p2pFinancingInformation);
        addMessage(redirectAttributes, "删除融资信息表成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pFinancingInformation/?repage";
    }


    //撮合前债项列表页面
    //@RequiresPermissions("financing:p2pFinancingInformation:view")
    //@RequiresPermissions("financing:p2pFinancingInformation:view")
    @RequestMapping(value = "relationList")
    public String relationList(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = p2pFinancingInformationService.findFinancingRelationInfo(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "p2p/back/financing/before/p2pFinancingInformationList";
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
     * 处理融资申请（不能处理融资项目阶段变更）
     *
     * @param session
     * @param p2pFinancingInformation
     * @return
     */
    @RequestMapping(value = "financingApplication", method = RequestMethod.POST)
    @Token(remove = true)
    public String financingApplication(HttpSession session, P2pFinancingInformation p2pFinancingInformation, P2pEnterpriseCertify p2pEnterpriseCertify) {
        try {
            if (PermissionUtils.ctrlPermission(session, CertificateState.BECOME_MEMBER, null) == false) {
                return "modules/front/state/error";
            }
            User user = (User) session.getAttribute("user");
            p2pFinancingInformation.setApplicantsId(user.getId());//设置申请人ID
            p2pFinancingInformation.setCommitTime(new Date());//设置提交时间
            p2pFinancingInformationService.saveOrUpdateP2pFinancingInformation(p2pFinancingInformation, p2pEnterpriseCertify.getEnterpriseName());
            p2pEnterpriseCertify.setUser(user);
            p2pEnterpriseCertifyService.updateEnterpriseOtherInfo(p2pEnterpriseCertify);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=myFinancApp";
    }

    /**
     * 前台返回已发布融资项目页面
     *
     * @return
     * @author Chace
     */
    @RequestMapping(value = "preLoadFinancingList")
    public String preLoadFinancingList(@RequestParam(value = "pageNo", required = false) String pageNo,
                                       P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpSession session,
                                       HttpServletResponse response, Model model) {
        Map<String, Object> param = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        if (user != null && !"".equals(user.getId())) {
            if ("101".equals(user.getRoleList().get(0).getId())) {
                param.put("markType", 1);
            }
            if ("104".equals(user.getRoleList().get(0).getId())) {
                param.put("markType", 2);
            }
        }
        List<P2pIndustryclassi> industryList = p2pIndustryclassiService.findTopCategory();
        String ratingLevel = request.getParameter("ratingLevel");
        //下面一行，解决加号被解析错误
        if (ratingLevel != null && !"".equals(ratingLevel)) {
            ratingLevel = ratingLevel.replace(" ", "+");
        } else {
            ratingLevel = null;
        }
        param.put("ratingLevel", ratingLevel);
        String financingMaturity = request.getParameter("financingMaturity");
        if ("".equals(financingMaturity)) {
            financingMaturity = null;
        }
        param.put("financingMaturity", financingMaturity);
        String earnRate = request.getParameter("earnRate");
        if ("".equals(earnRate)) {
            earnRate = null;
        }
        param.put("earnRate", earnRate);
        String json = JsonMapper.toJsonString(param);
        model.addAttribute("json", json);
        model.addAttribute("industryList", industryList);
        return "modules/front/investment/financingList";
    }

    /**
     * 前台加载已发布融资项目列表
     *
     * @return
     * @author
     */

    @RequestMapping(value = "financingList")
    public void financingList(@RequestParam(value = "pageNo", required = false) String pageNo,
                              P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpSession session,
                              HttpServletResponse response, Model model) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if (user != null && !"".equals(user.getId())) {
            paramMap.put("userId", user.getId());
        }
        if (p2pFinancingInformation.getMarkType() != null && !p2pFinancingInformation.getMarkType().equals("")) {
            paramMap.put("markType", p2pFinancingInformation.getMarkType());
        }
        String rateStr = request.getParameter("rateStr");
        String industryCode = request.getParameter("industryCode");
        P2pEnterpriseCertify p2pEnterpriseCertify = new P2pEnterpriseCertify();
        p2pEnterpriseCertify.setIndustryCode(industryCode);
        p2pFinancingInformation.setP2pEnterpriseCertify(p2pEnterpriseCertify);
        String ratingLevel = request.getParameter("ratingLevel");
        paramMap.put("ratingLevel", ratingLevel);
        paramMap.put("p2pEnterpriseCertify", p2pEnterpriseCertify);
        String financingMaturity = request.getParameter("financingMaturity");
        paramMap.put("financingMaturity", financingMaturity);
        String financingScale = request.getParameter("financingScale");
        String earnRate = request.getParameter("earnRate");
        if (rateStr != null && rateStr != "") {
            double rate = Double.parseDouble(rateStr);
            paramMap.put("rate", rate);
        }
        if (financingScale != null && financingScale.equals("0~200000")) {
            String[] array = new String[2];
            array = "0~200000".split("~");
            String params1 = array[0];
            String params2 = array[1];
            int fs1 = Integer.parseInt(params1, 10);
            int fs2 = Integer.parseInt(params2, 10);
            paramMap.put("fs1", fs1);
            paramMap.put("fs2", fs2);
        } else if (financingScale != null && financingScale.equals("200000~499999")) {
            String[] array = new String[2];
            array = "200000~499999".split("~");
            String params1 = array[0];
            String params2 = array[1];
            int fs1 = Integer.parseInt(params1, 10);
            int fs2 = Integer.parseInt(params2, 10);
            paramMap.put("fs1", fs1);
            paramMap.put("fs2", fs2);
        } else if (financingScale != null && financingScale.equals("500000~1000000")) {
            String[] array = new String[2];
            array = "500000~1000000".split("~");
            String params1 = array[0];
            String params2 = array[1];
            int fs1 = Integer.parseInt(params1, 10);
            int fs2 = Integer.parseInt(params2, 10);
            paramMap.put("fs1", fs1);
            paramMap.put("fs2", fs2);
        }
        if (earnRate != null && earnRate.equals("0~0.08")) {
            String[] array = new String[2];
            array = "0~0.08".split("~");
            String params1 = array[0];
            String params2 = array[1];
            double er1 = Double.parseDouble(params1);
            double er2 = Double.parseDouble(params2);
            paramMap.put("er1", er1);
            paramMap.put("er2", er2);
        } else if (earnRate != null && earnRate.equals("0.08~0.1")) {
            String[] array = new String[2];
            array = "0.08~0.1".split("~");
            String params1 = array[0];
            String params2 = array[1];
            double er1 = Double.parseDouble(params1);
            double er2 = Double.parseDouble(params2);
            paramMap.put("er1", er1);
            paramMap.put("er2", er2);
        } else if (earnRate != null && earnRate.equals("0.1~0.15")) {
            String[] array = new String[2];
            array = "0.1~0.15".split("~");
            String params1 = array[0];
            String params2 = array[1];
            double er1 = Double.parseDouble(params1);
            double er2 = Double.parseDouble(params2);
            paramMap.put("er1", er1);
            paramMap.put("er2", er2);

        } else if (earnRate != null && earnRate.equals("0.15~1")) {
            String[] array = new String[2];
            array = "0.15~1".split("~");
            String params1 = array[0];
            String params2 = array[1];
            double er1 = Double.parseDouble(params1);
            double er2 = Double.parseDouble(params2);
            paramMap.put("er1", er1);
            paramMap.put("er2", er2);
        }
        int pageSize = 10;//默认每页显示10条数据
        int pageIndex = 1;//默认显示第一页的数据
        if (pageNo != null && !"".equals(pageNo)) {
            pageIndex = Integer.parseInt(pageNo);
        }
        paramMap.put("start", pageSize * (pageIndex - 1));
        List<P2pFinancingInformation> list = p2pFinancingInformationService.findAllFinancingList(paramMap);
        try {
            String json = JsonMapper.toJsonString(list);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据融资信息id查询投资信息表
     *
     * @param financingInformationId
     */
    @RequestMapping(value = "findInvestmentInformation")
    public void findInvestmentInformation(String financingInformationId, HttpServletResponse response) {
        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setFinancingInformationId(financingInformationId);
        List<P2pInvestmentInformation> list = p2pInvestmentInformationService.findList(p2pInvestmentInformation);
        try {
            String json = JsonMapper.toJsonString(list);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 加载用户头像（融资）
     *
     * @param session
     * @param p2pUserInformation
     * @return
     */
    public P2pUserInformation findFinancingUserPicById(String id) {
        return p2pUserInformationService.findFinancingUserPicById(id);
    }

    /**
     * 加载企业认证材料图片
     *
     * @param id
     * @return
     */
    public P2pFinancingInformation findFinancingCertifyInfo(String id) {
        return p2pFinancingInformationService.findFinancingCertifyInfo(id);
    }

    /**
     * 获取一条融资项目信息
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @param id
     * @return
     * @author li
     */
    @RequestMapping(value = "financingInfoPage")
    @Token(save = true)
    public String financingInfoPage(P2pFinancingInformation p2pFinancingInformation, P2pInvestmentInformation p2p, P2pFinancingRatingInfo p2pFinancingRatingInfo,
                                    HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, String id) {
        User user = (User) session.getAttribute("user");
        //start ,此id在购买企业评级报告时候用到
        //因p2pFinancingRatingInfo的id和financing_information_id被置换，顾需要重新new一个p2pFinancingRatingInfo对象，去传输id
        String financingInformationId = p2pFinancingRatingInfo.getId();
        P2pFinancingRatingInfo p2pFinancingRatingInfoNew = p2pFinancingRatingInfoService.findById(financingInformationId);
        String id2 = p2pFinancingRatingInfoNew.getId();
        model.addAttribute("id2", id2);
        //end

        try {
            p2pFinancingInformation = p2pFinancingInformationService.getApplicantdId(p2pFinancingInformation);
//			P2pFinancingInformation p2pFinancingInformation2 = new P2pFinancingInformation();
//			p2pFinancingInformation2 = p2pFinancingInformationService.getById(p2pFinancingInformation.getId());
//			if(!"500".equals(p2pFinancingInformation2.getCurrentStage()) && !"0".equals(p2pFinancingInformation2.getInRaiseState())){
//				return "redirect:"+adminPath+"/financing/p2pFinancingInformation/preLoadFinancingList";
//			}
            //判断当前用户是否登录
            if (user != null && !"".equals(user)) {
                P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
                p2pInvestmentInformation.setUserId(user.getId());
                p2pInvestmentInformation.setFinancingInformationId(p2pFinancingInformation.getId());
                p2pInvestmentInformation = p2pInvestmentInformationService.findInvestmentByids(p2pInvestmentInformation);
                if (p2pInvestmentInformation != null && !"".equals(p2pInvestmentInformation)) {
                    model.addAttribute("p2pInvestmentInformation", p2pInvestmentInformation);
                }
                Integer certificateState = p2pUserInformationService.findCertificateState(user.getId());
                //			certificateState = 1008;//待调试
                if (certificateState != null && !"".equals(certificateState)) {
                    model.addAttribute("certificateState", certificateState);
                }
            }
            List<P2pRepaymentRecord> p2pRepaymentRecordList = p2pRepaymentRecordService.getrepaymentVoucher(id);
            p2pFinancingInformation = p2pFinancingInformationService.findOneFinancingInfoById(id);
            p2p.setFinancingInformationId(p2p.getId());
            List<P2pInvestmentInformation> p2pInvestmentInformationList = p2pInvestmentInformationService.getP2pInvestmentInformationList(p2p);
            List<P2pFinancingInformation> p2pFinancingInformationList = p2pFinancingInformationService.getP2pFinancingInformationList(p2pFinancingInformation);
            String address = "";
            if (p2pRepaymentRecordList != null && p2pRepaymentRecordList.size() > 0) {
                for (int i = 0; i < p2pRepaymentRecordList.size(); i++) {
                    address += p2pRepaymentRecordList.get(i).getRepaymentVoucher() + ",";
                }
            }
            if (!"".equals(address)) {
                address = address.substring(0, address.length() - 1);
            }
            model.addAttribute("address", address);
            P2pEnterpriseCertify enterprise = p2pFinancingInformation.getP2pEnterpriseCertify();
            enterprise.setNameOf(enterprise.getNameOf().substring(0, 1) + "**");

            String idNumberOf = enterprise.getIdNumberOf();
            if (idNumberOf.length() == 18) {
                enterprise.setIdNumberOf(enterprise.getIdNumberOf().substring(0, 4) + "**********" + enterprise.getIdNumberOf().substring(14, 18));
            } else if (idNumberOf.length() == 15) {
                enterprise.setIdNumberOf(enterprise.getIdNumberOf().substring(0, 4) + "********" + enterprise.getIdNumberOf().substring(12, 15));
            }

            model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
            //拼接图片url 周红涛 start
            P2pFinancingInformation findFinancingCertifyInfo = findFinancingCertifyInfo(id);
            P2pEnterpriseCertify p2pEnterpriseCertify = findFinancingCertifyInfo.getP2pEnterpriseCertify();
            String businessLicense0 = p2pEnterpriseCertify.getBusinessLicense();
            if (businessLicense0 != null) {
                String businessLicense = UploadFileUtils.viewUrl(businessLicense0);
                p2pEnterpriseCertify.setBusinessLicense(businessLicense);
            }
            String idCardFront0 = p2pEnterpriseCertify.getIdCardFront();
            if (idCardFront0 != null) {
                String idCardFront = UploadFileUtils.viewUrl(idCardFront0);
                p2pEnterpriseCertify.setIdCardFront(idCardFront);
            }
            String idCardBack0 = p2pEnterpriseCertify.getIdCardBack();
            if (idCardBack0 != null) {
                String idCardBack = UploadFileUtils.viewUrl(idCardBack0);
                p2pEnterpriseCertify.setIdCardBack(idCardBack);
            }
            findFinancingCertifyInfo.setP2pEnterpriseCertify(p2pEnterpriseCertify);
            model.addAttribute("certifyInfo", findFinancingCertifyInfo);
            //拼接图片url 周红涛 end
            //model.addAttribute("certifyInfo", findFinancingCertifyInfo(id));
            model.addAttribute("userPic", findFinancingUserPicById(id));
            model.addAttribute("user", user);
            model.addAttribute("p2pInvestmentInformationList", p2pInvestmentInformationList);
            model.addAttribute("p2pFinancingInformationList", p2pFinancingInformationList);
            P2pEnterpriseCertify p2p2 = new P2pEnterpriseCertify();
            p2p2.setUserId(p2pFinancingInformation.getApplicantsId());
            p2p2 = p2pEnterpriseCertifyService.findCreditByUserId(p2p2);
            model.addAttribute("p2pEnterpriseCertify", p2p2);
            model.addAttribute("countDagong", p2p2.getDagongList().size());
            model.addAttribute("countOther", p2p2.getOtherList().size());
            model.addAttribute("countBank", p2p2.getBankList().size());
            model.addAttribute("dagongList", p2p2.getDagongList());
            model.addAttribute("otherList", p2p2.getOtherList());
            model.addAttribute("bankList", p2p2.getBankList());
            model.addAttribute("user", user);
            model.addAttribute("reportUserId", p2p2.getUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/front/investment/investmentInfo";
    }


    /**
     * 查询所有的评级信息
     *
     * @param p2pFinancingInformationService
     * @param redirectAttributes             查询所有的评级信息
     * @return
     * @author duan
     */
    @RequestMapping(value = "findAllcredit")
    public String findAllcredit(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = p2pFinancingInformationService.findAllcredit(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "modules/financing/p2pCreditFindList";
    }

    /**
     * 根据输入条件查询评级信息
     */
    @RequestMapping(value = "findTheFinancingList")
    public String findTheFinancingList(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        if (p2pFinancingInformation.getRatingLevel().equals("无")) {
            p2pFinancingInformation.setRatingLevel(null);
        }
        Page<P2pFinancingInformation> page = p2pFinancingInformationService.findTheFinancingList(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "modules/financing/p2pCreditFindList";
    }


    /**
     * 查询四条融资数据信息
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     * @author li
     */
    @RequestMapping(value = "findFourFinancingInfo")
    @ResponseBody
    public void findFourFinancingInfo(P2pFinancingInformation p2pFinancingInformation,
                                      HttpServletRequest request, HttpServletResponse response, Model model) {
        List<P2pFinancingInformation> list = p2pFinancingInformationService.findFourFinancingInfo(p2pFinancingInformation);
        try {
            String json = JsonMapper.toJsonString(list);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 签订投资协议
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     * @author li
     */
    @RequestMapping(value = "investmentFinalization")
    @Token(save = true)
    public String financingFinalization(HttpSession session, P2pAgreement p2pAgreement, String p2pFinancingInformationId, Double earnings, Model model) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        try {
            P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.getById(p2pFinancingInformationId);
            if (!"500".equals(p2pFinancingInformation.getCurrentStage())) {
                return "modules/front/investment/investmentfailure";
            }
            //计算剩余时间
            long raiseTimeLimit = p2pFinancingInformation.getRaiseTimeLimit();//募集期限
            raiseTimeLimit = raiseTimeLimit * 24 * 3600 * 1000;
            Date nowDate = new Date();
            long nowTime = nowDate.getTime();
            long publishTime = p2pFinancingInformation.getPublishTime().getTime();
            long lastPublishTime;
            if (p2pFinancingInformation.getLastPublishTime() != null && !"".equals(p2pFinancingInformation.getLastPublishTime())) {
                lastPublishTime = p2pFinancingInformation.getLastPublishTime().getTime();
            } else {
                lastPublishTime = publishTime;
            }
            long hasRaiseTime = Long.parseLong(p2pFinancingInformation.getHasRaiseTime());
            hasRaiseTime = hasRaiseTime * 1000;
            long leftsecond = (raiseTimeLimit - (nowTime - lastPublishTime + hasRaiseTime));
            if (leftsecond <= 0) {
                return "modules/front/investment/investmentfailure3";
            }

            String currentStage = p2pFinancingInformation.getCurrentStage();
            if (!"500".equals(currentStage)) {
                return "modules/front/investment/investmentfailure";
            }
            p2pAgreement.setAgreementType("2");
            p2pAgreement = p2pAgreementService.getAgreement(p2pAgreement);

            String agreementContent = StringEscapeUtils.unescapeHtml4(p2pAgreement.getAgreementContent());
            p2pAgreement.setAgreementContent(agreementContent);

            model.addAttribute("p2pInvestmentAgreement", p2pAgreement);
            model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
            model.addAttribute("earnings", earnings);
            session.setAttribute("p2pInvestmentAgreement", p2pAgreement);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/front/investment/investmentFinalization";
    }

    /**
     * 个人投资支付页面
     */
    @RequestMapping(value = "investmentFinalizationPerson")
    @Token(remove = true)
    @Transactional(readOnly = false)
    public String financingFinalizationPerson(HttpSession session, String p2pFinancingInformationId, double earnings, double investSum, Model model) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        P2pInvestmentDetails p2pInvestmentDetails = new P2pInvestmentDetails();
        String userId = user.getId();
        P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.getById(p2pFinancingInformationId);
        if (!"500".equals(p2pFinancingInformation.getCurrentStage())) {
            return "modules/front/investment/investmentfailure";
        }
        //计算剩余时间
        long raiseTimeLimit = p2pFinancingInformation.getRaiseTimeLimit();//募集期限
        raiseTimeLimit = raiseTimeLimit * 24 * 3600 * 1000;
        Date nowDate = new Date();
        long nowTime = nowDate.getTime();
        long publishTime = p2pFinancingInformation.getPublishTime().getTime();
        long lastPublishTime;
        if (p2pFinancingInformation.getLastPublishTime() != null && !"".equals(p2pFinancingInformation.getLastPublishTime())) {
            lastPublishTime = p2pFinancingInformation.getLastPublishTime().getTime();
        } else {
            lastPublishTime = publishTime;
        }
        long hasRaiseTime = Long.parseLong(p2pFinancingInformation.getHasRaiseTime());
        hasRaiseTime = hasRaiseTime * 1000;
        long leftsecond = (raiseTimeLimit - (nowTime - lastPublishTime + hasRaiseTime));
        if (leftsecond <= 0) {
            return "modules/front/investment/investmentfailure3";
        }

        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setFinancingInformationId(p2pFinancingInformationId);
        p2pInvestmentInformation.setUserId(userId);
        p2pInvestmentInformation = p2pInvestmentInformationService.findInvestmentByids(p2pInvestmentInformation);
        String currentStage = p2pFinancingInformation.getCurrentStage();
        if (!"500".equals(currentStage)) {
            return "modules/front/investment/investmentfailure";
        }
        double restMoney = 0.0;//已投金额
        Integer financingAmount = p2pFinancingInformation.getFinancingAmount();
        Integer restRaiseMoney = Integer.valueOf(p2pFinancingInformation.getRestRaiseMoney()) == null ? 0 : Integer.valueOf(p2pFinancingInformation.getRestRaiseMoney());
        if (p2pInvestmentInformation != null && !"".equals(p2pInvestmentInformation)) {
            restMoney = p2pInvestmentInformation.getInvestmentSumAmount();
        }
        double financingAmount2 = (double) financingAmount / 5;
        double a = restMoney + investSum;
        boolean flag = true;
        if (a > financingAmount2 || a > restRaiseMoney || a > 50000) {
            flag = false;
        }
        double restInvestMoney = restRaiseMoney;
//			double restInvestMoney = financingAmount > restRaiseMoney?restRaiseMoney:financingAmount;//可投金额
        if (!flag) {
            return "modules/front/investment/investmentfailure2";
        } else {
            try {
                if (restInvestMoney == investSum) {
                    P2pFinancingInformation p2pFinancingInformation2 = new P2pFinancingInformation();
                    p2pFinancingInformation2.setId(p2pFinancingInformationId);
                    p2pFinancingInformation2.setCurrentStage(FinancingState.INVESTED + "");//修改融资项目状态为被投资人选中
                    p2pFinancingInformation2.setHasRaiseAmount(p2pFinancingInformation.getFinancingAmount());
                    p2pFinancingInformation2.setRestRaiseMoney(0 + "");
                    p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation2);
                    //在撮合前债项状态进展表添加一条记录
                    P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                    p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
                    p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());//记录当前项目编号
                    p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation2.getCurrentStage());//记录当前融资项目阶段
                    p2pBeforeMatchDebtState.setStateTime(new Date());//记录时间
                    p2pBeforeMatchDebtState.setOperatorId(user.getId());
                    p2pFinancingInformationService.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
                    //发送站内信和短信
                    Map<String, String> map = MsgLetterTemplate.getGrmbtzqy(p2pFinancingInformation.getFinacingName(), (double) p2pFinancingInformation.getFinancingAmount());
                    MsgUtils.sendLetter(p2pFinancingInformation.getApplicantsId(), map);
                    String content = MsgSmsTemplate.getGrmbtzqy((double) p2pFinancingInformation.getFinancingAmount());
                    MsgUtils.sendSMS(p2pFinancingInformation.getApplicantsId(), content);
                } else {
                    P2pFinancingInformation p2pFinancingInformation3 = new P2pFinancingInformation();
                    p2pFinancingInformation3.setId(p2pFinancingInformationId);
                    p2pFinancingInformation3.setHasRaiseAmount(p2pFinancingInformation.getHasRaiseAmount() + (int) investSum);
                    p2pFinancingInformation3.setRestRaiseMoney((Integer.valueOf(p2pFinancingInformation.getRestRaiseMoney()) - (int) investSum) + "");
                    p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation3);
                }
                //在投资信息表中添加一条记录
                if (p2pInvestmentInformation != null && !"".equals(p2pInvestmentInformation)) {
                    p2pInvestmentDetails.setInvestmentInformationId(p2pInvestmentInformation.getId());
                    P2pInvestmentInformation p2pInvestmentInformation3 = new P2pInvestmentInformation();
                    p2pInvestmentInformation3.setFinancingInformationId(p2pFinancingInformationId);
                    p2pInvestmentInformation3.setUserId(userId);
                    p2pInvestmentInformation3.setInvestmentDebtState(p2pFinancingInformation.getCurrentStage());
                    p2pInvestmentInformation3.setInvestmentSumAmount(p2pInvestmentInformation.getInvestmentSumAmount() + investSum);
                    p2pInvestmentInformation3.setLastInvestmentTime(new Date());
                    p2pInvestmentInformation3.setExpectEarn(p2pInvestmentInformation.getExpectEarn() + earnings);
                    p2pInvestmentInformationService.updateP2pInvestmentInformation(p2pInvestmentInformation3);
                } else {
                    P2pInvestmentInformation p2pInvestmentInformation2 = new P2pInvestmentInformation();
                    p2pInvestmentInformation2.setId(IdGen.uuid());
                    p2pInvestmentInformation2.setFinancingInformationId(p2pFinancingInformationId);
                    p2pInvestmentInformation2.setUserId(userId);
                    p2pInvestmentInformation2.setInvestmentDebtState(p2pFinancingInformation.getCurrentStage());
                    p2pInvestmentInformation2.setInvestmentSumAmount(investSum);
                    p2pInvestmentInformation2.setLastInvestmentTime(new Date());
                    p2pInvestmentInformation2.setExpectEarn(earnings);
                    p2pInvestmentDetails.setInvestmentInformationId(p2pInvestmentInformation2.getId());
                    p2pFinancingInformationService.saveP2pInvestmentInformation(p2pInvestmentInformation2);
                }
                //在投资明细表中添加一条记录
                p2pInvestmentDetails.setInvestmentAmount((double) (investSum));
                p2pInvestmentDetails.setInvestmentTime(new Date());
                p2pInvestmentDetailsService.save(p2pInvestmentDetails);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "modules/front/investment/investmentSuccess2";
        }
    }

    /**
     * 确认投资
     * 我要投资邀约成功（机构类）
     *
     * @return
     * @author li
     */
    @RequestMapping(value = "investmentSuccess")
    @Token(remove = true)
    public String financingSuccess(HttpSession session, Double earnings, String financingInformationId) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        P2pAgreement p2pAgreement = new P2pAgreement();
        p2pAgreement.setAgreementType("2");
        p2pAgreement = p2pAgreementService.getAgreement(p2pAgreement);
        P2pUserInformation p2pUserInformation = new P2pUserInformation();
        p2pUserInformation.setUser(user);
        p2pUserInformation = p2pUserInformationService.getContactByUserId(p2pUserInformation);
        P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
        p2pFinancingInformation = p2pFinancingInformationService.getById(financingInformationId);
        if (!"500".equals(p2pFinancingInformation.getCurrentStage())) {
            return "modules/front/investment/investmentfailure";
        }
        //计算剩余时间
        long raiseTimeLimit = p2pFinancingInformation.getRaiseTimeLimit();//募集期限
        raiseTimeLimit = raiseTimeLimit * 24 * 3600 * 1000;
        Date nowDate = new Date();
        long nowTime = nowDate.getTime();
        long publishTime = p2pFinancingInformation.getPublishTime().getTime();
        long lastPublishTime;
        if (p2pFinancingInformation.getLastPublishTime() != null && !"".equals(p2pFinancingInformation.getLastPublishTime())) {
            lastPublishTime = p2pFinancingInformation.getLastPublishTime().getTime();
        } else {
            lastPublishTime = publishTime;
        }
        long hasRaiseTime = Long.parseLong(p2pFinancingInformation.getHasRaiseTime());
        hasRaiseTime = hasRaiseTime * 1000;
        long leftsecond = (raiseTimeLimit - (nowTime - lastPublishTime + hasRaiseTime));
        if (leftsecond <= 0) {
            return "modules/front/investment/investmentfailure3";
        }

        String currentStage = p2pFinancingInformation.getCurrentStage();
        if (!"500".equals(currentStage)) {
            return "modules/front/investment/investmentfailure";
        }
        try {
            P2pFinancingInformation p2pFinancingInformation2 = new P2pFinancingInformation();
            p2pFinancingInformation2 = p2pFinancingInformationService.findOneFinancingInfoById(p2pFinancingInformation.getId());
            p2pFinancingInformation2.setCurrentStage(FinancingState.INVESTED + "");//修改融资项目状态为被投资人选中
            if (p2pFinancingInformation.getFinancingAmount() >= p2pFinancingInformation.getApplicationAmount()) {
                p2pFinancingInformation2.setHasRaiseAmount(p2pFinancingInformation.getApplicationAmount());
            } else {
                p2pFinancingInformation2.setHasRaiseAmount(p2pFinancingInformation.getFinancingAmount());
            }
            p2pFinancingInformation2.setRestRaiseMoney(0 + "");
            p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation2);
            //在撮合前债项状态进展表添加一条记录
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
            p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
            p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation2.getId());//记录当前项目编号
            p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation2.getCurrentStage());//记录当前融资项目阶段
            p2pBeforeMatchDebtState.setStateTime(new Date());//记录时间
            p2pBeforeMatchDebtState.setOperatorId(user.getId());
            p2pFinancingInformationService.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
            //在投资信息表中添加一条记录
            P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation(p2pInvestmentInformationService.createInvestmentInformationId());
            p2pInvestmentInformation.setId(IdGen.uuid());
            p2pInvestmentInformation.setFinancingInformationId(p2pFinancingInformation.getId());
            p2pInvestmentInformation.setUserId(user.getId());//当前用户ID
            p2pInvestmentInformation.setInvestmentDebtState(p2pFinancingInformation2.getCurrentStage());
            p2pInvestmentInformation.setInvestmentSumAmount((double) (p2pFinancingInformation2.getHasRaiseAmount()));
            p2pInvestmentInformation.setLastInvestmentTime(new Date());
            p2pInvestmentInformation.setExpectEarn(earnings);
            p2pFinancingInformationService.saveP2pInvestmentInformation(p2pInvestmentInformation);
            //在投资明细表中添加一条记录
            P2pInvestmentDetails p2pInvestmentDetails = new P2pInvestmentDetails();
            p2pInvestmentDetails.setInvestmentInformationId(p2pInvestmentInformation.getId());
            p2pInvestmentDetails.setInvestmentAmount((double) (p2pFinancingInformation2.getHasRaiseAmount()));
            p2pInvestmentDetails.setInvestmentTime(new Date());
            p2pInvestmentDetails.setInvestmentAgreementId(p2pAgreement.getId());
            p2pInvestmentDetailsService.save(p2pInvestmentDetails);
            //发送站内信和短信
            if (p2pFinancingInformation2.getIsHandRateCost() == 0) {
                //给企业发
                Map<String, String> map = MsgLetterTemplate.getMbwjftz(p2pFinancingInformation2.getFinacingName());
                MsgUtils.sendLetter(p2pFinancingInformation2.getApplicantsId(), map);
                String content = MsgSmsTemplate.getMbwjftz();
                MsgUtils.sendSMS(p2pFinancingInformation2.getApplicantsId(), content);
                //给机构发
                Map<String, String> map2 = MsgLetterTemplate.getYtzwzfpjf(p2pFinancingInformation2.getFinacingName(), (double) (p2pFinancingInformation2.getFinancingAmount()));
                MsgUtils.sendLetter(user.getId(), map2);
                String content2 = MsgSmsTemplate.getYtzwzfpjf(p2pFinancingInformation2.getFinacingName(), (double) (p2pFinancingInformation2.getFinancingAmount()));
                MsgUtils.sendSMS(user.getId(), content2);
            } else if (p2pFinancingInformation2.getIsHandRateCost() == 1) {
                //给企业发
                Map<String, String> map = MsgLetterTemplate.getJgmbtzqy(p2pFinancingInformation2.getFinacingName(),
                        p2pUserInformation.getBankname(),
                        p2pUserInformation.getBankaddress(),
                        user.getName(),
                        p2pUserInformation.getDockingDepartment(),
                        p2pUserInformation.getDockingJob(),
                        user.getPhone());
                MsgUtils.sendLetter(p2pFinancingInformation2.getApplicantsId(), map);
                String content = MsgSmsTemplate.getJgmbtzqy();
                MsgUtils.sendSMS(p2pFinancingInformation2.getApplicantsId(), content);
                //给机构发
                Map<String, String> map2 = MsgLetterTemplate.getYtzqrzqywjpjf(p2pFinancingInformation2.getId(), (double) (p2pFinancingInformation2.getFinancingAmount()));
                MsgUtils.sendLetter(user.getId(), map2);
                String content2 = MsgSmsTemplate.getYtzqrzqywjpjf((double) (p2pFinancingInformation2.getFinancingAmount()));
                MsgUtils.sendSMS(user.getId(), content2);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/front/investment/investmentSuccess";
    }


    /**
     * 按ID查询债项详情
     *
     * @return
     * @throws UnsupportedEncodingException
     * @author duan
     */
    @RequestMapping(value = "findFinancingDetail")
    public String findFinancingInformationDetail(String id, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        P2pFinancingInformation p2pFinancingInformation = subscribeRecordService.getDebtDetails(id);
        P2pRegUserCertify regUserCertify = p2pRegUserCertifyService.getByUserId(p2pFinancingInformation.getApplicantsId());
        //String applyAmount = RepaymentPlanUtils.getRepaymentAmountByApplyRate(p2pFinancingInformation);
        p2pFinancingInformation.getP2pEnterpriseCertify().setProvincialArea(AreaUtils.findById(p2pFinancingInformation.getP2pEnterpriseCertify().getProvincialArea()).getName());
        p2pFinancingInformation.getP2pEnterpriseCertify().setMunicipalArea(AreaUtils.findById(p2pFinancingInformation.getP2pEnterpriseCertify().getMunicipalArea()).getName());
        model.addAttribute("vo", p2pFinancingInformation);
        model.addAttribute("regUserCertify", regUserCertify);
        //model.addAttribute("applyAmount",applyAmount);
        return "modules/financing/FinacingProjetDetailInformation";
    }

    /**
     * 立项审核意见
     *
     * @param id
     * @param request
     * @param response
     * @param model
     * @return
     * @author Sora
     */
    @RequestMapping(value = "findFinancingDetailTwo")
    public String findFinancingDetailTwo(String id, String name, Model model) {
        try {
            P2pFinancingInformation p2pFinancingInformation = subscribeRecordService.getDebtDetails(id);
            String area = null;
            if (p2pFinancingInformation.getP2pEnterpriseCertify() != null) {
                if (p2pFinancingInformation.getP2pEnterpriseCertify().getProvincialArea() != null) {
                    area = areaService.get(p2pFinancingInformation.getP2pEnterpriseCertify().getProvincialArea()).getName();
                }
                if (p2pFinancingInformation.getP2pEnterpriseCertify().getMunicipalArea() != null) {
                    area += areaService.get(p2pFinancingInformation.getP2pEnterpriseCertify().getMunicipalArea()).getName();
                }
            }
            P2pIndustryclassi p2pIndustryclassi = p2pIndustryclassiService.getByIndustyNum(p2pFinancingInformation.getP2pEnterpriseCertify().getIndustryCode());
            p2pFinancingInformation.getP2pEnterpriseCertify().setIndustryCode(p2pIndustryclassi.getClassinameCn());
            model.addAttribute("area", area);
            model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
            model.addAttribute("enterpriseName", name);
            return "p2p/back/financing/before/debtProjectAudit";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 立项审核意见回显
     *
     * @param id
     * @param request
     * @param response
     * @param model
     * @return
     * @author Sora
     */
    @RequestMapping(value = "findFinancingDetailOne")
    public String findFinancingDetailOne(String id, String name, Model model) {
        try {
            P2pFinancingInformation p2pFinancingInformation = subscribeRecordService.getDebtDetails(id);
            String area = null;
            if (p2pFinancingInformation.getP2pEnterpriseCertify() != null) {
                if (p2pFinancingInformation.getP2pEnterpriseCertify().getProvincialArea() != null) {
                    area = areaService.get(p2pFinancingInformation.getP2pEnterpriseCertify().getProvincialArea()).getName();
                }
                if (p2pFinancingInformation.getP2pEnterpriseCertify().getMunicipalArea() != null) {
                    area += areaService.get(p2pFinancingInformation.getP2pEnterpriseCertify().getMunicipalArea()).getName();
                }

            }
            P2pIndustryclassi p2pIndustryclassi = p2pIndustryclassiService.getByIndustyNum(p2pFinancingInformation.getP2pEnterpriseCertify().getIndustryCode());
            p2pFinancingInformation.getP2pEnterpriseCertify().setIndustryCode(p2pIndustryclassi.getClassinameCn());
            model.addAttribute("area", area);
            model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        } catch (Exception e) {
            e.printStackTrace();
        }
        P2pMarketConfirmRecord p2pMarketConfirmRecord = p2pMarketConfirmRecordService.findById(id);
        model.addAttribute("enterpriseName", name);
        model.addAttribute("p2pMarketConfirmRecord", p2pMarketConfirmRecord);
        return "p2p/back/financing/before/debtProjectAuditView";
    }

    /**
     * 债项发布前确认审核
     *
     * @param id
     * @param name
     * @param request
     * @param response
     * @param model
     * @return
     * @throws UnsupportedEncodingException
     * @author Sora
     */
    @RequestMapping(value = "findFinancingDetailThree")
    public String findFinancingDetailThree(String id, String name, HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
        //债项信息
        P2pFinancingInformation p2pFinancingInformation = subscribeRecordService.getDebtDetails(id);
        p2pFinancingInformation.getP2pEnterpriseCertify().setProvincialArea(AreaUtils.findById(p2pFinancingInformation.getP2pEnterpriseCertify().getProvincialArea()).getName());
        p2pFinancingInformation.getP2pEnterpriseCertify().setMunicipalArea(AreaUtils.findById(p2pFinancingInformation.getP2pEnterpriseCertify().getMunicipalArea()).getName());
        //评级信息
        P2pFinancingRatingInfo p2pFinancingRatingInfo = p2pFinancingRatingInfoService.findById(id);
        model.addAttribute("p2pFinancingRatingInfo", p2pFinancingRatingInfo);
        //判断是否补信
        if (p2pFinancingRatingInfo != null
                && p2pFinancingRatingInfo.getWetherRep() != null
                && p2pFinancingRatingInfo.getWetherRep().equals("1")) {
            //判断标的类型
            //如果是个人标
            if (p2pFinancingRatingInfo != null
                    && p2pFinancingRatingInfo.getMarkType() != null
                    && p2pFinancingRatingInfo.getMarkType().equals("2")
                    ) {
                //担保记录
                P2pGuaranteeRecord p2pGuaranteeRecord = p2pGuaranteeRecordService.findByFinancingId(p2pFinancingInformation.getId());
                //资产评估记录
                P2pAssetValuationRecord p2pAssetValuationRecord = p2pAssetValuationRecordService.findByFinancingId(p2pFinancingInformation.getId());
                model.addAttribute("p2pGuaranteeRecord", p2pGuaranteeRecord).addAttribute("p2pAssetValuationRecord", p2pAssetValuationRecord);
                //如果是机构标
            } else if (p2pFinancingRatingInfo != null
                    && p2pFinancingRatingInfo.getMarkType() != null
                    && p2pFinancingRatingInfo.getMarkType().equals("1")
                    ) {
                //资产评估记录
                P2pAssetValuationRecord p2pAssetValuationRecord = p2pAssetValuationRecordService.findByFinancingId(p2pFinancingInformation.getId());
                model.addAttribute("p2pAssetValuationRecord", p2pAssetValuationRecord);
            }
        }
        //P2pMarketConfirmRecord findById=p2pMarketConfirmRecordService.findById(id);
        try {
            P2pIndustryclassi p2pIndustryclassi = p2pIndustryclassiService.getByIndustyNum(p2pFinancingInformation.getP2pEnterpriseCertify().getIndustryCode());
            p2pFinancingInformation.getP2pEnterpriseCertify().setIndustryCode(p2pIndustryclassi.getClassinameCn());
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("vo", p2pFinancingInformation);
        //model.addAttribute("p2pMarketConfirmRecord",findById);
        return "p2p/back/financing/before/debtIssuedBeforeConfirmAudit";
    }

    /**
     * 债项发布前确认审核回显查看页面
     *
     * @param id
     * @param name
     * @param request
     * @param response
     * @param model
     * @return
     * @throws UnsupportedEncodingException
     * @author Sora
     */
    @RequestMapping(value = "findFinancingDetailFour")
    public String findFinancingDetailFour(String id, String name, HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
        //债项信息
        P2pFinancingInformation p2pFinancingInformation = subscribeRecordService.getDebtDetails(id);
        p2pFinancingInformation.getP2pEnterpriseCertify().setProvincialArea(AreaUtils.findById(p2pFinancingInformation.getP2pEnterpriseCertify().getProvincialArea()).getName());
        p2pFinancingInformation.getP2pEnterpriseCertify().setMunicipalArea(AreaUtils.findById(p2pFinancingInformation.getP2pEnterpriseCertify().getMunicipalArea()).getName());
        //评级信息
        P2pFinancingRatingInfo p2pFinancingRatingInfo = p2pFinancingRatingInfoService.findById(id);
        model.addAttribute("p2pFinancingRatingInfo", p2pFinancingRatingInfo);
        //判断是否补信
        if (p2pFinancingRatingInfo != null
                && p2pFinancingRatingInfo.getWetherRep() != null
                && p2pFinancingRatingInfo.getWetherRep().equals("1")) {
            //判断标的类型
            //如果是个人标
            if (p2pFinancingRatingInfo != null
                    && p2pFinancingRatingInfo.getMarkType() != null
                    && p2pFinancingRatingInfo.getMarkType().equals("2")
                    ) {
                //担保记录
                P2pGuaranteeRecord p2pGuaranteeRecord = p2pGuaranteeRecordService.findByFinancingId(p2pFinancingInformation.getId());
                //资产评估记录
                P2pAssetValuationRecord p2pAssetValuationRecord = p2pAssetValuationRecordService.findByFinancingId(p2pFinancingInformation.getId());
                model.addAttribute("p2pGuaranteeRecord", p2pGuaranteeRecord).addAttribute("p2pAssetValuationRecord", p2pAssetValuationRecord);
                //如果是机构标
            } else if (p2pFinancingRatingInfo != null
                    && p2pFinancingRatingInfo.getMarkType() != null
                    && p2pFinancingRatingInfo.getMarkType().equals("1")
                    ) {
                //资产评估记录
                P2pAssetValuationRecord p2pAssetValuationRecord = p2pAssetValuationRecordService.findByFinancingId(p2pFinancingInformation.getId());
                model.addAttribute("p2pAssetValuationRecord", p2pAssetValuationRecord);
            }
        }
        P2pMarketConfirmRecord p2pMarketConfirmRecord = p2pMarketConfirmRecordService.findByIdTwo(id);
        try {
            P2pIndustryclassi p2pIndustryclassi = p2pIndustryclassiService.getByIndustyNum(p2pFinancingInformation.getP2pEnterpriseCertify().getIndustryCode());
            p2pFinancingInformation.getP2pEnterpriseCertify().setIndustryCode(p2pIndustryclassi.getClassinameCn());
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("vo", p2pFinancingInformation);
        model.addAttribute("p2pMarketConfirmRecord", p2pMarketConfirmRecord);
        return "p2p/back/financing/before/debtIssuedBeforeConfirmAuditView";
    }

    /**
     * 发布债项审核
     *
     * @param id
     * @param name
     * @param request
     * @param response
     * @param model
     * @return
     * @throws UnsupportedEncodingException
     * @author Sora
     */
    @RequestMapping(value = "findFinancingDetailFive")
    public String findFinancingDetailFive(String id, String name, HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
        try {
            Date date = new Date();
            //债项信息
            P2pFinancingInformation p2pFinancingInformation = subscribeRecordService.getDebtDetails(id);
            p2pFinancingInformation.getP2pEnterpriseCertify().setProvincialArea(AreaUtils.findById(p2pFinancingInformation.getP2pEnterpriseCertify().getProvincialArea()).getName());
            p2pFinancingInformation.getP2pEnterpriseCertify().setMunicipalArea(AreaUtils.findById(p2pFinancingInformation.getP2pEnterpriseCertify().getMunicipalArea()).getName());
            //评级信息
            P2pFinancingRatingInfo p2pFinancingRatingInfo = p2pFinancingRatingInfoService.findById(id);
            model.addAttribute("p2pFinancingRatingInfo", p2pFinancingRatingInfo);
            //判断是否补信
            if (p2pFinancingRatingInfo != null
                    && p2pFinancingRatingInfo.getWetherRep() != null
                    && p2pFinancingRatingInfo.getWetherRep().equals("1")) {
                //判断标的类型
                //如果是个人标
                if (p2pFinancingRatingInfo != null
                        && p2pFinancingRatingInfo.getMarkType() != null
                        && p2pFinancingRatingInfo.getMarkType().equals("2")
                        ) {
                    //担保记录
                    P2pGuaranteeRecord p2pGuaranteeRecord = p2pGuaranteeRecordService.findByFinancingId(p2pFinancingInformation.getId());
                    //资产评估记录
                    P2pAssetValuationRecord p2pAssetValuationRecord = p2pAssetValuationRecordService.findByFinancingId(p2pFinancingInformation.getId());
                    model.addAttribute("p2pGuaranteeRecord", p2pGuaranteeRecord).addAttribute("p2pAssetValuationRecord", p2pAssetValuationRecord);
                    //如果是机构标
                } else if (p2pFinancingRatingInfo != null
                        && p2pFinancingRatingInfo.getMarkType() != null
                        && p2pFinancingRatingInfo.getMarkType().equals("1")
                        ) {
                    //资产评估记录
                    P2pAssetValuationRecord p2pAssetValuationRecord = p2pAssetValuationRecordService.findByFinancingId(p2pFinancingInformation.getId());
                    model.addAttribute("p2pAssetValuationRecord", p2pAssetValuationRecord);
                }
            }
            //未支付评级费
            if (p2pFinancingInformation.getIsHandRateCost() == 0) {
                P2pMarketConfirmRecord p2pMarketConfirmRecord = p2pMarketConfirmRecordService.findByIdTwo(id);
                model.addAttribute("p2pMarketConfirmRecord", p2pMarketConfirmRecord);
            }

            P2pIndustryclassi p2pIndustryclassi = p2pIndustryclassiService.getByIndustyNum(p2pFinancingInformation.getP2pEnterpriseCertify().getIndustryCode());
            p2pFinancingInformation.getP2pEnterpriseCertify().setIndustryCode(p2pIndustryclassi.getClassinameCn());
            model.addAttribute("date", date);
            model.addAttribute("vo", p2pFinancingInformation);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "p2p/back/financing/before/issuedDebtAudit";
    }


    /**
     * 发布债项详情
     *
     * @param id
     * @param name
     * @param request
     * @param response
     * @param model
     * @return
     * @throws UnsupportedEncodingException
     * @author Sora
     */
    @RequestMapping(value = "findFinancingDetailSix")
    public String findFinancingDetailSix(String id, String name, HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
        //债项信息
        P2pFinancingInformation p2pFinancingInformation = subscribeRecordService.getDebtDetails(id);
        p2pFinancingInformation.getP2pEnterpriseCertify().setProvincialArea(AreaUtils.findById(p2pFinancingInformation.getP2pEnterpriseCertify().getProvincialArea()).getName());
        p2pFinancingInformation.getP2pEnterpriseCertify().setMunicipalArea(AreaUtils.findById(p2pFinancingInformation.getP2pEnterpriseCertify().getMunicipalArea()).getName());
        //评级信息
        P2pFinancingRatingInfo p2pFinancingRatingInfo = p2pFinancingRatingInfoService.findById(id);
        model.addAttribute("p2pFinancingRatingInfo", p2pFinancingRatingInfo);
        //判断是否补信
        if (p2pFinancingRatingInfo != null
                && p2pFinancingRatingInfo.getWetherRep() != null
                && p2pFinancingRatingInfo.getWetherRep().equals("1")) {
            //判断标的类型
            //如果是个人标
            if (p2pFinancingRatingInfo != null
                    && p2pFinancingRatingInfo.getMarkType() != null
                    && p2pFinancingRatingInfo.getMarkType().equals("2")
                    ) {
                //担保记录
                P2pGuaranteeRecord p2pGuaranteeRecord = p2pGuaranteeRecordService.findByFinancingId(p2pFinancingInformation.getId());
                //资产评估记录
                P2pAssetValuationRecord p2pAssetValuationRecord = p2pAssetValuationRecordService.findByFinancingId(p2pFinancingInformation.getId());
                model.addAttribute("p2pGuaranteeRecord", p2pGuaranteeRecord).addAttribute("p2pAssetValuationRecord", p2pAssetValuationRecord);
                //如果是机构标
            } else if (p2pFinancingRatingInfo != null
                    && p2pFinancingRatingInfo.getMarkType() != null
                    && p2pFinancingRatingInfo.getMarkType().equals("1")
                    ) {
                //资产评估记录
                P2pAssetValuationRecord p2pAssetValuationRecord = p2pAssetValuationRecordService.findByFinancingId(p2pFinancingInformation.getId());
                model.addAttribute("p2pAssetValuationRecord", p2pAssetValuationRecord);
            }
        }
        //未支付评级费(市场意见)
        if (p2pFinancingInformation.getIsHandRateCost() == 0) {
            P2pMarketConfirmRecord p2pMarketConfirmRecord = p2pMarketConfirmRecordService.findByIdTwo(id);
            model.addAttribute("p2pMarketConfirmRecord", p2pMarketConfirmRecord);
        }
        //发布意见
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = p2pBeforeMatchDebtStateService.findByIdOne(id, FinancingState.FINANCING_PUBLISHED + "");
        try {
            P2pIndustryclassi p2pIndustryclassi = p2pIndustryclassiService.getByIndustyNum(p2pFinancingInformation.getP2pEnterpriseCertify().getIndustryCode());
            p2pFinancingInformation.getP2pEnterpriseCertify().setIndustryCode(p2pIndustryclassi.getClassinameCn());
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("vo", p2pFinancingInformation);
        model.addAttribute("p2pBeforeMatchDebtState", p2pBeforeMatchDebtState);
        return "p2p/back/financing/before/issuedDebtAuditView";
    }

    /**
     * 处理确认债项请求
     *
     * @param session
     * @param p2pFinancingInformation
     * @param rate
     * @return
     */
    @RequestMapping(value = "confirmDebt", method = RequestMethod.POST)
    @Token(remove = true)
    public String confirmDebt(HttpSession session, P2pFinancingInformation p2pFinancingInformation, Double newRate) {
        if (PermissionUtils.ctrlPermission(session, null, FinancingState.CREDIT_RATING_SUCCESS) == false) {
            return "modules/front/state/error";
        }
        User user = (User) session.getAttribute("user");
        p2pFinancingInformation.setApplicantsId(user.getId());
        p2pFinancingInformationService.confirmDebt(p2pFinancingInformation, newRate);
        return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=myFinancApp";
    }


    /**
     * 快速投资
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "quickInvestment")
    public String quickInvestment(P2pFinancingInformation p2pFinancingInformation,
                                  HttpServletRequest request, HttpServletResponse response, Model model) {

        return "modules/front/investment/financingList";
    }

    /**
     * 查询所有处于募集预警期内的债项
     *
     * @author duan
     */
    @RequestMapping(value = "findAllRaiseAndWarning")
    public String findAllRaiseAndWarning(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = p2pFinancingInformationService.findAllRaiseAndWarning(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "modules/back/AllRaiseAndWaring";
    }

    /**
     * 按输入条件查询所有处于募集预警期内的债项
     *
     * @author duan
     */
    @RequestMapping(value = "findAllAccRaiseAndWarning")
    public String findAllAccRaiseAndWarning(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = p2pFinancingInformationService.findAllAccRaiseAndWarning(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "modules/back/AllRaiseAndWaring";
    }

/*	*//**
     * 根据条件查询所有处于还款警期内的债项
     * @author duan
     * @throws ParseException
     *//*
    @RequestMapping(value ="findAllAccFinaNameAndGivTime")
	public String findAllAccFinaNameAndGivTime(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) throws ParseException {
		Map<String,Integer> map=new HashMap<String,Integer>();
		String method=request.getParameter("start");
		List<P2pFinancingInformation> list = p2pFinancingInformationService.findAllAccFinaNameAndGivTime(p2pFinancingInformation);
		if (list.size()==0) {//判断有无处于还款期内的债项
			return "modules/back/AllRepayAndWaring";
		}
		List<Map<String,Object>> warnList=CalculateRepayWarnUtils.RepayWarnTime(list);
		if (warnList.size()==0) {//判断有无预警的债项，没有则返回页面
			return "modules/back/AllRepayAndWaring";
		}
		String remoteAddrP= request.getRemoteAddr();//获取用户的IP
		ListPageUtils<Map<String, Object>> listPageUtils = mapLQ.get(remoteAddrP);//通过用户获取List
		List<Map<String,Object>> pageList;
		if (method.equals("toFistPage")) {
			 mapLQ.put(remoteAddrP,listPageUtils);
			 pageList=listPageUtils.toFirstPage();
		}else if (method.equals("toLastPage")) {
			 pageList=listPageUtils.toLastPage();
		}else if (method.equals("toNextPage")) {
			 pageList=listPageUtils.toNextPage();
		}else if (method.equals("toBackPage")){
			pageList=listPageUtils.toBackPage();
		}else{
			return "modules/back/AllRepayAndWaring";
		}
		map.put("pageCount",listPageUtils.getPageCount());//总页数
		map.put("pageNum",listPageUtils.getPageNum());//当前页数
		
		model.addAttribute("map",map);
		model.addAttribute("list",  pageList);
		return "modules/back/AllRepayAndWaring";
	}
	*/

    /**
     * 将当前项目改为流标项目
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "changeExpired")
    public String changeExpired(HttpSession session) {
        try {
            if (PermissionUtils.ctrlPermission(session, null, FinancingState.CREDIT_RATING_SUCCESS) == false) {
                return "modules/front/state/error";
            }
            User user = (User) session.getAttribute("user");
            P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
            p2pFinancingInformation.setApplicantsId(user.getId());
            p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.FINANCING_EXPIRED));
            p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
            return "redirect:" + frontPath;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + frontPath;
    }


    @ResponseBody
    @RequestMapping(value = "findArea")
    public List<Area> findArea(@RequestParam String provinceCode, @RequestParam String cityCode) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("provinceCode", provinceCode);
        paramMap.put("cityCode", cityCode);
        List<Area> list = areaDao.findArea(paramMap);

        return list;
    }


    /**
     * 查询所有待审（首页材料审核任务池）
     */
    @RequestMapping(value = "findAllAccFinaNameAndID")
    public String findAllAccFinaNameAndID(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = p2pFinancingInformationService.findAllAccFinaNameAndID(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "modules/financing/p2pAllExamineTasks";
    }

    /**
     * 市场审核列表页面
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     * @author Sora
     */
    //@RequiresPermissions("financing:p2pFinancingInformation:view")
    @RequestMapping(value = "marketConfirmation")
    public String marketConfirmation(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pFinancingInformation> page = p2pFinancingInformationService.findMarketConfirmation(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/financing/before/marketConfirmationList";
    }

    /**
     * @return
     * @author DASH
     * 查询字典项value
     */
    @RequestMapping(value = "selectDict")
    @ResponseBody
    public String getDictLabel(String value, String type, String defaultValue, HttpServletResponse response) {
        if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)) {
            for (Dict dict : getDictList(type)) {
                if (type.equals(dict.getType()) && value.equals(dict.getValue())) {
                    return dict.getLabel();
                }
            }
        }
        return defaultValue;
    }


    /**
     * @return
     * @author DASH
     * 查询字典项value
     */
    public List<Dict> getDictList(String type) {
        @SuppressWarnings("unchecked")
        Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>) CacheUtils.get(CACHE_DICT_MAP);
        if (dictMap == null) {
            dictMap = Maps.newHashMap();
            for (Dict dict : dictDao.findAllList(new Dict())) {
                List<Dict> dictList = dictMap.get(dict.getType());
                if (dictList != null) {
                    dictList.add(dict);
                } else {
                    dictMap.put(dict.getType(), Lists.newArrayList(dict));
                }
            }
            CacheUtils.put(CACHE_DICT_MAP, dictMap);
        }
        List<Dict> dictList = dictMap.get(type);
        if (dictList == null) {
            dictList = Lists.newArrayList();
        }
        return dictList;
    }

    /**
     * 市场确认债项
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     * @author Sora
     */
    //@RequiresPermissions("financing:p2pFinancingInformation:view")
    @RequestMapping(value = "marketConfirmationDebt")
    public String marketConfirmationDebt(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = p2pFinancingInformationService.findMarketConfirmation(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "p2p/back/financing/before/marketConfirmationList";
    }

    /**
     * 市场确认发布债项
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     * @author Sora
     */
    //@RequiresPermissions("financing:p2pFinancingInformation:view")
    @RequestMapping(value = "marketConfirmationReleaseDebt")
    public String marketConfirmationReleaseDebt(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFinancingInformation> page = p2pFinancingInformationService.findMarketConfirmationReleaseDebt(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
        model.addAttribute("page", page);
        return "p2p/back/financing/before/marketConfirmationDebtList";
    }


    /**
     * 债项发布
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     * @author Sora
     */
    //@RequiresPermissions("financing:p2pFinancingInformation:view")
    @RequestMapping(value = "debtIssued")
    public String debtIssued(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pFinancingInformation> page = p2pFinancingInformationService.findDebtIssued(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/financing/before/debtIssuedList";
    }

    /**
     * 计算投资收益
     *
     * @param
     * @param
     * @param
     * @param
     * @param
     * @author Chace
     */
    @RequestMapping(value = "calculateIncome")
    @ResponseBody
    public Double calculateIncome(Double amount, Double rate, String repaymentMode, int phase) {
        Double expectEarn = moneyService.calculateIncome(amount, rate, repaymentMode, phase);
        return expectEarn;
    }

    /**
     * 评级材料打包下载
     *
     * @param
     * @param
     * @param
     * @author Chace
     */
    @RequestMapping("downloads")
    public String downloads(String financingInformationId, String rateDocumentTempId, HttpServletRequest request, HttpServletResponse response) {
        String tempId = documentUploadService.findEnterpriseShareholders(financingInformationId);
//		UploadFileUtils.rateInformation(financingInformationId,rateDocumentTempId,response);
        return "forward:" + adminPath + "/document/p2pRateDocumentUpload/getAddress";
    }

    /**
     * 单个下载
     *
     * @author Chace
     */
    @RequestMapping("download")
    public void download(HttpServletRequest request, HttpServletResponse response, String address) {
        UploadFileUtils.fdfsDownload(address, response);
    }

    /**
     * 打包下载
     *
     * @author Chace
     */
    @RequestMapping("download2")
    public void download2(HttpServletResponse response, String address) {
        try {
            String[] array = address.split(",");
            String path = Global.getConfig("filePath");
            String names[] = new String[array.length];
            List<File> files = new ArrayList<File>();
            String zipName = "还款凭证.zip";
            for (int i = 0; i < array.length; i++) {
                String name = array[i];
                File file = new File(path + array[i]);
                names[i] = name.substring(name.lastIndexOf("/") + 1, name.length());
                files.add(file);
            }
            UploadFileUtils.createZip(zipName, names, files, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 返回批量发布页面
     */
    @RequestMapping("batchReleasePage")
    public String batchReleasePage(String[] ids, Model model) {
        List<String> list = new ArrayList<String>();
        String idsStr = "";
        for (int i = 0; i < ids.length; i++) {
            list.add(ids[i]);
            idsStr += ids[i] + ",";
        }
        idsStr = idsStr.substring(0, idsStr.length() - 1);
        List<P2pFinancingInformation> p2pList = p2pFinancingInformationService.batchReleasePage(list);
        model.addAttribute("p2pList", p2pList);
        model.addAttribute("idsStr", idsStr);
        return "/p2p/back/financing/before/batchReleasePage";
    }

    /**
     * 批量发布
     *
     * @author Chace
     */
    @RequestMapping("batchRelease")
    public String batchRelease(String idsStr, P2pFinancingInformation p2pFinancingInformation, String operatorId, RedirectAttributes redirectAttributes) {
        Date date = new Date();
        String[] ids = new String[1];
        if (idsStr.indexOf(",") != -1) {
            ids = idsStr.split(",");
        } else {
            ids[0] = idsStr;
        }
        for (int i = 0; i < ids.length; i++) {
            P2pFinancingInformation p2pFinancingInformation2 = new P2pFinancingInformation();
            p2pFinancingInformation2 = p2pFinancingInformationService.getFinancingAmount(ids[i]);
            p2pFinancingInformation2.setId(ids[i]);
            p2pFinancingInformation2.setPublishTime(p2pFinancingInformation.getPublishTime());
            p2pFinancingInformation2.setLastPublishTime(p2pFinancingInformation.getPublishTime());
            p2pFinancingInformation2.setHasRaiseAmount(0);
            p2pFinancingInformation2.setHasRaiseTime("0");
            p2pFinancingInformation2.setInRaiseState("0");
            if (p2pFinancingInformation2.getFinancingAmount() >= p2pFinancingInformation2.getApplicationAmount()) {
                p2pFinancingInformation2.setRestRaiseMoney(p2pFinancingInformation2.getApplicationAmount() + "");
            } else {
                p2pFinancingInformation2.setRestRaiseMoney(p2pFinancingInformation2.getFinancingAmount() + "");
            }
            p2pFinancingInformation2.setPublishId(operatorId);
            if (date.getTime() >= p2pFinancingInformation.getPublishTime().getTime()) {
                p2pFinancingInformation2.setCurrentStage(FinancingState.FINANCING_PUBLISHED + "");
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                p2pBeforeMatchDebtState.setProgressStage(FinancingState.FINANCING_PUBLISHED + "");//审核通过状态变为募集期
                p2pBeforeMatchDebtState.setStateTime(p2pFinancingInformation.getPublishTime());
                p2pBeforeMatchDebtState.setFinacingInformationId(ids[i]);
                p2pBeforeMatchDebtState.setOperatorId(operatorId);
                p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
                //发送站内信和短信
                P2pFinancingInformation p2p = p2pFinancingInformationService.findForMsg(p2pFinancingInformation2);
                Map<String, String> map = MsgLetterTemplate.getJdcpfbtz(p2p.getFinacingName());
                MsgUtils.sendLetter(p2p.getApplicantsId(), map);
                String content = MsgSmsTemplate.getJdcpfbtz();
                MsgUtils.sendSMS(p2p.getApplicantsId(), content);
            }
            p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation2);
        }
        addMessage(redirectAttributes, "操作成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pFinancingInformation/debtIssued?repage";
    }
}













