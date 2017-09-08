package com.dagongsoft.p2p.user.service.front;

import java.util.Date;
import java.util.List;

import com.dagongsoft.p2p.user.entity.P2pAccountMoneyRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 账户金额记录表Service
 *
 * @author Joe
 * @version 2016-11-04
 */
public interface P2pAccountMoneyRecordService {

    public P2pAccountMoneyRecord get(String id);

    public List<P2pAccountMoneyRecord> findList(P2pAccountMoneyRecord p2pAccountMoneyRecord);

    public Page<P2pAccountMoneyRecord> findPage(Page<P2pAccountMoneyRecord> page, P2pAccountMoneyRecord p2pAccountMoneyRecord);

    public void save(P2pAccountMoneyRecord p2pAccountMoneyRecord);

    public void delete(P2pAccountMoneyRecord p2pAccountMoneyRecord);

    /**
     * 查询数据库所有的P2pAccountMoneyRecord记录
     *
     * @author Joe
     * @since 2016-11-05
     */
    public List<P2pAccountMoneyRecord> findAllRecord();

    /**
     * 查询数据库所有的P2pAccountMoenyRecord记录,根据指定的时间
     *
     * @author Joe
     * @since 2016-11-05
     */
    public List<P2pAccountMoneyRecord> finAllRecordByDeadline(Date beginDate, Date endDate);

    /**
     * 计算累计投资总金额
     *
     * @author Joe
     * @since 2016-11-05
     */
    public Double accumulativeInvestmentTotalMoney();
}