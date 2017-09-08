package com.dagongsoft.p2p.creditreport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.creditreport.entity.P2pCreditReportIndex;
import com.dagongsoft.p2p.creditreport.dao.P2pCreditReportIndexDao;


/**
 * 信用报告指标表ServiceImpl
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class P2pCreditReportIndexService extends CrudService<P2pCreditReportIndexDao, P2pCreditReportIndex> {

    @Autowired
    private P2pCreditReportIndexDao p2pCreditReportIndexDao;

    public P2pCreditReportIndex get(String id) {
        return super.get(id);
    }

    public List<P2pCreditReportIndex> findList(P2pCreditReportIndex p2pCreditReportIndex) {
        return super.findList(p2pCreditReportIndex);
    }

    public Page<P2pCreditReportIndex> findPage(Page<P2pCreditReportIndex> page, P2pCreditReportIndex p2pCreditReportIndex) {
        return super.findPage(page, p2pCreditReportIndex);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pCreditReportIndex p2pCreditReportIndex) {
        super.save(p2pCreditReportIndex);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pCreditReportIndex p2pCreditReportIndex) {
        super.delete(p2pCreditReportIndex);
    }

    public List<P2pCreditReportIndex> getIndexId() {
        return p2pCreditReportIndexDao.getIndexId();
    }

}