package com.dagongsoft.p2p.financing.service.back.before;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 补信Service
 *
 * @author Zeus
 */
@Service
@Transactional(readOnly = true)
public class BuxinService {
    @Resource
    private P2pFinancingInformationDao p2pFinancingInformationDao;

    /**
     * 抵质押补信查询
     *
     * @param p2pGuaranteeRecord
     * @return
     */
    public List<P2pFinancingInformation> buxinList1(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.buxinList1(p2pFinancingInformation);
    }

    /**
     * 抵质押补信分页
     *
     * @param page
     * @param P2pFinancingInformation
     * @return
     */
    public Page<P2pFinancingInformation> buxinPage1(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(buxinList1(p2pFinancingInformation));
        return page;
    }

    /**
     * 担保补信查询
     *
     * @param P2pFinancingInformation
     * @return
     */
    public List<P2pFinancingInformation> buxinList2(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.buxinList2(p2pFinancingInformation);
    }

    /**
     * 担保补信分页
     *
     * @param page
     * @param P2pFinancingInformation
     * @return
     */
    public Page<P2pFinancingInformation> buxinPage2(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(buxinList2(p2pFinancingInformation));
        return page;
    }

}
