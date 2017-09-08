package com.dagongsoft.p2p.rating.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.rating.entity.P2pRatingReportTrading;
import com.dagongsoft.p2p.rating.dao.P2pRatingReportTradingDao;
import com.dagongsoft.p2p.rating.service.P2pRatingReportTradingService;

/**
 * 评级报告交易记录ServiceImpl
 *
 * @author Chace
 * @version 2017-03-06
 */
@Transactional(readOnly = true)
@Service("p2pRatingReportTradingService")
public class P2pRatingReportTradingServiceImpl extends CrudService<P2pRatingReportTradingDao, P2pRatingReportTrading> implements P2pRatingReportTradingService {

    @Resource
    private P2pRatingReportTradingDao p2pRatingReportTradingDao;

    public P2pRatingReportTrading get(String id) {
        return super.get(id);
    }

    public List<P2pRatingReportTrading> findList(P2pRatingReportTrading p2pRatingReportTrading) {
        return super.findList(p2pRatingReportTrading);
    }

    public Page<P2pRatingReportTrading> findPage(Page<P2pRatingReportTrading> page, P2pRatingReportTrading p2pRatingReportTrading) {
        return super.findPage(page, p2pRatingReportTrading);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pRatingReportTrading p2pRatingReportTrading) {
        super.save(p2pRatingReportTrading);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pRatingReportTrading p2pRatingReportTrading) {
        super.delete(p2pRatingReportTrading);
    }

    @Override
    public List<P2pRatingReportTrading> findListByUid(
            P2pRatingReportTrading p2pRatingReportTrading) {
        return p2pRatingReportTradingDao.findListByUid(p2pRatingReportTrading);
    }

}