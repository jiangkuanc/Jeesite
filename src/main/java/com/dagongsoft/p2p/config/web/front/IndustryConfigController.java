package com.dagongsoft.p2p.config.web.front;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.dagongsoft.p2p.config.service.front.IndustryConfigService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.web.BaseController;

@Controller
@RequestMapping(value = "${adminPath}/Industry")
public class IndustryConfigController extends BaseController {

    @Autowired
    private IndustryConfigService industryConfigService;

    /**
     * 加载二级行业分类
     *
     * @param industryNum
     * @return
     */
    @RequestMapping(value = "findSecondCategory")
    @ResponseBody
    public List<P2pIndustryclassi> findSecondCategory(@RequestParam String industryNum) {
        return industryConfigService.findSecondCategory(industryNum);
    }

    /**
     * 加载行业树
     */

    @ResponseBody
    @RequestMapping(value = "industryTreeData")
    public List<Map<String, Object>> industryTreeData(@RequestParam(required = false) String type, P2pIndustryclassi p2pIndustryclassi, HttpServletResponse response) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<P2pIndustryclassi> list = industryConfigService.findList(p2pIndustryclassi);
        for (int i = 0; i < list.size(); i++) {
            P2pIndustryclassi e = list.get(i);
            Map<String, Object> map = Maps.newHashMap();
            map.put("id", e.getIndustrynum());
            map.put("pId", e.getParentnum());
            map.put("name", e.getClassinameCn());
            if (type != null && "3".equals(type)) {
                map.put("isParent", true);
            }
            mapList.add(map);
        }
        return mapList;
    }
}
