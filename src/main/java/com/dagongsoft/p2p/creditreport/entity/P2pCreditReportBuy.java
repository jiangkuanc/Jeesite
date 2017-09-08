package com.dagongsoft.p2p.creditreport.entity;

import java.math.BigDecimal;
import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 信用信息购买表Entity
 *
 * @author wangbignqi
 * @version 2016-11-07
 */
public class P2pCreditReportBuy extends DataEntity<P2pCreditReportBuy> {

    private static final long serialVersionUID = 1L;
    private User user;        // 用户编号
    private String userId;
    private String creditReportId;        // 信用报告编号
    private String creditInfoType;        // 信用信息类型(credit_info_type)
    private BigDecimal cost;        // 费用
    private Date buyTime;        // 购买时间
    private P2pCreditReport p2pCreditReport;
    private P2pIndustryclassi p2pIndustryclassi;


    public P2pIndustryclassi getP2pIndustryclassi() {
        return p2pIndustryclassi;
    }

    public void setP2pIndustryclassi(P2pIndustryclassi p2pIndustryclassi) {
        this.p2pIndustryclassi = p2pIndustryclassi;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public P2pCreditReportBuy() {
        super();
    }

    public P2pCreditReportBuy(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 1, max = 64, message = "信用报告编号长度必须介于 1 和 64 之间")
    public String getCreditReportId() {
        return creditReportId;
    }

    public void setCreditReportId(String creditReportId) {
        this.creditReportId = creditReportId;
    }

    @Length(min = 1, max = 64, message = "信用信息类型(credit_info_type)长度必须介于 1 和 64 之间")
    public String getCreditInfoType() {
        return creditInfoType;
    }

    public void setCreditInfoType(String creditInfoType) {
        this.creditInfoType = creditInfoType;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public Date getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(Date buyTime) {
        this.buyTime = buyTime;
    }

    public P2pCreditReport getP2pCreditReport() {
        return p2pCreditReport;
    }

    public void setP2pCreditReport(P2pCreditReport p2pCreditReport) {
        this.p2pCreditReport = p2pCreditReport;
    }

}