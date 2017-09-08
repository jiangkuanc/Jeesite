/**
 *
 */
package com.dagongsoft.p2p.investment.service.back;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.repayment.service.MoneyService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * @author Zeus
 * @2016-11-4
 */
@Service
@Transactional(readOnly = true)
public class InvestmentIncomeService {

    @Resource
    private UserDao userDao;
    @Resource
    private MoneyService moneyService;

    /**
     * 投资收益列表
     *
     * @param user
     * @return
     * @author Zeus
     */
    public List<User> getInvestmentIncomeList(User user) {
        return userDao.getInvestmentIncomeList(user);

    }

    /**
     * 投资收益分页
     *
     * @param page
     * @param user
     * @return
     * @author Zeus
     */
    public Page<User> getInvestmentIncomePage(Page<User> page, User user) {
        user.setPage(page);
        List<User> list = getInvestmentIncomeList(user);
        for (User u : list) {
            P2pInvestmentInformation p = u.getP2pInvestmentInformation();
            p.setAccumulativeIncome(moneyService.accumulativeIncome(u.getId()));
            p.setLatelyIncome(moneyService.latelyIncome(u.getId()));
            u.setP2pInvestmentInformation(p);
        }
        page.setList(list);
        return page;
    }

    /**
     * getUserById
     *
     * @param userId
     * @return
     * @author Zeus
     */
    public User getUserById(String userId) {
        return userDao.get(userId);

    }
}
