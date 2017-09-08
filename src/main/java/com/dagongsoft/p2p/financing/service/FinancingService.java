package com.dagongsoft.p2p.financing.service;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.FinancingDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 融资管理Service
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@Service
@Transactional(readOnly = true)
public class FinancingService {
    @Autowired
    private FinancingDao financingDao;

    public Page<P2pEnterpriseCertify> findListByFid(Page<P2pEnterpriseCertify> page, P2pEnterpriseCertify p2pEnterpriseCertify) {
        p2pEnterpriseCertify.setPage(page);
        page.setList(financingDao.findDocumentAuditList(p2pEnterpriseCertify));
        return page;
    }


    public Page<P2pFinancingInformation> fupingDebtList(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(financingDao.fupingDebtList(p2pFinancingInformation));
        return page;
    }

    //查询待材料审核债项
    public List<P2pEnterpriseCertify> findDocumentAuditList2() {
        return financingDao.findDocumentAuditList2();
    }

    //根据user_id获取企业认证基本信息
    public P2pEnterpriseCertify getEnterpriseBaseInfo(String userId) {
        return financingDao.getEnterpriseBaseInfo(userId);
    }

    //债项发布		融资信息表，融资评级信息表关联查询
    public Page<P2pFinancingInformation> findDebtReleaseList(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(financingDao.findDebtReleaseList(p2pFinancingInformation));
        return page;
    }

    //撮合中债项列表
    public Page<P2pFinancingInformation> findMiddleMatchList(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(financingDao.findMiddleMatchList(p2pFinancingInformation));
        return page;
    }

    //根据fiId获取单条撮合中债项信息
    public P2pFinancingInformation getMiddleMatchForm(String id) {
        return financingDao.getMiddleMatchForm(id);
    }

    //撮合后债项列表
    public Page<P2pFinancingInformation> findAfterMatchList(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(financingDao.findAfterMatchList(p2pFinancingInformation));
        return page;
    }

    /**
     * 获取债项各状态时间
     */
    public Date getDebtStageTime(String fiId, String stage) {
        return financingDao.getDebtStageTime(fiId, stage);
    }
}
