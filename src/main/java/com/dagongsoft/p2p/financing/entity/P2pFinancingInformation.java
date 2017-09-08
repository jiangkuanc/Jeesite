/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.dagongsoft.p2p.feedback.entity.P2pRatingResultView;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.repayment.entity.P2pReceivePlan;
import com.dagongsoft.p2p.repayment.entity.P2pReceiveRecord;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentPlan;
import com.dagongsoft.p2p.repayment.entity.P2pRepaymentRecord;
import com.dagongsoft.p2p.user.entity.P2pAssetValuation;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.dagongsoft.p2p.user.entity.P2pGuarantee;
import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 融资信息表，包含申请信息Entity
 *
 * @author zhengshuo
 * @version 2016-07-11
 */
public class P2pFinancingInformation extends DataEntity<P2pFinancingInformation> {

    private static final long serialVersionUID = 1L;
    private String applicantsId;        // 申请人ID，是平台注册用户的ID
    private String userId;
    private String finacingName;        // 债项名称
    private String currentStage;        // 当前阶段，用数字代号表示：提交、审核、评级、发布
    private Date commitTime;        // 融资申请提交时间
    private Date publishTime;        // 融资发布时间
    private Integer financingMaturity;        // 借款时长，单位为月数，如：6个月、12个月、24个月
    private Integer isGuarantee;        // 是否担保
    private Integer financingAmount;        //批复金额  融资金额，最低5万，金额为100的倍数
    private Double recommendedRate;   //批复利率
    private Integer applicationAmount;   //申请金额
    private String applicationRate;        //申请利率
    private Integer raiseTimeLimit;        // 融资期限、募集期限，单位为天数，如：3天、10天、15天
    private String repaymentMode;        // 还款方式，字典项，如：一次性还本付息、按月付息到期还本
    private String creditState;        //准入评级结果
    private String developmentPhase;  //进展阶段
    private String givingOutVoucher;    //放款凭证
    private String givingOutState;        //放款状态

    private String purposeClassification;        // 融资用途分类，字典项，如：用于投资、新建工程、补充流动资金等
    private String purposeName;                    //VO属性，用途名称
    private String purposeExplain;        // 融资用途说明
    private String repaymentFirstSource;        // 第一还款来源的说明
    private String repaymentSecondSource;        // 第二还款来源的说明
    private String repaymentThirdSource;        // 第三还款来源的说明
    private String repaymentOtherSource;        // 其他还款来源的说明
    private Integer hasRaiseAmount;            //已募集金额
    private String restRaiseMoney;        // 剩余募集金额
    private String restRepaymetMoney;        // 剩余还款金额
    private Integer isHandRateCost;            //是否交评级费(yes_no)
    private Integer markType;                //标的类型(mark_type)
    private String inRaiseState;            //募集中状态（暂停，终止，恢复）(in_raise_state)
    private Date lastPublishTime;        //最新发布时间
    private String hasRaiseTime;        //已募集时间
    private Double retainRate;        //批复保留利率
    private String productName;   //产品名称
    private Integer isSupply;        //是否可以提交补充材料
    private String publishId;  //发布人id
    private String productDescription;//产品介绍

    private String warndays;   //警示天数
    private String phone;        // 联系电话
    private String realName;        // 企业法人姓名
    private Date givingOutTime;        // 放款时间
    private String expectCurrentAccount;//当前债项收益额
    private String sumReceiveAccount;//收款总额度
    private String ratingLevel;//评级结果
    private P2pFinancingRatingInfo p2pFinancingRatingInfo; //融资评级信息表
    private P2pPaymentOfRatingCost p2pPaymentOfRatingCost;
    private P2pBeforeMatchDebtState p2pBeforeMatchDebtState; //撮合前债项进展表
    private P2pEnterpriseCertify p2pEnterpriseCertify;//企业认证表
    private P2pRegUserCertify p2pRegUserCertify;
    private P2pGivingOutLoans p2pGivingOutLoans;//放款记录表
    private P2pInvestmentInformation p2pInvestmentInformation;//投资信息表
    private P2pRepaymentPlan p2pRepaymentPlan;
    private P2pReceivePlan p2pReceivePlan;
    private P2pReceiveRecord p2pReceiveRecord;
    private P2pRepaymentRecord p2pRepaymentRecord;
    private P2pMarketConfirmRecord p2pMarketConfirmRecord;//市场确认记录		private String JZQX;//募集期限倒计时使用
    private P2pIndustryclassi p2pIndustryclassi;//行业表
    private P2pRatingResultView p2pRatingResultView;
    private P2pGuarantee p2pGuarantee;
    private P2pGuaranteeRecord p2pGuaranteeRecord;
    private P2pAssetValuation p2pAssetValuation;
    private P2pAssetValuationRecord p2pAssetValuationRecord;

    private User user;
    private Date raiseDeadTime;//募集截止日期
    private String expectSumAccount;//总收益

    private String investmentIncome;//单项投资收益
    private Date beginTime;        // 开始日期
    private Date endTime;        // 结束日期

    private Date financingRepayExpire;//融资还款到期时间

    private Integer fs1;//融资规模（前台传参）
    private Integer fs2;//融资规模（前台传参）

    private double er1;//年化率（前台传参）
    private double er2;//年化率（前台传参）

    private double rate;//年化率（前台传参）

    private String JZQX;//

    private Double qbyhk; //全部应还款
    private Integer overdueNum; //债项逾期次数
    private Double yhzjz; //已还总金额
    private String roleId;


    public P2pReceiveRecord getP2pReceiveRecord() {
        return p2pReceiveRecord;
    }

    public void setP2pReceiveRecord(P2pReceiveRecord p2pReceiveRecord) {
        this.p2pReceiveRecord = p2pReceiveRecord;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getPublishId() {
        return publishId;
    }

    public void setPublishId(String publishId) {
        this.publishId = publishId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public P2pGuarantee getP2pGuarantee() {
        return p2pGuarantee;
    }

    public void setP2pGuarantee(P2pGuarantee p2pGuarantee) {
        this.p2pGuarantee = p2pGuarantee;
    }

    public P2pGuaranteeRecord getP2pGuaranteeRecord() {
        return p2pGuaranteeRecord;
    }

    public void setP2pGuaranteeRecord(P2pGuaranteeRecord p2pGuaranteeRecord) {
        this.p2pGuaranteeRecord = p2pGuaranteeRecord;
    }

    public P2pAssetValuation getP2pAssetValuation() {
        return p2pAssetValuation;
    }

    public void setP2pAssetValuation(P2pAssetValuation p2pAssetValuation) {
        this.p2pAssetValuation = p2pAssetValuation;
    }

    public P2pAssetValuationRecord getP2pAssetValuationRecord() {
        return p2pAssetValuationRecord;
    }

    public void setP2pAssetValuationRecord(
            P2pAssetValuationRecord p2pAssetValuationRecord) {
        this.p2pAssetValuationRecord = p2pAssetValuationRecord;
    }

    public String getGivingOutVoucher() {
        return givingOutVoucher;
    }

    public void setGivingOutVoucher(String givingOutVoucher) {
        this.givingOutVoucher = givingOutVoucher;
    }

    public P2pRatingResultView getP2pRatingResultView() {
        return p2pRatingResultView;
    }

    public void setP2pRatingResultView(P2pRatingResultView p2pRatingResultView) {
        this.p2pRatingResultView = p2pRatingResultView;
    }

    public P2pIndustryclassi getP2pIndustryclassi() {
        return p2pIndustryclassi;
    }

    public void setP2pIndustryclassi(P2pIndustryclassi p2pIndustryclassi) {
        this.p2pIndustryclassi = p2pIndustryclassi;
    }

    public P2pReceivePlan getP2pReceivePlan() {
        return p2pReceivePlan;
    }

    public void setP2pReceivePlan(P2pReceivePlan p2pReceivePlan) {
        this.p2pReceivePlan = p2pReceivePlan;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Double getQbyhk() {
        return qbyhk;
    }

    public void setQbyhk(Double qbyhk) {
        this.qbyhk = qbyhk;
    }

    public Integer getOverdueNum() {
        return overdueNum;
    }

    public void setOverdueNum(Integer overdueNum) {
        this.overdueNum = overdueNum;
    }

    public Double getYhzjz() {
        return yhzjz;
    }

    public void setYhzjz(Double yhzjz) {
        this.yhzjz = yhzjz;
    }

    public String getRatingLevel() {
        return ratingLevel;
    }

    public void setRatingLevel(String ratingLevel) {
        this.ratingLevel = ratingLevel;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getSumReceiveAccount() {
        return sumReceiveAccount;
    }

    public void setSumReceiveAccount(String sumReceiveAccount) {
        this.sumReceiveAccount = sumReceiveAccount;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public Integer getFs1() {
        return fs1;
    }

    public void setFs1(Integer fs1) {
        this.fs1 = fs1;
    }

    public Integer getFs2() {
        return fs2;
    }

    public void setFs2(Integer fs2) {
        this.fs2 = fs2;
    }

    public double getEr1() {
        return er1;
    }

    public void setEr1(double er1) {
        this.er1 = er1;
    }

    public double getEr2() {
        return er2;
    }

    public void setEr2(double er2) {
        this.er2 = er2;
    }

    public Date getRaiseDeadTime() {
        return raiseDeadTime;
    }

    public void setRaiseDeadTime(Date raiseDeadTime) {
        this.raiseDeadTime = raiseDeadTime;
    }

    public String getInvestmentIncome() {
        return investmentIncome;
    }

    public void setInvestmentIncome(String investmentIncome) {
        this.investmentIncome = investmentIncome;
    }

    public P2pInvestmentInformation getP2pInvestmentInformation() {
        return p2pInvestmentInformation;
    }

    public void setP2pInvestmentInformation(
            P2pInvestmentInformation p2pInvestmentInformation) {
        this.p2pInvestmentInformation = p2pInvestmentInformation;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getGivingOutTime() {
        return givingOutTime;
    }

    public void setGivingOutTime(Date givingOutTime) {
        this.givingOutTime = givingOutTime;
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getExpectSumAccount() {
        return expectSumAccount;
    }

    public void setExpectSumAccount(String expectSumAccount) {
        this.expectSumAccount = expectSumAccount;
    }

    public String getJZQX() {
        return JZQX;
    }

    public void setJZQX(String jZQX) {
        this.JZQX = jZQX;
    }

    public String getWarndays() {
        return warndays;
    }

    public void setWarndays(String warndays) {
        this.warndays = warndays;
    }


    public String getDevelopmentPhase() {
        return developmentPhase;
    }

    public void setDevelopmentPhase(String developmentPhase) {
        this.developmentPhase = developmentPhase;
    }

    public String getCreditState() {
        return creditState;
    }

    public void setCreditState(String creditState) {
        this.creditState = creditState;
    }


    public P2pEnterpriseCertify getP2pEnterpriseCertify() {
        return p2pEnterpriseCertify;
    }

    public void setP2pEnterpriseCertify(P2pEnterpriseCertify p2pEnterpriseCertify) {
        this.p2pEnterpriseCertify = p2pEnterpriseCertify;
    }

    public P2pPaymentOfRatingCost getP2pPaymentOfRatingCost() {
        return p2pPaymentOfRatingCost;
    }

    public void setP2pPaymentOfRatingCost(
            P2pPaymentOfRatingCost p2pPaymentOfRatingCost) {
        this.p2pPaymentOfRatingCost = p2pPaymentOfRatingCost;
    }

    public P2pFinancingInformation() {
        super();
    }

    public P2pFinancingInformation(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "申请人ID，是平台注册用户的ID长度必须介于 0 和 64 之间")
    public String getApplicantsId() {
        return applicantsId;
    }

    public void setApplicantsId(String applicantsId) {
        this.applicantsId = applicantsId;
    }

    @Length(min = 0, max = 64, message = "债项名称长度必须介于 0 和 64 之间")
    public String getFinacingName() {
        return finacingName;
    }

    public void setFinacingName(String finacingName) {
        this.finacingName = finacingName;
    }

    @Length(min = 0, max = 16, message = "当前阶段，用数字代号表示：提交、审核、评级、发布长度必须介于 0 和 16 之间")
    public String getCurrentStage() {
        return currentStage;
    }

    public void setCurrentStage(String currentStage) {
        this.currentStage = currentStage;
    }

    public Date getCommitTime() {
        return commitTime;
    }

    public void setCommitTime(Date commitTime) {
        this.commitTime = commitTime;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public Integer getFinancingMaturity() {
        return financingMaturity;
    }

    public void setFinancingMaturity(Integer financingMaturity) {
        this.financingMaturity = financingMaturity;
    }

    public Integer getIsGuarantee() {
        return isGuarantee;
    }

    public void setIsGuarantee(Integer isGuarantee) {
        this.isGuarantee = isGuarantee;
    }

    public Integer getFinancingAmount() {
        return financingAmount;
    }

    public void setFinancingAmount(Integer financingAmount) {
        this.financingAmount = financingAmount;
    }

    public String getApplicationRate() {
        return applicationRate;
    }

    public void setApplicationRate(String applicationRate) {
        this.applicationRate = applicationRate;
    }

    public Integer getRaiseTimeLimit() {
        return raiseTimeLimit;
    }

    public void setRaiseTimeLimit(Integer raiseTimeLimit) {
        this.raiseTimeLimit = raiseTimeLimit;
    }

    @Length(min = 0, max = 64, message = "还款方式，字典项，如：一次性还本付息、按月付息到期还本长度必须介于 0 和 64 之间")
    public String getRepaymentMode() {
        return repaymentMode;
    }

    public void setRepaymentMode(String repaymentMode) {
        this.repaymentMode = repaymentMode;
    }


    @Length(min = 0, max = 32, message = "融资用途分类，字典项，如：用于投资、新建工程、补充流动资金等长度必须介于 0 和 32 之间")
    public String getPurposeClassification() {
        return purposeClassification;
    }

    public void setPurposeClassification(String purposeClassification) {
        this.purposeClassification = purposeClassification;
    }

    @Length(min = 0, max = 2000, message = "融资用途说明长度必须介于 0 和 2000 之间")
    public String getPurposeExplain() {
        return purposeExplain;
    }

    public void setPurposeExplain(String purposeExplain) {
        this.purposeExplain = purposeExplain;
    }

    @Length(min = 0, max = 2000, message = "第一还款来源的说明长度必须介于 0 和 2000 之间")
    public String getRepaymentFirstSource() {
        return repaymentFirstSource;
    }

    public void setRepaymentFirstSource(String repaymentFirstSource) {
        this.repaymentFirstSource = repaymentFirstSource;
    }

    @Length(min = 0, max = 2000, message = "第二还款来源的说明长度必须介于 0 和 2000 之间")
    public String getRepaymentSecondSource() {
        return repaymentSecondSource;
    }

    public void setRepaymentSecondSource(String repaymentSecondSource) {
        this.repaymentSecondSource = repaymentSecondSource;
    }

    @Length(min = 0, max = 2000, message = "第三还款来源的说明长度必须介于 0 和 2000 之间")
    public String getRepaymentThirdSource() {
        return repaymentThirdSource;
    }

    public void setRepaymentThirdSource(String repaymentThirdSource) {
        this.repaymentThirdSource = repaymentThirdSource;
    }

    @Length(min = 0, max = 2000, message = "其他还款来源的说明长度必须介于 0 和 2000 之间")
    public String getRepaymentOtherSource() {
        return repaymentOtherSource;
    }

    public void setRepaymentOtherSource(String repaymentOtherSource) {
        this.repaymentOtherSource = repaymentOtherSource;
    }

    @Length(min = 0, max = 10, message = "剩余募集金额长度必须介于 0 和 10 之间")
    public String getRestRaiseMoney() {
        return restRaiseMoney;
    }

    public void setRestRaiseMoney(String restRaiseMoney) {
        this.restRaiseMoney = restRaiseMoney;
    }

    @Length(min = 0, max = 10, message = "剩余还款金额长度必须介于 0 和 10 之间")
    public String getRestRepaymetMoney() {
        return restRepaymetMoney;
    }

    public void setRestRepaymetMoney(String restRepaymetMoney) {
        this.restRepaymetMoney = restRepaymetMoney;
    }

    public P2pFinancingRatingInfo getP2pFinancingRatingInfo() {
        return p2pFinancingRatingInfo;
    }

    public void setP2pFinancingRatingInfo(
            P2pFinancingRatingInfo p2pFinancingRatingInfo) {
        this.p2pFinancingRatingInfo = p2pFinancingRatingInfo;
    }

    public P2pBeforeMatchDebtState getP2pBeforeMatchDebtState() {
        return p2pBeforeMatchDebtState;
    }

    public void setP2pBeforeMatchDebtState(
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        this.p2pBeforeMatchDebtState = p2pBeforeMatchDebtState;
    }

    public P2pGivingOutLoans getP2pGivingOutLoans() {
        return p2pGivingOutLoans;
    }

    public void setP2pGivingOutLoans(P2pGivingOutLoans p2pGivingOutLoans) {
        this.p2pGivingOutLoans = p2pGivingOutLoans;
    }


    public Date getFinancingRepayExpire() {
        return financingRepayExpire;
    }

    public void setFinancingRepayExpire(Date financingRepayExpire) {
        this.financingRepayExpire = financingRepayExpire;
    }

    public String getExpectCurrentAccount() {
        return expectCurrentAccount;
    }

    public void setExpectCurrentAccount(String expectCurrentAccount) {
        this.expectCurrentAccount = expectCurrentAccount;
    }


    public Double getRecommendedRate() {
        return recommendedRate;
    }


    public void setRecommendedRate(Double recommendedRate) {
        this.recommendedRate = recommendedRate;
    }

    public Integer getApplicationAmount() {
        return applicationAmount;
    }

    public void setApplicationAmount(Integer applicationAmount) {
        this.applicationAmount = applicationAmount;
    }

    public Integer getIsHandRateCost() {
        return isHandRateCost;
    }

    public void setIsHandRateCost(Integer isHandRateCost) {
        this.isHandRateCost = isHandRateCost;
    }

    public Integer getMarkType() {
        return markType;
    }

    public void setMarkType(Integer markType) {
        this.markType = markType;
    }

    public String getInRaiseState() {
        return inRaiseState;
    }

    public void setInRaiseState(String inRaiseState) {
        this.inRaiseState = inRaiseState;
    }

    public Integer getHasRaiseAmount() {
        return hasRaiseAmount;
    }

    public void setHasRaiseAmount(Integer hasRaiseAmount) {
        this.hasRaiseAmount = hasRaiseAmount;
    }

    public Date getLastPublishTime() {
        return lastPublishTime;
    }

    public void setLastPublishTime(Date lastPublishTime) {
        this.lastPublishTime = lastPublishTime;
    }

    public String getHasRaiseTime() {
        return hasRaiseTime;
    }

    public void setHasRaiseTime(String hasRaiseTime) {
        this.hasRaiseTime = hasRaiseTime;
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

    public P2pRepaymentPlan getP2pRepaymentPlan() {
        return p2pRepaymentPlan;
    }

    public void setP2pRepaymentPlan(P2pRepaymentPlan p2pRepaymentPlan) {
        this.p2pRepaymentPlan = p2pRepaymentPlan;
    }

    public P2pRepaymentRecord getP2pRepaymentRecord() {
        return p2pRepaymentRecord;
    }

    public void setP2pRepaymentRecord(P2pRepaymentRecord p2pRepaymentRecord) {
        this.p2pRepaymentRecord = p2pRepaymentRecord;
    }

    public P2pMarketConfirmRecord getP2pMarketConfirmRecord() {
        return p2pMarketConfirmRecord;
    }

    public void setP2pMarketConfirmRecord(
            P2pMarketConfirmRecord p2pMarketConfirmRecord) {
        this.p2pMarketConfirmRecord = p2pMarketConfirmRecord;
    }

    public Double getRetainRate() {
        return retainRate;
    }

    public void setRetainRate(Double retainRate) {
        this.retainRate = retainRate;
    }

    public String getPurposeName() {
        return purposeName;
    }

    public void setPurposeName(String purposeName) {
        this.purposeName = purposeName;
    }

    public P2pRegUserCertify getP2pRegUserCertify() {
        return p2pRegUserCertify;
    }

    public void setP2pRegUserCertify(P2pRegUserCertify p2pRegUserCertify) {
        this.p2pRegUserCertify = p2pRegUserCertify;
    }

    public String getGivingOutState() {
        return givingOutState;
    }

    public void setGivingOutState(String givingOutState) {
        this.givingOutState = givingOutState;
    }

    public Integer getIsSupply() {
        return isSupply;
    }

    public void setIsSupply(Integer isSupply) {
        this.isSupply = isSupply;
    }


}