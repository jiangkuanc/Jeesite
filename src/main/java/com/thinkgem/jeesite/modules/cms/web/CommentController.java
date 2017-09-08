/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Comment;
import com.thinkgem.jeesite.modules.cms.service.CommentService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 评论Controller
 *
 * @author ThinkGem
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/comment")
public class CommentController extends BaseController {

    @Autowired
    private CommentService commentService;

    @ModelAttribute
    public Comment get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return commentService.get(id);
        } else {
            return new Comment();
        }
    }

    @RequiresPermissions("cms:comment:view")
    @RequestMapping(value = {"list", ""})
    public String list(Comment comment, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<Comment> page = commentService.findPage(new Page<Comment>(request, response), comment);
        model.addAttribute("page", page);
        return "modules/cms/commentList";
    }

    @RequiresPermissions("cms:comment:edit")
    @RequestMapping(value = "save")
    public String save(Comment comment, RedirectAttributes redirectAttributes, HttpServletRequest request, HttpServletResponse response, Model model) {
        if (beanValidator(redirectAttributes, comment)) {
            if (comment.getAuditUser() == null) {
                comment.setAuditUser(UserUtils.getUser());
                comment.setAuditDate(new Date());
            }
            comment.setDelFlag(Comment.DEL_FLAG_NORMAL);
            commentService.save(comment);
            addMessage(redirectAttributes, DictUtils.getDictLabel(comment.getDelFlag(), "cms_del_flag", "保存")
                    + "评论'" + StringUtils.abbr(StringUtils.replaceHtml(comment.getContent()), 50) + "'成功");
        }
        return "redirect:" + adminPath + "/cms/comment/?repage&delFlag=2";
    }

    @RequiresPermissions("cms:comment:edit")
    @RequestMapping(value = "delete")
    public String delete(Comment comment, @RequestParam(required = false) Boolean isRe, RedirectAttributes redirectAttributes) {
        commentService.delete(comment, isRe);
        addMessage(redirectAttributes, (isRe != null && isRe ? "恢复审核" : "删除") + "评论成功");
        return "redirect:" + adminPath + "/cms/comment/?repage&delFlag=2";
    }

    @RequestMapping(value = "commite")
    public void commite(Comment comment, HttpServletRequest request, HttpServletResponse response, Model model) {
        //接受前台数据
//		comment.setName(request.getParameter("username"));//评论名称
//		comment.setContent(request.getParameter("comment"));//评论内容
//		String contentId = request.getParameter("contentId");//内容的编号
//		comment.setContentId(contentId);
//		//接受前台的catagroyId
//		Category category = new Category();
//		category.setId(request.getParameter("categoryId"));
//		comment.setCategory(category);
//		comment.setTitle(request.getParameter("title"));//内容标题
//		String state = request.getParameter("state");//评论状态
//		comment.setReplayContent(request.getParameter("replayContent"));
//		if(state.equals("回复")){
//			state = "1";
//		}else{
//			state = "0";
//		}
//		comment.setState(state);
//		comment.setCreateDate(new Date());
//		//进行保存
//		commentService.save(comment);
        //查询时所需的条件
        Comment comment2 = new Comment();
        comment2.setDelFlag("0");
//		comment2.setContentId(contentId);
        //保存之后查询，将数据返回到前台页面
        List<Comment> list = commentService.findDate(comment2);
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            map.put("total", list.size());
            map.put("data", list);
            String json = JsonMapper.toJsonString(map);
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write(json);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

	/*//恢复审核
    @RequestMapping(value = "regain")
	public String regain(Comment comment,HttpServletRequest request, HttpServletResponse response, Model model){
		comment.setDelFlag("0");
		Page<Comment> page = commentService.findPage(new Page<Comment>(request, response), comment); 
        model.addAttribute("page", page);
		return "modules/cms/commentList";
	}*/


}
