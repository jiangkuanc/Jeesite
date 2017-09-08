package com.dagongsoft.p2p.user.web.front.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.user.dao.P2pAccountDao;
import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.dagongsoft.p2p.user.service.P2pRegUserCertifyService;
import com.dagongsoft.p2p.user.service.P2pUserInformationService;
import com.dagongsoft.p2p.user.service.front.P2pAccountService;
import com.dagongsoft.p2p.user.web.front.interceptor.IdCertifyPageConst;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.UserService;

@Controller
@RequestMapping("${adminPath}/user/idCardCertify")
public class IdCardCertifyController {

    @Autowired
    P2pRegUserCertifyService p2pRegUserCertifyService;

    @Autowired
    P2pUserInformationService p2pUserInformationService;

    @Autowired
    public P2pAccountService p2pAccountService;

    @Autowired
    public P2pAccountDao p2pAccountDao;
    @Autowired
    public UserService userService;


    /**
     * 身份认证页面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("certify")
    public String certify(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        P2pUserInformation p2pUserInformation = p2pUserInformationService.get(user.getId());
        return IdCertifyPageConst.idCertifyFormPage;
    }

    /**
     * 身份认证重新页面
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("reCertify")
    public String reCertify(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        P2pUserInformation p2pUserInformation = p2pUserInformationService.get(user.getId());
        P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.getByUserId(user.getId());
        model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);
        return "modules/person/idReCertifyFormPage";
    }

    @RequestMapping("authingIdCard")
    public String authingIdCard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        P2pUserInformation p2pUserInformation = p2pUserInformationService.get(user.getId());
        P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.get(user.getId());
        if (p2pRegUserCertify.getIdCardFront() != null) {
            p2pRegUserCertify.setIdCardFrontView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardFront()));
        }
        if (p2pRegUserCertify.getIdCardBack() != null) {
            p2pRegUserCertify.setIdCardBackView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardBack()));
        }
        if (p2pRegUserCertify.getIdCardInhand() != null) {
            p2pRegUserCertify.setIdCardInhandView(UploadFileUtils.viewUrl(p2pRegUserCertify.getIdCardInhand()));
        }
        model.addAttribute("p2pRegUserCertify", p2pRegUserCertify);
        return "modules/person/authingIdCardPage";
    }


//	@RequestMapping(value="exposerHandIn",method=RequestMethod.GET)
//	public byte[] exposerHandIn(HttpServletRequest request,HttpServletResponse response){
//		User user = (User) request.getSession().getAttribute("user");
//		P2pRegUserCertify p2pRegUserCertify = p2pRegUserCertifyService.getByUserId(user.getId());
//		String cardBack=p2pRegUserCertify.getIdCardBack();
//		String cardInHand=p2pRegUserCertify.getIdCardInhand();
//		String cardFront =p2pRegUserCertify.getIdCardFront();
//		response.setContentType("application/octet-stream");
//		OutputStream out = response.getOutputStream();
//		File cardBackFile=new File(cardBack.replace("uploadFiles/", "d"+File.separator));
//		File cardInHandFile=new File(cardBack.replace("uploadFiles/", "d"+File.separator));
//		File cardFrontFile=new File(cardBack.replace("uploadFiles/", "d"+File.separator));
//		FileUtils.copyURLToFile(new URL("d:"+File.separator+user.getId()+"userCertify"+""), destination);
//		FileCopyUtils.copy(in, out);
//		byte[] reBytes = {1,1,1,1,2,2};
//		String a = “test”;
//		out.write(a.getBytes());
//		out.write(reBytes);
//		
//	}
//	
//	@RequestMapping(value="exposerHandBack",method=RequestMethod.GET)
//	public byte[] exposerHandBack(HttpServletRequest request,HttpServletResponse response){
//		response.setContentType("application/octet-stream");
//	}
//	

    /**
     * 身份认证页面信息获取
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "certifyForm", method = RequestMethod.POST)
    @Transactional(readOnly = false)
    public String certifyForm(HttpSession session, Model model, P2pRegUserCertify p2pRegUserCertify, MultipartHttpServletRequest multipartRequest) {
        try {
            String realName = (String) multipartRequest.getParameter("realName");
            User user = (User) session.getAttribute("user");
            user.setName(realName);
            //进行上传操作
            List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);
            //进行实名认证信息添加
            Integer count = 0;
            if (p2pRegUserCertify.getInhandIsReject() == null || p2pRegUserCertify.getInhandIsReject() == 0) {
                p2pRegUserCertify.setIdCardInhand(list.get(count));//将上传照片地址添加到对应用户实名认证信息
                p2pRegUserCertify.setInhandIsReject(null);
                p2pRegUserCertify.setInhandRejectReason(null);
                count++;
            }
            if (p2pRegUserCertify.getFrontIsReject() == null || p2pRegUserCertify.getFrontIsReject() == 0) {
                p2pRegUserCertify.setIdCardFront(list.get(count));
                p2pRegUserCertify.setFrontIsReject(null);
                p2pRegUserCertify.setFrontRejectReason(null);
                count++;
            }
            if (p2pRegUserCertify.getBackIsReject() == null || p2pRegUserCertify.getBackIsReject() == 0) {
                p2pRegUserCertify.setIdCardBack(list.get(count));
                p2pRegUserCertify.setBackIsReject(null);
                p2pRegUserCertify.setBackRejectReason(null);
                count++;
            }
            p2pRegUserCertify.setAuditState(3);                //设置审核状态为待审核
            p2pRegUserCertify.setUser(user);                //让用户表与实名认证表进行账号关联
            //存入真实姓名
            userService.updateByName(user);

            p2pRegUserCertify.setSubmitTime(new Date());    //设置提交时间
            P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            p2pUserInformation.setCertificateState(1012);                                    //设置当前实名为认证审核过程中
            p2pUserInformationService.updateCertificateState(p2pUserInformation);            //更新P2pUserInformation的认证状态
            p2pRegUserCertifyService.saveOrUpdateUserCertify(p2pRegUserCertify, user);

            return IdCertifyPageConst.idCertifyResultPage;
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:" + Global.getFrontPath();
        }

    }

    /**
     * 身份认证重新认证
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "reCertifyForm", method = RequestMethod.POST)
    @Transactional(readOnly = false)
    public String reCertifyForm(HttpSession session, Model model, P2pRegUserCertify p2pRegUserCertify, MultipartHttpServletRequest multipartRequest) {
        User user = (User) session.getAttribute("user");
        P2pRegUserCertify p2pRegUserCertify2 = p2pRegUserCertifyService.getByUserId(user.getId());
        try {
            //进行上传操作
            List<String> list = UploadFileUtils.fdfsUpload(multipartRequest);
            //进行实名认证信息添加
            Integer count = list.size();
            int index = 0;
            if (p2pRegUserCertify2.getInhandIsReject() == null || p2pRegUserCertify2.getInhandIsReject() == 0) {
                p2pRegUserCertify2.setIdCardInhand(list.get(index));//将上传照片地址添加到对应用户实名认证信息
                p2pRegUserCertify2.setInhandIsReject(null);
                p2pRegUserCertify2.setInhandRejectReason(null);
                index++;
            }
            if (p2pRegUserCertify2.getFrontIsReject() == null || p2pRegUserCertify2.getFrontIsReject() == 0) {
                p2pRegUserCertify2.setIdCardFront(list.get(index));
                p2pRegUserCertify2.setFrontIsReject(null);
                p2pRegUserCertify2.setFrontRejectReason(null);
                index++;
            }
            if (p2pRegUserCertify2.getBackIsReject() == null || p2pRegUserCertify2.getBackIsReject() == 0) {
                p2pRegUserCertify2.setIdCardBack(list.get(index));
                p2pRegUserCertify2.setBackIsReject(null);
                p2pRegUserCertify2.setBackRejectReason(null);
                index++;
            }
            p2pRegUserCertify2.setAuditState(3);                //设置审核状态为待审核
            p2pRegUserCertify2.setUser(user);                    //让用户表与实名认证表进行账号关联
            p2pRegUserCertify2.setSubmitTime(new Date());    //设置提交时间
            //P2pUserInformation p2pUserInformation = p2pUserInformationService.findP2pUserInformationByUser(user);
            //p2pUserInformation.setCertificateState(1012);									//设置当前实名为认证审核过程中
            //p2pUserInformationService.updateCertificateState(p2pUserInformation);			//更新P2pUserInformation的认证状态
            p2pRegUserCertifyService.saveOrUpdateUserCertify(p2pRegUserCertify2, user);

            return IdCertifyPageConst.idCertifyResultPage;
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:" + Global.getFrontPath();
        }

    }


}
