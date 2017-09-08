/**
 *
 */
package com.dagongsoft.p2p.financing.web.back.before;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.financing.entity.P2pAssetValuationRecord;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pGuaranteeRecord;
import com.dagongsoft.p2p.financing.service.P2pAssetValuationRecordService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.financing.service.P2pGuaranteeRecordService;
import com.dagongsoft.p2p.financing.service.back.before.BuxinService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 增信Controller
 *
 * @author Zeus
 * @2016-11-10
 */
@Controller
@RequestMapping(value = "${adminPath}/before/buxin")
public class BuxinController extends BaseController {

    @Resource
    private BuxinService buxinService;
    @Resource
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Resource
    private P2pAssetValuationRecordService p2pAssetValuationRecordService;
    @Resource
    private P2pGuaranteeRecordService p2pGuaranteeRecordService;

    //抵质押增信列表（机构标）
    @RequestMapping(value = "buxinList1")
    public String buxinList1(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pFinancingInformation> page = buxinService.buxinPage1(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/p2p/back/financing/before/p2pBuxinList1";
    }

    //担保增信列表（个人标）
    @RequestMapping(value = "buxinList2")
    public String buxinList2(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pFinancingInformation> page = buxinService.buxinPage2(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/p2p/back/financing/before/p2pBuxinList2";
    }

    //资产评估审核页
    @RequestMapping(value = "assetValuation")
    public String assetValuation(String fiId, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.getDebtDetails(fiId);
            model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);

            P2pAssetValuationRecord p2pAssetValuationRecord = p2pAssetValuationRecordService.getByFiId(fiId);
            model.addAttribute("p2pAssetValuationRecord", p2pAssetValuationRecord);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/p2p/back/financing/before/p2pAssetValuation";
    }


    //资产评估审核
    @RequestMapping(value = "assetValuationAudit")
    public String assetValuationAudit(P2pAssetValuationRecord p2pAssetValuationRecord, String markType, RedirectAttributes redirectAttributes) {
        User user = (User) UserUtils.getUser();
        try {
            p2pAssetValuationRecordService.saveAudit(p2pAssetValuationRecord, markType, user.getId());
            addMessage(redirectAttributes, "操作成功");
        } catch (Exception e) {
            addMessage(redirectAttributes, "操作失败");
            e.printStackTrace();
        }
        if ("2".equals(markType)) {
            //个人标
            return "redirect:" + Global.getAdminPath() + "/before/buxin/buxinList2?repage";
        } else {
            //机构标
            return "redirect:" + Global.getAdminPath() + "/before/buxin/buxinList1?repage";
        }

    }

    //担保审核页
    @RequestMapping(value = "guarantee")
    public String guarantee(String fiId, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.getDebtDetails(fiId);
            model.addAttribute("p2pFinancingInformation", p2pFinancingInformation);

            P2pAssetValuationRecord p2pAssetValuationRecord = p2pAssetValuationRecordService.getByFiId(fiId);
            model.addAttribute("p2pAssetValuationRecord", p2pAssetValuationRecord);

            P2pGuaranteeRecord p2pGuaranteeRecord = p2pGuaranteeRecordService.getByFiId(fiId);
            model.addAttribute("p2pGuaranteeRecord", p2pGuaranteeRecord);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/p2p/back/financing/before/p2pGuarantee";
    }

    //担保审核
    @RequestMapping(value = "guaranteeAudit")
    public String guaranteeAudit(P2pGuaranteeRecord p2pGuaranteeRecord, P2pAssetValuationRecord p2pAssetValuationRecord, String id2, RedirectAttributes redirectAttributes) {
        try {
            p2pAssetValuationRecord.setId(id2);
            p2pGuaranteeRecordService.saveAudit(p2pGuaranteeRecord, p2pAssetValuationRecord);
            addMessage(redirectAttributes, "操作成功");

        } catch (Exception e) {
            addMessage(redirectAttributes, "操作失败");
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/before/buxin/buxinList2?repage";


    }
}
