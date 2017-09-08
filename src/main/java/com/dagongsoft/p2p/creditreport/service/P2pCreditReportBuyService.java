package com.dagongsoft.p2p.creditreport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.creditreport.dao.P2pCreditReportBuyDao;
import com.dagongsoft.p2p.creditreport.entity.P2pCreditReportBuy;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;


/**
 * 信用信息购买表ServiceImpl
 *
 * @author wangbignqi
 * @version 2016-11-07
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class P2pCreditReportBuyService extends CrudService<P2pCreditReportBuyDao, P2pCreditReportBuy> {

    @Autowired
    P2pCreditReportBuyDao p2pCreditReportBuyDao;

    public P2pCreditReportBuy get(String id) {
        return super.get(id);
    }

    public List<P2pCreditReportBuy> findList(P2pCreditReportBuy p2pCreditReportBuy) {
        return super.findList(p2pCreditReportBuy);
    }


    public Page<P2pCreditReportBuy> findPage(Page<P2pCreditReportBuy> page, P2pCreditReportBuy p2pCreditReportBuy) {
        return super.findPage(page, p2pCreditReportBuy);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pCreditReportBuy p2pCreditReportBuy) {
        super.save(p2pCreditReportBuy);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pCreditReportBuy p2pCreditReportBuy) {
        super.delete(p2pCreditReportBuy);
    }

    public List<P2pCreditReportBuy> getCreditReprotId(String id, String idd) {
        return p2pCreditReportBuyDao.getCreditReprotId(id, idd);
    }

    public List<P2pCreditReportBuy> tableList(P2pCreditReportBuy p2pCreditReportBuy) {
        List<P2pCreditReportBuy> tableList = p2pCreditReportBuyDao.tableList(p2pCreditReportBuy);
        return tableList;

    }

    ;

}