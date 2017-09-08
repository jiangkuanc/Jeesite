package com.dagongsoft.p2p.financing.service.back;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 撮合中债项Service
 *
 * @author Chace
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class InFinancingService {
    @Autowired
    private P2pFinancingInformationDao p2pFinancingInformationDao;

    /**
     * 撮合中债项列表查询
     *
     * @param p2pFinancingInformation
     * @return p2pFinancingInformation
     * @author Chace
     */
    public List<P2pFinancingInformation> findInFinancingInformations(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.findInFinancingInformations(p2pFinancingInformation);
    }

    /**
     * 撮合中债项列表分页
     *
     * @param page
     * @param p2pFinancingInformation
     * @return
     * @author Chace
     */
    public Page<P2pFinancingInformation> getInFinancingPage(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(findInFinancingInformations(p2pFinancingInformation));
        return page;
    }

    /**
     * 撮合中满标审核列表查询
     *
     * @param p2pFinancingInformation
     * @return p2pFinancingInformation
     * @author Chace
     */
    public List<P2pFinancingInformation> findFullAuditList(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.findFullAuditList(p2pFinancingInformation);
    }

    /**
     * 撮合中满标审核列表分页
     *
     * @param page
     * @param p2pFinancingInformation
     * @return
     * @author Chace
     */
    public Page<P2pFinancingInformation> findFullAuditListPage(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(findFullAuditList(p2pFinancingInformation));
        return page;
    }

    /**
     * 撮合中流标审核列表查询
     *
     * @param p2pFinancingInformation
     * @return p2pFinancingInformation
     * @author Chace
     */
    public List<P2pFinancingInformation> findStandardAuditList(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.findStandardAuditList(p2pFinancingInformation);
    }

    /**
     * 撮合中流标审核列表分页
     *
     * @param page
     * @param p2pFinancingInformation
     * @return
     * @author Chace
     */
    public Page<P2pFinancingInformation> findStandardAuditListPage(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(findStandardAuditList(p2pFinancingInformation));
        return page;
    }

    /**
     * 根据债项id查询投资记录明细
     *
     * @param p2pInvestmentInformation
     * @return list
     * @author Chace
     * getInvestRecord
     */
    public List<P2pInvestmentInformation> getInvestRecord(P2pInvestmentInformation p2pInvestmentInformation) {
        return p2pFinancingInformationDao.getInvestRecord(p2pInvestmentInformation);
    }

    /**
     * 根据债项id查询投资记录分页
     *
     * @param page
     * @param p2pInvestmentInformation
     * @return
     * @author Chace
     */
    public Page<P2pInvestmentInformation> getInvestRecordPage(Page<P2pInvestmentInformation> page, P2pInvestmentInformation p2pInvestmentInformation) {
        p2pInvestmentInformation.setPage(page);
        page.setList(getInvestRecord(p2pInvestmentInformation));
        return page;
    }

    /**
     * 满标审核状态修改
     *
     * @param p2pFinancingInformation
     * @return
     * @author Chace
     */
    @Transactional(readOnly = false)
    public void updateById(P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformationDao.updateById(p2pFinancingInformation);
    }

    /**
     * 根据债项id查询投资记录
     *
     * @param p2pInvestmentInformation
     * @return list
     * @author Chace
     * getInvestRecord
     */
    public List<P2pInvestmentInformation> getInvestRecordByFid(P2pInvestmentInformation p2pInvestmentInformation) {
        return p2pFinancingInformationDao.getInvestRecordByFid(p2pInvestmentInformation);
    }

    /**
     * 募集期风控列表查询
     *
     * @param p2pFinancingInformation
     * @return p2pFinancingInformation
     * @author Chace
     */
    public List<P2pFinancingInformation> findRiskManagementList(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.findRiskManagementList(p2pFinancingInformation);
    }

    /**
     * 募集期风控列表分页
     *
     * @param page
     * @param p2pFinancingInformation
     * @return
     * @author Chace
     */
    public Page<P2pFinancingInformation> findRiskManagementListPage(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(findRiskManagementList(p2pFinancingInformation));
        return page;
    }

    /**
     * 撮合中机构放款审核列表查询
     *
     * @param p2pFinancingInformation
     * @return p2pFinancingInformation
     * @author Chace
     */
    public Page<P2pFinancingInformation> givingOutAuditPage(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao.givingOutAuditPage(p2pFinancingInformation));
        return page;
    }

    /**
     * 每天零点查询募集截止期，发送站内信和短信
     *
     * @author Chace
     */
    @Scheduled(cron = "0 0 0 * * ?  ")
    @Transactional(readOnly = false)
    public void sendMsg() {
        List<P2pFinancingInformation> list = p2pFinancingInformationDao.getLimitTime();
        if (list != null && list.size() != 0) {
            for (P2pFinancingInformation p2pFinancingInformation : list) {
                Date lastPublishTime = p2pFinancingInformation.getLastPublishTime();
                Date date = new Date();
                long hasRaiseTime = Long.valueOf(p2pFinancingInformation.getHasRaiseTime());
                int raiseTimeLimit = p2pFinancingInformation.getRaiseTimeLimit();
                String financingName = p2pFinancingInformation.getFinacingName();
                String recId = p2pFinancingInformation.getApplicantsId();
                long sec = raiseTimeLimit * 24 * 3600 - (date.getTime() - lastPublishTime.getTime() + hasRaiseTime * 1000) / 1000;
                int d = (int) (sec / 3600 / 24); //计算天
                int h = (int) ((sec / 3600) % 24); //计算时
                int m = (int) ((sec / 60) % 60); //计算分
                int ss = (int) ((sec) % 60); //计算秒
                Date limitDate = new Date(date.getTime() + sec * 1000);
                if ((d == 2 && (h + m + ss) > 0) || (d == 3 && (h + m + ss) == 0)) {
                    Map<String, String> map = MsgLetterTemplate.getMjdqst(financingName, limitDate);
                    MsgUtils.sendLetter(recId, map);
                    String content = MsgSmsTemplate.getMjdqst(limitDate);
                    try {
                        MsgUtils.sendSMS(recId, content);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if ((d == 0 && (h + m + ss) > 0) || (d == 1 && (h + m + ss) == 0)) {
                    Map<String, String> map = MsgLetterTemplate.getMjdqyt(financingName, limitDate);
                    MsgUtils.sendLetter(recId, map);
                    String content = MsgSmsTemplate.getMjdqyt(limitDate);
                    try {
                        MsgUtils.sendSMS(recId, content);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

}
