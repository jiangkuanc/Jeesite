package com.dagongsoft.p2p.user.service.front;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.user.dao.P2pAccountMoneyRecordDao;
import com.dagongsoft.p2p.user.entity.P2pAccountMoneyRecord;
import com.dagongsoft.p2p.user.web.front.investment.InvestmentInfo;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 账户金额记录表ServiceImpl
 *
 * @author Joe
 * @version 2016-11-04
 */
@Transactional(readOnly = true)
@Service("p2pAccountMoneyRecordService")
public class P2pAccountMoneyRecordServiceImpl extends CrudService<P2pAccountMoneyRecordDao, P2pAccountMoneyRecord> implements P2pAccountMoneyRecordService {

    @Autowired
    public P2pAccountMoneyRecordDao daoAccountMoneyRecordDao;

    public P2pAccountMoneyRecord get(String id) {
        return super.get(id);
    }

    public List<P2pAccountMoneyRecord> findList(P2pAccountMoneyRecord p2pAccountMoneyRecord) {
        return super.findList(p2pAccountMoneyRecord);
    }

    public Page<P2pAccountMoneyRecord> findPage(Page<P2pAccountMoneyRecord> page, P2pAccountMoneyRecord p2pAccountMoneyRecord) {
        return super.findPage(page, p2pAccountMoneyRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pAccountMoneyRecord p2pAccountMoneyRecord) {
        super.save(p2pAccountMoneyRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pAccountMoneyRecord p2pAccountMoneyRecord) {
        super.delete(p2pAccountMoneyRecord);
    }

    /**
     * 获取投资收益封装信息
     *
     * @author Joe
     * @since 2016-11-04
     */
    @SuppressWarnings("deprecation")
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public List<InvestmentInfo> getInvestmentInfos() {
        List<P2pAccountMoneyRecord> p2pAccountMoneyRecord = daoAccountMoneyRecordDao.findAllList();
        for (P2pAccountMoneyRecord p2pAccountMoneyRecord2 : p2pAccountMoneyRecord) {
            //TODO
            p2pAccountMoneyRecord2.getBeginDate();
            p2pAccountMoneyRecord2.getEndDate();
            p2pAccountMoneyRecord2.getSpending();
            p2pAccountMoneyRecord2.getIncome();
            p2pAccountMoneyRecord2.getAmount();
            p2pAccountMoneyRecord2.getTradeState();

        }
        return null;

    }

    @Override
    public List<P2pAccountMoneyRecord> findAllRecord() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<P2pAccountMoneyRecord> finAllRecordByDeadline(Date beginDate,
                                                              Date endDate) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Double accumulativeInvestmentTotalMoney() {
        // TODO Auto-generated method stub
        return null;
    }

}