/**
 *
 */
package com.dagongsoft.p2p.config.service.back;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.service.FinancingService;
import com.dagongsoft.p2p.financing.service.P2pFinancingInformationService;
import com.dagongsoft.p2p.repayment.dao.P2pRepaymentPlanDao;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 后台首页Service
 *
 * @author Zeus
 * @version 2016-11-21
 */
@Transactional(readOnly = true)
@Service("homePageService")
public class HomePageService {
    @Resource
    private P2pRepaymentPlanDao p2pRepaymentPlanDao;
    @Resource
    private FinancingService financingService;
    @Resource
    private P2pFinancingInformationDao p2pFinancingInformationDao;
    @Resource
    private P2pFinancingInformationService p2pFinancingInformationService;

    /**
     * 查询处于还款预警状态的融资项目
     *
     * @return
     */
    public List<P2pRepaymentPlan> findRepaymentAndWarning() {
        Date date = new Date();
        return p2pRepaymentPlanDao.findRepaymentAndWarning(date);
    }

    /**
     * 材料审核任务池分页
     *
     * @param page
     * @param user
     * @return
     * @author Zeus
     */
    public Page<P2pEnterpriseCertify> p2pHomePageList1(Page<P2pEnterpriseCertify> page, P2pEnterpriseCertify p2pEnterpriseCertify) {
        p2pEnterpriseCertify.setPage(page);
        page.setList(financingService.findDocumentAuditList2());
        return page;
    }

    /**
     * 募集期债项预警信息分页
     *
     * @param page
     * @param user
     * @return
     * @author Zeus
     */
    public Page<P2pFinancingInformation> p2pHomePageList2(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationService.findFronRaiseAndWarning());
        return page;
    }

    /**
     * 还款期债项预警信息分页
     *
     * @param page
     * @param user
     * @return
     * @author Zeus
     */
    public Page<P2pRepaymentPlan> p2pHomePageList3(Page<P2pRepaymentPlan> page, P2pRepaymentPlan p2pRepaymentPlan) {
        p2pRepaymentPlan.setPage(page);
        page.setList(findRepaymentAndWarning());
        return page;
    }

    /**
     * 查询当前状态债项数量
     *
     * @param currentStage
     * @return
     */
    public Integer getCurrentStageNum(String currentStage) {
        return p2pFinancingInformationDao.getCurrentStageNum(currentStage);
    }
}
