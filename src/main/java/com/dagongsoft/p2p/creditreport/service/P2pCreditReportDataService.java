package com.dagongsoft.p2p.creditreport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.creditreport.entity.P2pCreditReportData;
import com.dagongsoft.p2p.creditreport.dao.P2pCreditReportDataDao;


/**
 * 信用报告指标数据表ServiceImpl
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class P2pCreditReportDataService extends CrudService<P2pCreditReportDataDao, P2pCreditReportData> {

    @Autowired
    P2pCreditReportDataDao p2pCreditReportDataDao;

    public P2pCreditReportData get(String id) {
        return super.get(id);
    }

    public List<P2pCreditReportData> findList(P2pCreditReportData p2pCreditReportData) {
        return super.findList(p2pCreditReportData);
    }

    public Page<P2pCreditReportData> findPage(Page<P2pCreditReportData> page, P2pCreditReportData p2pCreditReportData) {
        return super.findPage(page, p2pCreditReportData);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pCreditReportData p2pCreditReportData) {
        super.save(p2pCreditReportData);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pCreditReportData p2pCreditReportData) {
        super.delete(p2pCreditReportData);
    }

    public List<P2pCreditReportData> getCreditReprotId(String id) {
        return p2pCreditReportDataDao.getCreditReprotId(id);

    }

}