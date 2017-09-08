package com.dagongsoft.p2p.operation.web;

import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.operation.entity.P2pPlatformOperationDataStatistics;
import com.dagongsoft.p2p.operation.service.P2pPlatformOperationDataStatisticsService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 平台数据统计Controller
 *
 * @author Sora
 * @version 2016-11-22
 */
@Controller
@RequestMapping(value = "${adminPath}/operation/p2pPlatformOperationDataStatistics")
public class P2pPlatformOperationDataStatisticsController extends BaseController {

    @Resource
    private P2pPlatformOperationDataStatisticsService p2pPlatformOperationDataStatisticsService;

    @ModelAttribute
    public P2pPlatformOperationDataStatistics get(@RequestParam(required = false) String id) {
        P2pPlatformOperationDataStatistics entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pPlatformOperationDataStatisticsService.get(id);
        }
        if (entity == null) {
            entity = new P2pPlatformOperationDataStatistics();
        }
        return entity;
    }

    //平台运营统计
    //@RequiresPermissions("operation:p2pPlatformOperationDataStatistics:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pPlatformOperationDataStatistics> page = p2pPlatformOperationDataStatisticsService.findPage(new Page<P2pPlatformOperationDataStatistics>(request, response), p2pPlatformOperationDataStatistics);
        model.addAttribute("page", page);
        return "p2p/back/operation/p2pPlatformOperationDataStatisticsList";
    }

    @RequiresPermissions("operation:p2pPlatformOperationDataStatistics:view")
    @RequestMapping(value = "form")
    public String form(P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics, Model model) {
        model.addAttribute("p2pPlatformOperationDataStatistics", p2pPlatformOperationDataStatistics);
        return "modules/operation/p2pPlatformOperationDataStatisticsForm";
    }

    @RequiresPermissions("operation:p2pPlatformOperationDataStatistics:edit")
    @RequestMapping(value = "save")
    public String save(P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pPlatformOperationDataStatistics)) {
            return form(p2pPlatformOperationDataStatistics, model);
        }
        p2pPlatformOperationDataStatisticsService.save(p2pPlatformOperationDataStatistics);
        addMessage(redirectAttributes, "保存平台数据统计成功");
        return "redirect:" + Global.getAdminPath() + "/operation/p2pPlatformOperationDataStatistics/?repage";
    }

    @RequiresPermissions("operation:p2pPlatformOperationDataStatistics:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics, RedirectAttributes redirectAttributes) {
        p2pPlatformOperationDataStatisticsService.delete(p2pPlatformOperationDataStatistics);
        addMessage(redirectAttributes, "删除平台数据统计成功");
        return "redirect:" + Global.getAdminPath() + "/operation/p2pPlatformOperationDataStatistics/?repage";
    }

    //平台运营分析
    @RequestMapping(value = "dataAnalysis")
    public String dataAnalysis(P2pPlatformOperationDataStatistics p2pPlatformOperationDataStatistics, Model model) {
        try {
            if (p2pPlatformOperationDataStatistics.getEndTime() != null) {
                Date endTime = p2pPlatformOperationDataStatistics.getEndTime();
                Calendar cal = Calendar.getInstance();
                cal.setTime(p2pPlatformOperationDataStatistics.getEndTime());
                cal.add(Calendar.DATE, 1);
                p2pPlatformOperationDataStatistics.setEndTime(cal.getTime());
                model.addAttribute("endTime", endTime);
            }
            String[][] echarts = p2pPlatformOperationDataStatisticsService.getEcharts(p2pPlatformOperationDataStatistics);
            /*	PrintWriter pw=null;
            try {
				String jsonString = JSONArray.toJSONString(echarts);
				pw=response.getWriter();
				pw.write(jsonString);
				pw.flush();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				pw.close();
			}*/
            model.addAttribute("echarts", echarts);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/operation/p2pPlatformOperationDataAnalysis";
    }

}