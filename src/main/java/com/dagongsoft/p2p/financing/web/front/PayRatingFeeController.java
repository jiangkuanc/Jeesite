package com.dagongsoft.p2p.financing.web.front;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.financing.service.front.PayRatingFeeService;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.PermissionUtils;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 前台支付评级费业务Controller
 *
 * @author Quincy
 */
@Controller
@RequestMapping(value = "${adminPath}/RatingFee")
public class PayRatingFeeController {

    @Autowired
    private PayRatingFeeService payRatingFeeService;

    /**
     * 处理支付评级费请求（废弃方法）
     *
     * @param financingInformationId
     * @param session
     * @author Quincy
     */
    @RequestMapping(value = "payRatingFee")
    @ResponseBody
    public void payRatingFee(@RequestParam String financingInformationId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (PermissionUtils.ctrlPermission2(session, FinancingState.DOCUMENTS_AUDIT, FinancingState.PAID_RATING) == true) {
            boolean flag = true;
            if (flag) {
                payRatingFeeService.payRatingFee(financingInformationId, user.getId());
            }
        }
    }

    /**
     * 购买评级报告时，初始化订单
     *
     * @param session
     * @param financingInformationId
     */
    @RequestMapping(value = "initOrder")
    @ResponseBody
    public String initOrder(HttpSession session, String financingInformationId, Double paymentAmount) {
        try {
            User user = (User) session.getAttribute("user");
            Date orderTime = new Date();
            DateFormat df = new SimpleDateFormat("yyyyMMddhhssmmSSS");//精确到毫秒
//			DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
            String orderNo = "NO" + df.format(orderTime);
            P2pPaymentOfRatingCost entity = new P2pPaymentOfRatingCost(IdGen.uuid());
            entity.setFinancingInformationId(financingInformationId);    //评级报告项目ID
            entity.setOrderNo(orderNo);                //订单编号
            entity.setOrderTime(orderTime);            //订单时间
            entity.setPaymentAmount(paymentAmount);    //支付金额
            entity.setPaymentId(user.getId());        //付款人ID
            entity.setChargingItem("2");            //收费项目：购买评级报告
            entity.setPaymentStatus(0);                //支付状态：待付款
            payRatingFeeService.initOrder(entity);
            entity.setOrderTimeView(df.format(orderTime));
            return JsonMapper.toJsonString(entity);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 购买评级报告时，判断是否为等待支付成功状态
     *
     * @param financingInformationId
     * @return
     */
    @RequestMapping(value = "findIsPaying")
    @ResponseBody
    public boolean findIsPaying(HttpSession session, String financingInformationId) {
        User user = (User) session.getAttribute("user");
        return payRatingFeeService.findIsPaying(user.getId(), financingInformationId, "2", 3);
    }
}
