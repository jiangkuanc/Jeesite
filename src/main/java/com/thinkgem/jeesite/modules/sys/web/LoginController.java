/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dagongsoft.p2p.utils.GetMacAddress;
import com.thinkgem.jeesite.common.web.Servlets;
import com.thinkgem.jeesite.modules.sys.entity.SysErrorLoginLog;
import com.thinkgem.jeesite.modules.sys.entity.SysLoginRecord;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SysConfigService;
import com.thinkgem.jeesite.modules.sys.service.SysErrorLoginLogService;
import com.thinkgem.jeesite.modules.sys.service.SysLoginRecordService;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.security.shiro.session.SessionDAO;
import com.thinkgem.jeesite.common.servlet.ValidateCodeServlet;
import com.thinkgem.jeesite.common.utils.CacheUtils;
import com.thinkgem.jeesite.common.utils.CookieUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.security.FormAuthenticationFilter;
import com.thinkgem.jeesite.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 登录Controller
 *
 * @author ThinkGem
 * @version 2013-5-31
 */
@Controller
public class LoginController extends BaseController {

    @Autowired
    private SessionDAO sessionDAO;
    @Autowired
    private SystemService systemService;
    @Resource
    private SysConfigService sysConfigService;
    @Resource
    private SysLoginRecordService sysLoginRecordService;
    @Resource
    private SysErrorLoginLogService sysErrorLoginLogService;


    /**
     * 管理登录
     */
    @RequestMapping(value = "${adminPath}/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
        Principal principal = UserUtils.getPrincipal();

        // 默认关闭页签模式
        String tabmode = CookieUtils.getCookie(request, "tabmode");
        if (tabmode == null) {
            CookieUtils.setCookie(response, "tabmode", "0");
        }

        if (logger.isDebugEnabled()) {
            logger.debug("login, active session size: {}", sessionDAO.getActiveSessions(false).size());
        }

        // 如果已登录，再次访问主页，则退出原账号。
        if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))) {
            CookieUtils.setCookie(response, "LOGINED", "false");
        }

        // 如果已经登录，则跳转到管理首页
        /*if(principal != null && !principal.isMobileLogin()){
            return "redirect:" + adminPath;
		}*/
//		String view;
//		view = "/WEB-INF/views/modules/sys/sysLogin.jsp";
//		view = "classpath:";
//		view += "jar:file:/D:/GitHub/jeesite/src/main/webapp/WEB-INF/lib/jeesite.jar!";
//		view += "/"+getClass().getName().replaceAll("\\.", "/").replace(getClass().getSimpleName(), "")+"view/sysLogin";
//		view += ".jsp";
        return "modules/sys/sysLogin_gen_clear";
//		return "modules/sys/sysLogin";
    }

    /**
     * 登录失败，真正登录的POST请求由Filter完成
     */
    @RequestMapping(value = "${adminPath}/login", method = RequestMethod.POST)
    public String loginFail(HttpServletRequest request, HttpServletResponse response, Model model) {
        Principal principal = UserUtils.getPrincipal();
        //String minutes = sysConfigService.getValueBySysIdAndKey( "dagongp2p", "account_freeze_minutes");
        //String maxCount = sysConfigService.getValueBySysIdAndKey("dagongp2p", "password_max_wrong_times");
        String minutes = Global.getConfig("account_freeze_minutes");
        String maxCount = Global.getConfig("password_max_wrong_times");

        int min = Integer.parseInt(minutes);
        int max = Integer.parseInt(maxCount);
        Date currentTime = new Date();
        User u = systemService.getUserByLoginName(request.getParameter("username"));
        if (u != null) {
            processErrorLogin(u, request.getParameter("password"));
            SysLoginRecord record = sysLoginRecordService.getRecordByUserId(u.getId());
            if (record.getFrozenState().equals("1")) {//已冻结
                if (record.getFrozenStartTime() != null) {
                    //超过了最晚不允许登录时间
                    if (currentTime.after(getNotPerTime(record.getFrozenStartTime(), min))) {
                        SysLoginRecord sysLoginRecord = new SysLoginRecord();
                        sysLoginRecord.setUser(u);
                        sysLoginRecordService.deleteRecored(sysLoginRecord);//清空记录
                    } else {
                        long endTime = getNotPerTime(record.getFrozenStartTime(), 30).getTime();
                        long minutesNew = (endTime - new Date().getTime()) / 60000;
                        //转换分钟数
                        model.addAttribute("loginMsg", "账户已冻结，请" + minutesNew + "分钟后重试！");
//						model.addAttribute("message", "账户已被冻结" + minutes + "分钟！");
                        return "modules/sys/sysLogin_gen_clear";
                    }
                }
            } else if (record.getFrozenState().equals("0")) {
                model.addAttribute("message", "密码错误，还有" + (max - record.getErrorPwdCount()) + "次机会！");
                return "modules/sys/sysLogin_gen_clear";
            }
        }

        // 如果已经登录，则跳转到管理首页
        if (principal != null) {
            return "redirect:" + adminPath;
        }

        String username = WebUtils.getCleanParam(request, FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
        boolean rememberMe = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM);
        boolean mobile = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
        String exception = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        String message = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM);

        if (StringUtils.isBlank(message) || StringUtils.equals(message, "null")) {
            message = "用户或密码错误, 请重试.";
        }

        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM, rememberMe);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_MOBILE_PARAM, mobile);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
        model.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);

        if (logger.isDebugEnabled()) {
            logger.debug("login fail, active session size: {}, message: {}, exception: {}",
                    sessionDAO.getActiveSessions(false).size(), message, exception);
        }

        // 非授权异常，登录失败，验证码加1。
        if (!UnauthorizedException.class.getName().equals(exception)) {
            model.addAttribute("isValidateCodeLogin", isValidateCodeLogin(username, true, false));
        }

        // 验证失败清空验证码
        request.getSession().setAttribute(ValidateCodeServlet.VALIDATE_CODE, IdGen.uuid());

        // 如果是手机登录，则返回JSON字符串
        if (mobile) {
            return renderString(response, model);
        }
        return "modules/sys/sysLogin_gen_clear";
//		return "modules/sys/sysLogin";
    }

    /**
     * 处理密码输错的的登录
     *
     * @param user     当前登录用户
     * @param password 错误的明文密码
     * @return
     */
    public void processErrorLogin(User user, String password) {
        try {
            //密码最大尝试次数
            //String max_wrong_times = sysConfigService.getValueBySysIdAndKey("dagongp2p", "password_max_wrong_times");
            String max_wrong_times = Global.getConfig("password_max_wrong_times");
            int maxTimes = Integer.valueOf(max_wrong_times);
            //通过用户编号获取用户登录记录
            SysLoginRecord sysLoginRecord = sysLoginRecordService.getRecordByUserId(user.getId());
            SysLoginRecord sysRecord = new SysLoginRecord();
            if (sysLoginRecord != null) {
                //账号冻结状态（1-已冻结；0-未冻结）
                if (sysLoginRecord.getErrorPwdCount() >= 0
                        && sysLoginRecord.getErrorPwdCount() < (maxTimes - 1)) {
                    sysRecord.setErrorPwdCount((sysLoginRecord.getErrorPwdCount() + 1));
                    sysRecord.setLastLoginTime(new Date());
                    sysRecord.setLastLoginIp(Servlets.getRequest().getRemoteAddr());
                    //更新用户登录记录
                    sysLoginRecordService.updateRecord(sysRecord);

                } else if (sysLoginRecord.getErrorPwdCount() == (maxTimes - 1)) {
                    sysRecord.setErrorPwdCount(0);//输错密码次数清零
                    sysRecord.setFrozenState("1");//冻结账户
                    sysRecord.setFrozenStartTime(new Date());
                    //更新用户冻结状态
                    sysLoginRecordService.updateFrozenState(sysRecord);
                }
            } else if (sysLoginRecord == null) {
                sysRecord.setId(IdGen.uuid());
                sysRecord.setUser(user);
                sysRecord.setErrorPwdCount(1);
                sysRecord.setLastLoginTime(new Date());
                sysRecord.setLastLoginIp(Servlets.getRequest().getRemoteAddr());
                sysRecord.setFrozenState("0");//初始是默认为未冻结
                //保存用户登录记录
                sysLoginRecordService.saveRecord(sysRecord);
            }
            //初始化错误登录日志并保存到错误日志表中
            SysErrorLoginLog sysErrorLoginLog = new SysErrorLoginLog();
            sysErrorLoginLog.setLoginName(user.getLoginName());// 登录名
            sysErrorLoginLog.setErrorPwd(password);// 输入的错误密码
            String ip = Servlets.getRequest().getRemoteAddr();
            sysErrorLoginLog.setLogIp(ip);// 记录登录ip地址
//			String pcMac = GetMacAddress.getMacAddress(ip);
//			sysErrorLoginLog.setPcMac(pcMac);// 登录错误的物理机
            sysErrorLoginLog.setLoginTime(new Date());// 登录错误的时间
            sysErrorLoginLog.setUserRole(2);// 1为前台用户2为后台用户
            sysErrorLoginLogService.save(sysErrorLoginLog);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 登录成功，进入管理首页
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "${adminPath}")
    public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
        Principal principal = UserUtils.getPrincipal();
        //String minutes = sysConfigService.getValueBySysIdAndKey( "dagongp2p", "account_freeze_minutes");
        //String maxCount = sysConfigService.getValueBySysIdAndKey("dagongp2p", "password_max_wrong_times");
        String minutes = Global.getConfig("account_freeze_minutes");
        String maxCount = Global.getConfig("password_max_wrong_times");
        int min = Integer.parseInt(minutes);
        int max = Integer.parseInt(maxCount);
        Date currentTime = new Date();
        User u = new User();
        u.setId(principal.getId());
        SysLoginRecord sysLoginRecord = sysLoginRecordService.getRecordByUserId(principal.getId());
        if (sysLoginRecord != null) {
            //账号冻结状态（1-已冻结；0-未冻结）
            if ("1".equals(sysLoginRecord.getFrozenState())
                    && currentTime.before(getNotPerTime(sysLoginRecord.getFrozenStartTime(), min))) {
                long endTime = getNotPerTime(sysLoginRecord.getFrozenStartTime(), 30).getTime();
                long minutesNew = (endTime - new Date().getTime()) / 60000;
                model.addAttribute("message", "账户已冻结，请" + minutesNew + "分钟后重试！");
//					model.addAttribute("message", "账户已冻结！");
                return "modules/sys/sysLogin_gen_clear";
            } else {
                SysLoginRecord slr2 = new SysLoginRecord();
                slr2.setUser(u);
                sysLoginRecordService.deleteRecored(slr2);//清空记录
            }
        }
        //用户最新修改密码时间
        //后台登录，添加一个开关配置参数，控制如果N天后没有更新密码，是否后台用户可以登录；
        //如果配置为0：不可登录，则前台提示：“您的密码已经过期，请联系管理员。”
        if (!"thinkgem".equals(principal.getLoginName())) {//管理员不做限制
//			//内网用户密码更新周期(天)
            Date passwordModifyDate = systemService.getUser(principal.getId()).getPasswordModifyDate();
            //String maxDays = sysConfigService.getValueBySysIdAndKey( "dagongp2p", "intranet_password_update_cycle");
            String maxDays = Global.getConfig("intranet_password_update_cycle");
            int overdueDays = Integer.parseInt(maxDays);
            //后台密码过期，是否可登录,'1：可以登录；0：不可以登录'
            //String isCanLogin = sysConfigService.getValueBySysIdAndKey("dagongp2p", "password_be_overdue_is_can_login");
            String isCanLogin = Global.getConfig("password_be_overdue_is_can_login");
            if (passwordModifyDate != null) {
                //如果N天后用户没有修改密码
                if (isPasswordOverdue(passwordModifyDate, overdueDays)) {
                    if (!isCanLogin.equals("1")) {//'1：可以登录；0：不可以登录'
                        model.addAttribute("message", "您的密码已经过期，请联系管理员。");
                        return "modules/sys/sysLogin_gen_clear";
                    } else {
                        model.addAttribute("overdueFlag", true);
                        //后台登录后，密码过期，弹出窗口进行提醒“您的平台密码已经超过N天未修改，请及时修改密码！
                        model.addAttribute("overdueMsg", "您的平台密码已经超过" + overdueDays + "天未修改，请及时修改密码");
                    }
                }
            }
        }

        // 登录成功后，验证码计算器清零
        isValidateCodeLogin(principal.getLoginName(), false, true);

        if (logger.isDebugEnabled()) {
            logger.debug("show index, active session size: {}", sessionDAO.getActiveSessions(false).size());
        }

        // 如果已登录，再次访问主页，则退出原账号。
        if (Global.TRUE.equals(Global.getConfig("notAllowRefreshIndex"))) {
            String logined = CookieUtils.getCookie(request, "LOGINED");
            if (StringUtils.isBlank(logined) || "false".equals(logined)) {
                CookieUtils.setCookie(response, "LOGINED", "true");
            } else if (StringUtils.equals(logined, "true")) {
                UserUtils.getSubject().logout();
                return "redirect:" + adminPath + "/login";
            }
        }

        // 如果是手机登录，则返回JSON字符串
        if (principal.isMobileLogin()) {
            if (request.getParameter("login") != null) {
                return renderString(response, principal);
            }
            if (request.getParameter("index") != null) {
                return "modules/sys/sysIndex";
            }
            return "redirect:" + adminPath + "/login";
        }

//		// 登录成功后，获取上次登录的当前站点ID
//		UserUtils.putCache("siteId", StringUtils.toLong(CookieUtils.getCookie(request, "siteId")));

//		System.out.println("==========================a");
//		try {
//			byte[] bytes = com.thinkgem.jeesite.common.utils.FileUtils.readFileToByteArray(
//					com.thinkgem.jeesite.common.utils.FileUtils.getFile("c:\\sxt.dmp"));
//			UserUtils.getSession().setAttribute("kkk", bytes);
//			UserUtils.getSession().setAttribute("kkk2", bytes);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
////		for (int i=0; i<1000000; i++){
////			//UserUtils.getSession().setAttribute("a", "a");
////			request.getSession().setAttribute("aaa", "aa");
////		}
//		System.out.println("==========================b");

        return "modules/sys/sysIndex";
    }

    /**
     * 获取主题方案
     */
    @RequestMapping(value = "/theme/{theme}")
    public String getThemeInCookie(@PathVariable String theme, HttpServletRequest request, HttpServletResponse response) {
        if (StringUtils.isNotBlank(theme)) {
            CookieUtils.setCookie(response, "theme", theme);
        } else {
            theme = CookieUtils.getCookie(request, "theme");
        }
        return "redirect:" + request.getParameter("url");
    }

    /**
     * 是否是验证码登录
     *
     * @param useruame 用户名
     * @param isFail   计数加1
     * @param clean    计数清零
     * @return
     */
    @SuppressWarnings("unchecked")
    public static boolean isValidateCodeLogin(String useruame, boolean isFail, boolean clean) {
        Map<String, Integer> loginFailMap = (Map<String, Integer>) CacheUtils.get("loginFailMap");
        if (loginFailMap == null) {
            loginFailMap = Maps.newHashMap();
            CacheUtils.put("loginFailMap", loginFailMap);
        }
        Integer loginFailNum = loginFailMap.get(useruame);
        if (loginFailNum == null) {
            loginFailNum = 0;
        }
        if (isFail) {
            loginFailNum++;
            loginFailMap.put(useruame, loginFailNum);
        }
        if (clean) {
            loginFailMap.remove(useruame);
        }
        return loginFailNum >= 3;
    }

    /**
     * 最晚不允许登录时间
     *
     * @param date
     * @return
     */
    public Date getNotPerTime(Date date, int minutes) {
        Calendar cl = Calendar.getInstance();
        cl.setTime(date);
        cl.add(Calendar.MINUTE, minutes);
        return cl.getTime();
    }

    /**
     * 判读密码是否过期(true-过期，false-没过期)
     *
     * @param date        最近一次修改密码的时间
     * @param overdueDays 内网用户密码更新周期(天)
     * @return
     */
    public boolean isPasswordOverdue(Date date, int overdueDays) {
        Calendar cl = Calendar.getInstance();
        cl.setTime(date);
        cl.add(Calendar.DATE, overdueDays);
        if (new Date().after(cl.getTime())) {
            return true;
        } else {
            return false;
        }
    }

}
