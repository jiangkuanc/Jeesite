package com.dagongsoft.p2p.user.web.front;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.financing.entity.P2pGuaranteeRecord;
import com.dagongsoft.p2p.financing.service.front.SupplyCreditService;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 担保公司账户中心相关
 *
 * @author Quincy
 */
@Controller
@RequestMapping(value = "${adminPath}/user/Guarantee")
public class GuaranteeAccountController extends BaseController {

    @Autowired
    private SupplyCreditService supplyCreditService;

    /**
     * 账户中心控制
     *
     * @param session
     * @param model
     * @param mode
     * @return
     * @author Quincy
     */
    @RequestMapping(value = "ctrlMenu")
    public String ctrlMenu(HttpSession session, Model model, String mode) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        String roleId = user.getRoleList().get(0).getId();
        //判断是否为担保公司账号
        if (roleId != null && "106".equals(roleId)) {
            if ("pwdManager".equals(mode)) {
                return "modules/front/account/pwdManager";//密码管理
            } else {
                model.addAttribute("list", supplyCreditService.findGuaranteeTaskList(user.getId()));
                return "p2p/front/supplyCredit/guaranteeTask";//跳转到担保任务页面
            }
        }
        return null;
    }

    /**
     * 处理担保函提交请求
     *
     * @param multipartHttpServletRequest
     * @param session
     * @param p2pAssetValuationRecord
     * @param applicantsId
     * @return
     */
    @RequestMapping(value = "finishTask")
    public String finishTask(MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session,
                             P2pGuaranteeRecord p2pGuaranteeRecord, String applicantsId) {
        User user = (User) session.getAttribute("user");
        //判断当前用户是否登录
        if (user == null || "".equals(user.getId())) {
            return "modules/front/user/userLogin";//返回登录页
        }
        String roleId = user.getRoleList().get(0).getId();
        //判断是否为资产评估账号
        if (roleId != null && "106".equals(roleId)) {
            supplyCreditService.finishGuaranteeTask(multipartHttpServletRequest, p2pGuaranteeRecord, applicantsId);
        }
        return "redirect:" + adminPath + "/user/Guarantee/ctrlMenu";
    }
}
