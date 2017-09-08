package com.dagongsoft.p2p.utils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.rating.dao.P2pRatingServiceInfoDao;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;

/**
 * 生成用户编号
 *
 * @author Zeus
 */
public class GenerateUserIdutils {
    private static UserDao userDao = SpringContextHolder.getBean(UserDao.class);
    private static P2pFinancingInformationDao p2pFinancingInformationDao = SpringContextHolder.getBean(P2pFinancingInformationDao.class);
    private static P2pRatingServiceInfoDao P2pRatingServiceInfoDao = SpringContextHolder.getBean(P2pRatingServiceInfoDao.class);

    /**
     * 生成用户编号
     *
     * @return
     */
    public String GenerateUserId(String staticUserRole) {
        String prefix = null;

        if (staticUserRole == StaticUserRole.FINACING_USER) {
            //融资企业 1
            prefix = "DGE";
        } else if (staticUserRole == StaticUserRole.INDIVIDUAL_INVESTMENT) {
            //投资个人2
            prefix = "DGP";
        } else if (staticUserRole == StaticUserRole.INSTITUTIONAL_INVESTOR) {
            //投资机构3
            prefix = "DGO";
        } else if (staticUserRole == StaticUserRole.ASSET_COMPANY) {
            //评估公司4
            prefix = "DGA";
        } else if (staticUserRole == StaticUserRole.GUARANTEE_COMPANY) {
            //担保公司5
            prefix = "DGG";
        } else {
            return null;
        }
        String id = userDao.getMaxId(prefix);
        if (id != null) {
            DecimalFormat df = new DecimalFormat("000000");
            id = id.substring(0, prefix.length()) + df.format(Integer.parseInt(id.substring(prefix.length())) + 1);
            return id;
        } else {
            return prefix + "000001";
        }
    }

    /**
     * 生成融资债项编号
     *
     * @param type
     * @return 项目编号生成规则:DG + 项目类型 + 8位日期 + 4位流水号
     * 项目类型:
     * 1.仅委托评级
     * 2.主动评级
     * 3.跟踪评级
     * 4.委托评级+发债
     * 5.其他
     * 6.服务平台委托
     * 7.纯评级
     */
    public static String createFinanInformationId(String type) {
        String prefix = "DG" + type;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        prefix += sdf.format(new Date());
        String id = null;
        if (type.equals("7")) {
            id = P2pRatingServiceInfoDao.getMaxId(prefix);
        } else {
            id = p2pFinancingInformationDao.getMaxId(prefix);
        }
        if (id != null) {
            DecimalFormat df = new DecimalFormat("0000");
            id = id.substring(0, prefix.length()) + df.format(Integer.parseInt(id.substring(prefix.length())) + 1);
            return id;
        } else {
            return prefix + "0001";
        }
    }
}
