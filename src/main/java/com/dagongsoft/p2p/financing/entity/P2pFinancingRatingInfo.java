/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.entity;

import java.util.Date;


import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 融资评级信息Entity
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
public class P2pFinancingRatingInfo extends DataEntity<P2pFinancingRatingInfo> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId; // 融资信息ID
    private String ratingLevel; // 信用等级---
    private String recommendedAmount;//批复金额
    private String recommendedRate; // 批复利率
    private String commitReport;//简版评级报告
    private String commitReportName;
    private String creditReport; //详版评级报告
    private String creditReportName;
    private Date publishTime; // 发布时间
    private String rateExpectation;//评级展望（rate_expectation）
    private String markType;//标的类型（mark_type）
    private String wetherRep;// 是否补信
    private String repCount;// 补信额度
    private String rating_audit_state;
    private String rating_audit_opinion;
    private String isFinalized;
    private String mainCreditGrade;//主体信用等级
    /*	private String creditState;// 评级状态
        private String debtLimit;//债项举债额度
        private String commitResult;// 准入评级结果
        private String commitPerson;// 准入分析师
        private String creditPerson;// 评级分析师
    */
    private String reportName; //评级报告名称(用于前台评级报告列表显示)
    private String isOrNoself;  //是否是本账户报告（用于评级报告购买时判断）
    private String isOrNoBuyed;  //是否已购买(用于评级报告购买时判断)
    private P2pFinancingInformation p2pFinancingInformation;
    private P2pEnterpriseCertify p2pEnterpriseCertify;
    private P2pRatingServiceInfo p2pRatingServiceInfo;
    private P2pIndustryclassi p2pIndustryclassi;
    private P2pUserInformation p2pUserInformation;
    /*public String getDebtLimit() {
        return debtLimit;
	}

	public void setDebtLimit(String debtLimit) {
		this.debtLimit = debtLimit;
	}*/


    public String getCommitReport() {
        return commitReport;
    }

    public String getIsOrNoself() {
        return isOrNoself;
    }

    public void setIsOrNoself(String isOrNoself) {
        this.isOrNoself = isOrNoself;
    }

    public String getIsOrNoBuyed() {
        return isOrNoBuyed;
    }

    public void setIsOrNoBuyed(String isOrNoBuyed) {
        this.isOrNoBuyed = isOrNoBuyed;
    }

    public P2pUserInformation getP2pUserInformation() {
        return p2pUserInformation;
    }

    public void setP2pUserInformation(P2pUserInformation p2pUserInformation) {
        this.p2pUserInformation = p2pUserInformation;
    }

    public P2pIndustryclassi getP2pIndustryclassi() {
        return p2pIndustryclassi;
    }

    public void setP2pIndustryclassi(P2pIndustryclassi p2pIndustryclassi) {
        this.p2pIndustryclassi = p2pIndustryclassi;
    }

    public String getReportName() {
        return reportName;
    }

    public void setReportName(String reportName) {
        this.reportName = reportName;
    }

    public String getMainCreditGrade() {
        return mainCreditGrade;
    }

    public void setMainCreditGrade(String mainCreditGrade) {
        this.mainCreditGrade = mainCreditGrade;
    }

    public String getRating_audit_state() {
        return rating_audit_state;
    }

    public void setRating_audit_state(String rating_audit_state) {
        this.rating_audit_state = rating_audit_state;
    }

    public String getRating_audit_opinion() {
        return rating_audit_opinion;
    }

    public void setRating_audit_opinion(String rating_audit_opinion) {
        this.rating_audit_opinion = rating_audit_opinion;
    }

    public void setCommitReport(String commitReport) {
        this.commitReport = commitReport;
    }

	/*public String getCommitResult() {
        return commitResult;
	}

	public void setCommitResult(String commitResult) {
		this.commitResult = commitResult;
	}

	public String getCommitPerson() {
		return commitPerson;
	}

	public void setCommitPerson(String commitPerson) {
		this.commitPerson = commitPerson;
	}

	public String getCreditPerson() {
		return creditPerson;
	}

	public void setCreditPerson(String creditPerson) {
		this.creditPerson = creditPerson;
	}*/

    public String getWetherRep() {
        return wetherRep;
    }

    public void setWetherRep(String wetherRep) {
        this.wetherRep = wetherRep;
    }

    public String getRepCount() {
        return repCount;
    }

    public void setRepCount(String repCount) {
        this.repCount = repCount;
    }

/*	public String getCreditState() {
		return creditState;
	}

	public void setCreditState(String creditState) {
		this.creditState = creditState;
	}*/

    public P2pFinancingRatingInfo() {
        super();
    }

    public P2pFinancingRatingInfo(String id) {
        super(id);
    }

    @Length(min = 1, max = 64, message = "融资信息ID长度必须介于 1 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 255, message = "信用等级长度必须介于 0 和255之间")
    public String getRatingLevel() {
        return ratingLevel;
    }

    public void setRatingLevel(String ratingLevel) {
        this.ratingLevel = ratingLevel;
    }

    @Length(min = 0, max = 255, message = "评级报告长度必须介于 0 和255 之间")
    public String getCreditReport() {
        return creditReport;
    }

    public void setCreditReport(String creditReport) {
        this.creditReport = creditReport;
    }

    @JsonFormat(pattern = "yyyy年MM月")
    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getRecommendedRate() {
        return recommendedRate;
    }

    public void setRecommendedRate(String recommendedRate) {
        this.recommendedRate = recommendedRate;
    }

    public String getRecommendedAmount() {
        return recommendedAmount;
    }

    public void setRecommendedAmount(String recommendedAmount) {
        this.recommendedAmount = recommendedAmount;
    }

    public String getRateExpectation() {
        return rateExpectation;
    }

    public void setRateExpectation(String rateExpectation) {
        this.rateExpectation = rateExpectation;
    }

    public String getMarkType() {
        return markType;
    }

    public void setMarkType(String markType) {
        this.markType = markType;
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

    public String getCommitReportName() {
        return commitReportName;
    }

    public void setCommitReportName(String commitReportName) {
        this.commitReportName = commitReportName;
    }

    public String getCreditReportName() {
        return creditReportName;
    }

    public void setCreditReportName(String creditReportName) {
        this.creditReportName = creditReportName;
    }

    public String getIsFinalized() {
        return isFinalized;
    }

    public void setIsFinalized(String isFinalized) {
        this.isFinalized = isFinalized;
    }

    public P2pRatingServiceInfo getP2pRatingServiceInfo() {
        return p2pRatingServiceInfo;
    }

    public void setP2pRatingServiceInfo(P2pRatingServiceInfo p2pRatingServiceInfo) {
        this.p2pRatingServiceInfo = p2pRatingServiceInfo;
    }
}