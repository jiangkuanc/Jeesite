package com.dagongsoft.p2p.config.service;

import java.util.List;


import com.dagongsoft.p2p.config.entity.P2pGivingOutRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 放款审核记录Service
 *
 * @author Chace
 * @version 2017-02-17
 */
public interface P2pGivingOutRecordService {

    public P2pGivingOutRecord get(String id);

    public List<P2pGivingOutRecord> findList(P2pGivingOutRecord p2pGivingOutRecord);

    public Page<P2pGivingOutRecord> findPage(Page<P2pGivingOutRecord> page, P2pGivingOutRecord p2pGivingOutRecord);

    public void save(P2pGivingOutRecord p2pGivingOutRecord);

    public void delete(P2pGivingOutRecord p2pGivingOutRecord);

}