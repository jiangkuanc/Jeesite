package com.dagongsoft.p2p.financing.web;


import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.utils.FormatUtils;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.service.ServiceException;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.UserService;
import com.thinkgem.jeesite.modules.sys.utils.email.MailSender;
import com.thinkgem.jeesite.modules.sys.utils.email.SendMail;

/**
 * 我的账户 Controller
 *
 * @author liyongwei
 * @version 2016-07-27
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/myAccount")
public class MyCountController extends BaseController {

    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;

    @Autowired
    private P2pUserInformationService p2pUserInformationService;
    @Autowired
    private UserService userService;
    @Autowired
    private UserDao userDao;

    /**
     * 加载投资总金额
     *
     * @param userId
     * @return
     */
    public String loadAllInvestmentAmountByUserId(String userId) {
        Integer amount = p2pFinancingInformationService.loadAllInvestAmountByUserId(userId);
        if (amount != null) {
            return FormatUtils.amountFormat(amount);
        }
        return "0";
    }

    /**
     * 加载募集中的债项个数
     *
     * @param userId
     * @return
     */
    public String loadAllInvestmentRaiseNumByUserId(String userId) {
        Integer raiseAmount = p2pFinancingInformationService.loadAllInvestmentRaiseNumByUserId(userId);
        if (raiseAmount != null) {
            return FormatUtils.amountFormat(raiseAmount);
        }
        return "0";
    }

    /**
     * 加载还款中的债项个数
     *
     * @param userId
     * @return
     */
    public String loadAllRepaymentNumByUserId(String userId) {
        Integer raiseAmount = p2pFinancingInformationService.loadAllRepaymentNumByUserId(userId);
        if (raiseAmount != null) {
            return FormatUtils.amountFormat(raiseAmount);
        }
        return "0";
    }

    /**
     * 加载已还款的债项个数
     *
     * @param userId
     * @return
     */
    public String loadAllRepaymentEndNumByUserId(String userId) {
        Integer raiseAmount = p2pFinancingInformationService.loadAllRepaymentEndNumByUserId(userId);
        if (raiseAmount != null) {
            return FormatUtils.amountFormat(raiseAmount);
        }
        return "0";
    }

    /**
     * 加载已流标的债项个数
     *
     * @param userId
     * @return
     */
    public String loadAllLoseBidsNumByUserId(String userId) {
        Integer raiseAmount = p2pFinancingInformationService.loadAllLoseBidsNumByUserId(userId);
        if (raiseAmount != null) {
            return FormatUtils.amountFormat(raiseAmount);
        }
        return "0";
    }

    /**
     * 加载逾期的债项个数
     *
     * @param userId
     * @return
     */
    public String loadAllOverdueNumByUserId(String userId) {
        Integer raiseAmount = p2pFinancingInformationService.loadAllOverdueNumByUserId(userId);
        if (raiseAmount != null) {
            return FormatUtils.amountFormat(raiseAmount);
        }
        return "0";
    }

    /**
     * 加载投资累计总收益
     *
     * @param userId
     * @return
     */
    public String loadAllInvestmentIncomeByUserId(String userId) {
        Integer investmentIncome = p2pFinancingInformationService.loadAllInvestmentIncomeByUserId(userId);
        if (investmentIncome != null) {
            return FormatUtils.amountFormat(investmentIncome);
        }
        return "0";
    }

    /**
     * 加载未到账投资收益总金额
     *
     * @param userId
     * @return
     */
    public String loadAllNotToAccountIncomeByUserId(String userId) {
        Integer notToAccountIncome = p2pFinancingInformationService.loadAllNotToAccountIncomeByUserId(userId);
        if (notToAccountIncome != null) {
            return FormatUtils.amountFormat(notToAccountIncome);
        }
        return "0";
    }

    /**
     * 加载用户头像（投资）
     *
     * @param session
     * @param p2pUserInformation
     * @return
     */
    public P2pUserInformation findUserPicByUserId(User user) {
        P2pUserInformation p2pUserInformation = new P2pUserInformation();
        p2pUserInformation.setUser(user);
        return p2pUserInformationService.findUserPicByUserId(p2pUserInformation);
    }

    /**
     * 投资总览
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "investmentGeneral")
    public String financingGeneral(P2pFinancingInformation p2pFinancingInformation,
                                   HttpSession session, HttpServletRequest request, HttpServletResponse response,
                                   Model model) {
        User user = (User) session.getAttribute("user");
        String beginDate = request.getParameter("beginDate");
        String endDate = request.getParameter("endDate");
        model.addAttribute("beginDate", beginDate);
        model.addAttribute("endDate", endDate);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", user.getId());
        paramMap.put("beginDate", beginDate);
        paramMap.put("endDate", endDate);
        model.addAttribute("allInvestmentAmount", loadAllInvestmentAmountByUserId(user.getId()));//投资总金额
        model.addAttribute("investmentIncome", loadAllInvestmentIncomeByUserId(user.getId()));//投资累计收益
        model.addAttribute("investmentRaiseNum", loadAllInvestmentRaiseNumByUserId(user.getId()));//募集中债项总个数
        model.addAttribute("repaymentNum", loadAllRepaymentNumByUserId(user.getId()));//还款中债项个数
        model.addAttribute("repaymentEndNum", loadAllRepaymentEndNumByUserId(user.getId()));//已还款债项个数
        model.addAttribute("loseBidsNum", loadAllLoseBidsNumByUserId(user.getId()));//已流标债项个数
//		model.addAttribute("overdueAmountNum",loadAllOverdueNumByUserId(user.getId()));//逾期债项个数
        List<P2pFinancingInformation> loadInvestmentList = p2pFinancingInformationService.loadInvestmentList(paramMap);
        model.addAttribute("loadInvestmentList", loadInvestmentList);//加载投资列表
        List<P2pFinancingInformation> InvestIncomeDetail = p2pFinancingInformationService.InvestIncomeDetail(user.getId());
        List<P2pFinancingInformation> loadRepayingInvestmentList = p2pFinancingInformationService.loadRepayingInvestmentList(user);//还款中记录


        model.addAttribute("InvestIncomeDetail", InvestIncomeDetail);
        model.addAttribute("p2pUserInformation", p2pUserInformationService.findP2pUserInformationByUser(user));
        return "modules/front/investment/investmentGeneral";
    }

    /**
     * 投资收益
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "investmentIncome")
    public String financingIncome(String id, P2pFinancingInformation p2pFinancingInformation,
                                  HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("investmentIncome", loadAllInvestmentIncomeByUserId(user.getId()));//投资收到的益
        model.addAttribute("notToAccountIncome", loadAllNotToAccountIncomeByUserId(user.getId()));//未到账收益
        String beginDate = request.getParameter("beginDate");
        String endDate = request.getParameter("endDate");
        model.addAttribute("beginDate", beginDate);
        model.addAttribute("endDate", endDate);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", user.getId());
        paramMap.put("beginDate", beginDate);
        paramMap.put("endDate", endDate);
        List<P2pFinancingInformation> earnRecordList = p2pFinancingInformationService.investmentEarnRecordByUserId(paramMap);
        List<P2pFinancingInformation> loadRepayingInvestmentList = p2pFinancingInformationService.loadRepayingInvestmentList(user);//还款中记录

        List<P2pFinancingInformation> loadRepayEndInvestmentList = p2pFinancingInformationService.loadRepayEndInvestmentList(user);//已还完
        List<P2pFinancingInformation> loadOverdueInvestmentList = p2pFinancingInformationService.loadOverdueInvestmentList(user);//逾期


//		List<P2pFinancingInformation> repaymentRecordList = p2pFinancingInformationService.getRepaymentRecordById(id);
        model.addAttribute("loadRepayingInvestmentList", loadRepayingInvestmentList);
        model.addAttribute("loadRepayEndInvestmentList", loadRepayEndInvestmentList);
        model.addAttribute("earnRecordList", earnRecordList);

        model.addAttribute("loadOverdueInvestmentList", loadOverdueInvestmentList);
//		model.addAttribute("repaymentRecordList", repaymentRecordList);
        return "modules/front/investment/investmentIncome";
    }


    /**
     * 根据条件查询当前投资人用户的逾期投资债项
     *
     * @throws ParseException
     * @author DAGONG
     */

    @RequestMapping(value = "selectCurrentUserDept")
    @ResponseBody
    public List<P2pFinancingInformation> selectCurrentUserDept(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ParseException {
        String mode = request.getParameter("selectMode");
        List<P2pFinancingInformation> overdueNorepaymentList = null;
        User user = (User) session.getAttribute("user");
        List<P2pFinancingInformation> loadRepayingInvestmentList = p2pFinancingInformationService.loadRepayingInvestmentList(user);//当前用户的还款中记录
        List<P2pFinancingInformation> loadRepayEndInvestmentList = p2pFinancingInformationService.loadRepayEndInvestmentList(user);//当前用户已还完债项记录
        if (loadRepayingInvestmentList != null) {

        }
        if (mode.equals("all")) {//查询所有
            loadRepayingInvestmentList.addAll(overdueNorepaymentList);//并集
            return loadRepayingInvestmentList;
        } else if (mode.equals("repaying")) {//查询正在还款中的债项
            loadRepayingInvestmentList.removeAll(overdueNorepaymentList);//获得当前投资用户处于在还款未逾期的债项
            return loadRepayingInvestmentList;
        } else if (mode.equals("overdue")) {//查询逾期的债项
            return overdueNorepaymentList;
        } else {//查询还完债的债项
            return loadRepayEndInvestmentList;
        }
    }

    /**
     * 投资记录
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "investmentRecord")
    public String financingRecord(P2pFinancingInformation p2pFinancingInformation,
                                  HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
        User user = (User) session.getAttribute("user");
        String beginDate = request.getParameter("beginDate");
        String endDate = request.getParameter("endDate");
        model.addAttribute("beginDate", beginDate);
        model.addAttribute("endDate", endDate);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", user.getId());
        paramMap.put("beginDate", beginDate);
        paramMap.put("endDate", endDate);
        List<P2pFinancingInformation> loadInvestmentList = p2pFinancingInformationService.loadInvestmentList(paramMap);//投资总记录
        List<P2pFinancingInformation> loadRepayingInvestmentList = p2pFinancingInformationService.loadRepayingInvestmentList(user);//还款中记录
        List<P2pFinancingInformation> loadRepayEndInvestmentList = p2pFinancingInformationService.loadRepayEndInvestmentList(user);//已还完
//		List<P2pFinancingInformation> loadOverdueInvestmentList = p2pFinancingInformationService.loadOverdueInvestmentList(user);//逾期


        model.addAttribute("allInvestmentAmount", loadAllInvestmentAmountByUserId(user.getId()));
        model.addAttribute("loadInvestmentList", loadInvestmentList);
        model.addAttribute("loadRepayingInvestmentList", loadRepayingInvestmentList);
        model.addAttribute("loadRepayEndInvestmentList", loadRepayEndInvestmentList);
//		model.addAttribute("overdueNorepaymentList", overdueNorepaymentList);//逾期
        return "modules/front/investment/investmentRecord";
    }

    /**
     * 绑定手机号
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "bindingPhone")
    public String bindingPhone(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
//		Page<P2pFinancingInformation> page = financingService.findMiddleMatchList(new Page<P2pFinancingInformation>(request, response),p2pFinancingInformation); 
//		model.addAttribute("page", page);
        return "modules/front/investment/bindingPhone";
    }

    /**
     * 替换手机号
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "replacePhone")
    public String replacePhone(Model model, HttpSession session, String phoneNumber, RedirectAttributes redirectAttributes) {

        return "modules/front/investment/replacePhone";
    }

    /**
     * 密码管理
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "passwordModify")
    public String passwordManager(P2pFinancingInformation p2pFinancingInformation, HttpServletRequest request, HttpServletResponse response, Model model) {
//		Page<P2pFinancingInformation> page = financingService.findMiddleMatchList(new Page<P2pFinancingInformation>(request, response),p2pFinancingInformation); 
//		model.addAttribute("page", page);
        return "modules/front/investment/passwordModify";
    }

    /**
     * 账户设置
     *
     * @param p2pFinancingInformation
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "accountSet")
    public String accountSet(P2pFinancingInformation p2pFinancingInformation,
                             HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
        User user = (User) session.getAttribute("user");
        P2pUserInformation p2pUserInformation = new P2pUserInformation();
        p2pUserInformation.setUser(user);
        p2pUserInformation = p2pUserInformationService.findDockedInfo(p2pUserInformation);
        model.addAttribute("p2pUserInformation", p2pUserInformation);
        String p2pUserInformationJson = JsonMapper.toJsonString(p2pUserInformation);
        model.addAttribute("p2pUserInformationJson", p2pUserInformationJson);
        model.addAttribute("p2pUserPic", findUserPicByUserId(user));
        return "modules/front/investment/accountSet";
    }

    /**
     * 邮箱认证
     *
     * @return
     */
    @RequestMapping(value = "emailAuthentication")
    public String emailAuthentication() {

        return "modules/front/investment/emailAuthentication";
    }

    /**
     * 邮箱认证成功
     *
     * @return
     */
    @RequestMapping(value = "emailAuthenticationSuccess")
    public String emailAuthenticationSuccess() {

        return "modules/front/investment/emailAuthenticationSuccess";
    }

    /**
     * 上传头像页面
     *
     * @return
     */
    @RequestMapping(value = "addTouXiang")
    public String addTouXiang() {
        //TODO(设置头像)
        return "modules/front/investment/addtouxiang";
    }

    //personAddTouXiang

    /**
     * 上传个人账户头像页面
     *
     * @return
     */
    @RequestMapping(value = "personAddTouXiang")
    public String personAddTouXiang() {
        return "modules/front/investment/personAddtouxiang";
    }

    /**
     * uploadUserPic
     *
     * @param multipartRequest
     * @param session
     * @param p2pUserInformation
     * @return
     */
    @RequestMapping(value = "uploadUserPic")
    public String uploadUserPic(MultipartHttpServletRequest multipartRequest, HttpSession session, P2pUserInformation p2pUserInformation, Model model) {
        User user = (User) session.getAttribute("user");
        List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);//文件上传
        p2pUserInformation.setUserpic(list.get(0));//设置文件上传的路径
        user.setId(user.getId());
        p2pUserInformation.setUser(user);
//		p2pUserInformation.setCreateDate(new Date());//设置文件上传日期
        p2pUserInformationService.saveOrUpdateUserPic(p2pUserInformation);
//		model.addAttribute("msg", "用户头像上传成功");
//		return "modules/front/investment/accountSet";
        return "redirect:" + Global.getAdminPath() + "/user/p2pUserInformation/accountPermission";//账户设置
    }

    /**
     * 发送验证邮件
     *
     * @param session
     * @param oldPassword
     * @param email
     * @param model
     * @return
     */
    @RequestMapping(value = "sendValidEmail")
    public String sendValidEmail(HttpSession session, String oldPassword, String email, Model model) {
        User user = (User) session.getAttribute("user");//获取当前用户
        SendMail mail = new SendMail();
        MailSender sms = new MailSender();
        mail.setMailServerHost("smtp.163.com"); // 这里填发送者的邮箱服务器，我以qq举个例子
        mail.setMailServerPort("25");
        mail.setValidate(true);
        mail.setUserName("projecttest123mail@163.com");//发送者的邮箱名字
        mail.setPassword("projecttest123");//发送者邮箱密码
        mail.setFromAddress("projecttest123mail@163.com");//发送者邮箱账户
        mail.setToAddress(email);//接收者邮箱账户
        String validCode = DigestUtils.md5Hex(mail.getFromAddress());
        user.setValidateCode(validCode);
        user.setValidateState("0");//未激活
        user.setValidateDate(new Date());
        user.setEmail(email);
        userService.updateOrInsertValidInfo(user);
        //邮件的内容
        mail.setSubject("用户邮箱绑定成功，大公P2P互联网金融平台，网贷领导者");//邮件主题
        mail.setContent("<h2>欢迎您 " + mail.getToAddress() + ",您已注册成为大公P2P互联网金融平台用户。</h2><br>" +
                "<h2>邮箱认证-激活邮件!点击下面的链接完成激活操作，该链接24小时之内有效：</h2>" +
                "<h3><a href='http://localhost:8686/jeesite/a/financing/myAccount/handleValidEmail?email=" + mail.getToAddress() + "&&code=" + validCode + "'>" +
                "http://localhost:8686/jeesite/a/financing/myAccount/handleValidEmail?email=" + mail.getToAddress() + "&&code=" + validCode + "</a></h3>");

        //发送邮件  
        sms.sendHtmlMail(mail);// 发送html格式
        model.addAttribute("msg", "验证邮件发送成功");
        return "modules/front/investment/emailAuthentication";
    }

    /**
     * 处理验证邮件
     *
     * @param session
     * @param oldPassword
     * @param email
     * @param model
     * @return
     */
    @RequestMapping(value = "handleValidEmail")
    public String handleValidEmail(HttpSession session, HttpServletRequest request, String code, Model model) {
        User user = (User) session.getAttribute("user");//获取当前用户
        String validCode = code;
        //验证用户是否存在   
        if (user != null) {
            //验证用户激活状态    
            if (user.getValidateState() == "0") {
                ///没激活  
                Date currentTime = new Date();//获取当前时间    
                //验证链接是否过期   
                currentTime.before(user.getCreateDate());
                long between = (currentTime.getTime() - user.getValidateDate().getTime()) / 1000;//除以1000是为了转换成秒

                long hours = between % (24 * 3600) / 3600;//获取两个时间差的小时数
//                if(currentTime.after(user.getValidateDate())) {  
                if (hours < 24) {        //判断是否超过期限
                    //验证激活码是否正确    
                    if (validCode.equals(user.getValidateCode())) {
                        //激活成功， //并更新用户的激活状态，为已激活   
                        user.setValidateState("1");//把状态改为激活  
                        userDao.update(user);
                    } else {
                        throw new ServiceException("激活码不正确");
                    }
                } else {
                    throw new ServiceException("激活链接已过期！");
                }
            } else {
                return "redirect:" + Global.getAdminPath() + "/financing/myAccount/emailAuthentication";
            }
        } else {
            throw new ServiceException("该邮箱未注册（邮箱地址不存在）！");
        }
        return "redirect:" + Global.getAdminPath() + "/financing/myAccount/emailAuthenticationSuccess";

    }

    /**
     * 用户头像上传（融资）
     *
     * @param multipartRequest
     * @param session
     * @param p2pUserInformation
     * @param model
     * @return
     */
    @RequestMapping(value = "uploadUserPic2")
    public String uploadUserPic2(MultipartHttpServletRequest multipartRequest, HttpSession session, P2pUserInformation p2pUserInformation, Model model) {
        User user = (User) session.getAttribute("user");
        List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);//文件上传
        p2pUserInformation.setUserpic(list.get(0));//设置文件上传的路径
        user.setId(user.getId());
        p2pUserInformation.setUser(user);
//		p2pUserInformation.setCreateDate(new Date());//设置文件上传日期
        p2pUserInformationService.saveOrUpdateUserPic(p2pUserInformation);
//		model.addAttribute("msg", "用户头像上传成功");
//		return "modules/front/investment/accountSet";
        String roleId = user.getRoleList().get(0).getId();
        //判断当前用户类型
        if (roleId != null && "102".equals(roleId)) {
            return "redirect:" + Global.getAdminPath() + "/user/p2pUserInformation/accountPermission";//融资账户总览
        } else if (roleId != null && "101".equals(roleId)) {
            return "forward:" + Global.getAdminPath() + "/user/Institution/ctrlMenu";//机构账户总览
        } else if (roleId != null && "104".equals(roleId)) {
            p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            p2pUserInformation.setUserpic(list.get(0));//设置文件上传的路径
            p2pUserInformationService.saveOrUpdateUserPic(p2pUserInformation);
            p2pUserInformation.setUserpic(UploadFileUtils.viewUrl(p2pUserInformation.getUserpic()));
            model.addAttribute("p2pUserInformation", p2pUserInformation);
            return "forward:" + Global.getAdminPath() + "/user/accountGeneration/showAllInformation";
        }
        return null;
    }


}
