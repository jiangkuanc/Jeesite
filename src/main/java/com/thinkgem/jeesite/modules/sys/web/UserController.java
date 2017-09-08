/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolationException;

import com.dagongsoft.p2p.utils.*;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSONObject;
import com.dagongsoft.p2p.config.entity.P2pAgreement;
import com.dagongsoft.p2p.config.service.P2pAgreementService;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.msg.entity.MsgSmsRecord;
import com.dagongsoft.p2p.msg.service.MsgSmsRecordService;
import com.dagongsoft.p2p.msg.web.SmsPhoneCodeConst;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.listener.SingleSignOnListener;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.tbar.back.investandfinancing.service.InvestmentService;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.web.Servlets;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.SysErrorLoginLog;
import com.thinkgem.jeesite.modules.sys.entity.SysLoginRecord;
import com.thinkgem.jeesite.modules.sys.entity.SysModifyPwdRecord;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.interceptor.Token;
import com.thinkgem.jeesite.modules.sys.service.SysConfigService;
import com.thinkgem.jeesite.modules.sys.service.SysErrorLoginLogService;
import com.thinkgem.jeesite.modules.sys.service.SysLoginRecordService;
import com.thinkgem.jeesite.modules.sys.service.SysModifyPwdRecordService;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.service.UserService;
import com.thinkgem.jeesite.modules.sys.utils.CheckEmail;
import com.thinkgem.jeesite.modules.sys.utils.Coder;
import com.thinkgem.jeesite.modules.sys.utils.DESCoder;
import com.thinkgem.jeesite.modules.sys.utils.LogUtils;
import com.thinkgem.jeesite.modules.sys.utils.RSACoder;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 用户Controller
 *
 * @author ThinkGem
 * @version 2013-8-29
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/user")
public class UserController extends BaseController {

    @Autowired
    private SystemService systemService;
    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Autowired
    private P2pRegUserCertifyService p2pRegUserCertifyService;
    @Autowired
    private P2pAgreementService p2pAgreementService;
    @Autowired
    private MsgSmsRecordService msgSmsRecordService;
    @Resource
    private InvestmentService investmentService;
    @Resource
    private SysConfigService sysConfigService;
    @Resource
    private SysModifyPwdRecordService sysModifyPwdRecordService;
    @Resource
    private SysLoginRecordService sysLoginRecordService;
    @Resource
    private SysErrorLoginLogService sysErrorLoginLogService;

    @ModelAttribute
    public User get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return systemService.getUser(id);
        } else {
            return new User();
        }
    }

    @RequiresPermissions("sys:user:view")
    @RequestMapping(value = {"index"})
    public String index(User user, Model model) {
        return "modules/sys/userIndex";
    }

    @RequiresPermissions("sys:user:view")
    @RequestMapping(value = {"list", ""})
    public String list(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        User u = UserUtils.getUser();
        Page<User> page = systemService.findUser(new Page<User>(request, response), user);
        model.addAttribute("page", page);
        model.addAttribute("u", u);
        return "modules/sys/userList";
    }

    @ResponseBody
    @RequiresPermissions("sys:user:view")
    @RequestMapping(value = {"listData"})
    public Page<User> listData(User user, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<User> page = systemService.findUser(new Page<User>(request, response), user);
        return page;
    }

    @RequiresPermissions("sys:user:view")
    @RequestMapping(value = "form")
    public String form(User user, Model model) {
        if (user.getCompany() == null || user.getCompany().getId() == null) {
            user.setCompany(UserUtils.getUser().getCompany());
        }
        if (user.getOffice() == null || user.getOffice().getId() == null) {
            user.setOffice(UserUtils.getUser().getOffice());
        }
        model.addAttribute("user", user);
        model.addAttribute("allRoles", systemService.findAllRole());
        return "modules/sys/userForm";
    }

    @RequiresPermissions("sys:user:edit")
    @RequestMapping(value = "save")
    public String save(User user, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        if (Global.isDemoMode()) {
            addMessage(redirectAttributes, "演示模式，不允许操作！");
            return "redirect:" + adminPath + "/sys/user/list?repage";
        }
        // 修正引用赋值问题，不知道为何，Company和Office引用的一个实例地址，修改了一个，另外一个跟着修改。
        user.setCompany(new Office(request.getParameter("company.id")));
        user.setOffice(new Office(request.getParameter("office.id")));
        // 如果新密码为空，则不更换密码
        if (StringUtils.isNotBlank(user.getNewPassword())) {
            user.setPassword(SystemService.entryptPassword(user.getNewPassword()));
        }
        if (!beanValidator(model, user)) {
            return form(user, model);
        }
        if (!"true".equals(checkLoginName(user.getOldLoginName(), user.getLoginName()))) {
            addMessage(model, "保存用户'" + user.getLoginName() + "'失败，登录名已存在");
            return form(user, model);
        }
        // 角色数据有效性验证，过滤不在授权内的角色
        List<Role> roleList = Lists.newArrayList();
        List<String> roleIdList = user.getRoleIdList();
        for (Role r : systemService.findAllRole()) {
            if (roleIdList.contains(r.getId())) {
                roleList.add(r);
            }
        }
        user.setRoleList(roleList);
        // 保存用户信息
        systemService.saveUser(user);
        //后台用户添加或修改密码，把记录存入到修改密码记录表中
        sysModifyPwdRecordService.saveModifyPwd(user, SystemService.entryptPassword(user.getPassword()));
        // 清除当前用户缓存
        if (user.getLoginName().equals(UserUtils.getUser().getLoginName())) {
            UserUtils.clearCache();
            //UserUtils.getCacheMap().clear();
        }
        addMessage(redirectAttributes, "保存用户'" + user.getLoginName() + "'成功");
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }

    @RequiresPermissions("sys:user:edit")
    @RequestMapping(value = "delete")
    public String delete(User user, RedirectAttributes redirectAttributes) {
        if (Global.isDemoMode()) {
            addMessage(redirectAttributes, "演示模式，不允许操作！");
            return "redirect:" + adminPath + "/sys/user/list?repage";
        }
        if (UserUtils.getUser().getId().equals(user.getId())) {
            addMessage(redirectAttributes, "删除用户失败, 不允许删除当前用户");
        } else if (User.isAdmin(user.getId())) {
            addMessage(redirectAttributes, "删除用户失败, 不允许删除超级管理员用户");
        } else {
            systemService.deleteUser(user);
            addMessage(redirectAttributes, "删除用户成功");
        }
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }

    /**
     * 导出用户数据
     *
     * @param user
     * @param request
     * @param response
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:user:view")
    @RequestMapping(value = "export", method = RequestMethod.POST)
    public String exportFile(User user, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
        try {
            String fileName = "用户数据" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";
            Page<User> page = systemService.findUser(new Page<User>(request, response, -1), user);
            new ExportExcel("用户数据", User.class).setDataList(page.getList()).write(response, fileName).dispose();
            return null;
        } catch (Exception e) {
            addMessage(redirectAttributes, "导出用户失败！失败信息：" + e.getMessage());
        }
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }

    /**
     * 导入用户数据
     *
     * @param file
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:user:edit")
    @RequestMapping(value = "import", method = RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
        if (Global.isDemoMode()) {
            addMessage(redirectAttributes, "演示模式，不允许操作！");
            return "redirect:" + adminPath + "/sys/user/list?repage";
        }
        try {
            int successNum = 0;
            int failureNum = 0;
            StringBuilder failureMsg = new StringBuilder();
            ImportExcel ei = new ImportExcel(file, 1, 0);
            List<User> list = ei.getDataList(User.class);
            for (User user : list) {
                try {
                    if ("true".equals(checkLoginName("", user.getLoginName()))) {
                        user.setPassword(SystemService.entryptPassword("123456"));
                        BeanValidators.validateWithException(validator, user);
                        systemService.saveUser(user);
                        successNum++;
                    } else {
                        failureMsg.append("<br/>登录名 " + user.getLoginName() + " 已存在; ");
                        failureNum++;
                    }
                } catch (ConstraintViolationException ex) {
                    failureMsg.append("<br/>登录名 " + user.getLoginName() + " 导入失败：");
                    List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
                    for (String message : messageList) {
                        failureMsg.append(message + "; ");
                        failureNum++;
                    }
                } catch (Exception ex) {
                    failureMsg.append("<br/>登录名 " + user.getLoginName() + " 导入失败：" + ex.getMessage());
                }
            }
            if (failureNum > 0) {
                failureMsg.insert(0, "，失败 " + failureNum + " 条用户，导入信息如下：");
            }
            addMessage(redirectAttributes, "已成功导入 " + successNum + " 条用户" + failureMsg);
        } catch (Exception e) {
            addMessage(redirectAttributes, "导入用户失败！失败信息：" + e.getMessage());
        }
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }

    /**
     * 下载导入用户数据模板
     *
     * @param response
     * @param redirectAttributes
     * @return
     */
    @RequiresPermissions("sys:user:view")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
        try {
            String fileName = "用户数据导入模板.xlsx";
            List<User> list = Lists.newArrayList();
            list.add(UserUtils.getUser());
            new ExportExcel("用户数据", User.class, 2).setDataList(list).write(response, fileName).dispose();
            return null;
        } catch (Exception e) {
            addMessage(redirectAttributes, "导入模板下载失败！失败信息：" + e.getMessage());
        }
        return "redirect:" + adminPath + "/sys/user/list?repage";
    }

    /**
     * 验证登录名是否有效
     *
     * @param oldLoginName
     * @param loginName
     * @return
     */
    @ResponseBody
    @RequiresPermissions("sys:user:edit")
    @RequestMapping(value = "checkLoginName")
    public String checkLoginName(String oldLoginName, String loginName) {
        if (loginName != null && loginName.equals(oldLoginName)) {
            return "true";
        } else if (loginName != null && systemService.getUserByLoginName(loginName) == null) {
            return "true";
        }
        return "false";
    }


    /**
     * 后台头像上传
     *
     * @param multipartRequest
     * @param
     * @param
     * @param model
     * @return
     */
    @RequestMapping(value = "uploadPhoto")
    @ResponseBody
    public String uploadPhoto(MultipartHttpServletRequest multipartRequest, Model model) {
        User user = UserUtils.getUser();
        List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);//文件上传
        user.setPhoto(list.get(0));
        systemService.updateUserInfoData(user);
        return "";
    }

    /**
     * 用户信息显示及保存
     *
     * @param user
     * @param model
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "info")
    public String info(User user, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = UserUtils.getUser();
        if (StringUtils.isNotBlank(user.getName())) {
            if (Global.isDemoMode()) {
                model.addAttribute("message", "演示模式，不允许操作！");
                return "modules/sys/userInfo";
            }
            currentUser.setEmail(user.getEmail());
            currentUser.setPhone(user.getPhone());
            currentUser.setMobile(user.getMobile());
            currentUser.setRemarks(user.getRemarks());
//			String photo = currentUser.getPhoto();
            systemService.updateUserInfo(currentUser);
            //model.addAttribute("message", "保存用户信息成功");
            redirectAttributes.addAttribute("message", "保存用户信息成功");
        }
        model.addAttribute("user", currentUser);
        model.addAttribute("Global", new Global());
        return "modules/sys/userInfo";
    }

    /**
     * 返回用户信息
     *
     * @return
     */
    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping(value = "infoData")
    public User infoData() {
        return UserUtils.getUser();
    }

    /**
     * 修改个人用户密码
     *
     * @param oldPassword
     * @param newPassword
     * @param model
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "modifyPwd")
    public String modifyPwd(String oldPassword, String newPassword, Model model, RedirectAttributes redirectAttributes) {
        User user = UserUtils.getUser();
        if (StringUtils.isNotBlank(oldPassword) && StringUtils.isNotBlank(newPassword)) {
            if (Global.isDemoMode()) {
                model.addAttribute("message", "演示模式，不允许操作！");
                return "modules/sys/userModifyPwd";
            }
            if (SystemService.validatePassword(oldPassword, user.getPassword())) {
                if (!validateNewPwd(newPassword, user.getId())) {//如果新密码是有效的
                    systemService.updatePasswordById(user.getId(), user.getLoginName(), newPassword);
                    //修改密码后，把记录存入到修改密码记录表中
                    sysModifyPwdRecordService.saveModifyPwd(user, SystemService.entryptPassword(newPassword));
                    model.addAttribute("message", "修改密码成功");
                } else {
                    String notRepeatTime = Global.getConfig("password_update_rule");
                    model.addAttribute("message", "您输入的新密码与以往" + notRepeatTime + "次内所使用的密码重复，系统不允许，请输入新密码！");
                }
            } else {
                model.addAttribute("message", "修改密码失败，旧密码错误");
            }
        }
        model.addAttribute("user", user);
        return "modules/sys/userModifyPwd";
    }

    @RequestMapping(value = "modifyPwdReception")
    @ResponseBody
    public String modifyPwdReception(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        User user = UserUtils.getUser();

        if (validateNewPwd(request.getParameter("password"), user.getId())) {
            //获取系统配置的多少次内不重复，（更换的密码多少次次内不能重复）
            //String notRepeatTime = sysConfigService.getValueBySysIdAndKey("dagongp2p", "password_update_rule");
            String notRepeatTime = Global.getConfig("password_update_rule");
            return JSONObject.toJSONString("您输入的新密码与以往" + notRepeatTime + "次内所使用的密码重复，系统不允许，请输入新密码！");
        }
        return "false";
    }


    /**
     * 校验新密码是否有效(true-无效，false-有效)
     *
     * @param newPassword
     * @return
     */
    public boolean validateNewPwd(String newPassword, String userId) {
        Map<String, Object> paramsMap = Maps.newHashMap();
        boolean flag = false;
        //获取系统配置的N次内不重复（（更换的密码N次内不能重复））
        //String notRepeatTime = sysConfigService.getValueBySysIdAndKey("dagongp2p", "password_update_rule");
        String notRepeatTime = Global.getConfig("password_update_rule");
        paramsMap.put("notRepeatTime", notRepeatTime);
        paramsMap.put("userId", userId);
        //通过用户编号，查询用户最近的N次修改密码的记录
        List<SysModifyPwdRecord> list = sysModifyPwdRecordService.getTopUPListByUserId(paramsMap);
        if (list != null && list.size() > 0) {
            for (SysModifyPwdRecord re : list) {
                String entryptPwd = re.getPassword();
                if (SystemService.validatePassword(newPassword, entryptPwd)) {
                    return true;
                }
            }
        }
        return flag;
    }

    /**
     * 用户权限
     *
     * @return
     */
    @RequiresPermissions("user")
    @RequestMapping(value = "menu")
    public String userMenu() {
        return "modules/sys/userMenu";
    }

    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping(value = "treeData")
    public List<Map<String, Object>> treeData(@RequestParam(required = false) String officeId, HttpServletResponse response) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<User> list = systemService.findUserByOfficeId(officeId);
        for (int i = 0; i < list.size(); i++) {
            User e = list.get(i);
            Map<String, Object> map = Maps.newHashMap();
            map.put("id", "u_" + e.getId());
            map.put("pId", officeId);
            map.put("name", StringUtils.replace(e.getName(), " ", ""));
            mapList.add(map);
        }
        return mapList;
    }

//	@InitBinder
//	public void initBinder(WebDataBinder b) {
//		b.registerCustomEditor(List.class, "roleList", new PropertyEditorSupport(){
//			@Autowired
//			private SystemService systemService;
//			@Override
//			public void setAsText(String text) throws IllegalArgumentException {
//				String[] ids = StringUtils.split(text, ",");
//				List<Role> roles = new ArrayList<Role>();
//				for (String id : ids) {
//					Role role = systemService.getRole(Long.valueOf(id));
//					roles.add(role);
//				}
//				setValue(roles);
//			}
//			@Override
//			public String getAsText() {
//				return Collections3.extractToString((List) getValue(), "id", ",");
//			}
//		});
//	}

    @Autowired
    private UserService userService;
    @Autowired
    private P2pUserInformationService p2pUserInformationService;

    /**
     * 跳转到前台用户注册页面
     *
     * @return
     */
    @RequestMapping(value = "preUserRegister")
    @Token(save = true)
    public String preUserRegister() {
        return "modules/front/user/userRegister";
    }

    /**
     * 验证用户名是否被注册
     *
     * @param loginName
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getByLoginName")
    public String getByLoginName(@RequestParam String loginName) {
        JSONObject json = new JSONObject();
        try {
            User user = new User();
            user.setLoginName(loginName);
            if (userService.getByLoginName(user) == true) {
                json.put("valid", true);
            } else {
                json.put("valid", false);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(json.toString());
        return json.toString();
    }

    /**
     * 后台验证用户名是否被注册
     *
     * @param loginName
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getBackByLoginName")
    public boolean getBackByLoginName(String loginName, HttpServletRequest request) {
        try {
            if (loginName == null) {
                loginName = request.getParameter("user.loginName");
            }
            User user = new User();
            user.setLoginName(loginName);
            return userService.getByLoginName(user);
        } catch (Exception e) {
            return false;
        }

    }


    /**
     * 验证手机号是否被绑定
     *
     * @param phone
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getByPhone")
    public String getByPhone(@RequestParam String phone) {
        JSONObject json = new JSONObject();
        try {
            User user = new User();
            user.setPhone(phone);
            if (userService.getByPhone(user) == true) {
                json.put("valid", true);
            } else {
                json.put("valid", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json.toString();
    }

    /**
     * 后台验证手机号是否被注册
     *
     * @param phone
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getBackByPhone")
    public boolean getBackByPhone(String phone, HttpServletRequest request) {
        try {
            if (phone == null) {
                phone = request.getParameter("user.phone");
            }
            User user = new User();
            user.setPhone(phone);
            return userService.getByPhone(user);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 前台用户注册功能
     *
     * @param model
     * @param user
     * @param
     * @return
     */
    @RequestMapping(value = "userRegister")
    @Transactional(readOnly = false)
    @Token(remove = true)
    public String userRegister(Model model, User user, HttpSession session, Integer userBodyType, String bol) {
        try {
            if ((FormValidator.userValidator(user) == 1 || FormValidator.userValidator(user) == 2) && FormValidator.phoneValidator(user)) {
                if (userBodyType == 1) {
                    user.getRoleList().add(new Role(StaticUserRole.FINACING_USER));//给新注册用户添加角色(融资企业)
                } else {
                    user.getRoleList().add(new Role(StaticUserRole.INDIVIDUAL_INVESTMENT));//给新注册用户添加角色(投资个人)
                }
                //判断是否加密过
                if (bol != "false" && (user.getEncryption() == null || "".equals(user.getEncryption()))) {
                    user.setPassword(SystemService.entryptPassword(user.getPassword()));//密码加密sha-1
                }
                user.setOffice(new Office("100"));
                systemService.saveUser(user);
                //前台注册时根据手机号更新短信记录表接收人id
                MsgSmsRecord msgSmsRecord = new MsgSmsRecord();
                msgSmsRecord.setRecId(user.getId());
                msgSmsRecord.setTelnum(user.getPhone());
                msgSmsRecordService.updateRecIdByTelnum(msgSmsRecord);

                P2pUserInformation p2pUserInformation = new P2pUserInformation(IdGen.uuid());
                p2pUserInformation.setUser(user);
                p2pUserInformation.setUserBodyType(userBodyType);//设置用户主体类型
                p2pUserInformation.setRegTime(new Date());//设置注册时间
                if (user.getRoleList().get(0).getId().equals("102")) {
                    p2pUserInformation.setCertificateState(CertificateState.NEW_REGISTERED_USERS);//用户认证状态
                }
                if ("104".equals(user.getRoleList().get(0).getId())) {
                    p2pUserInformation.setCertificateState(1001);//用户认证状态
                }
//				p2pUserInformation.setUserpic("default/head.png");
                p2pUserInformationService.userRegister(p2pUserInformation);
                User u = systemService.getUserByLoginName(user.getLoginName());
                SingleSignOnListener.ssologin(session, u);
                userService.updateLoginDate(user);//更新最后一次登录时间
                if ("102".equals(user.getRoleList().get(0).getId())) {
                    return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission";
                }
                if ("104".equals(user.getRoleList().get(0).getId())) {
                    return "redirect:" + adminPath + "/user/accountGeneration/showAllInformation";
                }
            } else {
                model.addAttribute("registerMsg", "注册失败！");
                return "modules/front/user/userRegister";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("registerMsg", "注册失败！");
        return "modules/front/user/userRegister";
    }

    /**
     * 跳转到前台用户登录
     *
     * @return
     */
    @RequestMapping(value = "preUserLogin")
    public String preUserLogin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "modules/front/user/userLogin";
        }
        return "modules/front/state/error";
    }

    /**
     * 前台用户登录验证(validatePassword密码校验方法)
     *
     * @param model
     * @param session
     * @param user
     * @return
     */
    @RequestMapping(value = "userLogin")
    public String userLogin(Model model, HttpServletResponse response, HttpServletRequest request, HttpSession session, User user, String rememberMe) {
        User u = null;
        // 从一代一路网站进入的登录 start
        if (StringUtils.isNotBlank(request.getParameter("key"))) {
            try {
                if (RSACoder.verify(Coder.decryptBASE64(request.getParameter("data")), Global.getConfig("publicKey"), request.getParameter("sign"))) {
                    byte[] desKeyByte = RSACoder.decryptByPublicKey(Coder.decryptBASE64(request.getParameter("key")), Global.getConfig("publicKey"));
                    String data = new String(DESCoder.decrypt(Coder.decryptBASE64(request.getParameter("data")), desKeyByte), "utf-8");
                    JSONObject jsonObject = JSONObject.parseObject(data);
                    u = systemService.getUserByPhone(jsonObject.get("mobile").toString());
                    //判断用户是否存在，不存在就创建一个关联账户否则直接关联relationId
                    if (u == null) {
                        try {
                            JSONObject j = new JSONObject();
                            u = new User();
                            u.setLoginName(jsonObject.get("mobile").toString());
                            u.setPassword(jsonObject.get("password").toString());
                            u.setPhone(jsonObject.get("mobile").toString());
                            u.setRelationId(jsonObject.get("userId").toString());
                            j.put("userId", jsonObject.get("userId").toString());
                            userRegister(model, u, session, Integer.valueOf("102".equals(jsonObject.get("bodyType").toString()) == true ? 1 : 2), "false");
                            j.put("relationId", u.getId());
                            byte[] key = DESCoder.initKey();
                            //加密传递之前的数据
                            byte[] dataWebsite = DESCoder.encrypt(j.toJSONString().getBytes(), key);
                            //调用网站接口传递加密之后的数据
                            String bol = investmentService.synchronization(RSACoder.encryptBASE64(RSACoder.encryptByPrivateKey(key, Global.getConfig("privateKey"))),
                                    RSACoder.sign(dataWebsite, Global.getConfig("privateKey")), RSACoder.encryptBASE64(dataWebsite));
                            if ("false".equals(bol)) {
                                throw new RuntimeException();
                            }
                            systemService.saveUser(u);
                            /*P2pUserInformation p2pUserInformation = new P2pUserInformation(IdGen.uuid());
                            p2pUserInformation.setUser(u);
							p2pUserInformation.setUserBodyType(Integer.valueOf(jsonObject.get("bodyType").toString()));//设置用户主体类型
							p2pUserInformation.setRegTime(new Date());//设置注册时间
							p2pUserInformationService.userRegister(p2pUserInformation);*/
                            userService.updateLoginDate(u);//记录登录时间
                            SingleSignOnListener.ssologin(session, u);
                            if ("102".equals(jsonObject.get("bodyType").toString())) {
                                return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission";
                            }
                            if ("104".equals(jsonObject.get("bodyType").toString())) {
                                //关闭个人用户登录 更改三处
                                //return "redirect:"+adminPath+"/user/accountGeneration/showAllInformation";
                                //model.addAttribute("loginMsg", "登录失败");
                                PrintWriter writer = response.getWriter();
                                ServletOutputStream outputStream = response.getOutputStream();
                                writer.print("alert('nihao')");
                                outputStream.println("alert('nihao')");
                                try {
                                    writer.flush();
                                    writer.close();
                                    outputStream.flush();
                                    outputStream.close();
                                } catch (Exception e) {
                                    // TODO: handle exception
                                } finally {
                                    writer.close();
                                    outputStream.close();
                                }
                                return "modules/front/user/userLogin";
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            model.addAttribute("loginMsg", "登录失败");
                            return "modules/front/user/userLogin";
                        }
                    } else {
                        try {
                            JSONObject j = new JSONObject();
                            systemService.updateRelationId(jsonObject.get("userId").toString(), jsonObject.get("mobile").toString());
                            j.put("userId", jsonObject.get("userId").toString());
                            j.put("relationId", u.getId());
                            byte[] key = DESCoder.initKey();
                            //加密传递之前的数据
                            byte[] dataWebsite = DESCoder.encrypt(j.toJSONString().getBytes(), key);
                            //调用网站接口传递加密之后的数据
                            String bol = investmentService.synchronization(RSACoder.encryptBASE64(RSACoder.encryptByPrivateKey(key, Global.getConfig("privateKey"))),
                                    RSACoder.sign(dataWebsite, Global.getConfig("privateKey")), RSACoder.encryptBASE64(dataWebsite));
                            if ("false".equals(bol)) {
                                throw new RuntimeException();
                            }
                            userService.updateLoginDate(u);//记录登录时间
                            SingleSignOnListener.ssologin(session, u);
                            if ("102".equals(u.getRoleList().get(0).getId())) {
                                return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission";
                            }
                            if ("104".equals(u.getRoleList().get(0).getId())) {
                                //关闭个人用户登录 更改三处
                                //return "redirect:"+adminPath+"/user/accountGeneration/showAllInformation";
                                //model.addAttribute("loginMsg", "登录失败");
                                PrintWriter writer = response.getWriter();
                                ServletOutputStream outputStream = response.getOutputStream();
                                writer.print("alert('nihao')");
                                outputStream.println("alert('nihao')");
                                try {
                                    writer.flush();
                                    writer.close();
                                    outputStream.flush();
                                    outputStream.close();
                                } catch (Exception e) {
                                    // TODO: handle exception
                                } finally {
                                    writer.close();
                                    outputStream.close();
                                }
                                return "modules/front/user/userLogin";
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                            model.addAttribute("loginMsg", "登录失败");
                            return "modules/front/user/userLogin";
                        }

                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // 从一代一路网站进入的登录 end
        try {
            //后台表单校验
            int regexFlag = FormValidator.userValidator2(user);
//			if(regexFlag == 3){
//				model.addAttribute("loginMsg", "用户名/密码不能为空");
//				return "modules/front/user/userLogin";
//			}
            //判断登录账号为手机号还是用户名
            if (regexFlag == 1) {
                //通过用户名查询用户
                u = systemService.getUserByLoginName(user.getLoginName());
            }
            if (regexFlag == 2) {
                u = systemService.getUserByPhone(user.getLoginName());
            }
            //如果用户存在，执行下一步
            if (u == null) {
                model.addAttribute("loginMsg", "用户不存在");
                return "modules/front/user/userLogin";
            }
            //如果输错五次密码，账号就会锁定
            /*Integer count = p2pUserInformationService.findLockState(u.getId());
			if(count==5){
				model.addAttribute("loginMsg", "账号已被锁定，每天0点解锁");
				return "modules/front/user/userLogin";
			}*/

            //判断密码是否一致，执行下一步
            P2pUserInformation p2pUserInformation = new P2pUserInformation();
            p2pUserInformation.setUser(u);
            //获取当前时间
            Date currentTime = new Date();
            //String minutes = sysConfigService.getValueBySysIdAndKey( "dagongp2p", "account_freeze_minutes");
            //String maxCount = sysConfigService.getValueBySysIdAndKey("dagongp2p", "password_max_wrong_times");
            String minutes = Global.getConfig("account_freeze_minutes");
            String maxCount = Global.getConfig("password_max_wrong_times");
            int min = Integer.parseInt(minutes);
            int max = Integer.parseInt(maxCount);
            System.out.println(SystemService.validatePassword(user.getPassword(), u.getPassword()));
            if (SystemService.validatePassword(user.getPassword(), u.getPassword()) == false) {
                //处理密码输入错误逻辑 "u":从数据库中查出的用户，“user.getPassword()”前台传的密码
                processErrorLogin(u, user.getPassword());
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
                            return "modules/front/user/userLogin";
                        }
                    }
                } else if (record.getFrozenState().equals("0")) {
                    model.addAttribute("loginMsg", "密码错误，还有" + (max - record.getErrorPwdCount()) + "次机会！");
                    return "modules/front/user/userLogin";
                }


                //输错一次密码，次数会存入数据库，如果输错五次，就会记录账号锁定时间
				/*p2pUserInformation.setLockState(++count);
				if(count==5){
					p2pUserInformationService.updateLockTime(p2pUserInformation);
				}
				p2pUserInformationService.updateLockState(p2pUserInformation);
				model.addAttribute("loginMsg", (5-count)!=0?"密码错误,您还有"+(5-count)+"次机会":"账号已被锁定");
				return "modules/front/user/userLogin";*/
            }
            //判断是否为外网注册用户,通过后跳转到主页
            if (p2pUserInformationService.findCertificateState(u.getId()) >= CertificateState.NEW_REGISTERED_USERS) {
                //密码正确，进一步判断用户是否被冻结（1-已冻结；0-未冻结）
                SysLoginRecord sysLoginRecord = sysLoginRecordService.getRecordByUserId(u.getId());
                if (sysLoginRecord != null) {
                    //账号冻结状态（1-已冻结；0-未冻结）
                    if ("1".equals(sysLoginRecord.getFrozenState())
                            && currentTime.before(getNotPerTime(sysLoginRecord.getFrozenStartTime(), min))) {
                        long endTime = getNotPerTime(sysLoginRecord.getFrozenStartTime(), 30).getTime();
                        long minutesNew = (endTime - new Date().getTime()) / 60000;
                        model.addAttribute("loginMsg", "账户已冻结，请" + minutesNew + "分钟后重试！");
                        return "modules/front/user/userLogin";
                    } else {
                        SysLoginRecord slr2 = new SysLoginRecord();
                        slr2.setUser(u);
                        sysLoginRecordService.deleteRecored(slr2);//清空记录
                    }
                }

                //如果账号没有锁定，输入正确一次，账号锁定计数就会清零
				/*if(count > 0){
					p2pUserInformation.setLockState(0);
					p2pUserInformationService.updateLockState(p2pUserInformation);
				}*/
                userService.updateLoginDate(u);//记录登录时间
                //if ("104".equals(u.getRoleList().get(0).getId())) {}
                SingleSignOnListener.ssologin(session, u);


                if (rememberMe != null) {
                    Cookie cookie = new Cookie("loginName", user.getLoginName());
                    cookie.setMaxAge(3600);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }

                //保存日志
                LogUtils.saveLog2(request, null, u, "外网用户登录");

                if ("101".equals(u.getRoleList().get(0).getId())) {
                    if (p2pUserInformationService.findCertificateState(u.getId()) == AuthenticationStatus.NEW_REGISTERED_USERS) {
                        return "redirect:" + adminPath + "/sys/user/signAgreementPage";
                    }
                    if (p2pUserInformationService.findCertificateState(u.getId()) == AuthenticationStatus.SIGN_AGREEMENT_FINISHED) {
                        return "redirect:" + adminPath + "/user/Institution/ctrlMenu?mode=pwdManager";
                    }
                    return "redirect:" + adminPath + "/user/Institution/ctrlMenu";
                }
                if ("102".equals(u.getRoleList().get(0).getId())) {
                    return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission";
                }
                if ("104".equals(u.getRoleList().get(0).getId())) {
                    return "redirect:" + adminPath + "/user/accountGeneration/showAllInformation";
//					return "redirect:"+adminPath+"/user/accountGeneration/showAllInformation";
                    //关闭个人用户登录 更改三处
                    //model.addAttribute("geRenMsg", "as");
                    //return "modules/front/user/userLogin";
                }
                if ("105".equals(u.getRoleList().get(0).getId())) {
                    return "redirect:" + adminPath + "/user/AssetValuation/ctrlMenu";
                }
                if ("106".equals(u.getRoleList().get(0).getId())) {
                    return "redirect:" + adminPath + "/user/Guarantee/ctrlMenu";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("loginMsg", "登录失败");
        return "modules/front/user/userLogin";
    }

    /**
     * 跳转至签订服务协议页面
     *
     * @author Chace
     */
    @RequestMapping("signAgreementPage")
    public String signAgreementPage(HttpSession session, Model model, HttpServletResponse response, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        P2pAgreement p2pAgreement = new P2pAgreement();
        p2pAgreement.setAgreementType("2");
        p2pAgreement = p2pAgreementService.getAgreement(p2pAgreement);
        String agreementContent = StringEscapeUtils.unescapeHtml4(p2pAgreement.getAgreementContent());
        p2pAgreement.setAgreementContent(agreementContent);
        model.addAttribute("user", user);
        model.addAttribute("p2pAgreement", p2pAgreement);
        return "modules/front/account/investorsServiceAgreement";
    }

    /**
     * 机构用户签订服务协议
     *
     * @author Chace
     */
    @RequestMapping("signAgreement")
    public String signAgreement(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        try {
            P2pUserInformation p2pUserInformation = new P2pUserInformation();
            p2pUserInformation.setUser(user);
            p2pUserInformation.setCertificateState(AuthenticationStatus.SIGN_AGREEMENT_FINISHED);//用户认证状态
            p2pUserInformationService.updateCertificateState(p2pUserInformation);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/user/Institution/ctrlMenu?mode=pwdManager";
    }

    /**
     * 前台通过Cookie自动登录
     *
     * @param loginName
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "rememberMe")
    public boolean rememberMe(@RequestParam String loginName, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            User u = systemService.getUserByLoginName(loginName);
            //记录在线
            SingleSignOnListener.ssologin(session, u);
            return true;
        }
        return false;
    }

    /**
     * 前台用户注销
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "userLogout")
    public String userLogout(HttpSession session, HttpServletResponse response) {
        User user = (User) session.getAttribute("user");
        if (user == null || "".equals(user.getId())) {
            return "redirect:" + frontPath;
        }
        Cookie cookie = new Cookie("loginName", user.getLoginName());
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
        //移除在线
        SingleSignOnListener.clearSessionRecord(session);
        session.removeAttribute("user");
        // 清除用户缓存
        user.setLoginName(user.getLoginName());
        UserUtils.clearCache(user);
        return "redirect:" + frontPath;
    }

    /**
     * 修改密码
     *
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "updatePwd", method = RequestMethod.POST)
    public String updatePwd(HttpSession session, String oldPwd, String newPwd) {
        User user = (User) session.getAttribute("user");
        String roleId = user.getRoleList().get(0).getId();

        user.setPassword(SystemService.entryptPassword(newPwd));
        userService.updatePwd(user);
        if ("101".equals(roleId)) {
            if (p2pUserInformationService.findCertificateState(user.getId()) == AuthenticationStatus.SIGN_AGREEMENT_FINISHED) {
                P2pUserInformation p2pUserInformation = new P2pUserInformation();
                p2pUserInformation.setUser(user);
                p2pUserInformation.setCertificateState(AuthenticationStatus.INVESTMENT_PREPARE_SUCCESS);//用户认证状态
                p2pUserInformationService.updateCertificateState(p2pUserInformation);
            }
            return "redirect:" + adminPath + "/user/Institution/ctrlMenu";
        }
        if ("102".equals(roleId)) {
            return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission";
        }
        if ("104".equals(roleId)) {
            return "redirect:" + adminPath + "/user/accountGeneration/showAllInformation";
        }
        if ("105".equals(roleId)) {
            return "redirect:" + adminPath + "/user/AssetValuation/ctrlMenu";
        }
        if ("106".equals(roleId)) {
            return "redirect:" + adminPath + "/user/Guarantee/ctrlMenu";
        }
        return null;
    }

    /**
     * 密码修改时，校验原密码是否正确
     *
     * @param oldPwd
     * @param session
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "checkPwd")
    @ResponseBody
    public String checkPwd(@RequestParam String oldPwd, HttpSession session) {
        User user = (User) session.getAttribute("user");
        JSONObject json = new JSONObject();
        if (SystemService.validatePassword(oldPwd, user.getPassword()) == true) {
            json.put("valid", true);
        } else {
            json.put("valid", false);
        }
        return json.toString();
    }

    /**
     * 密码修改时，校验新密码和原密码是否相同
     *
     * @param newPwd
     * @param session
     * @return
     */
    @RequestMapping(value = "differentPwd")
    @ResponseBody
    public String differentPwd(@RequestParam String newPwd, HttpSession session) {
        User user = (User) session.getAttribute("user");
        JSONObject json = new JSONObject();
        if (SystemService.validatePassword(newPwd, user.getPassword()) == true) {
            json.put("valid", false);
        } else {
            json.put("valid", true);
        }
        return json.toString();
    }

    /**
     * 修改对接人信息
     *
     * @param model
     * @param session
     */
    @RequestMapping(value = "updateBankAgent")
    public void updateBankAgent(@RequestParam String usernames, @RequestParam String gender,
                                @RequestParam String dept, @RequestParam String job, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        user.setName(usernames);

    }
    /**
     * 测试用登录页面
     */
	/*@RequestMapping(value = "toHomepage")
	public String toHomepage(){
		System.out.println("come");
		return "modules/back/homepage";
	}*/

    /**
     * 后台用户登录后展示首页查询  wlcomeToBackPage
     *
     * @return
     * @throws ParseException
     */
    @RequestMapping(value = "toHomepage")
    public String toHomepage(Model model) throws ParseException {
        Integer tCount = userService.selectTodayLoginedUsersCount();//获得今日登录的用户数目
        Integer rCount = p2pUserInformationService.selectTodayRegUsersCount();//获得今日注册用户数,在session中已经获得当前在线人数
        Integer uCount = userService.selectUsersCount();//查询系统所有用户数量
        Integer fCount = p2pFinancingInformationService.selectCountfinancingAmounts();//查询融资总额
        if (fCount == null) {
            fCount = 0;
        }
        Integer pCount = p2pFinancingInformationService.selectRepayfinancingAmounts();//查询融待还总额
        if (pCount == null) {
            pCount = 0;
        }

        Integer aCount = p2pFinancingInformationService.selectAllFullscaleAmounts();//查询满标总数
        Map<String, String> map = new HashMap<String, String>();

        List<P2pFinancingInformation> raiseFrontList = p2pFinancingInformationService.findFronRaiseAndWarning();//查询处于募集预警状态的的融资项目
        List<P2pFinancingInformation> frontFinaNameAndIDList = p2pFinancingInformationService.findFrontFinaNameAndID();//查询前几条债项信息
        //查询处于付款期内的所有债项
        List<P2pFinancingInformation> finaNameAndGivTimeList = p2pFinancingInformationService.findAllFinaNameAndGivTime();
        //查询所有处于付款预警期内的债项
        List<Map<String, Object>> warnList = null;
//		if (finaNameAndGivTimeList.size()>0) {
//			 warnList=CalculateRepayWarnUtils.RepayWarnTime(finaNameAndGivTimeList);
//		}

        //统计当前在线用户数
        Integer sCount = SingleSignOnListener.calcOnlineCount();
        //Collection<Session> sessions=sessionDAO.getActiveSessions();

        map.put("sCount", sCount.toString());
        map.put("tCount", tCount.toString());
        map.put("rCount", rCount.toString());
        map.put("uCount", uCount.toString());
        map.put("fCount", fCount.toString());
        map.put("pCount", pCount.toString());
        map.put("aCount", aCount.toString());
        model.addAttribute("map", map);
        model.addAttribute("raiseFrontList", raiseFrontList);
        model.addAttribute("frontFinaNameAndIDList", frontFinaNameAndIDList);
        model.addAttribute("warnList", warnList);
        return "modules/back/homepage";
    }

    /**
     * 列表显示所有代办消息
     */
    @RequestMapping(value = "selectDetailNoties")
    public String kok(Model model) {
        List<P2pRegUserCertify> p2pRegUserCertify = p2pRegUserCertifyService.getRegUserCertifyNameAndTime();//查询实名待认证列表
        List<P2pFinancingInformation> p2pFullscaleNameAndTime = p2pFinancingInformationService.selectFullscaleNameAndTime();//查询满标债项公司名称及债项发布时间
        List<P2pFinancingInformation> p2pCreditNameAndTime = p2pFinancingInformationService.selectCreditNameAndTime();//查询评级审核状态的公司名称及债项发布时间

        List<P2pFinancingInformation> p2pFlowNameAndTime = p2pFinancingInformationService.SelectCreditFlowNameAndTime();//查询流标核状态的公司名称及债项发布时间
        List<P2pFinancingInformation> p2pReleaseNameAndTime = p2pFinancingInformationService.selectReleaseNameAndTime();//查询发布债项公司名称及融资申请提交时间

        List<P2pFinancingInformation> overdueNorepaylist = p2pFinancingInformationService.findOverdueNorepayNameAndTime();//查询出所有处于还款期内的债项
        List<P2pFinancingInformation> overdueNorepayNameAndTime = null;
        if (overdueNorepaylist.size() > 0) {//若存在付款期内的债项，则查询出逾期未付款债项的公司名称及融资发放时间
//			overdueNorepayNameAndTime=p2pRepaymentRecordService.selectOverdueNorepaymentNameAndTime(overdueNorepaylist);
        }
        model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);
        model.addAttribute("p2pFullscaleNameAndTime", p2pFullscaleNameAndTime);
        model.addAttribute("p2pCreditNameAndTime", p2pCreditNameAndTime);
        model.addAttribute("p2pFlowNameAndTime", p2pFlowNameAndTime);
        model.addAttribute("p2pReleaseNameAndTime", p2pReleaseNameAndTime);
        model.addAttribute("overdueNorepayNameAndTime", overdueNorepayNameAndTime);
        return "modules/back/showAllNoticePage";
    }

    @RequestMapping(value = "updatePhone2", method = RequestMethod.POST)
    public String updatePhone2(HttpSession session, String oldPassword, String phone, Model model) {
        User user = (User) session.getAttribute("user");//获取当前用户
        if (PermissionUtils.ctrlPermission(user) == false) {
            return "modules/front/state/error";
        }
        if (SystemService.validatePassword(oldPassword, user.getPassword()) == true) {
            user.setPhone(phone);
            userService.updatePhone(user);
            return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=accSettings";
        } else {
            return "modules/front/account/updatePhone";
        }
    }

    /**
     * 验证邮箱是否被注册
     *
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getByEmail")
    public String getByEmail(@RequestParam String email) {
        JSONObject json = new JSONObject();
        try {
            User user = new User();
            user.setEmail(email);
            if (CheckEmail.isAddressValid(email) == true) {
                json.put("valid", true);
            } else {
                json.put("valid", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json.toString();
    }

    @RequiresPermissions("user")
    @ResponseBody
    @RequestMapping(value = "treeData2")
    public List<Map<String, Object>> treeData2(@RequestParam(required = false) User user, HttpServletResponse response) {
        List<Map<String, Object>> mapList = Lists.newArrayList();
        List<User> list = userService.findAllPersonal(user);
        for (int i = 0; i < list.size(); i++) {
            User e = list.get(i);
            Map<String, Object> map = Maps.newHashMap();
            map.put("id", "u_" + e.getId());
            map.put("name", StringUtils.replace(e.getLoginName(), " ", ""));
            mapList.add(map);
        }
        return mapList;
    }

    /**
     * 忘记密码-跳转到验证手机号页面
     *
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "preResetPwd")
    public String preResetPwd() {
        return "p2p/front/user/resetPwd1";
    }

    /**
     * 忘记密码-校验手机号是否存在
     *
     * @param phone
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "isPhoneExist")
    public String isPhoneExist(@RequestParam String phone) {
        JSONObject json = new JSONObject();
        try {
            User user = new User();
            user.setPhone(phone);
            if (!userService.getByPhone(user)) {
                json.put("valid", true);
            } else {
                json.put("valid", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json.toString();
    }

    /**
     * 忘记密码-跳转到重置密码页面
     *
     * @param model
     * @param phone
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "preResetPwd2")
    public String preResetPwd2(Model model, String phone) {
        model.addAttribute("phone", phone);
        return "p2p/front/user/resetPwd2";
    }

    /**
     * 忘记密码-重置密码
     *
     * @param newPwd
     * @return
     */
    @RequestMapping(value = "resetPwd")
    public String resetPwd(String newPwd, String phone) {
        userService.resetPwd(newPwd, phone);
        return "modules/front/user/userLogin";
    }

    @ResponseBody
    @RequestMapping(value = "jumpWebsite")
    public String jumpWebsite(HttpServletRequest request, HttpServletResponse response, Model model) {
        User user = (User) request.getSession().getAttribute("user");
        String json = "";
        if (user != null) {
            json = systemService.checkUserRelation(user.getId());

        } else {
            JSONObject j = new JSONObject();
            j.put("text", "没有关联一带一路网站");
            j.put("flag", false);
            j.put("data", "");
            json = j.toJSONString();
        }
        return json;
    }

    @ResponseBody
    @RequestMapping(value = "returnIndex")
    public String returnIndex(HttpServletRequest request, HttpServletResponse response, Model model) {
        JSONObject j = new JSONObject();
        j.put("text", "跳转");
        j.put("flag", true);
        j.put("data", Global.getConfig("webSitePath"));
        return j.toJSONString();
    }

    @ResponseBody
    @RequestMapping(value = {"signIn"})
    public String signIn(HttpServletRequest request, HttpServletResponse response) {
        User u = (User) request.getSession().getAttribute("user");
        String json = "";
        JSONObject j = new JSONObject();
        //首先给json初始化默认值
        j.put("text", "验证失败");
        j.put("flag", false);
        j.put("data", "");
        json = j.toJSONString();
        //判断用户是否登录
        if (u != null) {
            //电话
            String phone = request.getParameter("phone");
            //验证码
            String smsCode = request.getParameter("smsCode");
            long curTime = System.currentTimeMillis();                 // 生成当前的时间戳
            String smsPhoneCode = (String) request.getSession().getAttribute(SmsPhoneCodeConst.SmsPhoneCode);    // 从Session中取得验证码
            long smsTime = ((Date) request.getSession().getAttribute(SmsPhoneCodeConst.SmsPhoneTime)).getTime();
            long expiredTime = (curTime - smsTime) / (60000);
            if (StringUtils.equalsIgnoreCase(smsPhoneCode, smsCode) && expiredTime <= 10) {
                json = systemService.jumpPage(phone, u.getId(), u.getPassword());
            }
        }
        return json;
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
//				String pcMac = GetMacAddress.getMacAddress(ip);
//				sysErrorLoginLog.setPcMac(pcMac);// 登录错误的物理机
            sysErrorLoginLog.setLoginTime(new Date());// 登录错误的时间
            sysErrorLoginLog.setUserRole(1);// 1为前台用户2为后台用户
            sysErrorLoginLogService.save(sysErrorLoginLog);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
}
