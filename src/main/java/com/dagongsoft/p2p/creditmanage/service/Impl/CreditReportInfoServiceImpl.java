package com.dagongsoft.p2p.creditmanage.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.creditmanage.entity.CreditReportInfo;
import com.dagongsoft.p2p.creditmanage.dao.CreditReportInfoDao;
import com.dagongsoft.p2p.creditmanage.service.CreditReportInfoService;

/**
 * 信用记录举报管理ServiceImpl
 *
 * @author Zazh
 * @version 2017-02-20
 */
@Transactional(readOnly = true)
@Service("creditReportInfoService")
public class CreditReportInfoServiceImpl extends CrudService<CreditReportInfoDao, CreditReportInfo> implements CreditReportInfoService {

    @Resource
    private CreditReportInfoDao creditReportInfoDao;

    public CreditReportInfo get(String id) {
        return super.get(id);
    }

    public List<CreditReportInfo> findList(CreditReportInfo creditReportInfo) {
        return super.findList(creditReportInfo);
    }

    public Page<CreditReportInfo> findPage(Page<CreditReportInfo> page, CreditReportInfo creditReportInfo) {
        return super.findPage(page, creditReportInfo);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(CreditReportInfo creditReportInfo) {
        super.save(creditReportInfo);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(CreditReportInfo creditReportInfo) {
        super.delete(creditReportInfo);
    }

    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void reportAudit(CreditReportInfo creditReportInfo) {
        creditReportInfoDao.reportAudit(creditReportInfo);
    }

    @Override
    public List<CreditReportInfo> findListByReportId(
            CreditReportInfo creditReportInfo) {
        return creditReportInfoDao.findListByReportId(creditReportInfo);
    }

    /**
     * 信用记录举报列表
     *
     * @param creditReportInfo
     * @return
     */
    public Page<CreditReportInfo> getReportPage(Page<CreditReportInfo> page, CreditReportInfo creditReportInfo) {
        creditReportInfo.setPage(page);
        page.setList(creditReportInfoDao.getReportList(creditReportInfo));
        return page;
    }

    /**
     * 信用记录举报详情（审核）
     */
    public CreditReportInfo getReportDetails(CreditReportInfo creditReportInfo) {
        return creditReportInfoDao.getReportDetails(creditReportInfo);
    }

}