package com.dagongsoft.p2p.financing.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.financing.entity.P2pRiskControlRecord;
import com.dagongsoft.p2p.financing.dao.P2pRiskControlRecordDao;
import com.dagongsoft.p2p.financing.service.P2pRiskControlRecordService;

/**
 * 募集期风控记录表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-14
 */
@Transactional(readOnly = true)
@Service("p2pRiskControlRecordService")
public class P2pRiskControlRecordServiceImpl extends CrudService<P2pRiskControlRecordDao, P2pRiskControlRecord> implements P2pRiskControlRecordService {
    @Resource
    private P2pRiskControlRecordDao p2pRiskControlRecordDao;

    public P2pRiskControlRecord get(String id) {
        return super.get(id);
    }

    public List<P2pRiskControlRecord> findList(P2pRiskControlRecord p2pRiskControlRecord) {
        return super.findList(p2pRiskControlRecord);
    }

    public Page<P2pRiskControlRecord> findPage(Page<P2pRiskControlRecord> page, P2pRiskControlRecord p2pRiskControlRecord) {
        return super.findPage(page, p2pRiskControlRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRiskControlRecord p2pRiskControlRecord) {
        super.save(p2pRiskControlRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRiskControlRecord p2pRiskControlRecord) {
        super.delete(p2pRiskControlRecord);
    }

    /**
     * 根据债项id查询
     *
     * @param p2pRiskControlRecord
     * @return p2pRiskControlRecord
     * @author Chace
     */
    public P2pRiskControlRecord getByFid(P2pRiskControlRecord p2pRiskControlRecord) {
        return p2pRiskControlRecordDao.getByFid(p2pRiskControlRecord);
    }
}