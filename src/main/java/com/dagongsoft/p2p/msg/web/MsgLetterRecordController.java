/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.msg.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.msg.entity.MsgLetterRecord;
import com.dagongsoft.p2p.msg.service.MsgLetterRecordService;
import com.dagongsoft.p2p.user.web.front.util.StringUtil;
import com.dagongsoft.p2p.utils.FormatData2Json;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
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
@RequestMapping(value = "${adminPath}/msg/msgLetterRecord")
public class MsgLetterRecordController extends BaseController {

    @Autowired
    private MsgLetterRecordService msgLetterRecordService;
    @Autowired
    private UserService userService;

    @ModelAttribute
    public MsgLetterRecord get(@RequestParam(required = false) String id) {
        MsgLetterRecord entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = msgLetterRecordService.get(id);
        }
        if (entity == null) {
            entity = new MsgLetterRecord();
        }
        return entity;
    }


    /**
     * 查询消息通知详情页
     *
     * @param recId
     * @param model
     * @return
     */
    @RequestMapping("showByRecId")
    public String showByRecId(@RequestParam("recId") String recId, Model model) {
        MsgLetterRecord msgLetterRecordRec = msgLetterRecordService.get(recId);
        model.addAttribute("msgLetterRecordRec", msgLetterRecordRec);
        return "modules/msg/msgLetterRecordPage";
    }

    @RequestMapping(value = {"list", ""})
    public String list(MsgLetterRecord msgLetterRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<MsgLetterRecord> page = msgLetterRecordService.findPage(new Page<MsgLetterRecord>(request, response), msgLetterRecord);
            List<MsgLetterRecord> listAll = page.getList();
            for (MsgLetterRecord m : listAll) {
                if (m != null) {
                    User user = userService.findOneUserFromId(m.getRecId());
                    if (user != null) {
                        m.setRecId(user.getLoginName());
                    }
                }
            }
            model.addAttribute("page", page);
            return "modules/msg/msgLetterRecordList";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    @RequestMapping(value = "form")
    public String form(MsgLetterRecord msgLetterRecord, Model model) {
        model.addAttribute("msgLetterRecord", msgLetterRecord);
        return "modules/msg/msgLetterRecordForm";
    }


    @RequestMapping(value = "view")
    public String view(MsgLetterRecord msgLetterRecord, Model model) {
        msgLetterRecord.setContent(StringUtils.replaceHtml(StringUtil.formatHTMLOut(msgLetterRecord.getContent())));
        msgLetterRecord.setRecId(UserUtils.getUserNameById(msgLetterRecord.getRecId()));
        model.addAttribute("msgLetterRecord", msgLetterRecord);
        return "modules/msg/msgLetterRecordFormView";
    }


    @RequestMapping(value = "save")
    public String save(MsgLetterRecord msgLetterRecord, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, msgLetterRecord)) {
            return form(msgLetterRecord, model);
        }
        //群发
        if (msgLetterRecord.getRecId().indexOf(",") != -1) {
            String[] arrRecIds = msgLetterRecord.getRecId().split(",");
            for (int i = 0; i < arrRecIds.length; i++) {
                MsgLetterRecord m = new MsgLetterRecord();
                m.setUser(msgLetterRecord.getUser());
                m.setRecId(arrRecIds[i]);
                m.setSendDate(new Date());
                m.setTitle(msgLetterRecord.getTitle());
                m.setContent(msgLetterRecord.getContent());
                m.setReadState("0");
                addMessage(redirectAttributes, "保存站内信成功");
                msgLetterRecordService.save(m);
            }
        } else {
            msgLetterRecord.setSendDate(new Date());
            msgLetterRecord.setReadState("0");//未读
            addMessage(redirectAttributes, "保存站内信成功");
            msgLetterRecordService.save(msgLetterRecord);
        }
        return "redirect:" + Global.getAdminPath() + "/msg/msgLetterRecord/?repage";
    }

    /**
     * 我的消息列表
     *
     * @param msgLetterRecord
     * @param model
     * @param request
     * @param response
     * @return
     * @author Chace
     */
    @RequestMapping("getMsgList")
    public String getMsgList(HttpSession session, MsgLetterRecord msgLetterRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        try {
            msgLetterRecord.setRecId(user.getId());
            List<MsgLetterRecord> list = msgLetterRecordService.findList(msgLetterRecord);
            List<MsgLetterRecord> list2 = new ArrayList<MsgLetterRecord>();
            for (MsgLetterRecord m : list) {
                MsgLetterRecord msgLetterRecord4 = new MsgLetterRecord();
                msgLetterRecord4.setId(m.getId());
                msgLetterRecord4.setReadState(m.getReadState());
                list2.add(msgLetterRecord4);
            }
            String jsonlist = JsonMapper.toJsonString(list2);
            Iterator<MsgLetterRecord> it = list.iterator();
            while (it.hasNext()) {
                MsgLetterRecord m = it.next();
                m.setContent(StringEscapeUtils.unescapeHtml4(m.getContent()));
            }
            MsgLetterRecord msgLetterRecord2 = new MsgLetterRecord();
            msgLetterRecord2.setReadState("0");
            msgLetterRecord2.setRecId(user.getId());
            int unReadJson = msgLetterRecordService.getUnReadMessageJson(msgLetterRecord2);
            MsgLetterRecord msgLetterRecord3 = new MsgLetterRecord();
            msgLetterRecord3.setReadState("1");
            msgLetterRecord3.setRecId(user.getId());
            int readJson = msgLetterRecordService.getReadMessageJson(msgLetterRecord3);
            model.addAttribute("user", user);
            model.addAttribute("list", list);
            model.addAttribute("unReadJson", unReadJson);
            model.addAttribute("readJson", readJson);
            model.addAttribute("jsonlist", jsonlist);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/msg/msgLetterRecordList2";
    }

    /**
     * 我的消息列表
     *
     * @param msgLetterRecord(机构+融资)
     * @param model
     * @param request
     * @param response
     * @return
     * @author Chace
     */
    @RequestMapping("getMsgList2")
    public String getMsgList2(HttpSession session, MsgLetterRecord msgLetterRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        try {
            msgLetterRecord.setRecId(user.getId());
            List<MsgLetterRecord> list = msgLetterRecordService.findList(msgLetterRecord);
            List<MsgLetterRecord> list2 = new ArrayList<MsgLetterRecord>();

            for (MsgLetterRecord m : list) {
                MsgLetterRecord msgLetterRecord4 = new MsgLetterRecord();
                msgLetterRecord4.setId(m.getId());
                msgLetterRecord4.setReadState(m.getReadState());
                list2.add(msgLetterRecord4);
            }
            String jsonlist = JsonMapper.toJsonString(list2);
            Iterator<MsgLetterRecord> it = list.iterator();
            while (it.hasNext()) {
                MsgLetterRecord m = it.next();
                m.setContent(StringEscapeUtils.unescapeHtml4(m.getContent()));
            }
            MsgLetterRecord msgLetterRecord2 = new MsgLetterRecord();
            msgLetterRecord2.setReadState("0");
            msgLetterRecord2.setRecId(user.getId());
            int unReadJson = msgLetterRecordService.getUnReadMessageJson(msgLetterRecord2);
            MsgLetterRecord msgLetterRecord3 = new MsgLetterRecord();
            msgLetterRecord3.setReadState("1");
            msgLetterRecord3.setRecId(user.getId());
            int readJson = msgLetterRecordService.getReadMessageJson(msgLetterRecord3);
            model.addAttribute("user", user);
            model.addAttribute("list", list);
            model.addAttribute("unReadJson", unReadJson);
            model.addAttribute("readJson", readJson);
            model.addAttribute("jsonlist", jsonlist);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/msg/msgLetterRecord";
    }

    /**
     * 删除消息
     *
     * @param msgLetterRecord
     * @author Chace
     */
    @RequestMapping("deleteMsg")
    @ResponseBody
    public String deleteMsg(MsgLetterRecord msgLetterRecord) {
        try {
            msgLetterRecordService.delete(msgLetterRecord);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }

    /**
     * 标记为已读
     */
    @RequestMapping("markRead")
    @ResponseBody
    public String markRead(MsgLetterRecord msgLetterRecord) {
        try {
            msgLetterRecordService.markRead(msgLetterRecord);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }

    /**
     * 查看消息详情
     */
    @RequestMapping("getById")
    public String getById(MsgLetterRecord msgLetterRecord, Model model, HttpSession session, String msgId) {

        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        try {
            msgLetterRecord.setId(msgId);
            msgLetterRecordService.markRead(msgLetterRecord);
            MsgLetterRecord msgLetterRecord2 = new MsgLetterRecord();
            msgLetterRecord2.setReadState("0");
            msgLetterRecord2.setRecId(user.getId());
            int unReadJson = msgLetterRecordService.getUnReadMessageJson(msgLetterRecord2);
            MsgLetterRecord msgLetterRecord3 = new MsgLetterRecord();
            msgLetterRecord3.setReadState("1");
            msgLetterRecord3.setRecId(user.getId());
            int readJson = msgLetterRecordService.getReadMessageJson(msgLetterRecord3);
            msgLetterRecord = msgLetterRecordService.getById(msgLetterRecord);
            String content = StringEscapeUtils.unescapeHtml4(msgLetterRecord.getContent());
            msgLetterRecord.setContent(content);
            model.addAttribute("unReadJson", unReadJson);
            model.addAttribute("readJson", readJson);
            model.addAttribute("msgLetterRecord", msgLetterRecord);
            model.addAttribute("user", user);
        } catch (Exception e) {

        }

        return "modules/msg/msgLetterRecordList3";
    }

    /**
     * 未读消息
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("unReadMessage")
    public String unReadMessage(HttpSession session, Model model, MsgLetterRecord msgLetterRecord) {
        List<MsgLetterRecord> unReadList = msgLetterRecordService.getListUnReadMessage(msgLetterRecord);
        model.addAttribute("unReadList", unReadList);
        return "modules/msg/msgLetterRecordPage";
    }

    /**
     * 未读消息json格式
     *
     * @param session
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping("unReadMessageCount")
    public String unReadMessageCount(HttpSession session, Model model, MsgLetterRecord msgLetterRecord) {
        msgLetterRecord.setReadState("0");
        User user = (User) session.getAttribute("user");
        msgLetterRecord.setRecId(user.getId());
        int unReadJson = msgLetterRecordService.getUnReadMessageJson(msgLetterRecord);
        model.addAttribute("unReadJson", unReadJson);
        return JsonMapper.toJsonString(unReadJson);
    }

    /**
     * 已读消息json格式
     *
     * @param session
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping("readMessageCount")
    public String readMessageCount(HttpSession session, Model model, MsgLetterRecord msgLetterRecord) {
        msgLetterRecord.setReadState("1");
        User user = (User) session.getAttribute("user");
        msgLetterRecord.setRecId(user.getId());
        int readJson = msgLetterRecordService.getReadMessageJson(msgLetterRecord);
        model.addAttribute("unReadList", readJson);
        return JsonMapper.toJsonString(readJson);
    }


    @RequestMapping(value = "delete")
    public String delete(MsgLetterRecord msgLetterRecord, RedirectAttributes redirectAttributes) {
        msgLetterRecordService.delete(msgLetterRecord);
        addMessage(redirectAttributes, "删除站内信成功");
        return "redirect:" + Global.getAdminPath() + "/msg/msgLetterRecord/?repage";
    }

    @ResponseBody
    @RequestMapping(value = "getListByUserId")
    public List<MsgLetterRecord> getListByUserId(String userId) {
        List<MsgLetterRecord> listByUserId = msgLetterRecordService.getListByUserId(userId);
        return listByUserId;
    }

    @ResponseBody
    @RequestMapping(value = "sendLetter")
    public void sendLetter(HttpServletRequest request, HttpServletResponse response, Model model, String userId) {
        try {
            PrintWriter writer = response.getWriter();
            List<MsgLetterRecord> list = msgLetterRecordService.getListByUserId(userId);
            if (list.size() > 0) {
                for (MsgLetterRecord letter : list) {
                    writer.print(letter.getTitle());
                    writer.flush();
                }
            }
            writer.flush();
            writer.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }


    @RequestMapping(value = "unReadMsgNum")
    public void unReadMsgNum(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        MsgLetterRecord msgLetterRecord2 = new MsgLetterRecord();
        msgLetterRecord2.setReadState("0");
        msgLetterRecord2.setRecId(user.getId());
        int unReadJson = msgLetterRecordService.getUnReadMessageJson(msgLetterRecord2);
        Map map = new HashMap();
        map.put("unRead", unReadJson);
        FormatData2Json.writeJson(response, map);
    }

}