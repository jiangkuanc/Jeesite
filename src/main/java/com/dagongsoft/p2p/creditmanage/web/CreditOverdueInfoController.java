package com.dagongsoft.p2p.creditmanage.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.dagongsoft.p2p.creditmanage.entity.CreditOverdueInfo;
import com.dagongsoft.p2p.creditmanage.service.CreditOverdueInfoService;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.service.P2pEnterpriseCertifyService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 信用记录维护Controller
 *
 * @author Zazh
 * @version 2017-02-20
 */
@Controller
@RequestMapping(value = "${adminPath}/creditmanage/creditOverdueInfo")
public class CreditOverdueInfoController extends BaseController {

    @Resource
    private CreditOverdueInfoService creditOverdueInfoService;
    @Resource
    private P2pEnterpriseCertifyService p2pEnterpriseCertifyService;

    @ModelAttribute
    public CreditOverdueInfo get(@RequestParam(required = false) String id) {
        CreditOverdueInfo entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = creditOverdueInfoService.get(id);
        }
        if (entity == null) {
            entity = new CreditOverdueInfo();
        }
        return entity;
    }

    /**
     * 信用记录信息
     */
    @RequestMapping(value = {"overdueInfo"})
    public String overdueInfo(CreditOverdueInfo creditOverdueInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        //企业信息
        P2pEnterpriseCertify p2pEnterpriseCertify = new P2pEnterpriseCertify();
        p2pEnterpriseCertify.setUserId(creditOverdueInfo.getUser().getId());
        User user = new User();
        user.setId(p2pEnterpriseCertify.getUserId());
        p2pEnterpriseCertify.setUser(user);
        List<P2pEnterpriseCertify> p2pEnterpriseCertifys = p2pEnterpriseCertifyService.findList(p2pEnterpriseCertify);
        if (p2pEnterpriseCertifys.size() > 0) {
            p2pEnterpriseCertify = p2pEnterpriseCertifys.get(0);
        } else {

        }
        p2pEnterpriseCertify.setRemarks(creditOverdueInfo.getRemarks());//操作类型
        model.addAttribute("p2pEnterpriseCertify", p2pEnterpriseCertify);
        return "modules/creditmanage/creditOverdueInfo";
    }

    @RequestMapping(value = {"list", ""})
    public String list(CreditOverdueInfo creditOverdueInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
        //逾期记录列表
        Page<CreditOverdueInfo> page = creditOverdueInfoService.findPage(new Page<CreditOverdueInfo>(request, response), creditOverdueInfo);
        model.addAttribute("page", page);
        model.addAttribute("CreditOverdueInfo", creditOverdueInfo);
        return "modules/creditmanage/creditOverdueInfoList";
    }

    @RequestMapping(value = "form")
    public String form(CreditOverdueInfo creditOverdueInfo, Model model) {
        model.addAttribute("creditOverdueInfo", creditOverdueInfo);
        return "modules/creditmanage/creditOverdueInfoForm";
    }

    @RequestMapping(value = "save")
    public String save(CreditOverdueInfo creditOverdueInfo, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, creditOverdueInfo)) {
            return form(creditOverdueInfo, model);
        }
        if ("".equals(creditOverdueInfo.getOverdueMonths())) {
            creditOverdueInfo.setOverdueMonths(null);
        }
        if ("".equals(creditOverdueInfo.getPens())) {
            creditOverdueInfo.setPens(null);
        }
        creditOverdueInfoService.save(creditOverdueInfo);
        addMessage(redirectAttributes, "保存信用记录维护成功");
        return "redirect:" + Global.getAdminPath() + "/creditmanage/creditOverdueInfo/?remarks=edit&user.id=" + creditOverdueInfo.getUser().getId();
//		return JSON.toJSONString("success");
    }

    @RequestMapping(value = "delete")
    @ResponseBody
    public String delete(CreditOverdueInfo creditOverdueInfo, RedirectAttributes redirectAttributes) {
        creditOverdueInfoService.delete(creditOverdueInfo);
        addMessage(redirectAttributes, "删除信用记录维护成功");
        return JSON.toJSONString("success");
    }

}