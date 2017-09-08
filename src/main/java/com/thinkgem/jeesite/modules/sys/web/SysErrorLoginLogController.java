/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.SysErrorLoginLog;
import com.thinkgem.jeesite.modules.sys.service.SysErrorLoginLogService;

/**
 * 错误日志Controller
 *
 * @author 王柄崎
 * @version 2017-5-9
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/erroLog")
public class SysErrorLoginLogController extends BaseController {

    @Autowired
    private SysErrorLoginLogService sysErrorLoginLogService;


    @RequestMapping(value = {"list", ""})
    public String list(SysErrorLoginLog sysErrorLoginLog, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<SysErrorLoginLog> page = sysErrorLoginLogService.findPage(new Page<SysErrorLoginLog>(request, response), sysErrorLoginLog);
        model.addAttribute("page", page);
        return "modules/sys/sysErrorLoginLogList";
    }

}
