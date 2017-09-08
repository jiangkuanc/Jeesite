package com.dagongsoft.p2p.msg.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dagongsoft.p2p.msg.entity.MsgLetterRecord;
import com.dagongsoft.p2p.msg.service.MsgLetterRecordService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.UserService;

@Controller
@RequestMapping(value = "${adminPath}/msg/msg")
public class MsgController {
    @Autowired
    private MsgLetterRecordService msgLetterRecordService;
    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "sendLetter")
    public void sendLetter(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam("userId") String userId) {
        try {
            PrintWriter writer = response.getWriter();
            List<MsgLetterRecord> list = msgLetterRecordService.getListByUserId(userId);
            if (list.size() > 0) {
                for (MsgLetterRecord letter : list) {
                    writer.print(letter.getTitle() + "#_#" + letter.getReadState() + "#_#" + list.size() + "#_#" + letter.getId() + "#_#");
                    writer.flush();
                }
            } else {
                writer.print(userId);
                writer.flush();
            }
            writer.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }

    }

    @RequestMapping(value = "formView")
    public String formView(String id, Model model) {
        MsgLetterRecord msgLetterRecord2 = msgLetterRecordService.get2(id);
        User user = userService.get2(msgLetterRecord2.getUser().getId());
        if (msgLetterRecord2.getContent() != null) {
            msgLetterRecord2.setContent(StringEscapeUtils.unescapeHtml4(
                    msgLetterRecord2.getContent()));
        }
        model.addAttribute("msgLetterRecord", msgLetterRecord2)
                .addAttribute("name", user.getName());
             /*.addAttribute("dictLabel2",dictLabel2);*/
        return "modules/msg/msgLetterRecordFormView";
    }

    @RequestMapping(value = "listQianTai")
    public String listQianTai(@RequestParam("id") String id, MsgLetterRecord msgLetterRecord, HttpServletResponse response, Model model, HttpServletRequest request) {
        MsgLetterRecord msgLetterRecord2 = msgLetterRecordService.get2(id);
        Page<MsgLetterRecord> page = msgLetterRecordService.findPage(new Page<MsgLetterRecord>(request, response), msgLetterRecord2);
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
        return "modules/msg/msgLetterRecordListQianTai";
    }

}
