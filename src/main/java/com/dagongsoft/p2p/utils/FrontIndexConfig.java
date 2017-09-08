package com.dagongsoft.p2p.utils;

import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.investment.dao.P2pInvestmentInformationDao;
import com.dagongsoft.p2p.user.dao.P2pUserInformationDao;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;

/**
 * 前台主页数据加载
 *
 * @author DAGONG
 */
public class FrontIndexConfig {

    private static P2pUserInformationDao p2pUserInformationDao = SpringContextHolder.getBean(P2pUserInformationDao.class);
    private static P2pFinancingInformationDao p2pFinancingInformationDao = SpringContextHolder.getBean(P2pFinancingInformationDao.class);
    private static P2pInvestmentInformationDao p2pInvestmentInformationDao = SpringContextHolder.getBean(P2pInvestmentInformationDao.class);

    /**
     * 获取外网注册总人数
     *
     * @return
     */
    public static Integer getAllUserInformation() {
        return p2pUserInformationDao.findMaxIdByUserBodyType(null);
    }

    /**
     * 获取已发布的融资总金额
     *
     * @return
     */
    public static String getAllFinancingAmount() {
        Integer amount = null;
        if (p2pFinancingInformationDao.findAllFinancingAmount("4") != null) {
            amount = p2pFinancingInformationDao.findAllFinancingAmount("4") / 10000;
        } else {
            amount = 0;
        }
        return FormatUtils.amountFormat(amount);
    }

    /**
     * 获取已发布的融资总项目数
     *
     * @return
     */
    public static String getAllFinancingInformation() {
        return FormatUtils.amountFormat(p2pFinancingInformationDao.findAllFinancingInformation("4"));
    }

    /**
     * 获取平台用户投资总收益
     *
     * @return
     */
    public static String getAllInvestmentIncome() {
        Integer amount = null;
        if (p2pInvestmentInformationDao.findAllInvestmentIncome(null) != null) {
            amount = p2pInvestmentInformationDao.findAllInvestmentIncome(null) / 10000;
        } else {
            amount = 0;
        }
        return FormatUtils.amountFormat(amount);
    }
}
