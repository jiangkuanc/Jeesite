package com.dagongsoft.p2p.investment.service.front;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.investment.dao.P2pInvestmentInformationDao;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.repayment.dao.P2pReceivePlanDao;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 投资记录Service
 *
 * @author Quincy
 */
@Service
@Transactional(readOnly = true)
public class InvestmentRecordService {

    @Autowired
    private P2pInvestmentInformationDao p2pInvestmentInformationDao;

    @Autowired
    private P2pReceivePlanDao p2pReceivePlanDao;

    /**
     * 根据债项ID查询投资记录
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public List<P2pInvestmentInformation> findInvestmentRecordByFid(String financingInformationId, Date beginTime, Date endTime) {
        P2pInvestmentInformation p2pInvestmentInformation = new P2pInvestmentInformation();
        p2pInvestmentInformation.setFinancingInformationId(financingInformationId);
        p2pInvestmentInformation.setBeginTime(beginTime);
        p2pInvestmentInformation.setEndTime(endTime);
        return p2pInvestmentInformationDao.findInvestmentRecordByFid(p2pInvestmentInformation);
    }

    /**
     * 根据债项ID查询投资总人数
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public Integer findAllRecordCountByFid(String financingInformationId) {
        return p2pInvestmentInformationDao.findAllRecordCountByFid(financingInformationId);
    }

    /**
     * 查询投资总览列表
     *
     * @param user
     * @param beginTime
     * @param endTime
     * @return
     * @author Quincy
     */
    public List<P2pInvestmentInformation> investmentGeneral(User user, Date beginTime, Date endTime) {
        P2pInvestmentInformation p2p = new P2pInvestmentInformation();
        p2p.setUserId(user.getId());
        p2p.setBeginTime(beginTime);
        p2p.setEndTime(endTime);
        return p2pInvestmentInformationDao.investmentGeneral(p2p);
    }

    /**
     * 根据投资人ID查询投资总额
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public Integer findInvestmentSumByUid(String userId) {
        Integer amount = p2pInvestmentInformationDao.findInvestmentSumByUid(userId);
        if (amount != null) {
            return amount;
        } else {
            return 0;
        }
    }

    /**
     * 根据投资人ID查询投资收益
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public Double findIncomeSumByUid(String userId) {
        Double amount = p2pReceivePlanDao.findIncomeSumByUid(userId);
        if (amount != null) {
            return amount;
        } else {
            return (double) 0;
        }
    }

    /**
     * 根据投资人ID和债项阶段查询投资债项总个数
     *
     * @param userId
     * @param currentStage
     * @return
     * @author Quincy
     */
    public Integer findInvestmentCountByUid(String userId, String currentStage) {
        P2pInvestmentInformation p2p = new P2pInvestmentInformation();
        P2pFinancingInformation pfi = new P2pFinancingInformation();
        p2p.setUserId(userId);
        pfi.setCurrentStage(currentStage);
        p2p.setP2pFinancingInformation(pfi);
        Integer count = p2pInvestmentInformationDao.findInvestmentCountByUid(p2p);
        if (count != null) {
            return count;
        } else {
            return 0;
        }
    }
}
