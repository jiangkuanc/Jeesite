package com.dagongsoft.p2p.risk.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.creditreport.entity.P2pReportInformationAudit;
import com.dagongsoft.p2p.risk.entity.P2pRiskAnswer;
import com.dagongsoft.p2p.risk.entity.P2pRiskPaper;
import com.dagongsoft.p2p.risk.entity.P2pRiskQuestion;
import com.dagongsoft.p2p.risk.service.P2pRiskAnswerService;
import com.dagongsoft.p2p.risk.service.P2pRiskPaperService;
import com.dagongsoft.p2p.risk.service.P2pRiskQuestionService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;


/**
 * 风险测评问卷表Controller
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/risk/p2pRiskPaper")
public class P2pRiskPaperController extends BaseController {

    @Resource
    private P2pRiskPaperService p2pRiskPaperService;
    @Resource
    private P2pRiskQuestionService p2pRiskQuestionService;
    @Resource
    private P2pRiskAnswerService p2pRiskAnswerService;

    @ModelAttribute
    public P2pRiskPaper get(@RequestParam(required = false) String id) {
        P2pRiskPaper entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pRiskPaperService.get(id);
        }
        if (entity == null) {
            entity = new P2pRiskPaper();
        }
        return entity;
    }


    @RequestMapping(value = {"list", ""})
    public String list(P2pRiskPaper p2pRiskPaper, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pRiskPaper> page = p2pRiskPaperService.findPage(new Page<P2pRiskPaper>(request, response), p2pRiskPaper);
        model.addAttribute("page", page);
        return "modules/p2p/risk/p2pRiskPaperList";
    }


    @RequestMapping(value = "form")
    public String form(P2pRiskPaper p2pRiskPaper, Model model, HttpSession session) {
        //问题表
        try {


            List<P2pRiskQuestion> p2pRiskQuestionList = p2pRiskQuestionService.getPaperId(p2pRiskPaper.getPaperId());
            p2pRiskPaper.setUser(UserUtils.getUser());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            p2pRiskPaper.setAuditTime2(sdf.format(new Date()));
            p2pRiskPaper.setPublishTime2(sdf2.format(new Date()));
            model.addAttribute(p2pRiskPaper);
            model.addAttribute("p2pRiskQuestionList", p2pRiskQuestionList);


        } catch (Exception e) {
            e.printStackTrace();
        }

        return "p2p/back/creditReport/p2pRiskPaperForm";

    }


    @RequestMapping(value = "form1")
    public String form1(HttpServletRequest request, P2pRiskPaper p2pRiskPaper, Model model) {

//		 List<P2pRiskQuestion> p2pRiskQuestionList = p2pRiskQuestionService.getPaperId(p2pRiskPaper.getId());
        //测试答案表
        List<P2pRiskAnswer> p2pRiskAnswerList = p2pRiskAnswerService.getRiskQuestionId(p2pRiskPaper.getRiskQuestionId());
        model.addAttribute("p2pRiskAnswerList", p2pRiskAnswerList);
//		  model.addAttribute("paperId", p2pRiskPaper.getRiskQuestionId());
        return "p2p/back/creditReport/p2pRiskAnswerFormView";
    }


    @RequestMapping(value = "save")
    @ResponseBody
    public String save(P2pRiskPaper p2pRiskPaper, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRiskPaper)) {
            return form(p2pRiskPaper, model, session);
        }
        P2pRiskQuestion p2pRiskQuestion = new P2pRiskQuestion();

        p2pRiskPaper.setDrawTime(new Date());
        p2pRiskPaper.setPaperState("1");
        p2pRiskPaperService.save(p2pRiskPaper);
        try {
            BeanUtils.copyProperties(p2pRiskQuestion, p2pRiskPaper);
        } catch (Exception e) {
        }


        p2pRiskQuestion.setId(UUID.randomUUID().toString());
        p2pRiskQuestion.setPaperId(p2pRiskPaper.getId());
        p2pRiskQuestion.setIsNewRecord(true);
        if (!"".equals(p2pRiskQuestion.getQuestionContent())) {
            p2pRiskQuestionService.save(p2pRiskQuestion);
        }
        addMessage(redirectAttributes, "保存风险测评问卷表成功");
        return p2pRiskPaper.getId() + "," + p2pRiskQuestion.getId() + "," + p2pRiskQuestion.getPaperId();
    }


    @RequestMapping(value = "saveAnswer")
    @ResponseBody
    public String saveAnswer(P2pRiskPaper p2pRiskPaper, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRiskPaper)) {
            return form(p2pRiskPaper, model, session);
        }

        P2pRiskAnswer p2pRiskAnswer = new P2pRiskAnswer();
        try {
            BeanUtils.copyProperties(p2pRiskAnswer, p2pRiskPaper);
        } catch (Exception e) {
            e.printStackTrace();
        }

        p2pRiskAnswer.setId(UUID.randomUUID().toString());
        p2pRiskAnswer.setIsNewRecord(true);
        p2pRiskAnswerService.save(p2pRiskAnswer);
        addMessage(redirectAttributes, "保存风险测评答案表成功");
        return p2pRiskAnswer.getRiskQuestionId();

    }

    //操作   编辑 审核 已审核 发布  已关闭
    @RequestMapping(value = "saveTj")
    public String saveTj(P2pRiskPaper p2pRiskPaper, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pRiskPaper)) {
            return form(p2pRiskPaper, model, session);
        }

        String message = "";
        if ("2".equals(p2pRiskPaper.getPaperState())) {

            if ("1".equals(p2pRiskPaper.getAuditOpinion())) { //通过
                p2pRiskPaper.setPaperState("3");
                message = "发布成功";
            } else if ("0".equals(p2pRiskPaper.getAuditOpinion())) { //不通过
                p2pRiskPaper.setPaperState("1");
                message = "发布失败";
            }
            p2pRiskPaperService.updateXg(p2pRiskPaper);
        } else if ("3".equals(p2pRiskPaper.getPaperState())) {

            p2pRiskPaper.setPaperState("4");
            p2pRiskPaperService.updateXg(p2pRiskPaper);
            message = "提交成功！";
        } else {
            if ("1".equals(p2pRiskPaper.getPaperState())) {
                p2pRiskPaper.setPaperState("2");
                p2pRiskPaperService.updateXg(p2pRiskPaper);

            }
        }
        addMessage(redirectAttributes, "成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pRiskPaper/p2pRiskPaperList";
    }


    @RequestMapping(value = "delete")
    public String delete(P2pRiskPaper p2pRiskPaper, RedirectAttributes redirectAttributes) {
        p2pRiskPaperService.delete(p2pRiskPaper);
        addMessage(redirectAttributes, "删除风险测评问卷表成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/risk/p2pRiskPaper/p2pRiskPaperList";
    }

    //后台 风险测试问卷管理
    @RequestMapping(value = "p2pRiskPaperList")
    public String p2pRiskPaperList(P2pRiskPaper p2pRiskPaper, HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
        String QTMessage = request.getParameter("QTMessage");
        if ("1".equals(QTMessage)) {
            QTMessage = "风险测评问卷表审核成功";
        } else if ("2".equals(QTMessage)) {
            QTMessage = "风险测评问卷表发布成功";
        } else if ("3".equals(QTMessage)) {
            QTMessage = "风险测评问卷表提交成功";
        } else {
            QTMessage = null;
        }
        User user = (User) session.getAttribute("user");
        if (user != null && !"".equals(user.getId())) {
            p2pRiskPaper.setUser(user);
        }
        try {
            Page<P2pRiskPaper> page = p2pRiskPaperService.findPage(new Page<P2pRiskPaper>(request, response), p2pRiskPaper);
            model.addAttribute("page", page);
            if (QTMessage != null) {
                model.addAttribute("QTMessage", QTMessage);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "p2p/back/creditReport/p2pRiskPaperList";
    }


    /**
     * 前台 风险测评答卷
     */

    @RequestMapping(value = "riskTest")
    public String riskTest(P2pRiskPaper p2pRiskPaper, HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model) {
            /*User user = (User) session.getAttribute("user");
            if(user != null && !"".equals(user.getId())){
				p2pRiskPaper.setUser(user);
			}*/
        try {
            p2pRiskPaper.setPaperState("4");
            //问卷表
            List<P2pRiskPaper> p2pRiskPapers = p2pRiskPaperService.findList(p2pRiskPaper);
            if (p2pRiskPapers.size() != 0) {
                p2pRiskPaper = p2pRiskPapers.get(0);
                //问题表
                List<P2pRiskQuestion> p2pRiskQuestionList = p2pRiskQuestionService.getPaperId(p2pRiskPaper.getId());
                //保存一个问题对应所有答案
                for (P2pRiskQuestion p : p2pRiskQuestionList) {
                    p.setP2pRiskAnswers(p2pRiskAnswerService.getRiskQuestionId(p.getId()));//测试答案
                }
                request.setAttribute("p2pRiskQuestionList", p2pRiskQuestionList);
                model.addAttribute(p2pRiskPaper).addAttribute(p2pRiskQuestionList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        return "modules/front/account/riskTest";
    }

    //问卷是发布状态 改为关闭状态
    @RequestMapping(value = "closePaper")
    @ResponseBody
    public String closePaper(P2pRiskPaper p2pRiskPaper, HttpServletRequest request, HttpSession session, HttpServletResponse response, Model model) {
        p2pRiskPaperService.updatePaperState(p2pRiskPaper);
        return "";
    }

}