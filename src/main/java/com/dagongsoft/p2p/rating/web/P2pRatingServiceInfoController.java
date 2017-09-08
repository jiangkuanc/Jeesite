package com.dagongsoft.p2p.rating.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.config.service.front.IndustryConfigService;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.document.service.DocumentUploadService;
import com.dagongsoft.p2p.financing.service.front.PayRatingFeeService;
import com.dagongsoft.p2p.financing.service.front.ViewDebtDetailsService;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.rating.service.P2pRatingServiceInfoService;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.utils.AreaUtils;
import com.dagongsoft.p2p.utils.RatingState;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 评级服务信息实体Controller
 *
 * @author Quincy
 * @version 2017-02-27
 */
@Controller
@RequestMapping(value = "${adminPath}/rating/p2pRatingServiceInfo")
public class P2pRatingServiceInfoController extends BaseController {

    @Resource
    private P2pRatingServiceInfoService p2pRatingServiceInfoService;
    @Resource
    private IndustryConfigService industryConfigService;
    @Resource
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;
    @Resource
    private DocumentUploadService documentUploadService;
    @Resource
    private PayRatingFeeService payRatingFeeService;
    @Resource
    private ViewDebtDetailsService viewDebtDetailsService;
    @Resource
    private P2pRegUserCertifyService p2pRegUserCertifyService;

    @ModelAttribute
    public P2pRatingServiceInfo get(@RequestParam(required = false) String id) {
        P2pRatingServiceInfo entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRatingServiceInfoService.get(id);
        }
        if (entity == null) {
            entity = new P2pRatingServiceInfo();
        }
        return entity;
    }

    @RequiresPermissions("rating:p2pRatingServiceInfo:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pRatingServiceInfo p2pRatingServiceInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRatingServiceInfo> page = p2pRatingServiceInfoService.findPage(new Page<P2pRatingServiceInfo>(request, response), p2pRatingServiceInfo);
        model.addAttribute("page", page);
        return "modules/rating/p2pRatingServiceInfoList";
    }

    @RequiresPermissions("rating:p2pRatingServiceInfo:view")
    @RequestMapping(value = "form")
    public String form(P2pRatingServiceInfo p2pRatingServiceInfo, Model model) {
        model.addAttribute("p2pRatingServiceInfo", p2pRatingServiceInfo);
        return "modules/rating/p2pRatingServiceInfoForm";
    }

    @RequiresPermissions("rating:p2pRatingServiceInfo:edit")
    @RequestMapping(value = "save")
    public String save(P2pRatingServiceInfo p2pRatingServiceInfo, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRatingServiceInfo)) {
            return form(p2pRatingServiceInfo, model);
        }
        p2pRatingServiceInfoService.save(p2pRatingServiceInfo);
        addMessage(redirectAttributes, "保存评级服务信息成功");
        return "redirect:" + Global.getAdminPath() + "/rating/p2pRatingServiceInfo/?repage";
    }

    @RequiresPermissions("rating:p2pRatingServiceInfo:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pRatingServiceInfo p2pRatingServiceInfo, RedirectAttributes redirectAttributes) {
        p2pRatingServiceInfoService.delete(p2pRatingServiceInfo);
        addMessage(redirectAttributes, "删除评级服务信息成功");
        return "redirect:" + Global.getAdminPath() + "/rating/p2pRatingServiceInfo/?repage";
    }

    /**
     * 控制评级流程
     *
     * @param session
     * @param model
     * @param currentStage
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "ctrlRatingFlow")
    public String ctrlRatingFlow(HttpSession session, Model model, Integer currentStage) {
        User user = (User) session.getAttribute("user");
        if (currentStage == null) {
            currentStage = Integer.valueOf(p2pRatingServiceInfoService.findInfoByApplicantsId(user.getId()).getCurrentStage());
        } else {
            currentStage = Integer.valueOf(Integer.toString(currentStage).substring(1));
        }
        P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.findP2pRegUserCertifyByUid(user);
        p2pRegUserCertify.setRealName(p2pRegUserCertify.getRealName().substring(0, 1) + "**");
        model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);//加载实名认证信息
        P2pRatingServiceInfo p2p = null;
        switch (currentStage) {
            case 0:
                model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertifyService.findP2pEnterpriseCertifyByUid(user));
                model.addAttribute("provincialAreaList", AreaUtils.loadProvincialArea());//加载省级区域
                model.addAttribute("industryList", industryConfigService.findTopCategory());//加载一级行业列表
                return "p2p/front/rating/ratingApplication";
            case RatingState.FINISH_RATING_APPLICATION:
                p2p = p2pRatingServiceInfoService.findInfoByApplicantsId(user.getId());
                model.addAttribute("p2pFinancingInformation", p2p);
                return "p2p/front/rating/ratingDocuments";//非财务材料提交页
            case RatingState.FINISH_ENTERPRISE_DOCUMENTS:
                p2p = p2pRatingServiceInfoService.findInfoByApplicantsId(user.getId());
                model.addAttribute("p2pFinancingInformation", p2p);
                return "p2p/front/rating/ratingDocuments2";//财务材料提交页
            case RatingState.FINISH_FINANCE_DOCUMENTS:
                InitDataList(model, user, 1);
                return "p2p/front/rating/flowView1";//评级材料审核中
            case RatingState.RATING_DOCUMENTS_FAIL:
                InitDataList(model, user, 2);
                return "p2p/front/rating/flowView2";//重新提交评级材料
            case RatingState.NEED_PAY_RATING_FEE:
                InitDataList(model, user, 3);
                return "p2p/front/rating/flowView3";//待支付评级费
            case RatingState.CREDIT_RATING_ING:
                InitDataList(model, user, 4);
                return "p2p/front/rating/flowView4";//信用评级中
            case RatingState.NEED_CONFIRM_RESULT:
                InitDataList(model, user, 4);
                return "p2p/front/rating/flowView5";//待确认评级结果
            case RatingState.REVIEW_RATING:
                InitDataList(model, user, 4);
                return "p2p/front/rating/flowView6";//复评中
            case RatingState.NEED_PUBLISH_REPORT:
                InitDataList(model, user, 5);
                return "p2p/front/rating/flowView7";//待发布评级报告
            case RatingState.STAY_FINISH:
                InitDataList(model, user, 4);
                return "p2p/front/rating/flowView8";//等待结项
        }
        return null;
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
    public void InitDataList(Model model, User user, int mode) {
        try {
            P2pRatingServiceInfo p2p = p2pRatingServiceInfoService.findInfoByApplicantsId(user.getId());
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
                model.addAttribute("orderInfo", payRatingFeeService.findOrderInfoByFid(p2p.getId(), user.getId()));//评级费订单
                model.addAttribute("financingInformationId", p2p.getId());
                model.addAttribute("isSupply", p2p.getIsSupply());
            } else if (mode == 4) {
                model.addAttribute("rateDocument0", documentUploadService.findSimpleList(p2p.getId(), 0));//已提交材料列表
                model.addAttribute("orderInfo", payRatingFeeService.findOrderInfoByFid(p2p.getId(), user.getId()));//评级费订单
                model.addAttribute("financingInformationId", p2p.getId());
                model.addAttribute("ratingInfo", viewDebtDetailsService.findRatingInfoByRid(p2p.getId()));//评级信息
                model.addAttribute("isSupply", p2p.getIsSupply());
            } else if (mode == 5) {
                model.addAttribute("rateDocument0", documentUploadService.findSimpleList(p2p.getId(), 0));//已提交材料列表
                model.addAttribute("orderInfo", payRatingFeeService.findOrderInfoByFid(p2p.getId(), user.getId()));//评级费订单
                model.addAttribute("financingInformationId", p2p.getId());
                model.addAttribute("ratingInfo", viewDebtDetailsService.findRatingInfoByRid(p2p.getId()));//评级信息
                model.addAttribute("page", p2pRatingServiceInfoService.findProOrbitByFid(p2p.getId()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}