/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 融资信息表，包含申请信息DAO接口
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@MyBatisDao
public interface P2pFinancingInformationDao extends
        CrudDao<P2pFinancingInformation> {

    /**
     * 根据融资信息阶段查询融资总金额
     *
     * @param currentStage
     * @return
     */
    public Integer findAllFinancingAmount(String currentStage);

    /**
     * 根据融资信息阶段查询融资项目总数
     *
     * @return
     */
    public Integer findAllFinancingInformation(String currentStage);

    /**
     * 融资信息表，撮合前债项状态进展表，融资评级信息表关联查询
     *
     * @return
     */
    public List<P2pFinancingInformation> findFinancingRelationInfo(
            P2pFinancingInformation p2pFinancingInformation);

    /**
     * 添加融资信息
     *
     * @param p2pFinancingInformation
     */
    public void saveP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation);

    /**
     * 修改融资信息
     *
     * @param p2pFinancingInformation
     */
    public void updateP2pFinancingInformation(
            P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据申请人ID查询当前融资项目阶段
     *
     * @param id
     * @return
     */
    public String findCurrentStage(String applicantsId);

    /**
     * 根据申请人ID修改当前融资项目阶段
     *
     * @param p2pFinancingInformation
     */
    public void updateCurrentStage(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据申请人ID和阶段单条查询融资项目信息
     *
     * @param applicantsId
     * @return
     */
    public P2pFinancingInformation findP2pFinancingInformationByApplicantsId(
            String applicantsId, String currentStage);

    /**
     * 查询所有
     *
     * @param p2pFinancingInformation
     * @return
     */
    public List<P2pFinancingInformation> findAllcreditList(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据输入条件综合查询信息
     */
    public List<P2pFinancingInformation> findTheFinancingList(P2pFinancingInformation p2pFinancingInformation);


    /**
     * 根据ID查对象
     */
    public P2pFinancingInformation findOneById(String id);

    public int getTotalRecords(Map<String, Object> paramMap);

    /**
     * 查询所有融资项目信息
     *
     * @param paramMap
     * @return
     */
    public List<P2pFinancingInformation> findAllFinancingList(Map paramMap);

    public P2pFinancingInformation findFinancingInfoById(String id);

    public List<P2pFinancingInformation> findFourFinancingInfo(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 查询推荐标的融资信息
     */


    /**
     * 根据申请人和阶段加载债项和评级信息(针对"我的债项"页面)
     *
     * @param p2pFinancingInformation
     * @return
     *//*
    public List<P2pFinancingInformation> loadMyDebts(
			P2pFinancingInformation p2pFinancingInformation);*/

    /**
     * 根据申请人记载融资总金额
     *
     * @param applicantsId
     * @return
     */
    public Integer loadAllFinancingAmountByApplicantsId(String applicantsId);

    /**
     * 根据申请人记载融资总个数
     *
     * @param applicantsId
     * @return
     */
    public Integer loadAllFinancingCountByApplicantsId(String applicantsId);


    /**
     * 查询融资总额
     *
     * @return
     */
    public Integer selectCountfinancingAmounts();

    /**
     * 查询剩余还款金额
     */
    public Integer selectRepayfinancingAmounts();

    /**
     * 根据投资用户Id加载投资总金额
     *
     * @param userId
     * @return
     */
    public Integer loadAllInvestAmountByUserId(String userId);

    // 查询投资推荐列表
    public List<P2pFinancingInformation> loadInvestRecommend(
            P2pFinancingInformation p2pFinancingInformation);

    /**
     * 加载募集中的债项个数
     */
    public Integer loadAllInvestmentRaiseNumByUserId(String userId);

    // 加载还款中的债项个数
    public Integer loadAllRepaymentNumByUserId(String userId);

    // 加载已还款的债项个数
    public Integer loadAllRepaymentEndNumByUserId(String userId);

    // 加载流标的债项个数
    public Integer loadAllLoseBidsNumByUserId(String userId);

    // 加载逾期的债项个
    public Integer loadAllOverdueNumByUserId(String userId);

    // 根据投资人ID查询投资列表
    public List<P2pFinancingInformation> loadInvestmentList(Map<String, Object> paramMap);

    // 根据投资人ID加载投资收益
    public Integer loadAllInvestIncomeByUserId(String userId);

    // 根据投资人ID加载投资未到账收益
    public Integer loadAllNotToAccountIncomeByUserId(String userId);

    // 根据投资人ID查询投资收益记录
    public List<P2pFinancingInformation> investmentEarnRecordByUserId(Map<String, Object> paramMap);

    // 根据投资人ID查询还款中投资记录
    public List<P2pFinancingInformation> loadRepayingInvestmentList(User user);

    // 根据投资人ID查询已还完投资记录
    public List<P2pFinancingInformation> loadRepayEndInvestmentList(User user);

    // 根据投资人ID查询逾期记录
    public List<P2pFinancingInformation> loadOverdueInvestmentList(User user);

    //根据投资人ID查询投资收益明细列表
    public List<P2pFinancingInformation> InvestIncomeDetail(String userId);

    /**
     * 查询满标总数
     *
     * @return
     */
    public Integer selectAllFullscaleAmounts();

    /**
     * 查询所有债项名称
     *
     * @return
     */
    public List<P2pFinancingInformation> findAllFinaNameAndID(
            P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据输入条件查询所有债项名称
     *
     * @return
     * @author duan
     */
    public List<P2pFinancingInformation> findAllAccFinaNameAndID(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 查询前几条债项名称
     *
     * @return
     */
    public List<P2pFinancingInformation> findFrontFinaNameAndID();

    /**
     * 查询所有处于募集预警的债项
     *
     * @return
     */
    public List<P2pFinancingInformation> findAllRaiseAndWarning(
            P2pFinancingInformation p2pFinancingInformation);

    /**
     * 查询处于募集预警期内的债项
     *
     * @return
     */
    public List<P2pFinancingInformation> findFronRaiseAndWarning();

    /**
     * 按输入条件查询所有处于募集预警期内的债项
     *
     * @return
     */
    public List<P2pFinancingInformation> findAllAccRaiseAndWarning(
            P2pFinancingInformation p2pFinancingInformation);

    /**
     * 查询前几条所有条债项名称等融资信息及放款时间
     *
     * @return
     */
    public List<P2pFinancingInformation> findFinaNameAndGivTime();

    /**
     * 查询所有债项名称等融资信息及放款时间
     *
     * @return
     */
    public List<P2pFinancingInformation> findAllFinaNameAndGivTime();

    /**
     * 根据条件查询所有处于还款期内的债项名称等融资信息及放款时间
     *
     * @return
     */
    public List<P2pFinancingInformation> findAllAccFinaNameAndGivTime(
            P2pFinancingInformation p2pFinancingInformation);

    /**
     * 查询满标债项数量
     *
     * @return
     */
    public Integer SelectFullscaleNum();

    /**
     * 查询评级审核数量
     */
    public Integer SelectCreditNum();

    /**
     * 查询评级审核状态的公司名称及债项发布时间
     */
    public List<P2pFinancingInformation> selectCreditNameAndTime();


    /**
     * 查询流标审核数量
     */
    public Integer SelectCreditFlowNum();

    /**
     * 查询位于流标债项的公司名称及债项发布时间
     */
    public List<P2pFinancingInformation> SelectCreditFlowNameAndTime();

    /**
     * 查询发布债项审核数量
     */
    public Integer SelectReleaseCreditNum();


    /**
     * 查询待发债项企业名称及融资申请提交时间
     */
    public List<P2pFinancingInformation> selectReleaseNameAndTime();

    /**
     * 查询逾期未还款债项数量及债项
     */
    public List<P2pFinancingInformation> findOverdueNorepaySumAndFina();

    /**
     * 查询满标确标审核状态债项公司名称及债项发布时间
     */
    public List<P2pFinancingInformation> selectFullscaleNameAndTime();

    /**
     * 查询处于还款状态的企业名称及融资发放时间
     */
    public List<P2pFinancingInformation> findOverdueNorepayNameAndTime();

    /**
     * 信用评级时根据id修改债项状态
     */
    public void updateCreditState(String id);

    /**
     * 获取前缀为prefix的最大的ID
     */
    public String getMaxId(@Param("prefix") String prefix);

    /**
     * 获取当前债项的还款计划
     *
     * @param id
     * @return
     */
    public List<P2pFinancingInformation> getRepaymentRecordById(String id);

    public P2pFinancingInformation findFinancingCertifyInfo(String id);

    /**
     * 查询募集期满但尚未自动流标的债项
     */

    public List<P2pFinancingInformation> findDebtMaturity();


    /**
     * 根据编号查融资
     *
     * @param id
     * @return
     */
    public P2pFinancingInformation getById(String id);

    /**
     * 根据ID修改评级费缴纳状态和债项状态
     *
     * @param id
     * @author Quincy
     */
    public void updateIsHandRateCost(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据债项ID查询债项详情
     *
     * @param financingInformationId
     * @return
     * @author Quincy
     */
    public P2pFinancingInformation findDebtDetailsByFid(String financingInformationId);

    /**
     * 根据债项ID修改当前阶段
     *
     * @param p2pFinancingInformation
     * @author Quincy
     */
    public void updateCurrentStageByFid(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 前台加载撮合中债项信息
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public P2pFinancingInformation findMiddleMatchDebtInfo(String userId);

    /**
     * 前台加载撮合后债项信息
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public P2pFinancingInformation findAfterMatchDebtInfo(String userId);

    /**
     * 前台加载已完成债项列表
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public List<P2pFinancingInformation> findFinishedDebtList(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 前台加载已流标债项列表
     *
     * @param p2pFinancingInformation
     * @return
     * @author Quincy
     */
    public List<P2pFinancingInformation> findExpiredDebtList(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 前台加载撮合中、撮合后以及以结项的债项列表
     *
     * @param p2pFinancingInformation
     * @return
     * @author Quincy
     */
    public List<P2pFinancingInformation> loadApplySuccessDebts(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 债项详情
     *
     * @param id（融资信息id）
     * @return
     * @author Zeus
     */
    public P2pFinancingInformation getDebtDetails(String id);

    /**
     * 撮合中债项列表查询
     *
     * @param p2pFinancingInformation
     * @return p2pFinancingInformation
     * @author Chace
     */
    public List<P2pFinancingInformation> findInFinancingInformations(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 撮合中债项列表查询
     *
     * @param p2pFinancingInformation
     * @return p2pFinancingInformation
     * @author Zeus
     */
    public List<P2pFinancingInformation> getAfterFinancingList(P2pFinancingInformation p2pFinancingInformation);


    /**
     * 根据用户ID查询还款记录列表
     *
     * @param p2pFinancingInformation
     * @return
     * @author Quincy
     */
    public List<P2pFinancingInformation> findRepayRecordByUid(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据用户ID查询放款记录列表
     *
     * @param p2pFinancingInformation
     * @return
     */
    public List<P2pFinancingInformation> findLoanRecordByUid(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 查询市场确认债项
     *
     * @param p2pFinancingInformation
     * @return
     * @autor Sora
     */
    public List<P2pFinancingInformation> findMarketConfirmationList(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 查询债项发布
     *
     * @param p2pFinancingInformation
     * @return
     * @author Sora
     */
    public List<P2pFinancingInformation> findDebtIssuedList(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 查询市场确认发布债项
     *
     * @param p2pFinancingInformation
     * @return
     * @author Sora
     */
    public List<P2pFinancingInformation> findMarketConfirmationReleaseDebt(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据债项id修改债项状态
     *
     * @param id
     * @param stage
     * @return
     * @author Sora
     */
    public int updateCurrentStageById(@Param("id") String id, @Param("currentStage") String currentStage);

    /**
     * 根据债项id查询债项详情
     *
     * @param id
     * @return
     */
    public P2pFinancingInformation getRepaymentPlanDebtDetails(String id);

    /**
     * 满标审核列表
     *
     * @param p2pFinancingInformation
     * @return list
     * @author Chace
     * findFullAuditList
     */
    public List<P2pFinancingInformation> findFullAuditList(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 流标审核列表
     *
     * @param p2pFinancingInformation
     * @return list
     * @author Chace
     * findStandardAuditList
     */
    public List<P2pFinancingInformation> findStandardAuditList(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据债项id查询投资记录明细
     *
     * @param p2pInvestmentInformation
     * @return list
     * @author Chace
     * getInvestRecord
     */
    public List<P2pInvestmentInformation> getInvestRecord(P2pInvestmentInformation p2pInvestmentInformation);

    /**
     * 满标审核状态修改
     *
     * @param p2pFinancingInformation
     * @return
     * @author Chace
     */
    public void updateById(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据债项id查询投资记录
     *
     * @param p2pInvestmentInformation
     * @return list
     * @author Chace
     * getInvestRecordByFid
     */
    public List<P2pInvestmentInformation> getInvestRecordByFid(P2pInvestmentInformation p2pInvestmentInformation);

    /**
     * 刷新评级信息
     *
     * @return
     * @author Quincy
     */
    public List<P2pFinancingInformation> refreshRatingInfo1();

    /**
     * 同步债项信息
     *
     * @param p2pFinancingInformation
     * @author Quincy
     */
    public void refreshRatingInfo2(P2pFinancingInformation p2pFinancingInformation);


    /**
     * 募集期风控列表
     *
     * @param p2pFinancingInformation
     * @return list
     * @author Chace
     * findRiskManagementList
     */
    public List<P2pFinancingInformation> findRiskManagementList(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 我的账户:投资收益列表
     *
     * @param p2pFinancingInformation
     * @return p2pFinancingInformation
     * @author Chace
     */
    public List<P2pFinancingInformation> getEarningsList(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 查询满标时间
     *
     * @param fid
     * @return
     * @author Quincy
     */
    public Date findFullBidTimeByFid(String fid);

    /**
     * 根据债项id和userId查询投资收益明细
     *
     * @param p2pFinancingInformation
     * @author Chace
     */
    public List<P2pFinancingInformation> getRepaymentRecordByIdAndUserId(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据id查询债项批复金额
     *
     * @param String id
     * @return Integer
     * @author Chace
     */
    public Integer getAmountById(String financinfId);

    public Integer getCurrentStageNum(String currentStage);

    /**
     * 修改保留利率
     *
     * @param p2pFinancingInformation
     * @author Quincy
     */
    public void updateRetainRate(P2pFinancingInformation p2pFinancingInformation);


    //抵质押补信查询
    public List<P2pFinancingInformation> buxinList1(P2pFinancingInformation p2pFinancingInformation);

    //担保补信查询
    public List<P2pFinancingInformation> buxinList2(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 根据融资信息ID查询融资申请信息
     *
     * @param id
     * @return
     */
    public P2pFinancingInformation findFinancingAppInfo(String id);

    /**
     * 评级结果查询列表
     *
     * @author Chace
     */
    public List<P2pFinancingInformation> findLevelResultList(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 评级报告发布页面
     *
     * @author Chace
     */
    public P2pFinancingInformation recordPublishPage(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 撮合前报告发布
     *
     * @author Chace
     */
    public void publishRecord(P2pFinancingInformation p2pFinancingInformation);


    /**
     * 还款凭证审核列表
     *
     * @param p2pFinancingInformation
     * @return
     */
    public List<P2pFinancingInformation> getRepaymentVoucherAuditList(P2pFinancingInformation p2pFinancingInformation);


    /**
     * 查询定时的未发布债项
     *
     * @author Chace
     */
    public List<P2pFinancingInformation> findTimingFinancing();

    /**
     * 获取要批量发布的债项
     *
     * @author Chace
     */
    public List<P2pFinancingInformation> batchReleasePage(List<String> list);

    /**
     * 查询融资金额
     *
     * @author Chace
     */
    public P2pFinancingInformation getFinancingAmount(String id);

    /**
     * 机构放款审核列表
     *
     * @param p2pFinancingInformation
     * @return list
     * @author Chace
     */
    public List<P2pFinancingInformation> givingOutAuditPage(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 机构放款审核页
     *
     * @author Chace
     */
    public P2pFinancingInformation givingOutAuditDetails(P2pFinancingInformation p2pFinancingInformation);

    /**
     * 查询募集期到期时间
     *
     * @author Chace
     */
    public List<P2pFinancingInformation> getLimitTime();

    /**
     * 查询发消息所需参数
     *
     * @author Chace
     */
    public P2pFinancingInformation findForMsg(P2pFinancingInformation p2pFinancingInformation);

    public List<P2pFinancingInformation> getP2pFinancingInformationList(P2pFinancingInformation p2pFinancingInformation);

    public P2pFinancingInformation getApplicantdId(
            P2pFinancingInformation p2pFinancingInformation);

}













