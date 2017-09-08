package com.dagongsoft.p2p.risk.web;

import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.risk.entity.P2pRiskRecord;
import com.dagongsoft.p2p.risk.service.P2pRiskRecordService;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 风险测评记录表Controller
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/risk/p2pRiskRecord")
public class P2pRiskRecordController extends BaseController {


    @Resource
    private P2pUserInformationService p2pUserInformationService;
    @Resource
    private P2pRiskRecordService p2pRiskRecordService;

    @ModelAttribute
    public P2pRiskRecord get(@RequestParam(required = false) String id) {
        P2pRiskRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRiskRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pRiskRecord();
        }
        return entity;
    }


    @RequestMapping(value = {"list", ""})
    public String list(P2pRiskRecord p2pRiskRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRiskRecord> page = p2pRiskRecordService.findPage(new Page<P2pRiskRecord>(request, response), p2pRiskRecord);
        model.addAttribute("page", page);
        return "modules/p2p/risk/p2pRiskRecordList";
    }


    @RequestMapping(value = "form")
    public String form(P2pRiskRecord p2pRiskRecord, Model model) {
        model.addAttribute("p2pRiskRecord", p2pRiskRecord);
        return "modules/p2p/risk/p2pRiskRecordForm";
    }


    @RequestMapping(value = "save")
    public String save(HttpSession session, P2pRiskRecord p2pRiskRecord, Model model, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        try {
            if (user != null && !"".equals(user.getId())) {
                p2pRiskRecord.setUser(user);
            }    //获取当前Session中User对象
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);    //从当前user中得到P2pUserInformation
            if (!beanValidator(model, p2pRiskRecord)) {
                return form(p2pRiskRecord, model);
            }
            p2pRiskRecord.setId(UUID.randomUUID().toString());//主键
            p2pRiskRecord.setIsNewRecord(true);
            p2pRiskRecordService.save(p2pRiskRecord);
            addMessage(redirectAttributes, "保存风险测评记录表成功");
            /***
             * 1.保存之后修改P2PUserinformation的certifyState=1030
             */
            p2pUserInformation.setCertificateState(1030);
            p2pUserInformation.setUser(user);
            p2pUserInformationService.save(p2pUserInformation);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/user/bankCard/beMember";
    }


    @RequestMapping(value = "delete")
    public String delete(P2pRiskRecord p2pRiskRecord, RedirectAttributes redirectAttributes) {
        p2pRiskRecordService.delete(p2pRiskRecord);
        addMessage(redirectAttributes, "删除风险测评记录表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pRiskRecord/?repage";
    }

}