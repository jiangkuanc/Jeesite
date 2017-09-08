package com.dagongsoft.p2p.creditmanage.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 信用记录维护Entity
 *
 * @author Zazh
 * @version 2017-02-20
 */
public class CreditOverdueInfo extends DataEntity<CreditOverdueInfo> {

    private static final long serialVersionUID = 1L;
    private User user;        // 企业账户ID
    private String disposalAgency;        // 处置机构
    private String currency;        // 币种
    private String overdueAmount;        // 逾期金额
    private Date overdueDate;        // 逾期年月
    private String overdueMonths;        // 逾期持续月数
    private Date lastRepaymentDate;        // 最近一次还款日期
    private Date disposalCompletionDate;        // 处置完成日期
    private String pens;        // 笔数


    public CreditOverdueInfo() {
        super();
    }

    public CreditOverdueInfo(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 0, max = 16, message = "处置机构长度必须介于 0 和 16 之间")
    public String getDisposalAgency() {
        return disposalAgency;
    }

    public void setDisposalAgency(String disposalAgency) {
        this.disposalAgency = disposalAgency;
    }

    @Length(min = 0, max = 16, message = "币种长度必须介于 0 和 16 之间")
    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    @Length(min = 0, max = 16, message = "逾期金额长度必须介于 0 和 16 之间")
    public String getOverdueAmount() {
        return overdueAmount;
    }

    public void setOverdueAmount(String overdueAmount) {
        this.overdueAmount = overdueAmount;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getOverdueDate() {
        return overdueDate;
    }

    public void setOverdueDate(Date overdueDate) {
        this.overdueDate = overdueDate;
    }

    @Length(min = 0, max = 11, message = "逾期持续月数长度必须介于 0 和 11 之间")
    public String getOverdueMonths() {
        return overdueMonths;
    }

    public void setOverdueMonths(String overdueMonths) {
        this.overdueMonths = overdueMonths;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getLastRepaymentDate() {
        return lastRepaymentDate;
    }

    public void setLastRepaymentDate(Date lastRepaymentDate) {
        this.lastRepaymentDate = lastRepaymentDate;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getDisposalCompletionDate() {
        return disposalCompletionDate;
    }

    public void setDisposalCompletionDate(Date disposalCompletionDate) {
        this.disposalCompletionDate = disposalCompletionDate;
    }

    @Length(min = 0, max = 11, message = "笔数长度必须介于 0 和 11 之间")
    public String getPens() {
        return pens;
    }

    public void setPens(String pens) {
        this.pens = pens;
    }

}