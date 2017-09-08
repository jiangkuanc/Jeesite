package com.dagongsoft.p2p.creditreport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.creditreport.dao.P2pCreditReportDao;
import com.dagongsoft.p2p.creditreport.entity.P2pCreditReport;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;


/**
 * 企业信用报告表ServiceImpl
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class P2pCreditReportService extends CrudService<P2pCreditReportDao, P2pCreditReport> {

    @Autowired
    private P2pCreditReportDao p2pcrediReportDao;

    public P2pCreditReport get(String id) {
        return super.get(id);
    }

    public List<P2pCreditReport> findList(P2pCreditReport p2pCreditReport) {
        List<P2pCreditReport> findList = super.findList(p2pCreditReport);
        return findList;
    }

    public List<P2pCreditReport> buyList(P2pCreditReport p2pCreditReport) {
        List<P2pCreditReport> findList = super.findList(p2pCreditReport);
        return findList;
    }

    public Page<P2pCreditReport> findPage(Page<P2pCreditReport> page, P2pCreditReport p2pCreditReport) {
        return super.findPage(page, p2pCreditReport);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pCreditReport p2pCreditReport) {
        super.save(p2pCreditReport);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pCreditReport p2pCreditReport) {
        super.delete(p2pCreditReport);
    }

    public P2pCreditReport getByUserId(String id) {
        return p2pcrediReportDao.getByUserId(id);
    }


}