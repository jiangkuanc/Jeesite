package com.dagongsoft.p2p.user.utils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dagongsoft.p2p.user.utils.consts.EmailConsts;
import com.dagongsoft.p2p.user.utils.entity.EmailJsonVo;
import com.dagongsoft.p2p.user.utils.entity.MsgMailRecord;
import com.dagongsoft.p2p.user.utils.service.MsgMailRecordService;
import com.dagongsoft.p2p.user.utils.test.DagongMailConst;
import com.dagongsoft.p2p.user.utils.test.DagongMailUtils;
import com.dagongsoft.p2p.user.utils.test.MailCodeATime;
import com.dagongsoft.p2p.user.utils.test.SessionEmailCodeConst;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.UserService;

/**
 * 邮箱验证Controller
 *
 * @author DAGONG
 */

@Controller
@RequestMapping(value = "${adminPath}/user/validEmailCode")
public class MailController {

    @Autowired
    public UserService userService;

    @Autowired
    public MsgMailRecordService mailRecordService;

    /**
     * 认证邮箱验证码
     *
     * @param session
     * @param model
     * @param clienCode
     * @return
     */
    @RequestMapping("authEmail")
    @ResponseBody
    public String validEmailCode(HttpSession session, Model model, @RequestParam(value = "clientCode") String clientCode) {
        String emailValidUrl = "modules/user/emailValidUrl";
        String emailReValidUrl = "modules/user/emailReValidUrl";
        /**
         * codeVaid  :  0 :	服务端异常
         * codeValid :  1 :  通过
         * codeValid： 2：验证失效
         * codeValid： 3：验证失败
         *
         */
        try {
            MailCodeATime mailCodeATime = (MailCodeATime) session.getAttribute(SessionEmailCodeConst.MAIL_CODE_A_TIME);
            //得到验证码
            String code = mailCodeATime.getCode();
            //得到验证时间
            Date emailTime = mailCodeATime.getDate();
            Date curTime = new Date();
            long diffTime = curTime.getTime() - emailTime.getTime();
            BigDecimal diffTimeDecimal = new BigDecimal(diffTime);
            BigDecimal oneMinute = new BigDecimal(1000 * 60);
            BigDecimal isOneValidMinute = diffTimeDecimal.divide(oneMinute, RoundingMode.FLOOR);
            double isOneMinute = isOneValidMinute.doubleValue();
            //如果验证码相等
            if (StringUtils.equalsIgnoreCase(clientCode, code) && isOneMinute <= 1) {
                User user = (User) session.getAttribute("user");
                user.setEmail((String) session.getAttribute("toEmailAddress"));
                user.setValidateState("1");
                //更新User表
                userService.updateByEmail(user);
                //userService;
                //验证通过
                model.addAttribute("codeValid", "1");
                EmailJsonVo emailJsonVo = new EmailJsonVo(String.valueOf(RandomUtils.nextLong(10000, 99999)), EmailConsts.valid_pass_message, EmailConsts.valid_pass);
                return JsonMapper.toJsonString(emailJsonVo);
            }
            //如果验证码并未失效,但是验证码错误
            if (isOneMinute <= 1 && !StringUtils.equalsIgnoreCase(clientCode, code)) {
                model.addAttribute("codeValid", "4");
                EmailJsonVo emailJsonVo = new EmailJsonVo(String.valueOf(RandomUtils.nextLong(10000, 99999)), EmailConsts.valid_unpass_untimeout_message, EmailConsts.valid_unpass_untimeout);
                return JsonMapper.toJsonString(emailJsonVo);

            } else if (StringUtils.equalsIgnoreCase(clientCode, code) && isOneMinute > 1) {
                //验证码时间失效
                model.addAttribute("codeValid", "2");
                EmailJsonVo emailJsonVo = new EmailJsonVo(String.valueOf(RandomUtils.nextLong(10000, 99999)), EmailConsts.valid_unpass_timeout_message, EmailConsts.valid_timeout);
                return JsonMapper.toJsonString(emailJsonVo);
            } else {
                //验证码错误
                model.addAttribute("codeValid", "3");
                EmailJsonVo emailJsonVo = new EmailJsonVo(String.valueOf(RandomUtils.nextLong(10000, 99999)), EmailConsts.valid_unpass_message, EmailConsts.valid_unpass);
                return JsonMapper.toJsonString(emailJsonVo);
            }
        } catch (Exception e) {
            model.addAttribute("codeValid", "3");
            EmailJsonVo emailJsonVo = new EmailJsonVo(String.valueOf(RandomUtils.nextLong(10000, 99999)), EmailConsts.valid_server_error_message, EmailConsts.server_error);
            return JsonMapper.toJsonString(emailJsonVo);
        }
    }

    /**
     * 发送邮件
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("sendEmail")
    public String sendEmailCode(HttpSession session, Model model, @RequestParam(value = "toEmailAddress") String toEmailAddress) {
        String sendEmailUrl = "modules/user/sendEmailUrl";
        String subject = "dagongSoft";
        MailCodeATime mailCodeATime = DagongMailUtils.sendEmailBySAutoGenerateCode(toEmailAddress, subject, DagongMailConst.AutoGenerateCode_TRUE, new Date());
        session.setAttribute(SessionEmailCodeConst.validCode, mailCodeATime.getCode());
        session.setAttribute(SessionEmailCodeConst.validTime, mailCodeATime.getDate());
        session.setAttribute("toEmailAddress", toEmailAddress);
        session.setAttribute(SessionEmailCodeConst.MAIL_CODE_A_TIME, new MailCodeATime(mailCodeATime.getCode(), mailCodeATime.getDate()));
        //记录MsgMailRecord表
        User user = (User) session.getAttribute("user");
        MsgMailRecord msgMailRecord = new MsgMailRecord();
        msgMailRecord.setUser(user);
        msgMailRecord.setMsgId(RandomStringUtils.randomAlphanumeric(4));
        msgMailRecord.setSendDate(new Date());
        msgMailRecord.setTitle(subject);
        msgMailRecord.setMailContent(mailCodeATime.getCode());
        msgMailRecord.setRecAddress(toEmailAddress);
        msgMailRecord.setSendState("1");        //1.已发送
        mailRecordService.save(msgMailRecord);
        model.addAttribute("mode", "accSettings");
        return sendEmailUrl;
    }

    /**
     * 显示邮箱验证界面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("showEmail")//user/validEmailCode/showEmail
    public String showEmailPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if ("101".equals(user.getRoleList().get(0).getId())) {
            model.addAttribute("mode", "accountSet");
        }
        if ("102".equals(user.getRoleList().get(0).getId())) {
            model.addAttribute("mode", "accSettings");
        }
        return "modules/user/email";
    }

    /**
     * 邮箱验证成功的跳转页面
     *
     * @return
     */
    @RequestMapping("emailSuccessPage")
    public String emailSuccessPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if ("101".equals(user.getRoleList().get(0).getId())) {
            model.addAttribute("mode", "accountSet");
        }
        if ("102".equals(user.getRoleList().get(0).getId())) {
            model.addAttribute("mode", "accSettings");
        }
        return "modules/user/emailValidUrl";
    }
}
