package com.dagongsoft.p2p.repayment.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dagongsoft.p2p.repayment.entity.P2pReceiveRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 投资人收款记录表Service
 *
 * @author Zeus
 * @version 2016-11-08
 */
public interface P2pReceiveRecordService {


    public P2pReceiveRecord get(String id);

    public List<P2pReceiveRecord> findList(P2pReceiveRecord p2pReceiveRecord);

    public Page<P2pReceiveRecord> findPage(Page<P2pReceiveRecord> page, P2pReceiveRecord p2pReceiveRecord);

    public void save(P2pReceiveRecord p2pReceiveRecord);

    public void delete(P2pReceiveRecord p2pReceiveRecord);


    public Double queryAccIncome(@Param("userId") String userId);

}