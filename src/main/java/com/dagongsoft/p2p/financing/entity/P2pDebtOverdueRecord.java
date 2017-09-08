package com.dagongsoft.p2p.financing.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 债项逾期记录表Entity
 *
 * @author Zeus
 * @version 2016-11-11
 */
public class P2pDebtOverdueRecord extends DataEntity<P2pDebtOverdueRecord> {

    private static final long serialVersionUID = 1L;
    private User user;        // user_id
    private String financingInformationId;        // financing_information_id
    private Integer totalOverdueNumber;        // 累计逾期次数
    private Double totalOverdueAmount;        // 累计逾期金额
    private Integer totalOverdueDays;        // 累计逾期天数
    private Integer continueOverdueDays;        // 连续逾期天数
    private Date lastOverdueTime;        // 最后一次逾期时间
    private Double repayAmount;        // 偿还金额
    private Double stayOverdueAmount;        // 待还逾期金额
    private Double overdueFaxi;        // 逾期总罚息
    private Double faxiRepayAmount;        // 罚息缴费金额
    private String guaranteeRepayState;        // 担保代偿状态（guarantee_repay_state）

    private String userId;
    private P2pFinancingInformation p2pFinancingInformation;
    private P2pEnterpriseCertify p2pEnterpriseCertify;


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public P2pFinancingInformation getP2pFinancingInformation() {
        return p2pFinancingInformation;
    }

    public void setP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation) {
        this.p2pFinancingInformation = p2pFinancingInformation;
    }

    public P2pEnterpriseCertify getP2pEnterpriseCertify() {
        return p2pEnterpriseCertify;
    }

    public void setP2pEnterpriseCertify(P2pEnterpriseCertify p2pEnterpriseCertify) {
        this.p2pEnterpriseCertify = p2pEnterpriseCertify;
    }

    public P2pDebtOverdueRecord() {
        super();
    }

    public P2pDebtOverdueRecord(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 0, max = 64, message = "financing_information_id长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    public Integer getTotalOverdueNumber() {
        return totalOverdueNumber;
    }

    public void setTotalOverdueNumber(Integer totalOverdueNumber) {
        this.totalOverdueNumber = totalOverdueNumber;
    }

    public Double getTotalOverdueAmount() {
        return totalOverdueAmount;
    }

    public void setTotalOverdueAmount(Double totalOverdueAmount) {
        this.totalOverdueAmount = totalOverdueAmount;
    }

    public Integer getTotalOverdueDays() {
        return totalOverdueDays;
    }

    public void setTotalOverdueDays(Integer totalOverdueDays) {
        this.totalOverdueDays = totalOverdueDays;
    }

    public Integer getContinueOverdueDays() {
        return continueOverdueDays;
    }

    public void setContinueOverdueDays(Integer continueOverdueDays) {
        this.continueOverdueDays = continueOverdueDays;
    }

    public Date getLastOverdueTime() {
        return lastOverdueTime;
    }

    public void setLastOverdueTime(Date lastOverdueTime) {
        this.lastOverdueTime = lastOverdueTime;
    }

    public Double getRepayAmount() {
        return repayAmount;
    }

    public void setRepayAmount(Double repayAmount) {
        this.repayAmount = repayAmount;
    }

    public Double getStayOverdueAmount() {
        return stayOverdueAmount;
    }

    public void setStayOverdueAmount(Double stayOverdueAmount) {
        this.stayOverdueAmount = stayOverdueAmount;
    }

    public Double getOverdueFaxi() {
        return overdueFaxi;
    }

    public void setOverdueFaxi(Double overdueFaxi) {
        this.overdueFaxi = overdueFaxi;
    }

    public Double getFaxiRepayAmount() {
        return faxiRepayAmount;
    }

    public void setFaxiRepayAmount(Double faxiRepayAmount) {
        this.faxiRepayAmount = faxiRepayAmount;
    }

    @Length(min = 0, max = 64, message = "担保代偿状态（guarantee_repay_state）长度必须介于 0 和 64 之间")
    public String getGuaranteeRepayState() {
        return guaranteeRepayState;
    }

    public void setGuaranteeRepayState(String guaranteeRepayState) {
        this.guaranteeRepayState = guaranteeRepayState;
    }

}