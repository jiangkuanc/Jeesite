/**
 *
 */
package com.dagongsoft.p2p.investment.service.back;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.investment.dao.P2pInvestmentInformationDao;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * @author Zeus
 * @2016-11-4
 */
@Service
@Transactional(readOnly = true)
public class SubscribeRecordService {
    @Resource
    private P2pInvestmentInformationDao p2pInvestmentInformationDao;
    @Resource
    private P2pFinancingInformationDao p2pFinancingInformationDao;
    @Resource
    private MoneyService moneyService;

    /**
     * 认购记录列表
     *
     * @param p2pInvestmentInformation
     * @return
     * @author Zeus
     */
    public List<P2pInvestmentInformation> getSubscribeRecordList(P2pInvestmentInformation p2pInvestmentInformation) {
        return p2pInvestmentInformationDao.getSubscribeRecordList(p2pInvestmentInformation);

    }

    /**
     * 认购记录分页
     *
     * @param page
     * @param p2pInvestmentInformation
     * @return
     * @author Zeus
     */
    public Page<P2pInvestmentInformation> getSubscribeRecordPage(Page<P2pInvestmentInformation> page, P2pInvestmentInformation p2pInvestmentInformation) {
        p2pInvestmentInformation.setPage(page);
        List<P2pInvestmentInformation> list = getSubscribeRecordList(p2pInvestmentInformation);
        for (P2pInvestmentInformation p : list) {
            p.setAccumulativeIncome(moneyService.userDebtIncome(p.getUserId(), p.getFinancingInformationId()));
        }
        page.setList(list);
        return page;
    }

    /**
     * 债项详情
     *
     * @param id(融资信息id)
     * @return
     * @author Zeus
     */
    public P2pFinancingInformation getDebtDetails(String id) {
        return p2pFinancingInformationDao.getDebtDetails(id);
    }
}
