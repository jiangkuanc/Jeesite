package com.dagongsoft.p2p.financing.service.front;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingRatingInfoDao;
import com.dagongsoft.p2p.financing.dao.P2pPaymentOfRatingCostDao;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.rating.dao.P2pRatingReportTradingDao;
import com.dagongsoft.p2p.rating.dao.P2pRatingServiceInfoDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingReportTrading;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.RatingState;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.utils.IdGen;

/**
 * 前台支付评级费业务Service
 *
 * @author Quincy
 */
@Service
@Transactional(readOnly = true)
public class PayRatingFeeService {

    @Autowired
    private P2pPaymentOfRatingCostDao p2pPaymentOfRatingCostDao;
    @Autowired
    private P2pFinancingInformationDao p2pFinancingInformationDao;
    @Autowired
    private P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao;
    @Autowired
    private P2pFinancingRatingInfoDao p2pFinancingRatingInfoDao;
    @Autowired
    private P2pRatingServiceInfoDao p2pRatingServiceInfoDao;
    @Autowired
    private P2pRatingReportTradingDao p2pRatingReportTradingDao;

    /**
     * 根据债项ID查询评级费订单信息
     *
     * @return
     * @author Quincy
     */
    public P2pPaymentOfRatingCost findOrderInfoByFid(String financingInformationId, String userId) {
        P2pPaymentOfRatingCost entity = p2pPaymentOfRatingCostDao.findOrderInfoByFid(financingInformationId, userId);
        if (entity != null) {
            entity.setOrderTimeView(new SimpleDateFormat("yyyyMMddHHmmss").format(entity.getOrderTime()));
        }
        return entity;
    }

    /**
     * 记录评级费支付信息并更新项目状态（融资项目）
     *
     * @param financingInformationId
     * @param userId
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void payRatingFee(String financingInformationId, String userId) {
        /*
         * 修改融资流程状态
		 */
        String currentStage = p2pFinancingInformationDao.findCurrentStage(userId);
        P2pFinancingInformation p2pFinancingInformation = new P2pFinancingInformation(financingInformationId);
        if (FinancingState.DOCUMENTS_AUDIT_SUCCESS == Integer.parseInt(currentStage)) {
            p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.CREDIT_RATING_ING));
        }
        if (FinancingState.MARKET_STAFF_CONFIRMED == Integer.parseInt(currentStage)) {
            p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.CREDIT_RATING_SUCCESS));
        }
        if (FinancingState.INVESTED == Integer.parseInt(currentStage)) {
            P2pFinancingInformation info = p2pFinancingInformationDao.get(new P2pFinancingInformation(financingInformationId));
            if (info != null && info.getMarkType() == 1) {
                P2pFinancingInformation p2p = p2pFinancingInformationDao.findForMsg(p2pFinancingInformation);
                Map<String, String> map = MsgLetterTemplate.getRzqiwczfs(financingInformationId,
                        Double.valueOf(Integer.toString(p2p.getFinancingAmount())));
                MsgUtils.sendLetter(p2p.getP2pInvestmentInformation().getUserId(), map);
                String content = MsgSmsTemplate.getRzqiwczfs(Double.valueOf(Integer.toString(p2pFinancingInformationDao.findForMsg(p2pFinancingInformation).getFinancingAmount())));
                MsgUtils.sendSMS(p2p.getP2pInvestmentInformation().getUserId(), content);
            }
        }
        p2pFinancingInformationDao.updateIsHandRateCost(p2pFinancingInformation);
        /*
		 * 添加债项进展信息
		 */
        if (p2pFinancingInformation.getCurrentStage() != null) {
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
            p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());
            p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());
            p2pBeforeMatchDebtState.setStateTime(new Date());
            p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
        }
		/*
		 * 修改订单状态
		 */
        P2pPaymentOfRatingCost ratCost = new P2pPaymentOfRatingCost();
        ratCost.setFinancingInformationId(financingInformationId);
        ratCost.setTimeOfPayment(new Date());
        ratCost.setChargingItem("1");//收费项目：评级费
        p2pPaymentOfRatingCostDao.updateOrderInfoByFid(ratCost);

    }

    /**
     * 根据债项ID查询评级报告地址
     *
     * @param financingInformationId
     * @return
     */
    public P2pFinancingRatingInfo findRatingReportByFid(String financingInformationId) {
        return p2pFinancingRatingInfoDao.findRatingReportByFid(financingInformationId);
    }

    /**
     * 记录评级费支付信息并更新项目状态到信用评级中阶段（评级项目）
     *
     * @param financingInformationId
     * @param userId
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void payRatingFee2(String financingInformationId) {
        //修改融资流程状态和评级费支付状态
        P2pRatingServiceInfo p2p = new P2pRatingServiceInfo(financingInformationId);
        p2p.setCurrentStage(Integer.toString(RatingState.CREDIT_RATING_ING));
        p2p.setIsHandRateCost(1);
        p2pRatingServiceInfoDao.updateInfoById(p2p);
        //添加债项进展信息
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
        p2pBeforeMatchDebtState.setFinacingInformationId(p2p.getId());
        p2pBeforeMatchDebtState.setProgressStage(p2p.getCurrentStage());
        p2pBeforeMatchDebtState.setStateTime(new Date());
        p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
        //修改订单状态
        P2pPaymentOfRatingCost ratCost = new P2pPaymentOfRatingCost();
        ratCost.setFinancingInformationId(financingInformationId);
        ratCost.setTimeOfPayment(new Date());
        ratCost.setChargingItem("1");//收费项目：评级费
        p2pPaymentOfRatingCostDao.updateOrderInfoByFid(ratCost);
    }

    /**
     * 根据评级ID查询评级报告地址
     *
     * @param financingInformationId
     * @return
     */
    public P2pFinancingRatingInfo findRatingReportByRid(String financingInformationId) {
        return p2pFinancingRatingInfoDao.findRatingReportByRid(financingInformationId);
    }

    /**
     * 初始化订单
     *
     * @param p2pPaymentOfRatingCost
     */
    @Transactional(readOnly = false)
    public void initOrder(P2pPaymentOfRatingCost p2pPaymentOfRatingCost) {
        p2pPaymentOfRatingCostDao.insert(p2pPaymentOfRatingCost);
    }

    /**
     * （购买评级报告）支付成功后，修改支付状态、添加购买记录
     *
     * @param orderNo
     * @param paymentStatus
     * @param timeOfPayment
     * @param batchNo
     * @return
     */
    @Transactional(readOnly = false)
    public String callbackOrder(String orderNo, Integer paymentStatus, Date timeOfPayment, String batchNo) {
        //如果支付成功
        if (paymentStatus == 1) {
            //查询债项ID，回调页面
            P2pPaymentOfRatingCost p2pPaymentOfRatingCost = p2pPaymentOfRatingCostDao.getInfoByOrderNo(orderNo);
            String prefix = p2pPaymentOfRatingCost.getFinancingInformationId().substring(0, 3);
            Integer reportType = null;
            if ("DG6".equals(prefix)) {
                reportType = 1;
            } else {
                reportType = 2;
            }
            //添加购买记录
            P2pRatingReportTrading entity2 = new P2pRatingReportTrading();
            entity2.setId(IdGen.uuid());
            entity2.setReportId(p2pPaymentOfRatingCost.getFinancingInformationId());
            entity2.setUserId(p2pPaymentOfRatingCost.getPaymentId());
            entity2.setTradingTime(timeOfPayment);
            entity2.setReportType(reportType);
            p2pRatingReportTradingDao.insert(entity2);
            //修改支付状态
            P2pPaymentOfRatingCost entity = new P2pPaymentOfRatingCost();
            entity.setOrderNo(orderNo);
            entity.setPaymentStatus(paymentStatus);
            entity.setTimeOfPayment(timeOfPayment);
            entity.setBatchNo(batchNo);
            p2pPaymentOfRatingCostDao.updateStatusByorderNo(entity);
            return null;
        } else if (paymentStatus == 3) {
            if (p2pPaymentOfRatingCostDao.getInfoByOrderNo(orderNo).getPaymentStatus() == 1) {
                return "p2p/front/payment/paymentSuccess";//直接返回支付成功
            }
            //修改支付状态
            P2pPaymentOfRatingCost entity = new P2pPaymentOfRatingCost();
            entity.setOrderNo(orderNo);
            entity.setPaymentStatus(paymentStatus);
            entity.setTimeOfPayment(timeOfPayment);
            entity.setBatchNo(batchNo);
            p2pPaymentOfRatingCostDao.updateStatusByorderNo(entity);
            return "p2p/front/payment/paymentFinish";//直接返回支付中
        } else {
            return "";//返回支付失败
        }
    }

    /**
     * （支付评级费）支付成功后，修改支付状态、修改债项状态、添加进展信息
     *
     * @param orderNo
     * @param paymentStatus
     * @param timeOfPayment
     * @param batchNo
     * @return
     */
    @Transactional(readOnly = false)
    public String callbackOrder2(String orderNo, Integer paymentStatus, Date timeOfPayment, String batchNo) {

        //如果支付成功
        if (paymentStatus == 1) {
            //修改支付状态
            P2pPaymentOfRatingCost entity = new P2pPaymentOfRatingCost();
            entity.setOrderNo(orderNo);
            entity.setPaymentStatus(paymentStatus);
            entity.setTimeOfPayment(timeOfPayment);
            entity.setBatchNo(batchNo);
            p2pPaymentOfRatingCostDao.updateStatusByorderNo(entity);
            //查询债项信息，
            P2pPaymentOfRatingCost p2pPaymentOfRatingCost = p2pPaymentOfRatingCostDao.getInfoByOrderNo(orderNo);
            String financingInformationId = p2pPaymentOfRatingCost.getFinancingInformationId();
            P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationDao.findOneById(financingInformationId);
            String currentStage = p2pFinancingInformation.getCurrentStage();

            //修改融资流程状态
            P2pFinancingInformation entity2 = new P2pFinancingInformation(financingInformationId);
            if (FinancingState.DOCUMENTS_AUDIT_SUCCESS == Integer.parseInt(currentStage)) {
                entity2.setCurrentStage(Integer.toString(FinancingState.CREDIT_RATING_ING));
            }
            if (FinancingState.MARKET_STAFF_CONFIRMED == Integer.parseInt(currentStage)) {
                entity2.setCurrentStage(Integer.toString(FinancingState.CREDIT_RATING_SUCCESS));
            }
            if (FinancingState.INVESTED == Integer.parseInt(currentStage)) {
                P2pFinancingInformation info = p2pFinancingInformationDao.get(new P2pFinancingInformation(financingInformationId));
                if (info != null && info.getMarkType() == 1) {
                    P2pFinancingInformation p2p = p2pFinancingInformationDao.findForMsg(entity2);
                    Map<String, String> map = MsgLetterTemplate.getRzqiwczfs(financingInformationId,
                            Double.valueOf(Integer.toString(p2p.getFinancingAmount())));
                    MsgUtils.sendLetter(p2p.getP2pInvestmentInformation().getUserId(), map);
                    String content = MsgSmsTemplate.getRzqiwczfs(Double.valueOf(Integer.toString(p2pFinancingInformationDao.findForMsg(entity2).getFinancingAmount())));
                    MsgUtils.sendSMS(p2p.getP2pInvestmentInformation().getUserId(), content);
                }
            }
            p2pFinancingInformationDao.updateIsHandRateCost(entity2);

            //添加债项进展信息
            if (entity2.getCurrentStage() != null) {
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
                p2pBeforeMatchDebtState.setFinacingInformationId(entity2.getId());
                p2pBeforeMatchDebtState.setProgressStage(entity2.getCurrentStage());
                p2pBeforeMatchDebtState.setStateTime(new Date());
                p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
            }
            return null;
        } else if (paymentStatus == 3) {
            if (p2pPaymentOfRatingCostDao.getInfoByOrderNo(orderNo).getPaymentStatus() == 1) {
                return "p2p/front/payment/paymentSuccess";//直接返回支付成功
            }
            //修改支付状态
            P2pPaymentOfRatingCost entity = new P2pPaymentOfRatingCost();
            entity.setOrderNo(orderNo);
            entity.setPaymentStatus(paymentStatus);
            entity.setTimeOfPayment(timeOfPayment);
            entity.setBatchNo(batchNo);
            p2pPaymentOfRatingCostDao.updateStatusByorderNo(entity);
            return "p2p/front/payment/paymentFinish";//直接返回支付中
        } else {
            return "";//返回支付失败
        }
    }

    /**
     * 查看是否有支付中的订单
     *
     * @param financingInformationId
     * @param chargingItem
     * @param paymentStatus
     * @return true:有	false:没有
     */
    public boolean findIsPaying(String paymentId, String financingInformationId, String chargingItem, Integer paymentStatus) {
        P2pPaymentOfRatingCost entity = new P2pPaymentOfRatingCost();
        entity.setFinancingInformationId(financingInformationId);
        entity.setChargingItem(chargingItem);
        entity.setPaymentStatus(paymentStatus);
        entity.setPaymentId(paymentId);
        P2pPaymentOfRatingCost p2pPaymentOfRatingCost = p2pPaymentOfRatingCostDao.findIsPaying(entity);
        if (p2pPaymentOfRatingCost != null) {
            return true;
        } else {
            return false;
        }
    }

    //订单列表
    public List<P2pPaymentOfRatingCost> findOrderInfoListByFid(String financingInformationId, String userId) {
        return p2pPaymentOfRatingCostDao.findOrderInfoListByFid(financingInformationId, userId);
    }
}
