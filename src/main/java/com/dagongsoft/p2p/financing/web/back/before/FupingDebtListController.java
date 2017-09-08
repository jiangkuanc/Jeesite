/**
 *
 */
package com.dagongsoft.p2p.financing.web.back.before;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.FinancingService;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 复评债项列表Controller
 *
 * @author Zeus
 * @2016-11-10
 */
@Controller
@RequestMapping(value = "${adminPath}/before/fuping")
public class FupingDebtListController {

    @Resource
    private FinancingService financingService;

    //复评债项列表
    @RequestMapping(value = "fupingDebtList")
    public String fupingDebtList(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pFinancingInformation> page = financingService.fupingDebtList(new Page<P2pFinancingInformation>(request, response), p2pFinancingInformation);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "/p2p/back/financing/before/p2pFupingDebtList";
    }


}
