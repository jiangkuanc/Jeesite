package com.dagongsoft.p2p.user.web.front.investment;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 投资信息记录信息类
 *
 * @author Joe
 * @since 2016-11-04
 */
public class InvestmentInfo implements Serializable {

    private static final long serialVersionUID = -6508034827941367879L;

    private boolean succeedInvestmentFlag;                    //是否成功投资
    private BigDecimal invesmentCredit;                        //投资额度(元)
    private Date investmentDatetime;                        //投资时间
    private String bondName;                                //债项名称
    private BigDecimal incomeRate;                            //收益率(年化)
    private String creditLevel;                                //信用级别
    private String bondState;                                //债项状态
    private Date expiredTime;                                //到期时间

    @Override
    public String toString() {
        return "InvestmentInfo [succeedInvestmentFlag=" + succeedInvestmentFlag
                + ", invesmentCredit=" + invesmentCredit
                + ", investmentDatetime=" + investmentDatetime + ", bondName="
                + bondName + ", incomeRate=" + incomeRate + ", creditLevel="
                + creditLevel + ", bondState=" + bondState + ", expiredTime="
                + expiredTime + "]";
    }

    public boolean isSucceedInvestmentFlag() {
        return succeedInvestmentFlag;
    }

    public void setSucceedInvestmentFlag(boolean succeedInvestmentFlag) {
        this.succeedInvestmentFlag = succeedInvestmentFlag;
    }

    public BigDecimal getInvesmentCredit() {
        return invesmentCredit;
    }

    public void setInvesmentCredit(BigDecimal invesmentCredit) {
        this.invesmentCredit = invesmentCredit;
    }

    public Date getInvestmentDatetime() {
        return investmentDatetime;
    }

    public void setInvestmentDatetime(Date investmentDatetime) {
        this.investmentDatetime = investmentDatetime;
    }

    public String getBondName() {
        return bondName;
    }

    public void setBondName(String bondName) {
        this.bondName = bondName;
    }

    public BigDecimal getIncomeRate() {
        return incomeRate;
    }

    public void setIncomeRate(BigDecimal incomeRate) {
        this.incomeRate = incomeRate;
    }

    public String getCreditLevel() {
        return creditLevel;
    }

    public void setCreditLevel(String creditLevel) {
        this.creditLevel = creditLevel;
    }

    public String getBondState() {
        return bondState;
    }

    public void setBondState(String bondState) {
        this.bondState = bondState;
    }

    public Date getExpiredTime() {
        return expiredTime;
    }

    public void setExpiredTime(Date expiredTime) {
        this.expiredTime = expiredTime;
    }


}
