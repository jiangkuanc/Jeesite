/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.web;

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

import com.dagongsoft.p2p.financing.entity.P2pApplicationDocuments;
import com.dagongsoft.p2p.financing.service.P2pApplicationDocumentsService;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;

/**
 * 融资申请材料Controller
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Controller
@RequestMapping(value = "${adminPath}/financing/p2pApplicationDocuments")
public class P2pApplicationDocumentsController extends BaseController {

    @Autowired
    private P2pApplicationDocumentsService p2pApplicationDocumentsService;

    @ModelAttribute
    public P2pApplicationDocuments get(@RequestParam(required = false) String id) {
        P2pApplicationDocuments entity = null;
        if (StringUtils.isNotBlank(id)) {
            entity = p2pApplicationDocumentsService.get(id);
        }
        if (entity == null) {
            entity = new P2pApplicationDocuments();
        }
        return entity;
    }

    @RequiresPermissions("financing:p2pApplicationDocuments:view")
    @RequestMapping(value = {"list", ""})
    public String list(P2pApplicationDocuments p2pApplicationDocuments, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<P2pApplicationDocuments> page = p2pApplicationDocumentsService.findPage(new Page<P2pApplicationDocuments>(request, response), p2pApplicationDocuments);
        model.addAttribute("page", page);
        return "modules/financing/p2pApplicationDocumentsList";
    }

    @RequiresPermissions("financing:p2pApplicationDocuments:view")
    @RequestMapping(value = "form")
    public String form(P2pApplicationDocuments p2pApplicationDocuments, Model model) {
        model.addAttribute("p2pApplicationDocuments", p2pApplicationDocuments);
        return "modules/financing/p2pApplicationDocumentsForm";
    }

    @RequiresPermissions("financing:p2pApplicationDocuments:edit")
    @RequestMapping(value = "save")
    public String save(P2pApplicationDocuments p2pApplicationDocuments, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, p2pApplicationDocuments)) {
            return form(p2pApplicationDocuments, model);
        }
        p2pApplicationDocumentsService.save(p2pApplicationDocuments);
        addMessage(redirectAttributes, "保存融资申请材料成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pApplicationDocuments/?repage";
    }

    @RequiresPermissions("financing:p2pApplicationDocuments:edit")
    @RequestMapping(value = "delete")
    public String delete(P2pApplicationDocuments p2pApplicationDocuments, RedirectAttributes redirectAttributes) {
        p2pApplicationDocumentsService.delete(p2pApplicationDocuments);
        addMessage(redirectAttributes, "删除融资申请材料成功");
        return "redirect:" + Global.getAdminPath() + "/financing/p2pApplicationDocuments/?repage";
    }


//	/**
//	 * 处理融资材料信息请求
//	 * @param p2pApplicationDocuments
//	 * @return
//	 */
//	@RequestMapping(value = "applicationDocuments",method = RequestMethod.POST)
//	@Transactional(readOnly = false)
//	public String applicationDocuments(MultipartHttpServletRequest multipartRequest,HttpSession session,P2pApplicationDocuments p2pApplicationDocuments){
//		try{
//			List<Integer> pers = new ArrayList<Integer>();
//			pers.add(FinancingState.FINANCING_APPLICATION_FINISHED);
//			pers.add(FinancingState.DOCUMENTS_AUDIT_FAILURE);
//			if(PermissionUtils.ctrlPermission(session, null, pers) == false){
//				return "modules/front/state/error";
//			}
//			User user = (User) session.getAttribute("user");
//			/*
//			 * 进行融资材料保存操作
//			 */
//			List<String> names = new ArrayList<String>();
//			names.add("applicationDocuments");
//			List<String> list = UploadFileUtils.fileUpload(multipartRequest,user.getLoginName(),names);//进行文件上传
//			p2pApplicationDocuments.setApplicationDocuments(list.get(0));//设置材料上传的保存路径
//			p2pApplicationDocuments.setCommitTime(new Date());//设置材料提交时间
//			p2pApplicationDocuments.setAuditOpinion("202");//设置为待审核
//			p2pApplicationDocumentsService.saveOrUpdateP2pApplicationDocuments(p2pApplicationDocuments);//添加或修改融资材料信息
//			/*
//			 * 进行融资项目状态更改操作
//			 */
//			P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation();
//			p2pFinancingInformation.setApplicantsId(user.getId());//根据申请人ID
//			p2pFinancingInformation.setCurrentStage("202");//设置当前融资项目的阶段
//			p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);//修改融资项目阶段
//			/*
//			 * 进行撮合前债项记录保存操作（更改融资项目状态后保存）
//			 */
//			P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
//			p2pBeforeMatchDebtState.setFinacingInformationId(p2pApplicationDocuments.getFinancingInformationId());//记录当前项目编号
//			p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());//记录当前融资项目阶段
//			p2pBeforeMatchDebtState.setStateTime(new Date());//记录时间
//			p2pBeforeMatchDebtStateService.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);//添加撮合前项目的记录信息
//			return "modules/front/financing/applicationDocumentsSuccess";
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		return "redirect:"+frontPath;
//	}
}