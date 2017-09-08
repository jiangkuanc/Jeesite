package com.dagongsoft.p2p.creditreport.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import com.dagongsoft.p2p.creditreport.entity.P2pCreditReportBuy;
import com.dagongsoft.p2p.creditreport.service.P2pCreditReportBuyService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 信用信息购买表Controller
 *
 * @author wangbignqi
 * @version 2016-11-07
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/creditreport/p2pCreditReportBuy")
public class P2pCreditReportBuyController extends BaseController {

    @Resource
    private P2pCreditReportBuyService p2pCreditReportBuyService;

    @ModelAttribute
    public P2pCreditReportBuy get(@RequestParam(required = false) String id) {
        P2pCreditReportBuy entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pCreditReportBuyService.get(id);
        }
        if (entity == null) {
            entity = new P2pCreditReportBuy();
        }
        return entity;
    }


    @RequestMapping(value = {"list", ""})
    public String list(P2pCreditReportBuy p2pCreditReportBuy, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pCreditReportBuy> page = p2pCreditReportBuyService.findPage(new Page<P2pCreditReportBuy>(request, response), p2pCreditReportBuy);
        model.addAttribute("page", page);
        return "modules/p2p/creditreport/p2pCreditReportBuyList";
    }


    @RequestMapping(value = "form")
    public String form(P2pCreditReportBuy p2pCreditReportBuy, Model model) {
        model.addAttribute("p2pCreditReportBuy", p2pCreditReportBuy);
        return "modules/p2p/creditreport/p2pCreditReportBuyForm";
    }

    @RequestMapping(value = "save")
    public String save(P2pCreditReportBuy p2pCreditReportBuy, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pCreditReportBuy)) {
            return form(p2pCreditReportBuy, model);
        }
        p2pCreditReportBuyService.save(p2pCreditReportBuy);
        addMessage(redirectAttributes, "保存信用信息购买表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/creditreport/p2pCreditReportBuy/?repage";
    }


    @RequestMapping(value = "delete")
    public String delete(P2pCreditReportBuy p2pCreditReportBuy, RedirectAttributes redirectAttributes) {
        p2pCreditReportBuyService.delete(p2pCreditReportBuy);
        addMessage(redirectAttributes, "删除信用信息购买表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/creditreport/p2pCreditReportBuy/?repage";
    }

    @RequestMapping(value = "add")
    public void add(String id, String number, HttpSession session, HttpServletRequest request, HttpServletResponse response
            , Model model) {
        //信用报告购买
        P2pCreditReportBuy p2pCreditReportBuy = new P2pCreditReportBuy();
        User user = (User) session.getAttribute("user");
        if (user != null && !"".equals(user.getId())) {
            p2pCreditReportBuy.setUser(user);
        }
        p2pCreditReportBuy.setId(UUID.randomUUID().toString());//主键
        p2pCreditReportBuy.setBuyTime(new Date());//购买时间
        p2pCreditReportBuy.setCreditReportId(id);//征信报告编号
        p2pCreditReportBuy.setCreditInfoType(number);//信用信息类型
        p2pCreditReportBuy.setCost(new BigDecimal(5));//费用5元
        p2pCreditReportBuy.setIsNewRecord(true);
        p2pCreditReportBuyService.save(p2pCreditReportBuy);
        String abc = "{\"success\":true}";
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
            writer.print(abc);
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            writer.close();
        }

    }

    @RequestMapping(value = "purchase")
    public void buyList(@RequestParam(value = "pageNo", required = false) String pageNo,
                        P2pCreditReportBuy p2pCreditReportBuy, HttpServletRequest request, HttpSession session,
                        HttpServletResponse response, Model model) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if (user != null && !"".equals(user.getId())) {
            p2pCreditReportBuy.setUser(user);
        }

        int pageSize = 10;//默认每页显示10条数据
        int pageIndex = 1;//默认显示第一页的数据
        if (pageNo != null && !"".equals(pageNo)) {
            pageIndex = Integer.parseInt(pageNo);
        }
        paramMap.put("start", pageSize * (pageIndex - 1));
        List<P2pCreditReportBuy> list = p2pCreditReportBuyService.findList(p2pCreditReportBuy);
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

}