/**
 *
 */
package com.dagongsoft.p2p.financing.service.back.after;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pDebtOverdueRecordDao;
import com.dagongsoft.p2p.financing.dao.P2pDebtorOverdueRecordDao;
import com.dagongsoft.p2p.financing.entity.P2pDebtOverdueRecord;
import com.dagongsoft.p2p.financing.entity.P2pDebtorOverdueRecord;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 逾期管理Service
 *
 * @author Zeus
 * @2016-11-11
 */
@Service
@Transactional(readOnly = true)
public class OverdueService {

    @Resource
    private P2pDebtOverdueRecordDao p2pDebtOverdueRecordDao;
    @Resource
    private P2pDebtorOverdueRecordDao p2pDebtorOverdueRecordDao;
    @Resource
    private MoneyService moneyService;

    /**
     * 债项逾期记录表
     *
     * @param p2pDebtOverdueRecord
     * @return
     * @author Zeus
     */
    public List<P2pDebtOverdueRecord> getDebtOverdueList(P2pDebtOverdueRecord p2pDebtOverdueRecord) {
        return p2pDebtOverdueRecordDao.getDebtOverdueList(p2pDebtOverdueRecord);
    }

    /**
     * 债项逾期记录表分页
     *
     * @param p2pDebtOverdueRecord
     * @return
     * @author Zeus
     */
    public Page<P2pDebtOverdueRecord> getDebtOverduePage(Page<P2pDebtOverdueRecord> page, P2pDebtOverdueRecord p2pDebtOverdueRecord) {
        p2pDebtOverdueRecord.setPage(page);
        List<P2pDebtOverdueRecord> list = getDebtOverdueList(p2pDebtOverdueRecord);
        for (P2pDebtOverdueRecord p : list) {
            String fid = p.getFinancingInformationId();
            P2pFinancingInformation p2pFinancingInformation = p.getP2pFinancingInformation();
            if (p2pFinancingInformation != null) {
                p2pFinancingInformation.setYhzjz(moneyService.DebtHasRepayment(fid));
            }
            p.setP2pFinancingInformation(p2pFinancingInformation);
        }
        page.setList(list);
        return page;
    }

    /**
     * 债务人逾期记录表
     *
     * @param P2pDebtorOverdueRecord
     * @return
     * @author Zeus
     */
    public List<P2pDebtorOverdueRecord> getDebtorOverdueList(P2pDebtorOverdueRecord p2pDebtorOverdueRecord) {
        return p2pDebtorOverdueRecordDao.getDebtorOverdueList(p2pDebtorOverdueRecord);
    }

    /**
     * 债务人逾期记录表分页
     *
     * @param P2pDebtorOverdueRecord
     * @return
     * @author Zeus
     */
    public Page<P2pDebtorOverdueRecord> getDebtorOverduePage(Page<P2pDebtorOverdueRecord> page, P2pDebtorOverdueRecord p2pDebtorOverdueRecord) {
        p2pDebtorOverdueRecord.setPage(page);
        List<P2pDebtorOverdueRecord> list = getDebtorOverdueList(p2pDebtorOverdueRecord);
        page.setList(list);
        return page;
    }

}
