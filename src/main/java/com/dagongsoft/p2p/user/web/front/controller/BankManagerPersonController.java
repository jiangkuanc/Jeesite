package com.dagongsoft.p2p.user.web.front.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.user.service.front.P2pAccountServiceImpl;
import com.dagongsoft.p2p.user.web.front.consts.PageRegisterModelConst;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 银行卡管理Controller
 *
 * @author Joe
 * @since 2016-11-08
 */
@Controller
@RequestMapping(value = "${adminPath}/user/bankManage")
public class BankManagerPersonController {
    @Autowired
    private P2pUserInformationService p2pUserInformationService;

    private static final Logger logger = LoggerFactory.getLogger(BankManagerPersonController.class);

    @Autowired
    public P2pAccountServiceImpl p2pAccountService;

    /**
     * 银行卡管理
     *
     * @return 银行卡管理页面
     * @author Joe
     * @since 2016-11-08
     */
    @RequestMapping("bankInfo")
    public String riskEvaluating(HttpSession session, Model model) {
        try {
            User user = (User) session.getAttribute("user");
            P2pAccount p2pAccount = p2pAccountService.getAccountByUserId(user.getId());
            model.addAttribute("p2pAccount", p2pAccount);
            if (p2pAccount == null) {
                return PageRegisterModelConst.bankInfoUrl;
            }

            return PageRegisterModelConst.bankInfoUrl;
        } catch (Exception e) {
            //.out.println(e);
            return "redirect:" + Global.getAdminPath();
        }
    }

    @RequestMapping("validCertifyStep")//user/bankManage/validCertifyStep
    @ResponseBody
    public String validCertifyStep(HttpSession session) {
        int certifyFromDb = 0, frontCertifyVal = 0;
        try {
            User user = (User) session.getAttribute("user");
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);    //从当前user中得到P2pUserInformation
            certifyFromDb = p2pUserInformation.getCertificateState();        //从数据库中获取相应的认证状态码值
            frontCertifyVal = getCertifyForCurrentUser(certifyFromDb);

        } catch (Exception e) {
            frontCertifyVal = -4;
            return JsonMapper.toJsonString(String.valueOf(frontCertifyVal));//返回前端请求认证异常状态码值
        }
        return JsonMapper.toJsonString(String.valueOf(frontCertifyVal));    //返回前端请求认证状态码值
    }


    /**
     * 获取当前用户的认证状态值从数库中
     * 该层将后台认证 状态转换为前端状态码
     * -4.网络异常
     * -3.实名认证失败
     * -2.实名认证审核
     * -1.未进行实名认证
     * 0.未进行绑卡
     * 1.未进行风险测评
     * 2.未成为会员
     * 3.实名认证完成
     *
     * @param certifyFromDb
     */

    /**
     * 获取用户认证状态值得公用方法
     *
     * @param certifyFromDb
     * @return
     */
    private int getCertifyForCurrentUser(int certifyFromDb) {
        int frontCertifyStateVal = 0;
        switch (certifyFromDb) {
            case 1001:
                frontCertifyStateVal = -1;
                break;
            case 1010:
                frontCertifyStateVal = 0;
                break;
            case 1020:
                frontCertifyStateVal = 1;
                break;
            case 1030:
                frontCertifyStateVal = 2;
                break;
            case 1040:
                frontCertifyStateVal = 3;
                break;
            case 2001:
                frontCertifyStateVal = -2;
                break;
            case 3001:
                frontCertifyStateVal = -3;
                break;
            default:
                break;
        }
        return frontCertifyStateVal;
    }


//	/**
//	 * 绑定银行卡
//	 */
//	@RequestMapping("binding")
//	public String bankbinding(Model model,String atOnceCerfify,HttpSession session,HttpServletResponse response){
//		AccountModel accountModel = new AccountModel();												//构建界面账户信息数据
//		JsonAccountModel jsonAccountModel = new JsonAccountModel().build(accountModel);				//构建Json格式化消息数据
//		String errorPageUrl = "redirect:"+adminPath+ "/user/p2pUserInformation/systemErrorPage";	//出现异常,重定向到异常处理页面
//		User user = (User) session.getAttribute("user");											//获取当前session域中的User信息
//		Role role =null;																			//初始化role
//		String roleId="";
//		if(user == null || "".equals(user.getId())){												//判断当前用户是否登录
//			return IndexConst.userLoginUrl;															//返回登录页
//		}
//		if(p2pUserInformationService==null){
//			logger.debug(p2pUserInformationService.getClass().getName()+"初始化异常...");
//			return errorPageUrl;																	//初始化和服务类异常
//		}
//		try{
//			role = user.getRoleList().get(0);														//获取该用户的角色类型
//			roleId = role.getId();
//			if(role==null){																			//角色异常,返回json格式信息到客户端
//				jsonAccountModel.setStatus(JsonAccountModelEnumConst.ERROR);
//				jsonAccountModel.setMessage("服务器未知错误,请重试...");
//				try {
//					response.getWriter().print(JsonMapper.toJsonString(jsonAccountModel));
//				} catch (IOException e) {
//					logger.debug(e.getMessage());
//					model.addAttribute("exceptionMsg", e.getMessage());
//					return errorPageUrl;
//				}
//				throw new RuntimeException("权限不足!");
//			}
//		}catch(RuntimeException e){
//			logger.debug(e.getMessage());
//			model.addAttribute("exceptionMsg",e.getMessage());
//			return errorPageUrl;
//		}
//		
//		if (roleId != null && "104".equals(roleId)) {									//判断当前用户类型  104为 投资个人
//			logger.info("roleId行为...");													//记录用户的操作行为
//			P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
//			String certificateStateDb = String.valueOf(p2pUserInformation.getCertificateState());
//			if(p2pUserInformation==null){
//				return errorPageUrl;
//			}
//			model.addAttribute("p2pUserInformation", p2pUserInformation);				//将用户信息数据放入model中
//			atOnceCerfify=com.dagongsoft.p2p.user.web.front.util.XSSUtils.escapeHtml(atOnceCerfify);											//防止XSS攻击
//			
//		P2pAccount p2pAccount = p2pAccountService.get(user.getId());
//		model.addAttribute("p2pAccount", p2pAccount);
//		String bankUrl = PersonalInvestmentConst.bankMsgUrl;
//		P2pUserInformation p2pUserInformation1 = user.getP2pUserInformation();
//		//得到认证状态
//		int certifyState=p2pUserInformation1.getCertificateState();
//		//已绑卡,未进行风险测评
//		if(certifyState==ProcesStateConst.regiesterUnRiskEvaluate){
//			model.addAttribute("certifyState", certifyState);
//		}
//		//未绑卡
//		else if(certifyState==ProcesStateConst.registerUnBindBank){
//			model.addAttribute("certifyState", certifyState);
//		}
//		//绑卡失败
//		else if(certifyState==ProcesStateConst.registerBindCardUnPass){
//			model.addAttribute("certifyState", certifyState);
//		}//atOnceCerfify
//		else if(certifyState==ProcesStateConst.registerUnBindBank && StringUtils.equalsIgnoreCase("yes", atOnceCerfify)){
//			//进入绑卡页面
//			return "modules/front/investment/bankMsg";
//		}
//		}
//		return "modules/front/investment/bankMsg";
//	}

    /**
     * 绑定银行卡成功
     */
    @RequestMapping("bindingSuccess")
    public String bindingSuccess() {
        return PageRegisterModelConst.bindingSuccessUrl;
    }

}
