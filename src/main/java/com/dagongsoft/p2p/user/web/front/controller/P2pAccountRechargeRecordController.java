package com.dagongsoft.p2p.user.web.front.controller;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.user.dao.P2pAccountDao;
import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.dagongsoft.p2p.user.entity.P2pAccountRechargeRecord;
import com.dagongsoft.p2p.user.service.front.P2pAccountRechargeRecordService;
import com.dagongsoft.p2p.user.service.front.P2pAccountService;
import com.dagongsoft.p2p.user.utils.editor.DateEditor;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 充值记录Controller
 *
 * @author Chace
 * @version 2016-11-21
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/user/p2pAccountRechargeRecord")
public class P2pAccountRechargeRecordController extends BaseController {

    @Autowired
    private P2pAccountRechargeRecordService p2pAccountRechargeRecordService;

    @Autowired
    private P2pAccountService p2pAccountService;

    @Autowired
    private P2pAccountDao p2pAccountDao;

    @ModelAttribute
    public P2pAccountRechargeRecord get(@RequestParam(required = false) String id) {
        P2pAccountRechargeRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pAccountRechargeRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pAccountRechargeRecord();
        }
        return entity;
    }


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new DateEditor());
    }

    @RequiresPermissions("p2p:user:p2pAccountRechargeRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pAccountRechargeRecord p2pAccountRechargeRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pAccountRechargeRecord> page = p2pAccountRechargeRecordService.findPage(new Page<P2pAccountRechargeRecord>(request, response), p2pAccountRechargeRecord);
        model.addAttribute("page", page);
        return "modules/p2p/user/p2pAccountRechargeRecordList";
    }

    @RequiresPermissions("p2p:user:p2pAccountRechargeRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pAccountRechargeRecord p2pAccountRechargeRecord, Model model) {
        model.addAttribute("p2pAccountRechargeRecord", p2pAccountRechargeRecord);
        return "modules/p2p/user/p2pAccountRechargeRecordForm";
    }

    @RequiresPermissions("p2p:user:p2pAccountRechargeRecord:edit")
    @RequestMapping(value = "save")
    public String save(P2pAccountRechargeRecord p2pAccountRechargeRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pAccountRechargeRecord)) {
            return form(p2pAccountRechargeRecord, model);
        }
        p2pAccountRechargeRecordService.save(p2pAccountRechargeRecord);
        addMessage(redirectAttributes, "保存充值记录成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/user/p2pAccountRechargeRecord/?repage";
    }

    @RequiresPermissions("p2p:user:p2pAccountRechargeRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pAccountRechargeRecord p2pAccountRechargeRecord, RedirectAttributes redirectAttributes) {
        p2pAccountRechargeRecordService.delete(p2pAccountRechargeRecord);
        addMessage(redirectAttributes, "删除充值记录成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/user/p2pAccountRechargeRecord/?repage";
    }

    /**
     * 加载充值记录列表（个人）
     *
     * @param user
     * @param mode
     * @author Chace
     */
    @RequestMapping("loadRechargeRecord")
    public String loadRechargeRecord(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";            //返回登录页
        }
        P2pAccountRechargeRecord p2pAccountRechargeRecord = new P2pAccountRechargeRecord();
        p2pAccountRechargeRecord.setUserId(user.getId());
        List<P2pAccountRechargeRecord> list = p2pAccountRechargeRecordService.getByUserId(p2pAccountRechargeRecord);
        model.addAttribute("list", list);
        return "modules/front/user/rechargeRecord";        //充值记录
    }

    /**
     * 加载充值记录列表（融资）
     *
     * @param user
     * @param mode
     * @author Chace
     */
    @RequestMapping("loadRechargeRecord2")
    public String loadRechargeRecord2(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        P2pAccountRechargeRecord p2pAccountRechargeRecord = new P2pAccountRechargeRecord();
        p2pAccountRechargeRecord.setUserId(user.getId());
        List<P2pAccountRechargeRecord> list = p2pAccountRechargeRecordService.getByUserId(p2pAccountRechargeRecord);
        model.addAttribute("list", list);
        return "modules/front/user/rechargeRecord2";//充值记录
    }


    /**
     * 保存充值记录
     *
     * @param session
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping("saveChargeRecord")
    public String saveChargeRecord(HttpSession session, Model model, P2pAccountRechargeRecord p2pAccountRechargeRecord, HttpServletResponse response, HttpServletRequest request) {
        class ServerStatus implements Serializable {
            private String status;            //充值状态码
            private String message;        //充值状态消息

            public ServerStatus() {
                super();
            }

            public String getStatus() {
                return status;
            }

            public ServerStatus(String status, String message) {
                super();
                this.status = status;
                this.message = message;
            }

            public void setStatus(String status) {
                this.status = status;
            }

            public String getMessage() {
                return message;
            }

            public void setMessage(String message) {
                this.message = message;
            }
        }
        ServerStatus serverStatus = new ServerStatus();
        try {
            User user = (User) session.getAttribute("user");
            System.out.println(user.getId());
            P2pAccount p2pAccount = p2pAccountDao.getAccountByUserId(user.getId());

            //判断当前用户是否登录
            if (user == null || "".equals(user.getId())) {
                return "modules/front/user/userLogin";                                //返回登录页
            }
            if (p2pAccount == null) {
                //未进行绑卡
                return JsonMapper.toJsonString(new ServerStatus("3", "您未进行绑卡"));
            }

            if (p2pAccountRechargeRecord != null) {

                //业务规则生成流水号
//				p2pAccountRechargeRecord.setId(IdGen.uuid());
                p2pAccountRechargeRecord.setUser(user);
                p2pAccountRechargeRecord.setP2pAccount(p2pAccount);
                p2pAccountRechargeRecord.setRechargeState("1");
                p2pAccountRechargeRecord.setRechargeSuccessTime(new Date());
                p2pAccountRechargeRecord.setRechargeTime(new Date());
                p2pAccountRechargeRecordService.save(p2pAccountRechargeRecord);    //保存充值记录
                serverStatus.setStatus("1");
                serverStatus.setMessage("保存充值记录成功");
                return JsonMapper.toJsonString(serverStatus);
            }
        } catch (Exception e) {
            serverStatus.setStatus("0");
            serverStatus.setMessage("保存充值记录失败");
            return JsonMapper.toJsonString(serverStatus);
        }
        serverStatus.setStatus("0");
        serverStatus.setMessage("保存充值记录失败");
        return JsonMapper.toJsonString(serverStatus);
    }

    /**
     * 保存充值记录
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("chargeRecordPage")
    public String chargeRecordPage(HttpSession session, Model model, P2pAccountRechargeRecord p2pAccountRechargeRecord) {
        try {
            User user = (User) session.getAttribute("user");
            //判断当前用户是否登录
            if (user == null || "".equals(user.getId())) {
                return "modules/front/user/userLogin";                                //返回登录页
            }
            return "modules/person/chargeRecordPage";
        } catch (Exception e) {
            return "modules/front/user/userLogin";
        }
    }


}