/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.h2.util.New;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pFinancingRatingInfoDao;
import com.dagongsoft.p2p.financing.dao.P2pPaymentOfRatingCostDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.entity.P2pPaymentOfRatingCost;
import com.dagongsoft.p2p.rating.dao.P2pRatingReportTradingDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingReportTrading;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.dao.DictDao;
import com.thinkgem.jeesite.modules.sys.entity.Dict;

/**
 * 融资评级信息Service
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Service
@Transactional(readOnly = true)
public class P2pFinancingRatingInfoService extends CrudService<P2pFinancingRatingInfoDao, P2pFinancingRatingInfo> {

    @Autowired
    private P2pFinancingRatingInfoDao p2pFinancingRatingInfoDao;
    @Autowired
    private P2pRatingReportTradingDao p2pRatingReportTradingDao;
    @Autowired
    private P2pPaymentOfRatingCostDao p2pPaymentOfRatingCostDao;
    @Autowired
    private DictDao dictDao;

    public P2pFinancingRatingInfo get(String id) {
        return super.get(id);
    }

    public List<P2pFinancingRatingInfo> findList(P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        return super.findList(p2pFinancingRatingInfo);
    }

    public Page<P2pFinancingRatingInfo> findPage(Page<P2pFinancingRatingInfo> page, P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        return super.findPage(page, p2pFinancingRatingInfo);
    }

    @Transactional(readOnly = false)
    public void save(P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        super.save(p2pFinancingRatingInfo);
    }

    @Transactional(readOnly = false)
    public int updateCreitRes(P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        return p2pFinancingRatingInfoDao.updateCreitRes(p2pFinancingRatingInfo);
    }


    @Transactional(readOnly = false)
    public void delete(P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        super.delete(p2pFinancingRatingInfo);
    }

    public P2pFinancingRatingInfo getByFiId(String financingInformationId) {
        return p2pFinancingRatingInfoDao.getByFiId(financingInformationId);
    }

    public P2pFinancingRatingInfo findById(String id) {
        return p2pFinancingRatingInfoDao.findById(id);
    }

    /**
     * 查询评级报告列表
     *
     * @author Chace
     */
    public List<P2pFinancingRatingInfo> getRatingList(P2pFinancingRatingInfo p2pFinancingRatingInfo, String ratingType) {
        if (p2pFinancingRatingInfo.getMainCreditGrade() != null) {
            p2pFinancingRatingInfo.setRatingLevel(p2pFinancingRatingInfo.getMainCreditGrade());
        }
        List<P2pFinancingRatingInfo> list = new ArrayList<P2pFinancingRatingInfo>();
        if (ratingType != null && !"".equals(ratingType)) {
            if ("1".equals(ratingType)) {
                list = p2pFinancingRatingInfoDao.getFinancingRatingList(p2pFinancingRatingInfo);
                if (list != null && list.size() != 0) {
                    for (P2pFinancingRatingInfo p2p : list) {
                        String str = p2p.getP2pFinancingInformation().getFinacingName();
                        str = str.replace(p2p.getP2pFinancingInformation().getId(), "") + "借贷评级报告";
                        p2p.setReportName(str);
                    }
                }
            } else if ("2".equals(ratingType)) {
                list = p2pFinancingRatingInfoDao.getMainRatingList(p2pFinancingRatingInfo);
                if (list != null && list.size() != 0) {
                    for (P2pFinancingRatingInfo p2p : list) {
                        String str = p2p.getP2pRatingServiceInfo().getRatingName();
                        str = str.replace(p2p.getP2pRatingServiceInfo().getId(), "") + "主体信用等级报告";
                        p2p.setReportName(str);
                    }
                }
            }
        } else {
            List<P2pFinancingRatingInfo> financingList = p2pFinancingRatingInfoDao.getFinancingRatingList(p2pFinancingRatingInfo);
            List<P2pFinancingRatingInfo> mainList = p2pFinancingRatingInfoDao.getMainRatingList(p2pFinancingRatingInfo);
            if (financingList != null && financingList.size() != 0) {
                for (P2pFinancingRatingInfo p2p : financingList) {
                    String str = p2p.getP2pFinancingInformation().getFinacingName();
                    str = str.replace(p2p.getP2pFinancingInformation().getId(), "") + "借贷评级报告";
                    p2p.setReportName(str);
                    list.add(p2p);
                }
            }
            if (mainList != null && mainList.size() != 0) {
                for (P2pFinancingRatingInfo p2p : mainList) {
                    String str = p2p.getP2pRatingServiceInfo().getRatingName();
                    str = str.replace(p2p.getP2pRatingServiceInfo().getId(), "") + "主体信用等级报告";
                    p2p.setReportName(str);
                    list.add(p2p);
                }
            }
        }
        SortClass sort = new SortClass();
        Collections.sort(list, sort);
        return list;
    }

    /**
     * 根据id查询报告名及地址
     */
    public P2pFinancingRatingInfo getAddressANDName(String id) {
        return p2pFinancingRatingInfoDao.getAddressANDName(id);
    }

    /**
     * 评级报告购买页详情
     *
     * @author Chace
     */
    public P2pFinancingRatingInfo ratingReportDetails(P2pFinancingRatingInfo p2pFinancingRatingInfo, String userId) {
        p2pFinancingRatingInfo = p2pFinancingRatingInfoDao.ratingReportDetails(p2pFinancingRatingInfo);
        String prefix = p2pFinancingRatingInfo.getFinancingInformationId();
        prefix = prefix.substring(0, 3);
        if (userId != null && userId != "") {
            P2pRatingReportTrading p2pRatingReportTrading = new P2pRatingReportTrading();
            p2pRatingReportTrading.setUserId(userId);
            List<P2pRatingReportTrading> list = p2pRatingReportTradingDao.findRecordByUid(p2pRatingReportTrading);
            if (list != null && list.size() != 0) {
                for (P2pRatingReportTrading p2p : list) {
                    if (p2p.getReportId().equals(p2pFinancingRatingInfo.getFinancingInformationId())) {
                        p2pFinancingRatingInfo.setIsOrNoBuyed("1"); //已购买过本报告  无需购买
                        break;
                    }
                }
            }
            if (p2pFinancingRatingInfo.getP2pEnterpriseCertify().getUserId().equals(userId)) {
                p2pFinancingRatingInfo.setIsOrNoself("1");  //本账户报告，无需购买
            }
        }
        if (p2pFinancingRatingInfo != null) {
            if (prefix.equals("DG6")) {
                String str = p2pFinancingRatingInfo.getP2pFinancingInformation().getFinacingName();
                str = str.replace(p2pFinancingRatingInfo.getP2pFinancingInformation().getId(), "") + "借贷评级报告";
                p2pFinancingRatingInfo.setReportName(str);
            } else if (prefix.equals("DG7")) {
                String str = p2pFinancingRatingInfo.getP2pEnterpriseCertify().getEnterpriseName();
                str += "主体信用等级报告";
                p2pFinancingRatingInfo.setReportName(str);
            }
        }
        return p2pFinancingRatingInfo;
    }


    /**
     * 重写集合排序方法
     *
     * @author Chace
     */
    static class SortClass implements Comparator<Object> {
        public int compare(Object arg0, Object arg1) {
            P2pFinancingRatingInfo p2p0 = (P2pFinancingRatingInfo) arg0;
            P2pFinancingRatingInfo p2p1 = (P2pFinancingRatingInfo) arg1;
            int flag = p2p1.getPublishTime().compareTo(p2p0.getPublishTime());
            return flag;
        }
    }

    /**
     * 评级报告购买操作
     */
    @Transactional(readOnly = false)
    public boolean ratingReportBuy(Double payAmount, String financingInformationId, String userId, Integer reportType) {
        //判断是否购买
        P2pRatingReportTrading p2pRatingReportTrading2 = new P2pRatingReportTrading();
        p2pRatingReportTrading2.setUserId(userId);
        List<P2pRatingReportTrading> list = p2pRatingReportTradingDao.findRecordByUid(p2pRatingReportTrading2);
        if (list != null && list.size() != 0) {
            for (P2pRatingReportTrading p2p : list) {
                if (p2p.getReportId().equals(financingInformationId)) {
                    return false;
                }
            }
        }
        Date date = new Date();
        //评级报告交易表添加数据
        P2pRatingReportTrading p2pRatingReportTrading = new P2pRatingReportTrading();
        p2pRatingReportTrading.setId(IdGen.uuid());
        p2pRatingReportTrading.setReportId(financingInformationId);
        p2pRatingReportTrading.setUserId(userId);
        p2pRatingReportTrading.setTradingTime(date);
        p2pRatingReportTrading.setReportType(reportType);
        p2pRatingReportTradingDao.insert(p2pRatingReportTrading);
        //费用支付表
        P2pPaymentOfRatingCost p2pPaymentOfRatingCost = new P2pPaymentOfRatingCost();
        p2pPaymentOfRatingCost.setId(IdGen.uuid());
        p2pPaymentOfRatingCost.setFinancingInformationId(financingInformationId);
        p2pPaymentOfRatingCost.setOrderNo(new SimpleDateFormat("yyyyMMddHHmmss").format(date));
        p2pPaymentOfRatingCost.setOrderTime(date);
        p2pPaymentOfRatingCost.setChargingItem("2");
        p2pPaymentOfRatingCost.setPaymentId(userId);
        p2pPaymentOfRatingCost.setPaymentStatus(1);
        p2pPaymentOfRatingCost.setPaymentAmount(payAmount);
        p2pPaymentOfRatingCost.setTimeOfPayment(date);
        p2pPaymentOfRatingCostDao.insert(p2pPaymentOfRatingCost);
        return true;
    }

    /**
     * 首页评级信息查询
     *
     * @author Chace
     */
    public Map<String, List<P2pFinancingRatingInfo>> findFiveList() {
        Map<String, List<P2pFinancingRatingInfo>> map = new HashMap<String, List<P2pFinancingRatingInfo>>();
        List<P2pFinancingRatingInfo> financingList = p2pFinancingRatingInfoDao.findFiveFinancing();
        List<P2pFinancingRatingInfo> ratingList = p2pFinancingRatingInfoDao.findFiveRating();
        List<Dict> rateExpectationList = dictDao.getDictByType("rating_expection");//查询字典项
        /*
         * financingRating 企业借贷评级报告
		 */
        if (financingList != null && financingList.size() != 0) {
            for (P2pFinancingRatingInfo p2p : financingList) {
                P2pFinancingInformation p2pFinancingInformation = p2p.getP2pFinancingInformation();
                p2pFinancingInformation.setFinacingName(p2p.getP2pFinancingInformation().getFinacingName().replace(p2p.getFinancingInformationId(), ""));
                p2p.setP2pFinancingInformation(p2pFinancingInformation);
            }
        }
        /*
		 * mainRating 主体评级 
		 */
        if (ratingList != null && ratingList.size() != 0) {
            for (P2pFinancingRatingInfo p2p : ratingList) {
                for (Dict dict : rateExpectationList) {
                    if (p2p.getRateExpectation().equals(dict.getValue())) {
                        p2p.setRateExpectation(dict.getLabel());
                    }
                }
            }
        }
        map.put("financingList", financingList);
        map.put("ratingList", ratingList);
        return map;
    }

    public List<P2pFinancingRatingInfo> getP2pFinancingRatingInfoList(
            P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        return p2pFinancingRatingInfoDao.getP2pFinancingRatingInfoList(p2pFinancingRatingInfo);
    }
}