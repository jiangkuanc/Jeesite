package com.dagongsoft.p2p.config.web;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dagongsoft.p2p.config.entity.P2pFriendshipLink;
import com.dagongsoft.p2p.config.service.P2pFriendshipLinkService;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.interceptor.Token;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 友情链接Controller
 *
 * @author Chace
 * @version 2016-12-23
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/config/p2pFriendshipLink")
public class P2pFriendshipLinkController extends BaseController {

    @Resource
    private P2pFriendshipLinkService p2pFriendshipLinkService;

    @ModelAttribute
    public P2pFriendshipLink get(@RequestParam(required = false) String id) {
        P2pFriendshipLink entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pFriendshipLinkService.get(id);
        }
        if (entity == null) {
            entity = new P2pFriendshipLink();
        }
        return entity;
    }

    @RequestMapping(value = {"list", ""})
    public String list(P2pFriendshipLink p2pFriendshipLink, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pFriendshipLink> page = p2pFriendshipLinkService.findPage(new Page<P2pFriendshipLink>(request, response), p2pFriendshipLink);
        List<P2pFriendshipLink> list = page.getList();
        for (P2pFriendshipLink l : list) {
            l.setLinkIcon(UploadFileUtils.viewUrl(l.getLinkIcon()));
        }
        model.addAttribute("page", page);
        return "modules/p2p/config/p2pFriendshipLinkList";
    }

    @RequestMapping(value = "form")
    @Token(save = true)
    public String form(P2pFriendshipLink p2pFriendshipLink, Model model) {
        model.addAttribute("p2pFriendshipLink", p2pFriendshipLink);
        return "modules/p2p/config/p2pFriendshipLinkForm";
    }

    @RequestMapping(value = "save")
    @Token(remove = true)
    public String save(MultipartHttpServletRequest multipartRequest, P2pFriendshipLink p2pFriendshipLink, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pFriendshipLink)) {
            return form(p2pFriendshipLink, model);
        }
        try {
            User user = UserUtils.getUser();
            if (multipartRequest.getFile("file").getOriginalFilename() != "") {
                List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);//文件上传
                p2pFriendshipLink.setLinkIcon(list.get(0));//设置文件上传的路径
            }
            if (p2pFriendshipLink.getId() == null || "".equals(p2pFriendshipLink.getId())) {
                p2pFriendshipLink.setOperationPerson(user.getName());
                p2pFriendshipLink.setOperateTime(new Date());
            }
            p2pFriendshipLinkService.save(p2pFriendshipLink);
        } catch (Exception e) {
            e.printStackTrace();
        }
        addMessage(redirectAttributes, "保存友情链接成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pFriendshipLink/?repage";
    }

    @RequestMapping(value = "delete")
    public String delete(P2pFriendshipLink p2pFriendshipLink, RedirectAttributes redirectAttributes) {
        p2pFriendshipLinkService.delete(p2pFriendshipLink);
        addMessage(redirectAttributes, "删除友情链接成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pFriendshipLink/?repage";
    }

    /**
     * 友情链接发布
     *
     * @param p2pFriendshipLink
     * @author Chace
     */
    @RequestMapping("publishLink")
    public String publishLink(String ids) {
        try {
            String[] idsArray = ids.split(",");
            for (int i = 0; i < idsArray.length; i++) {
                P2pFriendshipLink p2pFriendshipLink = new P2pFriendshipLink();
                p2pFriendshipLink.setId(idsArray[i]);
                User user = UserUtils.getUser();
//				p2pFriendshipLink.setOperationPerson(user.getName());
//				p2pFriendshipLink.setOperateTime(new Date());
                p2pFriendshipLinkService.publishLink(p2pFriendshipLink);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pFriendshipLink/?repage";
    }

    /**
     * 友情链接取消发布
     *
     * @param p2pFriendshipLink
     * @author Chace
     */
    @RequestMapping("stopLink")
    public String stopLink(P2pFriendshipLink p2pFriendshipLink) {
        try {
            User user = UserUtils.getUser();
//			p2pFriendshipLink.setOperationPerson(user.getName());
//			p2pFriendshipLink.setOperateTime(new Date());
            p2pFriendshipLinkService.stopLink(p2pFriendshipLink);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pFriendshipLink/?repage";
    }

    /**
     * 查询已发布友情链接
     *
     * @param p2pFriendshipLink return p2pFriendshipLink
     * @author Chace
     */
    @RequestMapping("findPublish")
    @ResponseBody
    public void findPublish(P2pFriendshipLink p2pFriendshipLink, HttpServletRequest request, HttpServletResponse response, String num) {
        Integer size = Integer.parseInt(num);
        List<P2pFriendshipLink> list = p2pFriendshipLinkService.findPublish(p2pFriendshipLink, size);
        if (list != null && list.size() > 0) {
            for (P2pFriendshipLink p2p : list) {
                if (p2p.getLinkIcon() != null) {
                    p2p.setLinkIcon(UploadFileUtils.viewUrl(p2p.getLinkIcon()));
                }
            }
        }
        String p2pFriendshipLinkJson = JsonMapper.toJsonString(list);
        response.setContentType("text/html;charset=utf-8");
        try {
            response.getWriter().write(p2pFriendshipLinkJson);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}