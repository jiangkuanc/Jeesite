package com.dagongsoft.p2p.user.web.front.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 计算器的控制类
 *
 * @author DAGONG
 */
@Controller
@RequestMapping(value = "${adminPath}/user/calculator")
public class CalculatorController {

    /**
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("calPage")
    public String toCalPage(HttpSession session, Model model) {
        return "modules/person/calPage";
    }
}
