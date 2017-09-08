package com.dagongsoft.p2p.utils;

import java.util.Calendar;
import java.util.Date;

import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;

public class InvestmentUtils {
    private static P2pFinancingInformationDao fiDao = SpringContextHolder.getBean(P2pFinancingInformationDao.class);


    /**
     * 当前债项是否满标
     */
    public static Boolean isFullDebt(String fiId) {
        P2pFinancingInformation fi = fiDao.get(fiId);
        String cs = fi.getCurrentStage();
        if ("800".equals(cs) || "900".equals(cs)/*&&"0".equals(fi.getRestRaiseMoney())*/) {
            return true;
        } else {
            return false;
        }
    }


    /**
     * 当前债项是否流标
     */
    public static Boolean isFlowDebt(String fiId) {
        P2pFinancingInformation fi = fiDao.get(fiId);
        String cs = fi.getCurrentStage();
        if ("501".equals(cs) || "999".equals(cs)) {
            return true;
        } else {
            return false;
        }
    }


    /**
     * 当前债项募集到期时间
     */
    public static Date debtRaiseTime(String fiId) {
        P2pFinancingInformation fi = fiDao.get(fiId);
        Date date = fi.getPublishTime();
        int day = fi.getRaiseTimeLimit();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, day);
        return cal.getTime();
    }
}
