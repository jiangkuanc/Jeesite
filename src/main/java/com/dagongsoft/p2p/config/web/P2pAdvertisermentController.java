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

import com.dagongsoft.p2p.config.entity.P2pAdvertiserment;
import com.dagongsoft.p2p.config.service.P2pAdvertisermentService;
import com.dagongsoft.p2p.utils.FormatData2Json;
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
 * 广告Controller
 *
 * @author Chace
 * @version 2016-12-19
 */
@Controller
@RequestMapping(value = "${adminPath}/p2p/config/p2pAdvertiserment")
public class P2pAdvertisermentController extends BaseController {

    @Resource
    private P2pAdvertisermentService p2pAdvertisermentService;

    @ModelAttribute
    public P2pAdvertiserment get(@RequestParam(required = false) String id) {
        P2pAdvertiserment entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pAdvertisermentService.get(id);
        }
        if (entity == null) {
            entity = new P2pAdvertiserment();
        }
        return entity;
    }

    @RequestMapping(value = {"list", ""})
    public String list(P2pAdvertiserment p2pAdvertiserment, HttpServletRequest request, HttpServletResponse response, Model model) {
        try {
            Page<P2pAdvertiserment> page = p2pAdvertisermentService.findPage(new Page<P2pAdvertiserment>(request, response), p2pAdvertiserment);
            model.addAttribute("page", page);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modules/p2p/config/p2pAdvertisermentList";
    }

    @RequestMapping(value = "form")
    @Token(save = true)
    public String form(P2pAdvertiserment p2pAdvertiserment, Model model) {
        model.addAttribute("p2pAdvertiserment", p2pAdvertiserment);
        return "modules/p2p/config/p2pAdvertisermentForm";
    }

    @RequestMapping(value = "save")
    @Token(remove = true)
    public String save(MultipartHttpServletRequest multipartRequest, P2pAdvertiserment p2pAdvertiserment, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pAdvertiserment)) {
            return form(p2pAdvertiserment, model);
        }
        try {
            User user = UserUtils.getUser();
            if (multipartRequest.getFile("file").getOriginalFilename() != "") {
                List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);//文件上传
                p2pAdvertiserment.setAdPicture(list.get(0));//设置文件上传的路径
            }
            if (p2pAdvertiserment.getId() == null || "".equals(p2pAdvertiserment.getId())) {
                p2pAdvertiserment.setOperationPerson(user.getName());
                p2pAdvertiserment.setOperateTime(new Date());
            }
            p2pAdvertisermentService.save(p2pAdvertiserment);
        } catch (Exception e) {
            e.printStackTrace();
        }
        addMessage(redirectAttributes, "保存广告成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pAdvertiserment/?repage";
    }

    @RequestMapping(value = "delete")
    public String delete(P2pAdvertiserment p2pAdvertiserment, RedirectAttributes redirectAttributes) {
        if ("1".equals(p2pAdvertiserment.getPosition()) && "1".equals(p2pAdvertiserment.getIsEnable())) {
            int count = p2pAdvertisermentService.getCount(p2pAdvertiserment);
            if (count == 1) {
                addMessage(redirectAttributes, "操作失败，上部广告至少要有一条处于启用状态");
                return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pAdvertiserment/?repage";
            }
        }
        p2pAdvertisermentService.delete(p2pAdvertiserment);
        addMessage(redirectAttributes, "删除广告成功");
        return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pAdvertiserment/?repage";
    }

    /**
     * 查询不同位置的广告
     *
     * @param p2pAdvertiserment
     * @return p2pAdvertiserment
     * @author Chace
     */
    @RequestMapping("getAdvertisement")
    @ResponseBody
    public void getAdvertisement(P2pAdvertiserment p2pAdvertiserment, HttpServletResponse response) {
        List<P2pAdvertiserment> list = p2pAdvertisermentService.findByType(p2pAdvertiserment);
        if (list != null && list.size() > 0) {
            for (P2pAdvertiserment p2p : list) {
                if (p2p.getAdPicture() != null) {
                    p2p.setAdPicture(UploadFileUtils.viewUrl(p2p.getAdPicture()));
                }
            }
        }
        String advertisermentJson = JsonMapper.toJsonString(list);
        response.setContentType("text/html;charset=utf-8");
        try {
            response.getWriter().write(advertisermentJson);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询不同位置广告启用条数
     *
     * @param p2pAdvertiserment
     * @author Chace
     */
    @RequestMapping("getCount")
    @ResponseBody
    public void getCount(P2pAdvertiserment p2pAdvertiserment, HttpServletResponse response) {
        int count = p2pAdvertisermentService.getCount(p2pAdvertiserment);
        String countJson = JsonMapper.toJsonString(count);
        response.setContentType("text/html;charset=utf-8");
        try {
            response.getWriter().write(countJson);
            response.getWriter().flush();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 停用/启用广告
     *
     * @param p2pAdvertiserment
     * @author Chace
     */
    @RequestMapping("changeStage")
    public String changeStage(P2pAdvertiserment p2pAdvertiserment, HttpServletResponse response, RedirectAttributes redirectAttributes) {
        User user = UserUtils.getUser();
        int count = p2pAdvertisermentService.getCount(p2pAdvertiserment);
        try {
            if (count == 1 && "1".equals(p2pAdvertiserment.getIsEnable()) && ("2".equals(p2pAdvertiserment.getPosition()) || "3".equals(p2pAdvertiserment.getPosition()))) {
                p2pAdvertisermentService.stopLeftOrRight(p2pAdvertiserment);
            }
//		p2pAdvertiserment.setOperationPerson(user.getName());
//		p2pAdvertiserment.setOperateTime(new Date());
            p2pAdvertisermentService.changeStage(p2pAdvertiserment);
            addMessage(redirectAttributes, "操作成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + Global.getAdminPath() + "/p2p/config/p2pAdvertiserment/?repage";
    }

    /**
     * 轮播图
     *
     * @param size     不传的时候，默认为3，传值，覆盖3
     * @param request
     * @param response
     * @author Frank Zhou
     */
    @RequestMapping(value = "takeTurn")
    public void takeTurn(HttpServletRequest request, HttpServletResponse response) {
        String num = request.getParameter("num");
        Integer size = new Integer(3);
        if (num != null) {
            size = Integer.parseInt(num);
        }
        List<P2pAdvertiserment> ads = p2pAdvertisermentService.takeTurn(size);
        FormatData2Json.writeJson(response, ads);
    }

}