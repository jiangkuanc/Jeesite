package com.dagongsoft.p2p.financing.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 债务人逾期记录表Entity
 *
 * @author Zeus
 * @version 2016-11-11
 */
public class P2pDebtorOverdueRecord extends DataEntity<P2pDebtorOverdueRecord> {

    private static final long serialVersionUID = 1L;
    private User user;        // user_id
    private Integer totalOverdueNumber;        // 累计逾期次数
    private Double totalOverdueAmount;        // 累计逾期金额
    private Integer totalOverdueDays;        // 累计逾期天数
    private Integer continueOverdueDays;        // 连续逾期天数
    private Date lastOverdueTime;        // 最后一次逾期时间
    private Double repayAmount;        // 偿还金额
    private Double stayOverdueAmount;        // 待还逾期金额
    private Double overdueFaxi;        // 逾期总罚息
    private Double faxiRepayAmount;        // 罚息缴费金额
    private String overdueLevel;        // 逾期级别（overdue_level）
    private String isDockingFirm;        // 是否对接事务所（yes_no）
    private String userId;
    private String debtNum; //债务人逾期债项数量
    private P2pEnterpriseCertify p2pEnterpriseCertify;


    public Double getFaxiRepayAmount() {
        return faxiRepayAmount;
    }

    public void setFaxiRepayAmount(Double faxiRepayAmount) {
        this.faxiRepayAmount = faxiRepayAmount;
    }

    public P2pEnterpriseCertify getP2pEnterpriseCertify() {
        return p2pEnterpriseCertify;
    }

    public void setP2pEnterpriseCertify(P2pEnterpriseCertify p2pEnterpriseCertify) {
        this.p2pEnterpriseCertify = p2pEnterpriseCertify;
    }

    public String getDebtNum() {
        return debtNum;
    }

    public void setDebtNum(String debtNum) {
        this.debtNum = debtNum;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public P2pDebtorOverdueRecord() {
        super();
    }

    public P2pDebtorOverdueRecord(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    @Length(min = 0, max = 64, message = "逾期级别（overdue_level）长度必须介于 0 和 64 之间")
    public String getOverdueLevel() {
        return overdueLevel;
    }

    public void setOverdueLevel(String overdueLevel) {
        this.overdueLevel = overdueLevel;
    }

    @Length(min = 0, max = 64, message = "是否对接事务所（yes_no）长度必须介于 0 和 64 之间")
    public String getIsDockingFirm() {
        return isDockingFirm;
    }

    public void setIsDockingFirm(String isDockingFirm) {
        this.isDockingFirm = isDockingFirm;
    }

}