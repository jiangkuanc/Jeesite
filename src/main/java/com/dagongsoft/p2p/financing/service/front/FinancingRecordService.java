package com.dagongsoft.p2p.financing.service.front;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.utils.FinancingState;

/**
 * 融资信息业务Service
 *
 * @author Quincy
 */
@Service
@Transactional(readOnly = true)
public class FinancingRecordService {

    @Autowired
    private P2pFinancingInformationDao p2pFinancingInformationDao;

    @Autowired
    private P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao;

    /**
     * 根据用户ID查询还款记录列表
     *
     * @param userId
     * @param beginTime
     * @param endTime
     * @return
     */
    public List<P2pFinancingInformation> findRepayRecordByUid(String userId, Date beginTime, Date endTime) {
        P2pFinancingInformation p2p = new P2pFinancingInformation();
        p2p.setApplicantsId(userId);
        p2p.setBeginTime(beginTime);
        p2p.setEndTime(endTime);
        return p2pFinancingInformationDao.findRepayRecordByUid(p2p);
    }

    /**
     * 根据用户ID查询放款记录列表
     *
     * @param userId
     * @param beginTime
     * @param endTime
     * @return
     */
    public List<P2pFinancingInformation> findLoanRecordByUid(String userId, Date beginTime, Date endTime) {
        P2pFinancingInformation p2p = new P2pFinancingInformation();
        p2p.setApplicantsId(userId);
        p2p.setBeginTime(beginTime);
        p2p.setEndTime(endTime);
        return p2pFinancingInformationDao.findLoanRecordByUid(p2p);
    }

    /**
     * 根据债项ID查询轨迹
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public Integer findDebtOrbitByFid(String financingInformationId) {
        List<Integer> list = p2pBeforeMatchDebtStateDao.findDebtOrbitByFid(financingInformationId);
        Integer flag = 0;
        //只补信
        if (list.contains(FinancingState.SUPPLY_CREDIT) && !list.contains(FinancingState.RATING_RESULTS_CONTENT_MODIFING) &&
                !list.contains(FinancingState.REVIEW_ING)) {
            flag = 1;
        }
        //复评和补信
        if (list.contains(FinancingState.SUPPLY_CREDIT) && (list.contains(FinancingState.RATING_RESULTS_CONTENT_MODIFING) ||
                list.contains(FinancingState.REVIEW_ING))) {
            flag = 2;
        }
        //只复评
        if (!list.contains(FinancingState.SUPPLY_CREDIT) && (list.contains(FinancingState.RATING_RESULTS_CONTENT_MODIFING) ||
                list.contains(FinancingState.REVIEW_ING))) {
            flag = 3;
        }
        //不补信、不复评
        if (!list.contains(FinancingState.SUPPLY_CREDIT) && !list.contains(FinancingState.RATING_RESULTS_CONTENT_MODIFING) &&
                !list.contains(FinancingState.REVIEW_ING)) {
            flag = 4;
        }
        return flag;
    }

    public Integer findDebtOrbitByFid2(String financingInformationId) {
        List<Integer> list = p2pBeforeMatchDebtStateDao.findDebtOrbitByFid(financingInformationId);
        Integer flag = 0;
        //选择复评
        if (list.contains(FinancingState.REVIEW_ING) || list.contains(FinancingState.RATING_RESULTS_CONTENT_MODIFING)) {
            flag = 1;
        } else {
            flag = 2;
        }
        return flag;
    }
}
