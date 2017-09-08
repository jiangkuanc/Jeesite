package com.dagongsoft.p2p.investment.entity;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

public class P2pInvestmentEarnRecord extends DataEntity<P2pInvestmentEarnRecord> {

    private static final long serialVersionUID = 1L;
    private String id;                        //投资企业id
    private String bankName;                //	<th>投资机构名称</th>
    private Date lateInvestTime;            //	<th>最近一次投资时间</th>
    private String countInvestItem;            //	<th>累计投资项目总数</th>
    private String countInvestSuccessItem;    //	<th>累计投资成功债项数</th>
    private String sumInvestAccount;        //	<th>累计投资成功总金额（元）</th>
    private String expectSumAccount;        //	<th>预计总收益（元）</th>
    private String realSumAccount;            //	<th>实际总收益（元）</th>
    private String lateAccount;                //	<th>最近一笔收益金额（元）</th>
    private Date beginTime;        // 开始 认购时间
    private Date endTime;        // 结束 认购时间

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public Date getLateInvestTime() {
        return lateInvestTime;
    }

    public void setLateInvestTime(Date lateInvestTime) {
        this.lateInvestTime = lateInvestTime;
    }

    public String getCountInvestItem() {
        return countInvestItem;
    }

    public void setCountInvestItem(String countInvestItem) {
        this.countInvestItem = countInvestItem;
    }

    public String getCountInvestSuccessItem() {
        return countInvestSuccessItem;
    }

    public void setCountInvestSuccessItem(String countInvestSuccessItem) {
        this.countInvestSuccessItem = countInvestSuccessItem;
    }

    public String getSumInvestAccount() {
        return sumInvestAccount;
    }

    public void setSumInvestAccount(String sumInvestAccount) {
        this.sumInvestAccount = sumInvestAccount;
    }

    public String getExpectSumAccount() {
        return expectSumAccount;
    }

    public void setExpectSumAccount(String expectSumAccount) {
        this.expectSumAccount = expectSumAccount;
    }

    public String getRealSumAccount() {
        return realSumAccount;
    }

    public void setRealSumAccount(String realSumAccount) {
        this.realSumAccount = realSumAccount;
    }

    public String getLateAccount() {
        return lateAccount;
    }

    public void setLateAccount(String lateAccount) {
        this.lateAccount = lateAccount;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

}
