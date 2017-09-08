/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.extractor.ExcelExtractor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.financing.service.P2pPaymentOfRatingCostService;
import com.dagongsoft.p2p.utils.ExcelHelper;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.sun.net.httpserver.Authenticator.Success;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 支付管理Controller
 *
 * @author qichao
 * @version 2016-07-27
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/p2pPaymentOfRatingCost")
public class P2pPaymentOfRatingCostController extends BaseController {

    @Autowired
    private P2pPaymentOfRatingCostService p2pPaymentOfRatingCostService;

    @ModelAttribute
    public P2pPaymentOfRatingCost get(@RequestParam(required = false) String id) {
        P2pPaymentOfRatingCost entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pPaymentOfRatingCostService.findBusinessOrderDetail(id);
        }
        if (entity == null) {
            entity = new P2pPaymentOfRatingCost();
        }
        return entity;
    }

    @RequestMapping(value = {"list", ""})
    public String list(P2pPaymentOfRatingCost p2pPaymentOfRatingCost, HttpServletRequest request, HttpServletResponse response, Model model, String paymentStatus0, String paymentStatus1, String paymentStatus2) {
        String status = "";
        if (paymentStatus0 != null) {
            status += paymentStatus0 + ",";
        }
        if (paymentStatus1 != null) {
            status += paymentStatus1 + ",";
        }
        if (paymentStatus2 != null) {
            status += paymentStatus2 + ",";
        }
        if (status != "") {
            status = status.substring(0, status.length() - 1);
        }
        p2pPaymentOfRatingCost.setPaymentStatusStr(status);
        Page<P2pPaymentOfRatingCost> page = p2pPaymentOfRatingCostService.findBusinessOrderPage(new Page<P2pPaymentOfRatingCost>(request, response), p2pPaymentOfRatingCost);
        model.addAttribute("page", page);
        return "modules/financing/businessOrderList";
    }

    @RequestMapping(value = "form")
    public String form(P2pPaymentOfRatingCost p2pPaymentOfRatingCost, Model model) {
        String prefix = p2pPaymentOfRatingCost.getFinancingInformationId();
        prefix = prefix.substring(0, 3);
        if (prefix.equals("DG6")) {
            String str = p2pPaymentOfRatingCost.getP2pFinancingInformation().getFinacingName();
            str = str.replace(p2pPaymentOfRatingCost.getP2pFinancingInformation().getId(), "") + "借贷评级报告";
            p2pPaymentOfRatingCost.setReportName(str);
        } else if (prefix.equals("DG7")) {
            String str = p2pPaymentOfRatingCost.getP2pEnterpriseCertify().getEnterpriseName();
            str += "主体信用等级报告";
            p2pPaymentOfRatingCost.setReportName(str);
        }
        model.addAttribute("p2pPaymentOfRatingCost", p2pPaymentOfRatingCost);
        return "modules/financing/businessOrderDetail";
    }

    @RequestMapping(value = "save")
    public String save(P2pPaymentOfRatingCost p2pPaymentOfRatingCost, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pPaymentOfRatingCost)) {
            return form(p2pPaymentOfRatingCost, model);
        }
        p2pPaymentOfRatingCostService.save(p2pPaymentOfRatingCost);
        addMessage(redirectAttributes, "保存评级费用缴纳情况成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pPaymentOfRatingCost/?repage";
    }

    @RequestMapping(value = "delete")
    public String delete(P2pPaymentOfRatingCost p2pPaymentOfRatingCost, RedirectAttributes redirectAttributes) {
        p2pPaymentOfRatingCostService.delete(p2pPaymentOfRatingCost);
        addMessage(redirectAttributes, "删除评级费用缴纳情况成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pPaymentOfRatingCost/?repage";
    }

    /**
     * 清算文件列表
     *
     * @author Chace
     */
    @RequestMapping("settlementDocumentList")
    public String settlementDocumentList(P2pPaymentOfRatingCost p2pPaymentOfRatingCost, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pPaymentOfRatingCost> page = p2pPaymentOfRatingCostService.settlementDocumentList(new Page<P2pPaymentOfRatingCost>(request, response), p2pPaymentOfRatingCost);
        model.addAttribute("page", page);
        return "/modules/financing/settlementDocumentList";
    }


    /**
     * 导出excel
     *
     * @author Chace
     */
    @RequestMapping("exportExcel")
    public void exportExcel(P2pPaymentOfRatingCost p2pPaymentOfRatingCost, HttpServletRequest request, HttpServletResponse response, Model model) {
        List list = p2pPaymentOfRatingCostService.exportExcel(p2pPaymentOfRatingCost);
        String[] headers = {"订单编号", "付款金额(元)", "付款用户编号", "到账时间"};
        String[][] headers2 = {headers};
        List list2 = new ArrayList();
        list2.add(list);
        try {
            File file = ExcelHelper.exportExcelFromList(headers2, list2);
            String path = Global.getConfig("filePath");
            String fileName = file.getPath().substring(path.length());
            fileName = fileName.replace("\\", "/");
            UploadFileUtils.download(fileName, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}