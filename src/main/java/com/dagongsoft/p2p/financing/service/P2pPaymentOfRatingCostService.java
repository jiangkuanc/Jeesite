/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pPaymentOfRatingCostDao;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 支付管理Service
 *
 * @author qichao
 * @version 2016-07-27
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class P2pPaymentOfRatingCostService extends CrudService<P2pPaymentOfRatingCostDao, P2pPaymentOfRatingCost> {

    @Autowired
    private P2pPaymentOfRatingCostDao p2pPaymentOfRatingCostDao;
    @Autowired
    private P2pFinancingInformationService p2pFinancingInformationService;
    @Autowired
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Autowired
    private P2pMarketConfirmRecordService p2pMarketConfirmRecordService;

    public P2pPaymentOfRatingCost get(String id) {
        return super.get(id);
    }

    public List<P2pPaymentOfRatingCost> findList(P2pPaymentOfRatingCost p2pPaymentOfRatingCost) {
        return super.findList(p2pPaymentOfRatingCost);
    }

    public Page<P2pPaymentOfRatingCost> findPage(Page<P2pPaymentOfRatingCost> page, P2pPaymentOfRatingCost p2pPaymentOfRatingCost) {
        return super.findPage(page, p2pPaymentOfRatingCost);
    }

    @Transactional(readOnly = false)
    public void save(P2pPaymentOfRatingCost p2pPaymentOfRatingCost) {
        super.save(p2pPaymentOfRatingCost);
    }

    @Transactional(readOnly = false)
    public void delete(P2pPaymentOfRatingCost p2pPaymentOfRatingCost) {
        super.delete(p2pPaymentOfRatingCost);
    }

    public P2pPaymentOfRatingCost getByFiId(String fiId) {
        return p2pPaymentOfRatingCostDao.getByFiId(fiId);
    }

    /**
     * 企业订单查询
     *
     * @author Chace
     */
    public Page<P2pPaymentOfRatingCost> findBusinessOrderPage(Page<P2pPaymentOfRatingCost> page, P2pPaymentOfRatingCost p2pPaymentOfRatingCost) {
        p2pPaymentOfRatingCost.setPage(page);
        page.setList(p2pPaymentOfRatingCostDao.findBusinessOrderList(p2pPaymentOfRatingCost));
        return page;
    }

    /**
     * 订单详情查询
     */
    public P2pPaymentOfRatingCost findBusinessOrderDetail(String id) {
        return p2pPaymentOfRatingCostDao.findBusinessOrderDetail(id);
    }

    /**
     * 清算文件管理列表
     *
     * @author Chace
     */
    public Page<P2pPaymentOfRatingCost> settlementDocumentList(Page<P2pPaymentOfRatingCost> page, P2pPaymentOfRatingCost p2pPaymentOfRatingCost) {
        p2pPaymentOfRatingCost.setPage(page);
        page.setList(p2pPaymentOfRatingCostDao.settlementDocumentList(p2pPaymentOfRatingCost));
        return page;
    }

    /**
     * 导出excel
     *
     * @author Chace
     */
    public List exportExcel(P2pPaymentOfRatingCost p2pPaymentOfRatingCost) {
        return p2pPaymentOfRatingCostDao.settlementDocumentList(p2pPaymentOfRatingCost);
    }

    /**
     * 根据债项id修改订单支付状态
     *
     * @author Chace
     */
    @Transactional(readOnly = false)
    public void updateStatusByFinancingId(P2pPaymentOfRatingCost p2pPaymentOfRatingCost) {
        p2pPaymentOfRatingCostDao.updateStatusByFinancingId(p2pPaymentOfRatingCost);
    }

    /**
     * 根据订单编号查看订单信息
     *
     * @param orderNo
     * @return
     */
    public P2pPaymentOfRatingCost getInfoByOrderNo(String orderNo) {
        return p2pPaymentOfRatingCostDao.getInfoByOrderNo(orderNo);
    }

    //@Override
    @Scheduled(cron = "0 0/1 * * * ? ")
    @Transactional(readOnly = false)
    public void updateOverdueDebt() {
        //获取203，250，600的非删除状态(支付节点)，未支付债项的评级费的企业list
        List<Map<String, Object>> list = p2pPaymentOfRatingCostDao.getPaymentPointProjectList();
        //处理203
        for (int i = 0; i < list.size(); i++) {
            Map<String, Object> map = list.get(i);
            Set<Entry<String, Object>> entrySet = map.entrySet();
            Date orderTime = null;
            String orderNo = null;
            String currentStage = null;
            String pass = null;
            String confirmStage = null;
            String financingInformationId = null;
            for (Entry<String, Object> entry : entrySet) {
                String key = entry.getKey();
                if ("orderTime".equals(key)) {
                    orderTime = (Date) entry.getValue();
                }
                if ("orderNo".equals(key)) {
                    orderNo = (String) entry.getValue();
                }
                if ("currentStage".equals(key)) {
                    currentStage = (String) entry.getValue();
                }
                if ("pass".equals(key)) {
                    pass = (String) entry.getValue();
                }
                if ("confirmStage".equals(key)) {
                    confirmStage = (String) entry.getValue();
                }
                if ("financingInformationId".equals(key)) {
                    financingInformationId = (String) entry.getValue();
                }
            }
            confirmOverdueOneDay(orderTime, pass, confirmStage, currentStage, financingInformationId, orderNo);
        }
    }

    //市场立项：将string转化为Date，并比较是否超过一天
    //@Scheduled(cron = "0 0/1 * * * ? ")
    //@Transactional(readOnly = false)
    private void confirmOverdueOneDay(Date date, String pass, String confirmStage, String currentStage, String financingInformationId, String orderNo) {
        Date now = new Date();
        long time2 = now.getTime();
        long time = date.getTime();
        long t = time2 - (time + 24 * 60 * 60 * 1000L);
        boolean flag = t > 0 ? true : false;
        //如果没有过时，就直接返回
        if (flag) {
            return;
        } else {
            //过一天后的债项,需要进行处理
            Integer stage = Integer.parseInt(currentStage);
            //待立项阶段203,还没有市场人员立项，结束项目，发送站内信
            if (203 == stage && !"1".equals(pass)) {
                //发送站内信通知
                P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.get(financingInformationId);
                //修改各种表
                p2pFinancingInformation.setCurrentStage(FinancingState.PROJECT_KNOT + "");//审核未通过状态变为结项
                p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);//仅更改为902

                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());
                p2pBeforeMatchDebtState.setProgressStage(FinancingState.PROJECT_KNOT + "");//审核未通过状态变为结项
                p2pBeforeMatchDebtState.setStateTime(date);
                p2pBeforeMatchDebtState.setOperatorId(UserUtils.getUser().getName());
                p2pBeforeMatchDebtState.setIsNewRecord(true);
                p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
                //发送站内信、短信
                MsgUtils.sendLetter(p2pFinancingInformationService.getDebtDetails(financingInformationId).getApplicantsId(), MsgLetterTemplate.getWzfsclxwtg());
                MsgUtils.sendSMS(p2pFinancingInformationService.getDebtDetails(financingInformationId).getApplicantsId(), MsgSmsTemplate.getWzfsclxwtg());
            } else if (203 == stage && "1".equals(pass)) {
                //市场确认后，更新废除就订单，第二次点击payFee的时候，生成新订单，标识位状态更改为1，1删除状态。
                Integer deleteFlag = this.deleteFlag(orderNo);
            }

            if (250 == stage && !"1".equals(pass)) {
                P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.get(financingInformationId);
                p2pFinancingInformation.setCurrentStage(FinancingState.PROJECT_KNOT + "");//审核未通过状态变为结项
                p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
                //发送站内信和短信
                P2pFinancingInformation p2p = p2pFinancingInformationService.findForMsg(p2pFinancingInformation);
                Map<String, String> map = MsgLetterTemplate.getWzfscfbwtg();
                MsgUtils.sendLetter(p2p.getApplicantsId(), map);
                String content = MsgSmsTemplate.getWzfscfbwtg();
                MsgUtils.sendSMS(p2p.getApplicantsId(), content);
                //轨迹表添加信息
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());
                p2pBeforeMatchDebtState.setProgressStage(FinancingState.PROJECT_KNOT + "");//审核未通过状态变为结项
                p2pBeforeMatchDebtState.setStateTime(date);
                p2pBeforeMatchDebtState.setIsNewRecord(true);
                p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            } else if (250 == stage && !"1".equals(pass)) {
                //市场确认后，更新废除就订单，第二次点击payFee的时候，生成新订单，标识位状态更改为1，1删除状态。
                Integer deleteFlag = this.deleteFlag(orderNo);
            }
            //假删除订单超过一天的
            if ("1".equals(pass) && stage > 203 && stage < 600) {
                Integer deleteFlag = this.deleteFlag(orderNo);
            }


            if (600 == stage && !"1".equals(pass) && "2".equals(confirmStage)) {
                P2pFinancingInformation p2pFinancingInformation = p2pFinancingInformationService.get(financingInformationId);
                p2pFinancingInformation.setCurrentStage(FinancingState.PROJECT_KNOT + "");//审核未通过状态变为结项
                p2pFinancingInformationService.updateCurrentStage(p2pFinancingInformation);
                //发送站内信和短信
                P2pFinancingInformation p2p = p2pFinancingInformationService.findForMsg(p2pFinancingInformation);
                Map<String, String> map = MsgLetterTemplate.getWzfscfbwtg();
                MsgUtils.sendLetter(p2p.getApplicantsId(), map);
                String content = MsgSmsTemplate.getWzfscfbwtg();
                MsgUtils.sendSMS(p2p.getApplicantsId(), content);
                //轨迹表添加信息
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                p2pBeforeMatchDebtState.setId(UUID.randomUUID().toString());
                p2pBeforeMatchDebtState.setProgressStage(FinancingState.PROJECT_KNOT + "");//审核未通过状态变为结项
                p2pBeforeMatchDebtState.setStateTime(date);
                p2pBeforeMatchDebtState.setIsNewRecord(true);
                p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
            }

        }


    }

    /*
     * 更改删除标识位，1删除，0正常
     */
    @Transactional(readOnly = false)
    public Integer deleteFlag(String orderNo) {
        return p2pPaymentOfRatingCostDao.deleteFlag(orderNo);
    }

    /**
     * 根据债项ID查询评级费订单信息
     * 防止多次重新生成订单用，在controller中，判断生成时间，是否，为小于24小时，否则重新生成订单
     *
     * @return
     * @author Quincy
     */
    public P2pPaymentOfRatingCost findOrderInfoByFid(String financingInformationId, String userId) {
        return p2pPaymentOfRatingCostDao.findOrderInfoByFid(financingInformationId, userId);
    }


}