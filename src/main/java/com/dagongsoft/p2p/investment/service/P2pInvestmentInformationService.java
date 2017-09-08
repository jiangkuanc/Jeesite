/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.investment.service;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.investment.dao.P2pInvestmentInformationDao;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentEarnRecord;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 投资信息Service
 *
 * @author qichao
 * @version 2016-07-06
 */
@Service
@Transactional(readOnly = true)
public class P2pInvestmentInformationService extends CrudService<P2pInvestmentInformationDao, P2pInvestmentInformation> {
    @Autowired
    private P2pInvestmentInformationDao p2pInvestmentInformationDao;

    public P2pInvestmentInformation get(String id) {
        return super.get(id);
    }

    public List<P2pInvestmentInformation> findList(P2pInvestmentInformation p2pInvestmentInformation) {
        return super.findList(p2pInvestmentInformation);
    }

    public Page<P2pInvestmentInformation> findPage(Page<P2pInvestmentInformation> page, P2pInvestmentInformation p2pInvestmentInformation) {
        return super.findPage(page, p2pInvestmentInformation);
    }

    @Transactional(readOnly = false)
    public void save(P2pInvestmentInformation p2pInvestmentInformation) {
        super.save(p2pInvestmentInformation);
    }

    @Transactional(readOnly = false)
    public void delete(P2pInvestmentInformation p2pInvestmentInformation) {
        super.delete(p2pInvestmentInformation);
    }

    public Page<P2pInvestmentEarnRecord> investmentEarnRecord(Page<P2pInvestmentEarnRecord> page, P2pInvestmentEarnRecord p2pInvestmentEarnRecord) {

        p2pInvestmentEarnRecord.setPage(page);
        page.setList(p2pInvestmentInformationDao.investmentEarnRecord(p2pInvestmentEarnRecord));
        return page;
    }


    public P2pInvestmentInformation addP2pInvestmentRecord(P2pInvestmentInformation p2pInvestmentInformation) {
        return p2pInvestmentInformationDao.addP2pInvestmentRecord(p2pInvestmentInformation);
    }

    /**
     * 根据项目查询投资信息列表
     *
     * @param p2pFinancingInformation
     * @return
     */
    public List<P2pInvestmentInformation> findP2pInvestmentInformationListByFid(P2pFinancingInformation p2pFinancingInformation) {
        return p2pInvestmentInformationDao.findP2pInvestmentInformationListByFid(p2pFinancingInformation);
    }

    public P2pInvestmentInformation getByFiId(String fiId) {
        return p2pInvestmentInformationDao.getByFiId(fiId);
    }


    public Integer findMaxId() {
        return p2pInvestmentInformationDao.findMaxId();
    }

    public String createInvestmentInformationId() {
        DecimalFormat df = new DecimalFormat("000000");
        Integer orderNo = findMaxId() + 1;
        return "ORDER" + df.format(orderNo);

    }

    /**
     * 根据债项ID和用户id查询投资记录
     *
     * @param p2pInvestmentInformation
     * @return
     * @author Chace
     */
    public P2pInvestmentInformation findInvestmentByids(P2pInvestmentInformation p2pInvestmentInformation) {
        return p2pInvestmentInformationDao.findInvestmentByids(p2pInvestmentInformation);
    }

    /**
     * 根据债项ID和用户id修改个人投资记录
     *
     * @param p2pInvestmentInformation
     * @return
     * @author Chace
     */
    @Transactional(readOnly = false)
    public void updateP2pInvestmentInformation(P2pInvestmentInformation p2pInvestmentInformation) {
        p2pInvestmentInformationDao.updateP2pInvestmentInformation(p2pInvestmentInformation);
    }

    /**
     * 根据用户id查询投资记录
     *
     * @param p2pInvestmentInformation
     * @return list
     * @author Chace
     */
    public List<P2pInvestmentInformation> findInvestmentByUserId(P2pInvestmentInformation p2pInvestmentInformation) {
        return p2pInvestmentInformationDao.findInvestmentByUserId(p2pInvestmentInformation);
    }

    public List<P2pInvestmentInformation> getP2pInvestmentInformationList(
            P2pInvestmentInformation p2p) {
        return p2pInvestmentInformationDao.getP2pInvestmentInformationList(p2p);
    }
}