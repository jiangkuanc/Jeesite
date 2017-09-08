/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.msg.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.activiti.engine.impl.util.json.JSONObject;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.msg.entity.MsgSmsRecord;
import com.dagongsoft.p2p.msg.service.ISmsStateRecord;
import com.dagongsoft.p2p.msg.service.MsgSmsRecordService;
import com.dagongsoft.p2p.msg.service.Impl.DagongSmsStateRecordImpl;
import com.dagongsoft.p2p.user.web.front.consts.PageRegisterModelConst;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.UserService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 站内信Controller
 *
 * @author zhengshuo
 * @version 2016-09-30
 */
@Controller
@RequestMapping(value = "${adminPath}/msg/msgSmsRecord")
public class MsgSmsRecordController extends BaseController {

    @Autowired
    private MsgSmsRecordService msgSmsRecordService;
    @Autowired
    private UserService userService;

    @ModelAttribute
    public MsgSmsRecord get(@RequestParam(required = false) String id) {
        MsgSmsRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = msgSmsRecordService.get(id);
        }
        if (entity == null) {
            entity = new MsgSmsRecord();
        }
        return entity;
    }

    @RequestMapping(value = {"list", ""})
    public String list(MsgSmsRecord msgSmsRecord, HttpServletRequest request,
                       HttpServletResponse response, Model model) {
        String ris = "\"";
        if (msgSmsRecord.getRecId() != null && !"".equals(msgSmsRecord.getRecId())) {
            String recIdStr[] = msgSmsRecord.getRecId().split(",");
            for (int i = 0; i < recIdStr.length; i++) {
                ris += recIdStr[i] + "\",\"";
            }
            msgSmsRecord.setRecId(ris.substring(0, ris.length() - 2));
        }
        Page<MsgSmsRecord> page = msgSmsRecordService.findPage(new Page<MsgSmsRecord>(request, response), msgSmsRecord);
        List<MsgSmsRecord> listAll = page.getList();
        /*
         * for(MsgSmsRecord m:listAll){ if(m!=null){ User user =
		 * userService.findOneUserFromId(m.getRecId()); if(user!=null){
		 * m.setRecId(user.getLoginName()); } } }
		 */
        model.addAttribute("page", page);
        return "modules/msg/msgSmsRecordList";
    }

    @RequestMapping(value = "form")
    public String form(MsgSmsRecord msgSmsRecord, Model model) {
        model.addAttribute("msgSmsRecord", msgSmsRecord);
        return "modules/msg/msgSmsRecordForm";
    }

    @RequestMapping(value = "view")
    public String view(MsgSmsRecord msgSmsRecord, Model model) {
        model.addAttribute("msgSmsRecord", msgSmsRecord);
        return "modules/msg/msgSmsRecordFormView";
    }

    @RequestMapping(value = "save")
    public String save(MsgSmsRecord msgSmsRecord, Model model,
                       RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, msgSmsRecord)) {
            return form(msgSmsRecord, model);
        }
        // 群发
        if (msgSmsRecord.getRecId().indexOf(",") != -1) {
            String[] arrRecIds = msgSmsRecord.getRecId().split(",");
            for (int i = 0; i < arrRecIds.length; i++) {
                MsgSmsRecord m = new MsgSmsRecord();
                m.setUser(msgSmsRecord.getUser());
                m.setRecId(arrRecIds[i]);
                m.setSendDate(new Date());
                m.setSmsContent(msgSmsRecord.getSmsContent());
                addMessage(redirectAttributes, "保存短信发送信息成功");
                msgSmsRecordService.save(m);
            }
        } else {
            msgSmsRecord.setSendDate(new Date());
            addMessage(redirectAttributes, "保存短信发送信息成功");
            msgSmsRecordService.save(msgSmsRecord);
        }
        return "redirect:" + Global.getAdminPath()
                + "/msg/msgSmsRecord/?repage";
    }

    @RequestMapping(value = "delete")
    public String delete(MsgSmsRecord msgSmsRecord,
                         RedirectAttributes redirectAttributes) {
        msgSmsRecordService.delete(msgSmsRecord);
        addMessage(redirectAttributes, "删除短信发送信息成功");
        return "redirect:" + Global.getAdminPath()
                + "/msg/msgSmsRecord/?repage";
    }

    @ResponseBody
    @RequestMapping(value = "getListByUserId")
    public List<MsgSmsRecord> getListByUserId(String userId) {
        List<MsgSmsRecord> listByUserId = msgSmsRecordService
                .getListByUserId(userId);
        return listByUserId;
    }

    @ResponseBody
    @RequestMapping(value = "sendLetter")
    public void sendLetter(HttpServletRequest request,
                           HttpServletResponse response, Model model, String userId) {
        try {
            PrintWriter writer = response.getWriter();
            List<MsgSmsRecord> list = msgSmsRecordService
                    .getListByUserId(userId);
            if (list.size() > 0) {
                for (MsgSmsRecord letter : list) {
                    writer.flush();
                }
            }
            writer.flush();
            writer.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }

    }

    /**
     * 发送短信验证码
     *
     * @param session
     * @param model
     * @param smsPhone
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "sendSms", method = RequestMethod.POST)
    public String sendSms(HttpSession session, Model model, @RequestParam("smsPhone") String smsPhone) throws Exception {
        User user = (User) session.getAttribute("user");
        sendMsg(smsPhone, session, new Date());
        MsgSmsRecord msgSmsRecord = new MsgSmsRecord();
//		user.setPhone(smsPhone);
//		userService.updatePhone(user);
        session.setAttribute(SmsPhoneCodeConst.SmsPhone, smsPhone);
        session.setAttribute(SmsPhoneCodeConst.SmsPhoneTime, new Date());
        msgSmsRecord.setUser(user);
        msgSmsRecord.setMsgId(RandomStringUtils.randomNumeric(10));
        msgSmsRecord.setSmsContent((String) session.getAttribute(SmsPhoneCodeConst.Content));
        msgSmsRecord.setRecId(user.getId());
        msgSmsRecord.setSendDate(new Date());
        msgSmsRecord.setSendState("1");//记录消息发送
        msgSmsRecord.setTelnum(smsPhone);

        msgSmsRecordService.save(msgSmsRecord);

        return "modules/user/sendPhoneUrl"; // 跳转到输入验证码页面

    }

    /**
     * 注册时发送短信验证码
     *
     * @param session
     * @param smsPhone
     * @return
     * @throws Exception
     */
    @RequestMapping("sendRegSmsRestful")
    @ResponseBody
    public String sendRegSmsRestful(HttpSession session, @RequestParam(value = "smsPhone") String smsPhone) throws Exception {
        SmsJsonStatus smsJsonStatus = new SmsJsonStatus();
        try {
            Date date = new Date();
            boolean flag = false;
            //查询每个手机号当天接收短信条数  超出限制则不发送请求
            int count = msgSmsRecordService.getCountByOhone(smsPhone);
            if (count < 100) {
                flag = sendSmsApi(smsPhone, session, date, 1);
            }
            String content = (String) session.getAttribute(SmsPhoneCodeConst.Content);
            System.err.println(content);
            String recId = userService.getIdByPhone(smsPhone);
            //录入数据库
            MsgSmsRecord msgSmsRecord = new MsgSmsRecord();
            msgSmsRecord.setUser(UserUtils.get("1"));
            msgSmsRecord.setSmsContent(content);
            if (recId != null && !"".equals(recId)) {
                msgSmsRecord.setRecId(recId);
            }
            msgSmsRecord.setSendDate(date);
            msgSmsRecord.setTelnum(smsPhone);
            if (flag) {
                smsJsonStatus.setMessage("发送成功");
                smsJsonStatus.setStatus("1");
                msgSmsRecord.setSendState(smsJsonStatus.getStatus());
                msgSmsRecordService.save(msgSmsRecord);
                session.setAttribute(SmsPhoneCodeConst.SmsPhoneTime, date);
                return JsonMapper.toJsonString(smsJsonStatus); // 跳转到输入验证码页面
            } else {
                /**
                 *  发送短信失败进行记录
                 */
                smsJsonStatus.setMessage("发送失败");
                smsJsonStatus.setStatus("0");
                msgSmsRecord.setSendState(smsJsonStatus.getStatus());
                msgSmsRecordService.save(msgSmsRecord);
                return JsonMapper.toJsonString(smsJsonStatus); // 跳转到输入验证码页面
            }
        } catch (Exception e) {
            e.printStackTrace();
            smsJsonStatus.setMessage("服务器端未知错误");
            smsJsonStatus.setStatus("3");
            return JsonMapper.toJsonString(smsJsonStatus);
        }
    }

    /**
     * 忘记密码时发送短信验证码
     *
     * @param session
     * @param smsPhone
     * @return
     * @throws Exception
     */
    @RequestMapping("sendRegSmsRestful2")
    @ResponseBody
    public String sendRegSmsRestful2(HttpSession session, @RequestParam(value = "smsPhone") String smsPhone) throws Exception {
        SmsJsonStatus smsJsonStatus = new SmsJsonStatus();
        try {
            Date date = new Date();
            boolean flag = false;
            //查询每个手机号当天接收短信条数  超出限制则不发送请求
            int count = msgSmsRecordService.getCountByOhone(smsPhone);
            if (count < 100) {
                flag = sendSmsApi(smsPhone, session, date, 2);
            }
            String content = (String) session.getAttribute(SmsPhoneCodeConst.Content);
            String recId = userService.getIdByPhone(smsPhone);
            //录入数据库
            MsgSmsRecord msgSmsRecord = new MsgSmsRecord();
            msgSmsRecord.setUser(UserUtils.get("1"));
            msgSmsRecord.setSmsContent(content);
            if (recId != null && !"".equals(recId)) {
                msgSmsRecord.setRecId(recId);
            }
            msgSmsRecord.setSendDate(date);
            msgSmsRecord.setTelnum(smsPhone);
            if (flag) {
                smsJsonStatus.setMessage("发送成功");
                smsJsonStatus.setStatus("1");
                msgSmsRecord.setSendState(smsJsonStatus.getStatus());
                msgSmsRecordService.save(msgSmsRecord);
                session.setAttribute(SmsPhoneCodeConst.SmsPhoneTime, date);
                return JsonMapper.toJsonString(smsJsonStatus); // 跳转到输入验证码页面
            } else {
                /**
                 *  发送短信失败进行记录
                 */
                smsJsonStatus.setMessage("发送失败");
                smsJsonStatus.setStatus("0");
                msgSmsRecord.setSendState(smsJsonStatus.getStatus());
                msgSmsRecordService.save(msgSmsRecord);
                return JsonMapper.toJsonString(smsJsonStatus); // 跳转到输入验证码页面
            }
        } catch (Exception e) {
            smsJsonStatus.setMessage("服务器端未知错误");
            smsJsonStatus.setStatus("3");
            return JsonMapper.toJsonString(smsJsonStatus);
        }
    }


    /**
     * 校验验证码是否正确
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("validSmsCode")
    public String validSmsCode(HttpSession session, @RequestParam("smsCode") String smsCode) {
        SmsJsonStatus smsJsonStatus = null;
        try {
            long curTime = System.currentTimeMillis();                 // 生成当前的时间戳
            User user = (User) session.getAttribute("user");
            String smsPhoneCode = (String) session.getAttribute(SmsPhoneCodeConst.SmsPhoneCode);    // 从Session中取得验证码
            long smsTime = ((Date) session.getAttribute(SmsPhoneCodeConst.SmsPhoneTime)).getTime();
            long expiredTime = (curTime - smsTime) / (60000);
            if (user != null) {
                //短信验证码的时间有效期为10分钟以内
                if (StringUtils.equalsIgnoreCase(smsPhoneCode, smsCode)) {
                    if (expiredTime <= 10) {
                        smsJsonStatus = new SmsJsonStatus("1", "验证成功");
                        String phone = (String) session.getAttribute(SmsPhoneCodeConst.SmsPhone);
                        if (phone != null && !"".equals(phone)) {
                            user.setPhone(phone);
                            userService.updatePhone(user);
                        }
                        session.setAttribute(SmsPhoneCodeConst.SmsPhoneTime, null);
                        return JsonMapper.toJsonString(smsJsonStatus);
                    } else {
                        smsJsonStatus = new SmsJsonStatus("3", "验证码已过期");
                        return JsonMapper.toJsonString(smsJsonStatus);
                    }
                } else {
                    smsJsonStatus = new SmsJsonStatus("0", "验证码错误");
                    return JsonMapper.toJsonString(smsJsonStatus);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            smsJsonStatus = new SmsJsonStatus("2", "服务器未知异常");
            return JsonMapper.toJsonString(smsJsonStatus);
        }
        smsJsonStatus = new SmsJsonStatus("0", "验证失败");
        return smsCode;

    }

    /**
     * 注册时，校验验证码是否正确
     *
     * @return
     * @author Quincy
     */
    @ResponseBody
    @RequestMapping("validSmsCode2")
    public String validSmsCode2(HttpSession session, @RequestParam("smsCode") String smsCode) {
        JSONObject json = null;
        try {
            json = new JSONObject();
            long curTime = System.currentTimeMillis();                 // 生成当前的时间戳
            System.out.println(SmsPhoneCodeConst.SmsPhoneCode);
            String smsPhoneCode = (String) session.getAttribute(SmsPhoneCodeConst.SmsPhoneCode);    // 从Session中取得验证码
            long smsTime = ((Date) session.getAttribute(SmsPhoneCodeConst.SmsPhoneTime)).getTime();
            long expiredTime = (curTime - smsTime) / (60000);
            if (StringUtils.equalsIgnoreCase(smsPhoneCode, smsCode) && expiredTime <= 10) {
                json.put("valid", true);
            } else {
                json.put("valid", false);
            }
        } catch (Exception e) {
            e.printStackTrace();
            json.put("valid", false);
        }
        return json.toString();
    }

    /**
     * 向指定手机发送信息内容
     *
     * @param session
     * @param date
     * @param smsContent
     * @param smsPhone
     * @return
     * @throws Exception
     */
    @RequestMapping("/sendSmsContent")
    @ResponseBody
    public String sendMsgTip(HttpSession session, Date date,
                             @RequestParam("smsContent") String smsContent,
                             @RequestParam("smsPhone") String smsPhone) throws Exception {


        User user = (User) session.getAttribute("user");
        if (sendSmsApi(smsPhone, session, date, smsContent) == Boolean.TRUE) {
            MsgSmsRecord msgSmsRecord = new MsgSmsRecord();
            msgSmsRecord.setUser(user);
            msgSmsRecord.setMsgId(RandomStringUtils.randomNumeric(10));
            msgSmsRecord.setSmsContent((String) session.getAttribute(SmsPhoneCodeConst.Content));
            msgSmsRecord.setRecId(user.getId());
            msgSmsRecord.setSendDate(new Date());
            msgSmsRecord.setSendState("1");
            msgSmsRecord.setTelnum(smsPhone);
            msgSmsRecordService.save(msgSmsRecord);
            SmsJsonStatus smsJsonStatus = new SmsJsonStatus("2", "手机内容发送成功");
            return JsonMapper.toJsonString(smsJsonStatus);
        }
        SmsJsonStatus smsJsonStatus = new SmsJsonStatus("0", "手机内容发送失败");
        return JsonMapper.toJsonString(smsJsonStatus);
    }

    public String sendSmsRestful(HttpSession session, Model model, @RequestParam(value = "smsPhone") String smsPhone) throws Exception {
        SmsJsonStatus smsJsonStatus = new SmsJsonStatus();
        MsgSmsRecord msgSmsRecord = null;
        ISmsStateRecord smsStateRecord = new DagongSmsStateRecordImpl(msgSmsRecordService);
        try {
            User user = (User) session.getAttribute("user");
            /**
             * 校验该手机号是否注册
             */
            if (smsStateRecord.isSmsPhoneCertify(user.getId(), msgSmsRecordService)) {
                smsJsonStatus.setMessage("该手机号已注册");
                smsJsonStatus.setStatus("2");
                return JsonMapper.toJsonString(smsJsonStatus);
            }
            if (sendSmsApi(smsPhone, session, new Date(), 1)) {
                /**
                 * 短信发送成功进行记录
                 */
                msgSmsRecord = smsStateRecord.recordSmsSuccessState(msgSmsRecord, user, session);
                msgSmsRecord.setTelnum(smsPhone);
                msgSmsRecordService.save(msgSmsRecord);
                smsJsonStatus.setMessage("发送成功");
                smsJsonStatus.setStatus("1");
                return JsonMapper.toJsonString(smsJsonStatus); // 跳转到输入验证码页面
            } else {
                /**
                 *  发送短信失败进行记录
                 */
                msgSmsRecord = smsStateRecord.recordSmsFailureState(msgSmsRecord, user, session);
                msgSmsRecord.setTelnum(smsPhone);
                msgSmsRecordService.save(msgSmsRecord);
                smsJsonStatus.setMessage("发送失败");
                smsJsonStatus.setStatus("0");
                return JsonMapper.toJsonString(smsJsonStatus); // 跳转到输入验证码页面
            }
        } catch (Exception e) {
            smsJsonStatus.setMessage("服务器端未知错误");
            smsJsonStatus.setStatus("3");
            return JsonMapper.toJsonString(smsJsonStatus);
        }
    }


    @RequestMapping("/sendSmsRestfulPhone")
    @ResponseBody
    public String sendSmsRestfulPhone(HttpSession session, Model model, @RequestParam(value = "smsPhone") String smsPhone) throws Exception {
        SmsJsonStatus smsJsonStatus = new SmsJsonStatus();
        MsgSmsRecord msgSmsRecord = null;
        ISmsStateRecord smsStateRecord = new DagongSmsStateRecordImpl(msgSmsRecordService);
        try {
            User user = (User) session.getAttribute("user");
            if (sendSmsApi(smsPhone, session, new Date(), 1)) {
                /**
                 * 短信发送成功进行记录
                 */
                msgSmsRecord = smsStateRecord.recordSmsSuccessState(msgSmsRecord, user, session);
                msgSmsRecord.setTelnum(smsPhone);
                msgSmsRecordService.save(msgSmsRecord);
                smsJsonStatus.setMessage("发送成功");
                smsJsonStatus.setStatus("1");
                return JsonMapper.toJsonString(smsJsonStatus); // 跳转到输入验证码页面
            } else {
                /**
                 *  发送短信失败进行记录
                 */
                msgSmsRecord = smsStateRecord.recordSmsFailureState(msgSmsRecord, user, session);
                msgSmsRecord.setTelnum(smsPhone);
                msgSmsRecordService.save(msgSmsRecord);
                smsJsonStatus.setMessage("发送失败");
                smsJsonStatus.setStatus("0");
                return JsonMapper.toJsonString(smsJsonStatus); // 跳转到输入验证码页面
            }
        } catch (Exception e) {
            smsJsonStatus.setMessage("服务器端未知错误");
            smsJsonStatus.setStatus("3");
            return JsonMapper.toJsonString(smsJsonStatus);
        }
    }


    /**
     * 发送短信验证码
     *
     * @param phone
     * @param session
     * @param date
     * @return
     * @throws Exception
     */
    private boolean sendMsg(String phone, HttpSession session, Date date)
            throws Exception {
        HttpPost post = null;
        post = new HttpPost("https://dx.ipyy.net/smsJson.aspx");
        boolean isCodeOk = Boolean.FALSE; // 是否发送成功标志
        String result = null;
        try {
            if (Boolean.TRUE == sendSmsApi(phone, session, date, 1)) {
                isCodeOk = Boolean.TRUE;
            }
            return isCodeOk;
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            return isCodeOk;
        } finally {
            post.releaseConnection();
        }

    }

    /**
     * 产生4为随机数
     *
     * @return
     */
    private String generateCode(HttpSession session, Date date) {
        String code = RandomStringUtils.randomNumeric(6);
        session.removeAttribute(SmsPhoneCodeConst.SmsPhoneCode); // 清空session保存的手机验证码
        session.removeAttribute(SmsPhoneCodeConst.SmsPhoneTime); // 清空session保存的时间
        session.setAttribute(SmsPhoneCodeConst.SmsPhoneCode, code); // 保存到session中
        session.setAttribute(SmsPhoneCodeConst.SmsPhoneTime, date);
        return code;
    }

    /**
     * 显示手机验证码页面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("showSmsPage")
    public String showSmsPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return PageRegisterModelConst.LOGIN_URL; // 如果未登录,则跳转到首页
        }
        List<MsgSmsRecord> msgSmsList = msgSmsRecordService
                .getListByUserId(user.getId());
        model.addAttribute("msgSmsList", msgSmsList);
        String phone = user.getPhone();
        model.addAttribute("smsPhonePlaceHonder", phone);
        session.setAttribute("validPhone", phone);
        model.addAttribute("phoneNumber", user.getPhone());
        return "modules/user/sms"; // 进入,手机验证页面
    }

    /**
     * 显示手机验证码页面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("showSmsPage2")
    public String showSmsPage2(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return PageRegisterModelConst.LOGIN_URL; // 如果未登录,则跳转到首页
        }
        String phone = user.getPhone();
        phone = phone.replaceAll("(\\d{3})\\d{4}(\\d{4})", "$1****$2");
        model.addAttribute("smsPhonePlaceHonder", phone);
        session.setAttribute("validPhone", phone);
        return "modules/user/sms2"; // 进入,手机验证页面
    }

    /**
     * 内部类,用于生成Json格式数据
     *
     * @author DAGONG
     */
    class SmsJsonStatus {
        public String status;
        public String message;

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        @Override
        public String toString() {
            return "SmsJsonStatus [status=" + status + ", message=" + message
                    + "]";
        }

        public SmsJsonStatus() {
        }

        public SmsJsonStatus(String status, String message) {
            this.status = status;
            this.message = message;
        }
    }

    /**
     * 发送Sms验证码消息
     *
     * @param phone
     * @param session
     * @param date
     * @param mode    1：注册时发送	2：忘记密码时发送
     * @return
     * @throws Exception
     */
    private boolean sendSmsApi(String phone, HttpSession session, Date date, int mode)
            throws Exception {
        try {
            String result = "";
            HttpPost post = null;
            HttpClient client = new SSLClient();
            String content = generateCode(session, date);
            post = new HttpPost("https://dx.ipyy.net/smsJson.aspx");
            List<NameValuePair> list = new ArrayList<NameValuePair>();
            list.add(new BasicNameValuePair("userid", ""));
            list.add(new BasicNameValuePair("account", "KA00002"));
            list.add(new BasicNameValuePair("password", Md5Utils.md5("KA0000200")));
            list.add(new BasicNameValuePair("mobile", phone));
            if (mode == 1) {
                list.add(new BasicNameValuePair("content", "尊敬的用户您好：您的验证码为" + content + "，有效期为10分钟。欢迎您加入丝路互金网！【丝路互金网】"));
            } else if (mode == 2) {
                list.add(new BasicNameValuePair("content", "尊敬的用户您好：您的验证码为" + content + "，有效期为10分钟。您正在进行手机验证，如非本人操作，建议立即更改账户密码。【丝路互金网】"));
            }

            list.add(new BasicNameValuePair("sendTime", ""));
            list.add(new BasicNameValuePair("extno", ""));
            list.add(new BasicNameValuePair("action", "send"));
            UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list,
                    "utf-8");
            session.setAttribute(SmsPhoneCodeConst.Content, content);
            post.setEntity(entity);
            HttpResponse response = client.execute(post);
            if (response != null) {
                HttpEntity resEntity = response.getEntity();
                if (resEntity != null) {
                    result = EntityUtils.toString(resEntity, "utf-8");
                    if (StringUtils.contains(result, "操作成功")) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }

    /**
     * 发送Sms消息内容(验证码)
     *
     * @param phone
     * @param session
     * @param date
     * @return
     * @throws Exception
     */
    private boolean sendSmsApi(String phone, HttpSession session, Date date,
                               String content) throws Exception {
        HttpPost post = null;
        try {
            String result = "";
            HttpClient client = new SSLClient();
            post = new HttpPost("https://dx.ipyy.net/smsJson.aspx");
            List<NameValuePair> list = new ArrayList<NameValuePair>();
            list.add(new BasicNameValuePair("userid", ""));
            list.add(new BasicNameValuePair("account", "KA00002"));
            list.add(new BasicNameValuePair("password", Md5Utils
                    .md5("KA0000200")));
            list.add(new BasicNameValuePair("mobile", phone));
            list.add(new BasicNameValuePair("content", "您好，您的验证码：" + content
                    + "【大公数据】"));
            list.add(new BasicNameValuePair("sendTime", ""));
            list.add(new BasicNameValuePair("extno", ""));
            list.add(new BasicNameValuePair("action", "send"));
            UrlEncodedFormEntity entity = new UrlEncodedFormEntity(list,
                    "utf-8");
            session.setAttribute(SmsPhoneCodeConst.Content, content);
            post.setEntity(entity);
            HttpResponse response = client.execute(post);
            if (response != null) {
                HttpEntity resEntity = response.getEntity();
                if (resEntity != null) {
                    result = EntityUtils.toString(resEntity, "utf-8");
                    if (StringUtils.contains(result, "操作成功")) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }
}