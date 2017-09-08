/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.entity.P2pMarketConfirmRecord;
import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.financing.service.P2pBeforeMatchDebtStateService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.financing.service.P2pFinancingRatingInfoService;
import com.dagongsoft.p2p.financing.service.P2pMarketConfirmRecordService;
import com.dagongsoft.p2p.financing.service.P2pPaymentOfRatingCostService;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 撮合前债项状态进展表Controller
 *
 * @author zhengshuo
 * @version 2016-07-11
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/p2pBeforeMatchDebtState")
public class P2pBeforeMatchDebtStateController extends BaseController {

    @Autowired
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Autowired
    private P2pPaymentOfRatingCostService p2pPaymentOfRatingCostService;
    @Autowired
    private P2pMarketConfirmRecordService p2pMarketConfirmRecordService;
    @Autowired
    private P2pFinancingRatingInfoService p2pFinancingRatingInfoService;

    @ModelAttribute
    public P2pBeforeMatchDebtState get(@RequestParam(required = false) String id) {
        P2pBeforeMatchDebtState entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pBeforeMatchDebtStateService.get(id);
        }
        if (entity == null) {
            entity = new P2pBeforeMatchDebtState();
        }
        return entity;
    }

    @RequiresPermissions("financing:p2pBeforeMatchDebtState:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pBeforeMatchDebtState> page = p2pBeforeMatchDebtStateService.findPage(new Page<P2pBeforeMatchDebtState>(request, response), p2pBeforeMatchDebtState);
        model.addAttribute("page", page);
        return "modules/financing/p2pBeforeMatchDebtStateList";
    }

    @RequiresPermissions("financing:p2pBeforeMatchDebtState:view")
    @RequestMapping(value = "form")
    public String form(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, Model model) {
        model.addAttribute("p2pBeforeMatchDebtState", p2pBeforeMatchDebtState);
        return "modules/financing/p2pBeforeMatchDebtStateForm";
    }

    @RequiresPermissions("financing:p2pBeforeMatchDebtState:edit")
    @RequestMapping(value = "save")
    public String save(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pBeforeMatchDebtState)) {
            return form(p2pBeforeMatchDebtState, model);
        }
        p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
        addMessage(redirectAttributes, "保存撮合前债项状态进展表成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pBeforeMatchDebtState/?repage";
    }

    @RequiresPermissions("financing:p2pBeforeMatchDebtState:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, RedirectAttributes redirectAttributes) {
        p2pBeforeMatchDebtStateService.delete(p2pBeforeMatchDebtState);
        addMessage(redirectAttributes, "删除撮合前债项状态进展表成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pBeforeMatchDebtState/?repage";
    }

    @RequiresPermissions("financing:p2pBeforeMatchDebtState:view")
    @RequestMapping(value = "findListByFid")
    public String findListByFid(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pBeforeMatchDebtState> page = p2pBeforeMatchDebtStateService.findListByFid(new Page<P2pBeforeMatchDebtState>(request, response), p2pBeforeMatchDebtState);
        P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.get(p2pBeforeMatchDebtState.getFinacingInformationId());
        model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);
        model.addAttribute("page", page);
        return "modules/financing/beforeMatch/p2pBeforeMatchDebtStateList";
    }


    /**
     * 材料审核认证
     *
     * @param p2pBeforeMatchDebtState
     * @param yesOrNo
     * @param p2pFinancingInformation
     * @param redirectAttributes
     * @return
     * @author Sora
     */
    //@RequiresPermissions("financing:p2pBeforeMatchDebtState:edit")
    @RequestMapping(value = "renzhengFinal")
    @Transactional(readOnly = false)
    public String save2(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, String progress_stage, P2pFinancingInformation p2pFinancingInformation, String finacingInformationId, String paymentId, RedirectAttributes redirectAttributes) {

        //1是0否
        if ("1".equals(progress_stage)) {
            p2pFinancingInformation.setId(finacingInformationId);
            p2pFinancingInformation.setCurrentStage("203");//审核通过状态变为待立项
            p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
            //新建债项状态进展轨迹记录
            p2pBeforeMatchDebtState.setProgressStage("203");//审核通过状态变为待立项
            p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            P2pPaymentOfRatingCost p2pPaymentOfRatingCost = new P2pPaymentOfRatingCost();
            p2pPaymentOfRatingCost.setId(IdGen.uuid());
            p2pPaymentOfRatingCost.setFinancingInformationId(finacingInformationId);
            p2pPaymentOfRatingCost.setPaymentId(paymentId);
            p2pPaymentOfRatingCost.setOrderNo("NO" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
            p2pPaymentOfRatingCost.setOrderTime(new Date());
            p2pPaymentOfRatingCost.setPaymentStatus(0);//付款状态
            p2pPaymentOfRatingCost.setDelFlag("0");//正常状态，非删除
            p2pPaymentOfRatingCost.setChargingItem("1");
            double d = 5000.00;//评级费
            p2pPaymentOfRatingCost.setPaymentAmount(d);
            p2pPaymentOfRatingCost.setIsNewRecord(true);
            p2pPaymentOfRatingCostService.save(p2pPaymentOfRatingCost);

            //发送站内信、短信
            MsgUtils.sendLetter(p2pFinancingInformationService.getDebtDetails(finacingInformationId).getApplicantsId(), MsgLetterTemplate.getPjfsftz());
            MsgUtils.sendSMS(p2pFinancingInformationService.getDebtDetails(finacingInformationId).getApplicantsId(), MsgSmsTemplate.getPjfsftz());
        }
        if ("0".equals(progress_stage)) {
            p2pFinancingInformation.setId(finacingInformationId);
            p2pFinancingInformation.setCurrentStage("201");//审核未通过状态变为材料初审未通过
            p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
            p2pBeforeMatchDebtState.setProgressStage("201");//审核未通过状态变为材料初审未通过
            p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);


            //发送站内信、短信
            MsgUtils.sendLetter(p2pFinancingInformationService.getDebtDetails(finacingInformationId).getApplicantsId(), MsgLetterTemplate.getPjclshsb());
            MsgUtils.sendSMS(p2pFinancingInformationService.getDebtDetails(finacingInformationId).getApplicantsId(), MsgSmsTemplate.getPjclshsb());
        }
        addMessage(redirectAttributes, "操作成功");
        return "redirect:" + Global.getAdminPath() + "/financing/findDocumentAuditList/?repage";
    }

    /**
     * 发布市场确认
     *
     * @param p2pBeforeMatchDebtState
     * @param date
     * @param progress_stage
     * @param p2pFinancingInformation
     * @param finacingInformationId
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "debtFinal")
    public String save3(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, Date date, String progress_stage, P2pFinancingInformation p2pFinancingInformation, String finacingInformationId, RedirectAttributes redirectAttributes) {
        //1是0否
        if ("1".equals(progress_stage)) {
            p2pFinancingInformation.setId(finacingInformationId);
            p2pFinancingInformation.setCurrentStage(FinancingState.CREDIT_RATING_SUCCESS + "");//审核通过状态变为待确认债项
            p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
            //发送站内信和短信
            P2pFinancingInformation p2p = p2pFinancingInformationService.findForMsg(p2pFinancingInformation);
            Map<String, String> map = MsgLetterTemplate.getJdcpxxqr(p2p.getId());
            MsgUtils.sendLetter(p2p.getApplicantsId(), map);
            String content = MsgSmsTemplate.getJdcpxxqr();
            MsgUtils.sendSMS(p2p.getApplicantsId(), content);
            //新建债项状态进展轨迹记录
            p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());
            p2pBeforeMatchDebtState.setProgressStage(FinancingState.CREDIT_RATING_SUCCESS + "");//审核通过状态变为待确认债项
            p2pBeforeMatchDebtState.setStateTime(date);
            p2pBeforeMatchDebtState.setIsNewRecord(true);
            p2pBeforeMatchDebtState.setFinacingInformationId(finacingInformationId);
            p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            //新建市场人员确认记录
            P2pMarketConfirmRecord p2pMarketConfirmRecord = new P2pMarketConfirmRecord();
            p2pMarketConfirmRecord.setId(UUID.randomUUID().toString());//主键
            p2pMarketConfirmRecord.setFinancingInformationId(finacingInformationId);//债项编号
            p2pMarketConfirmRecord.setConfirmStage("2");//市场人员确认发布阶段
            p2pMarketConfirmRecord.setIsPass("1");//通过
            p2pMarketConfirmRecord.setOperateExplain(p2pBeforeMatchDebtState.getHandleResult());//处理结果
            p2pMarketConfirmRecord.setOperateId(UserUtils.getUser().getName());//操作人
            p2pMarketConfirmRecord.setOperateTime(date);
            p2pMarketConfirmRecord.setIsNewRecord(true);
            p2pMarketConfirmRecordService.save(p2pMarketConfirmRecord);
        }
        if ("0".equals(progress_stage)) {
            p2pFinancingInformation.setId(finacingInformationId);
            p2pFinancingInformation.setCurrentStage(FinancingState.PROJECT_KNOT + "");//审核未通过状态变为结项
            p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
            //发送站内信和短信
            P2pFinancingInformation p2p = p2pFinancingInformationService.findForMsg(p2pFinancingInformation);
            Map<String, String> map = MsgLetterTemplate.getWzfscfbwtg();
            MsgUtils.sendLetter(p2p.getApplicantsId(), map);
            String content = MsgSmsTemplate.getWzfscfbwtg();
            MsgUtils.sendSMS(p2p.getApplicantsId(), content);
            //轨迹表添加信息
            p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());
            p2pBeforeMatchDebtState.setProgressStage(FinancingState.PROJECT_KNOT + "");//审核未通过状态变为结项
            p2pBeforeMatchDebtState.setStateTime(date);
            p2pBeforeMatchDebtState.setIsNewRecord(true);
            p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            //新建市场人员确认记录
            P2pMarketConfirmRecord p2pMarketConfirmRecord = new P2pMarketConfirmRecord();
            p2pMarketConfirmRecord.setId(UUID.randomUUID().toString());//主键
            p2pMarketConfirmRecord.setFinancingInformationId(finacingInformationId);//债项编号
            p2pMarketConfirmRecord.setConfirmStage("2");//市场人员确认发布阶段
            p2pMarketConfirmRecord.setIsPass("0");//未通过
            p2pMarketConfirmRecord.setOperateExplain(p2pBeforeMatchDebtState.getHandleResult());//处理结果
            p2pMarketConfirmRecord.setOperateId(UserUtils.getUser().getName());//操作人
            p2pMarketConfirmRecord.setOperateTime(date);
            p2pMarketConfirmRecord.setIsNewRecord(true);
            p2pMarketConfirmRecordService.save(p2pMarketConfirmRecord);
        }
        addMessage(redirectAttributes, "操作成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pFinancingInformation/marketConfirmationDebt/?rePage";
    }

    /**
     * 市场立项，确认
     *
     * @param p2pBeforeMatchDebtState
     * @param date
     * @param progress_stage
     * @param p2pFinancingInformation
     * @param finacingInformationId
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "debtProjectAudit")
    public String save4(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, Date date, String progress_stage, P2pFinancingInformation p2pFinancingInformation, String finacingInformationId, RedirectAttributes redirectAttributes) {
        //1是0否
        if ("1".equals(progress_stage)) {
            p2pFinancingInformation.setId(finacingInformationId);
            p2pFinancingInformation.setCurrentStage(FinancingState.CREDIT_RATING_ING + "");//审核通过状态变为信用评级中
            p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);//仅仅改变CurrentStage为210
            //新建债项状态进展轨迹记录
            p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());
            p2pBeforeMatchDebtState.setProgressStage(FinancingState.CREDIT_RATING_ING + "");//审核通过状态变为信用评级中
            p2pBeforeMatchDebtState.setStateTime(date);
            p2pBeforeMatchDebtState.setOperatorId(UserUtils.getUser().getName());
            p2pBeforeMatchDebtState.setIsNewRecord(true);
            p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);//新增一条记录ProgressStage=210，StateTime=OperatorId=IsNewRecord
            //新建市场人员确认记录
            P2pMarketConfirmRecord p2pMarketConfirmRecord = new P2pMarketConfirmRecord();
            p2pMarketConfirmRecord.setId(UUID.randomUUID().toString());//主键
            p2pMarketConfirmRecord.setFinancingInformationId(finacingInformationId);//债项编号
            p2pMarketConfirmRecord.setConfirmStage("1");//市场人员确认立项阶段
            p2pMarketConfirmRecord.setIsPass("1");//通过
            p2pMarketConfirmRecord.setOperateExplain(p2pBeforeMatchDebtState.getHandleResult());//处理结果
            p2pMarketConfirmRecord.setOperateId(UserUtils.getUser().getName());//操作人
            p2pMarketConfirmRecord.setOperateTime(date);
            p2pMarketConfirmRecord.setIsNewRecord(true);
            p2pMarketConfirmRecordService.save(p2pMarketConfirmRecord);
        }
        if ("0".equals(progress_stage)) {
            p2pFinancingInformation.setId(finacingInformationId);
            p2pFinancingInformation.setCurrentStage(FinancingState.PROJECT_KNOT + "");//审核未通过状态变为结项
            p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);//仅更改为902
            p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());
            p2pBeforeMatchDebtState.setProgressStage(FinancingState.PROJECT_KNOT + "");//审核未通过状态变为结项
            p2pBeforeMatchDebtState.setStateTime(date);
            p2pBeforeMatchDebtState.setOperatorId(UserUtils.getUser().getName());
            p2pBeforeMatchDebtState.setIsNewRecord(true);
            p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            //新建市场人员确认记录
            P2pMarketConfirmRecord p2pMarketConfirmRecord = new P2pMarketConfirmRecord();
            p2pMarketConfirmRecord.setId(UUID.randomUUID().toString());//主键
            p2pMarketConfirmRecord.setFinancingInformationId(finacingInformationId);//债项编号
            p2pMarketConfirmRecord.setConfirmStage("1");//市场人员确认立项阶段
            p2pMarketConfirmRecord.setIsPass("0");//通过
            p2pMarketConfirmRecord.setOperateExplain(p2pBeforeMatchDebtState.getHandleResult());//处理结果
            p2pMarketConfirmRecord.setOperateId(p2pBeforeMatchDebtState.getOperatorId());//操作人
            p2pMarketConfirmRecord.setOperateTime(date);
            p2pMarketConfirmRecord.setIsNewRecord(true);
            p2pMarketConfirmRecordService.save(p2pMarketConfirmRecord);

            //发送站内信、短信
            MsgUtils.sendLetter(p2pFinancingInformationService.getDebtDetails(finacingInformationId).getApplicantsId(), MsgLetterTemplate.getWzfsclxwtg());
            MsgUtils.sendSMS(p2pFinancingInformationService.getDebtDetails(finacingInformationId).getApplicantsId(), MsgSmsTemplate.getWzfsclxwtg());

        }
        addMessage(redirectAttributes, "操作成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pFinancingInformation/marketConfirmation/?rePage";
    }

    @RequestMapping(value = "debtRealFinal")
    public String save5(P2pBeforeMatchDebtState p2pBeforeMatchDebtState, P2pFinancingInformation p2pFinancingInformation, String financingInformationId, Integer financingAmount, RedirectAttributes redirectAttributes) {
        //发布
        p2pFinancingInformation.setId(financingInformationId);
        Date date = new Date();
        p2pFinancingInformation.setLastPublishTime(p2pFinancingInformation.getPublishTime());//最新发布时间
        p2pFinancingInformation.setHasRaiseAmount(0);//已募集金额
        p2pFinancingInformation.setHasRaiseTime("0");//已募集时间
        p2pFinancingInformation.setInRaiseState("0");//募集中状态
        p2pFinancingInformation.setPublishId(p2pBeforeMatchDebtState.getOperatorId());
        p2pFinancingInformation.setRestRaiseMoney(financingAmount + "");//剩余募集金额
        if (date.getTime() >= p2pFinancingInformation.getPublishTime().getTime()) {
            p2pFinancingInformation.setCurrentStage(FinancingState.FINANCING_PUBLISHED + "");//审核通过状态变为募集期
            p2pBeforeMatchDebtState.setProgressStage(FinancingState.FINANCING_PUBLISHED + "");//审核通过状态变为募集期
            p2pBeforeMatchDebtState.setStateTime(p2pFinancingInformation.getPublishTime());
            p2pBeforeMatchDebtState.setFinacingInformationId(financingInformationId);
            p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            //发送站内信和短信
            P2pFinancingInformation p2pFinancingInformation2 = p2pFinancingInformationService.findForMsg(p2pFinancingInformation);
            Map<String, String> map = MsgLetterTemplate.getJdcpfbtz(p2pFinancingInformation2.getFinacingName());
            MsgUtils.sendLetter(p2pFinancingInformation2.getApplicantsId(), map);
            String content = MsgSmsTemplate.getJdcpfbtz();
            MsgUtils.sendSMS(p2pFinancingInformation2.getApplicantsId(), content);
        }
        p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
        //新建债项状态进展轨迹记录
        addMessage(redirectAttributes, "操作成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pFinancingInformation/debtIssued/?rePage";
    }

    @ResponseBody
    @RequestMapping(value = "debtRealFinalPiliang")
    public void save6(@RequestParam("str") String str, RedirectAttributes redirectAttributes) {
        try {
            //批量发布
            P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
            Integer amount = 0;
            if (str.indexOf(",") != -1) {
                String arrStr[] = str.split(",");
                for (int i = 0; i < arrStr.length; i++) {
                    //融资申请编号
                    String strAbc = arrStr[i];
                    //操作人
                    amount = p2pFinancingInformationService.getAmountById(strAbc);
                    String userName = UserUtils.getUser().getName();
                    p2pFinancingInformation.setId(strAbc);
                    p2pFinancingInformation.setCurrentStage(FinancingState.FINANCING_PUBLISHED + "");//审核通过状态变为募集期
                    p2pFinancingInformation.setPublishTime(new Date());
                    p2pFinancingInformation.setLastPublishTime(new Date());//最新发布时间
                    p2pFinancingInformation.setHasRaiseAmount(0);//已募集金额
                    p2pFinancingInformation.setHasRaiseTime("0");//已募集时间
                    p2pFinancingInformation.setInRaiseState("0");//募集中状态
                    p2pFinancingInformation.setRestRaiseMoney(amount + "");//剩余募集金额
                    p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
                    //新建债项状态进展轨迹记录
                    p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());
                    p2pBeforeMatchDebtState.setProgressStage(FinancingState.FINANCING_PUBLISHED + "");//审核通过状态变为募集期
                    p2pBeforeMatchDebtState.setStateTime(new Date());
                    p2pBeforeMatchDebtState.setIsNewRecord(true);
                    p2pBeforeMatchDebtState.setFinacingInformationId(strAbc);
                    p2pBeforeMatchDebtState.setOperatorId(userName);
                    p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
                }
            } else if (str.indexOf(",") == -1) {
                String userName = UserUtils.getUser().getName();
                amount = p2pFinancingInformationService.getAmountById(str);
                p2pFinancingInformation.setId(str);
                p2pFinancingInformation.setCurrentStage(FinancingState.FINANCING_PUBLISHED + "");//审核通过状态变为募集期
                p2pFinancingInformation.setPublishTime(new Date());
                p2pFinancingInformation.setLastPublishTime(new Date());//最新发布时间
                p2pFinancingInformation.setHasRaiseAmount(0);//已募集金额
                p2pFinancingInformation.setHasRaiseTime("0");//已募集时间
                p2pFinancingInformation.setInRaiseState("0");//募集中状态
                p2pFinancingInformation.setRestRaiseMoney(amount + "");//剩余募集金额
                p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
                //新建债项状态进展轨迹记录
                p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());
                p2pBeforeMatchDebtState.setProgressStage(FinancingState.FINANCING_PUBLISHED + "");//审核通过状态变为募集期
                p2pBeforeMatchDebtState.setStateTime(new Date());
                p2pBeforeMatchDebtState.setIsNewRecord(true);
                p2pBeforeMatchDebtState.setFinacingInformationId(str);
                p2pBeforeMatchDebtState.setOperatorId(userName);
                p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        addMessage(redirectAttributes, "操作成功");
    }

    @RequestMapping(value = "isFinalized")
    @ResponseBody
    public List[] isFinalized(@RequestParam("abc") String abc) {
        abc = abc.replace("abc:", "");
        String arrStr[] = abc.split("@");
        //未定稿的债项iD集合
        List<String> list1 = new ArrayList<String>();
        //定稿的债项iD集合
        List<String> list2 = new ArrayList<String>();
        //总的iD集合
        List[] listAll = new ArrayList[2];
        for (int i = 0; i < arrStr.length; i++) {
            String strAbc = arrStr[i];
            //String str123[]=strAbc.split(",");
            //融资申请编号
            String financingInformationId = strAbc;
            //债项名称
            //String financingName=str123[1];
            //评级信息
            P2pFinancingRatingInfo p2pFinancingRatingInfo = p2pFinancingRatingInfoService.getByFiId(financingInformationId);
            //债项信息
            P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.getById(financingInformationId);
            //是否定稿不为空时，并且评级没有定稿债项不能发布!!!
            if (p2pFinancingRatingInfo.getIsFinalized() != null && "0".equals(p2pFinancingRatingInfo.getIsFinalized())) {
                list1.add(p2pFinancingInformation.getId() + ";" + p2pFinancingInformation.getFinacingName());
            }
            //是否定稿不为空时，并且评级定稿债项可以发布!!!
            else if (p2pFinancingRatingInfo.getIsFinalized() != null && "1".equals(p2pFinancingRatingInfo.getIsFinalized())) {
                list2.add(financingInformationId);
            }
        }
        listAll[0] = list1;
        listAll[1] = list2;
        return listAll;
    }
}