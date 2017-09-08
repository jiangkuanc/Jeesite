package com.dagongsoft.p2p.config.web;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.config.dao.P2pHolidayRecordDao;
import com.dagongsoft.p2p.config.entity.P2pHolidayRecord;
import com.dagongsoft.p2p.config.service.P2pHolidayRecordService;
import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 假期管理Controller
 *
 * @author Quincy
 * @version 2017-02-08
 */
@Controller
@RequestMapping(value = "${adminPath}/config/p2pHolidayRecord")
public class P2pHolidayRecordController extends BaseController {

    @Resource
    private P2pHolidayRecordService p2pHolidayRecordService;

    @ModelAttribute
    public P2pHolidayRecord get(@RequestParam(required = false) String id) {
        P2pHolidayRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pHolidayRecordService.get(id);
        }
        if (entity == null) {
            entity = new P2pHolidayRecord();
        }
        return entity;
    }

    @RequestMapping(value = {"list", ""})
    public String list(P2pHolidayRecord p2pHolidayRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        List<P2pHolidayRecord> list = p2pHolidayRecordService.getHoildays(p2pHolidayRecord);
        List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
        for (int z = 1; z < 13; z++) {
            Map<String, Object> map = new HashMap<String, Object>();
            String days = "";
            for (P2pHolidayRecord p : list) {
                if (String.valueOf(z).equals(p.getMonth())) {

                    map.put("operateTime", p.getOperateTime());
                    map.put("operationPerson", p.getOperationPerson());
                    days += p.getGetDay() + "日、";
                }
            }
            map.put("getYear", p2pHolidayRecord.getGetYear());
            String month = z + "月";
            map.put("month", month);
            if (days.length() > 0) {
                days = days.substring(0, days.length() - 1);
            }
            map.put("getDay", days);
            list2.add(map);
        }
        model.addAttribute("list", list2);
        return "/modules/p2p/config/p2pHolidayRecordList";
    }

    @RequestMapping(value = "form")
    public String form(P2pHolidayRecord p2pHolidayRecord, Model model) {
//		model.addAttribute("p2pHolidayRecord", p2pHolidayRecord);
        return "/modules/p2p/config/p2pHolidayRecordForm";
    }

    @RequestMapping(value = "save")
    public String save(P2pHolidayRecord p2pHolidayRecord, Model model, RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        if (!beanValidator(model, p2pHolidayRecord)) {
            return form(p2pHolidayRecord, model);
        }
        User user = UserUtils.getUser();
        p2pHolidayRecord.setOperationPerson(user.getName());
        p2pHolidayRecord.setOperateTime(new Date());
        p2pHolidayRecordService.save(p2pHolidayRecord);
        addMessage(redirectAttributes, "生成法定节假日成功");
        List<P2pHolidayRecord> list = p2pHolidayRecordService.getHoildays(p2pHolidayRecord);
        if (list == null || list.size() == 0) {
            model.addAttribute("error", "error");  //说明没有生成节假日，国务院还未公布
        }
        return list(p2pHolidayRecord, request, response, model);
//		return "redirect:" + Global.getAdminPath() + "/config/p2pHolidayRecord/?repage";
    }

    @RequestMapping(value = "delete")
    public String delete(P2pHolidayRecord p2pHolidayRecord, RedirectAttributes redirectAttributes) {
        p2pHolidayRecordService.delete(p2pHolidayRecord);
        addMessage(redirectAttributes, "删除假期管理成功");
        return "redirect:" + Global.getAdminPath() + "/config/p2pHolidayRecord/?repage";
    }


}