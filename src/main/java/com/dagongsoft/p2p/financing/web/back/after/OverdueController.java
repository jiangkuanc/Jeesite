/**
 *
 */
package com.dagongsoft.p2p.financing.web.back.after;

import java.text.ParseException;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.financing.entity.P2pDebtOverdueRecord;
import com.dagongsoft.p2p.financing.entity.P2pDebtorOverdueRecord;
import com.dagongsoft.p2p.financing.service.OverduesService;
import com.dagongsoft.p2p.financing.service.back.after.OverdueService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 逾期管理Controller
 *
 * @author Zeus
 * @2016-11-11
 */
@Controller
@RequestMapping(value = "${adminPath}/after/overdue")
public class OverdueController extends BaseController {

    @Resource
    private OverdueService overdueService;
    @Resource
    private OverduesService overduesService;

    @RequestMapping(value = "debtOverdueList")
    public String debtOverdueList(P2pDebtOverdueRecord p2pDebtOverdueRecord, HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<P2pDebtOverdueRecord> page = overdueService.getDebtOverduePage(new Page<P2pDebtOverdueRecord>(request, response), p2pDebtOverdueRecord);
        model.addAttribute("page", page);
        return "/p2p/back/financing/after/p2pDebtOverdueList";
    }

    @RequestMapping(value = "debtorOverdueList")
    public String debtorOverdueList(P2pDebtorOverdueRecord p2pDebtorOverdueRecord, HttpServletRequest request, HttpServletResponse response, Model model) {

        Page<P2pDebtorOverdueRecord> page = overdueService.getDebtorOverduePage(new Page<P2pDebtorOverdueRecord>(request, response), p2pDebtorOverdueRecord);
        model.addAttribute("page", page);
        return "/p2p/back/financing/after/p2pDebtorOverdueList";
    }

    /**
     * 手动逾期统计
     *
     * @return
     */
    @RequestMapping(value = "overdue")
    public String overdue(Date currentDate, Model model, RedirectAttributes redirectAttributes) {
        if (currentDate != null) {
            overduesService.handOverdueStatistics(currentDate);
            addMessage(redirectAttributes, "手动逾期统计成功");
        } else {
            addMessage(redirectAttributes, "手动逾期统计失败，请选择日期");
        }
        return "redirect:" + Global.getAdminPath() + "/after/overdue/debtOverdueList?repage";
    }
}
