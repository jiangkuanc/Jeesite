package com.dagongsoft.p2p.repayment.web.front;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentRecord;
import com.dagongsoft.p2p.repayment.service.front.RepaymentOperationService;
import com.dagongsoft.p2p.repayment.service.front.RepaymentService;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 还款操作Controller
 *
 * @author Quincy
 */
@Controller
@RequestMapping(value = "${adminPath}/repayment/repaymentOperation")
public class RepaymentOperationController extends BaseController {


    @Autowired
    private RepaymentOperationService repaymentOperationService;

    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;

    @Autowired
    private RepaymentService repaymentService;

    /**
     * （机构投资类型债项）处理还款请求
     *
     * @param p2pRepaymentRecord
     * @param financingInformationId
     * @param multipartHttpServletRequest
     */
    @RequestMapping(value = "institutionRepayment")
    public String institutionRepayment(Date realRepaymentDate, String phase, String financingInformationId,
                                       String repaymentRecordId, MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<String> list = UploadFileUtils.fdfsUpload(multipartHttpServletRequest);
        //如果为null,进行增加操作;如果不为null,进行修改操作
        if (repaymentRecordId == null || "".equals(repaymentRecordId)) {
            repaymentService.repaymentAccouting(financingInformationId, phase, list.get(0), realRepaymentDate, "1");//还款记账
        } else {
            P2pRepaymentRecord p2pRepaymentRecord = new P2pRepaymentRecord(repaymentRecordId);
            p2pRepaymentRecord.setRealRepaymentDate(realRepaymentDate);
            p2pRepaymentRecord.setRepaymentVoucher(list.get(0));
            p2pRepaymentRecord.setRepaymentAuditState("1");//审核状态
            repaymentService.updateRepayInfo(p2pRepaymentRecord);
        }
//		if(repaymentOperationService.findRepaymentCountByFid(financingInformationId, 1) == 0){
//			//如果未还款总额等于0,就更该债项状态为贷款已还清
//			P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation(financingInformationId);
//			p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.PAID_OFF_LOAN));
//			p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
//		}
        return "redirect:" + adminPath + "/user/p2pUserInformation/accountPermission?mode=myDebt&state=1";
    }

    /**
     * （个人投资类型债项）处理还款请求
     */
    @RequestMapping(value = "personRepayment")
    @ResponseBody
    public void personRepayment(@RequestParam String phase, String financingInformationId) {
        boolean flag = true;
        //如果中金支付成功，返回记账
        if (flag == true) {
            repaymentService.repaymentAccouting(financingInformationId, phase, null, new Date(), "2");//还款记账
        }
        if (repaymentOperationService.findRepaymentCountByFid(financingInformationId, 1) == 0) {
            //如果未还款总额等于0,就更该债项状态为贷款已还清
            P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation(financingInformationId);
            p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.PAID_OFF_LOAN));
            p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
        }
    }
}
