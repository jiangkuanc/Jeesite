/**
 *
 */
package com.thinkgem.jeesite.test.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.dagongsoft.p2p.repayment.service.Impl.MoneyServiceImpl;

/**
 * @author Zeus
 * @2016-12-2
 */
public class testRepaymentPlan {
    @Test
    public void test() {
        MoneyServiceImpl m = new MoneyServiceImpl();
        List<Map<String, Object>> list = m.getRepaymentPlan(new Date(), 80000.0, 0.06, "3", 12);
        System.out.println("期数\t利息\t本金\t\t日期");
        for (Map<String, Object> map : list) {
            System.out.println(map.get("phase") + "\t" + map.get("interest") + "\t" + map.get("principal") + "\t" + map.get("time"));
        }
    }
}
