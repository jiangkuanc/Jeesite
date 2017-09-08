package com.dagongsoft.p2p.user.web.front.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.user.dao.P2pAccountDao;
import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.dagongsoft.p2p.user.entity.P2pAccountWithdrawRecord;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.front.P2pAccountWithdrawRecordService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 提现记录Controller
 *
 * @author Chace
 * @version 2016-11-21
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/user/p2pAccountWithdrawRecord")
public class P2pAccountWithdrawRecordController extends BaseController {

    @Autowired
    private P2pAccountDao p2pAccountDao;

    @Autowired
    private P2pAccountWithdrawRecordService p2pAccountWithdrawRecordService;

    @Autowired
    private P2pRegUserCertifyService p2pRegUserCertifyService;

    @ModelAttribute
    public P2pAccountWithdrawRecord get(@RequestParam(required = false) String id) {
        P2pAccountWithdrawRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pAccountWithdrawRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pAccountWithdrawRecord();
        }
        return entity;
    }

    @RequiresPermissions("p2p:user:p2pAccountWithdrawRecord:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pAccountWithdrawRecord p2pAccountWithdrawRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pAccountWithdrawRecord> page = p2pAccountWithdrawRecordService.findPage(new Page<P2pAccountWithdrawRecord>(request, response), p2pAccountWithdrawRecord);
        model.addAttribute("page", page);
        return "modules/p2p/user/p2pAccountWithdrawRecordList";
    }

    @RequiresPermissions("p2p:user:p2pAccountWithdrawRecord:view")
    @RequestMapping(value = "form")
    public String form(P2pAccountWithdrawRecord p2pAccountWithdrawRecord, Model model) {
        model.addAttribute("p2pAccountWithdrawRecord", p2pAccountWithdrawRecord);
        return "modules/p2p/user/p2pAccountWithdrawRecordForm";
    }

    @RequestMapping(value = "save")
    public String save(P2pAccountWithdrawRecord p2pAccountWithdrawRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pAccountWithdrawRecord)) {
            return form(p2pAccountWithdrawRecord, model);
        }
        p2pAccountWithdrawRecordService.save(p2pAccountWithdrawRecord);
        addMessage(redirectAttributes, "保存提现记录成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/user/p2pAccountWithdrawRecord/?repage";
    }

    @RequiresPermissions("p2p:user:p2pAccountWithdrawRecord:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pAccountWithdrawRecord p2pAccountWithdrawRecord, RedirectAttributes redirectAttributes) {
        p2pAccountWithdrawRecordService.delete(p2pAccountWithdrawRecord);
        addMessage(redirectAttributes, "删除提现记录成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/user/p2pAccountWithdrawRecord/?repage";
    }

    /**
     * 加载提现记录列表（个人）
     *
     * @param user
     * @param mode
     * @author Chace
     */
    @RequestMapping("loadWithdrawRecord")
    public String loadWithdrawRecord(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        try {
            P2pAccountWithdrawRecord p2pAccountWithdrawRecord = new P2pAccountWithdrawRecord();
            p2pAccountWithdrawRecord.setUserId(user.getId());
            List<P2pAccountWithdrawRecord> list = p2pAccountWithdrawRecordService.getByUserId(p2pAccountWithdrawRecord);
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/front/user/withdrawRecord";
    }

    /**
     * 加载提现记录列表（融资）
     *
     * @param user
     * @param mode
     * @author Chace
     */
    @RequestMapping("loadWithdrawRecord2")
    public String loadWithdrawRecord2(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        try {
            P2pAccountWithdrawRecord p2pAccountWithdrawRecord = new P2pAccountWithdrawRecord();
            p2pAccountWithdrawRecord.setUserId(user.getId());
            List<P2pAccountWithdrawRecord> list = p2pAccountWithdrawRecordService.getByUserId(p2pAccountWithdrawRecord);
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/front/user/withdrawRecord2";
    }

    /**
     * 提现记录页面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("withDrawRecordPage")
    public String withDrawRecordPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        P2pAccount p2pAccount;
        P2pRegUserCertify p2pRegUserCertify;
        try {
            p2pAccount = p2pAccountDao.getAccountByUserId(user.getId());
            p2pRegUserCertify = p2pRegUserCertifyService.getByUserId(user.getId());
        } catch (Exception e) {
            p2pAccount = null;
            p2pRegUserCertify = null;
        }

        if (p2pRegUserCertify != null && p2pAccount != null) {
            String realName = p2pRegUserCertify.getRealName();
            model.addAttribute("p2pAccount", p2pAccount);
            String smsPhone = user.getMobile();
            session.setAttribute("smsPhone", smsPhone);    //验证手机号
            session.setAttribute("realName", realName);        //收款人姓名
        }

        return "modules/person/withdrawPage";    //提现页面
    }

    /**
     * 提现操作
     */
    @ResponseBody
    @RequestMapping("withDrawAmount")
    public String withDrawAmount(HttpSession session, Model model, P2pAccountWithdrawRecord p2pAccountWithdrawRecord) {
        String status = "0";
        User user = (User) session.getAttribute("user");
        p2pAccountWithdrawRecord.setUserId(user.getId());//设置userId
        try {
            P2pAccount p2pAccount = p2pAccountDao.getAccountByUserId(user.getId());
            p2pAccountWithdrawRecord.setP2pAccount(p2pAccount);//设置相互关联的P2pAccount表
            p2pAccountWithdrawRecord.setUser(user);
            p2pAccountWithdrawRecord.setWithdrawTime(new Date());
            p2pAccountWithdrawRecord.setWithdrawState("1");
            p2pAccountWithdrawRecord.setWithdrawSuccessTime(new Date());
            p2pAccountWithdrawRecord.setWithdrawFee(0.00);
            p2pAccountWithdrawRecordService.save(p2pAccountWithdrawRecord);
            status = "1";
        } catch (Exception e) {
            e.printStackTrace();
            status = "0";
        }
        return JsonMapper.toJsonString(status);

    }

}