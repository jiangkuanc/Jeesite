package com.dagongsoft.p2p.utils;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.rating.dao.P2pRatingServiceInfoDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.user.dao.P2pUserInformationDao;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.entity.User;

public class PermissionUtils {

    private static P2pUserInformationDao p2pUserInformationDao = SpringContextHolder.getBean(P2pUserInformationDao.class);
    private static P2pFinancingInformationDao p2pFinancingInformationDao = SpringContextHolder.getBean(P2pFinancingInformationDao.class);
    private static P2pRatingServiceInfoDao p2pRatingServiceInfoDao = SpringContextHolder.getBean(P2pRatingServiceInfoDao.class);

    /**
     * 前台权限控制（针对是否登录）
     *
     * @param user
     * @return
     */
    public static boolean ctrlPermission(User user) {
        if (user == null || "".equals(user.getId())) {
            return false;
        }
        return true;
    }

    /**
     * 前台权限控制（针对一种状态）
     *
     * @param session
     * @param certifyState
     * @param financingState
     * @return
     */
    public static boolean ctrlPermission(HttpSession session, Integer certifyState, Integer financingState) {
        User user = (User) session.getAttribute("user");
        if (ctrlPermission(user) == false) {
            return false;
        }
        if (certifyState != null && !certifyState.equals(p2pUserInformationDao.findCertificateState(user.getId()))) {
            return false;
        }
        if (financingState != null && !Integer.toString(financingState).equals(p2pFinancingInformationDao.findCurrentStage(user.getId()))) {
            return false;
        }
        return true;
    }

    /**
     * 前台权限控制（针对多种状态）
     *
     * @param session
     * @param list
     * @return
     */
    public static boolean ctrlPermission(HttpSession session, List<Integer> list1, List<Integer> list2) {
        User user = (User) session.getAttribute("user");
        if (ctrlPermission(user) == false) {
            return false;
        }
        if (list1 != null) {
            for (Integer state : list1) {
                int currentState = p2pUserInformationDao.findCertificateState(user.getId());
                int rightState = state;
                if (currentState == rightState) {
                    return true;
                }
            }
        }
        if (list2 != null) {
            for (Integer state : list2) {
                if (Integer.toString(state).equals(p2pFinancingInformationDao.findCurrentStage(user.getId()))) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 前台权限控制（针对大于某种状态）判断当前债项阶段是否大于financingState1并且小于financingState2
     *
     * @param session
     * @param list
     * @return
     */
    public static boolean ctrlPermission2(HttpSession session, Integer financingState1, Integer financingState2) {
        User user = (User) session.getAttribute("user");
        if (ctrlPermission(user) == false) {
            return false;
        }
        int currentState = Integer.parseInt(p2pFinancingInformationDao.findCurrentStage(user.getId()));
        if (financingState1 != null && currentState > financingState1) {
            return true;
        }
        if (financingState2 != null && currentState < financingState2) {
            return true;
        }
        return false;
    }

    /**
     * 前台权限控制（针对评级流程状态）
     *
     * @param session
     * @param list
     * @return
     */
    public static boolean ctrlPermission3(HttpSession session, List<Integer> list) {
        User user = (User) session.getAttribute("user");
        if (ctrlPermission(user) == false) {
            return false;
        }
        if (list != null) {
            for (Integer state : list) {
                P2pRatingServiceInfo p2p = p2pRatingServiceInfoDao.findInfoByApplicantsId(user.getId());
                if (p2p == null) {
                    return false;
                }
                int rightState = state;
                if (Integer.valueOf(p2p.getCurrentStage()) == rightState) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 前台权限控制（针对评级流程状态）
     *
     * @param session
     * @param list
     * @return
     */
    public static boolean ctrlPermission3(HttpSession session, int currentStage) {
        User user = (User) session.getAttribute("user");
        if (ctrlPermission(user) == false) {
            return false;
        }
        P2pRatingServiceInfo p2p = p2pRatingServiceInfoDao.findInfoByApplicantsId(user.getId());
        if (p2p == null) {
            return false;
        }
        if (Integer.valueOf(p2p.getCurrentStage()) == currentStage) {
            return true;
        }
        return false;
    }
}
