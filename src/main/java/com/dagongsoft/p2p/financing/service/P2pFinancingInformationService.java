/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.document.dao.P2pRateDocumentUploadDao;
import com.dagongsoft.p2p.document.entity.P2pRateDocumentUpload;
import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingInformationDao;
import com.dagongsoft.p2p.financing.dao.P2pFinancingRatingInfoDao;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.investment.dao.P2pInvestmentInformationDao;
import com.dagongsoft.p2p.investment.entity.P2pInvestmentInformation;
import com.dagongsoft.p2p.rating.dao.P2pRatingServiceInfoDao;
import com.dagongsoft.p2p.rating.entity.P2pRatingServiceInfo;
import com.dagongsoft.p2p.utils.FinancingState;
import com.dagongsoft.p2p.utils.GenerateUserIdutils;
import com.dagongsoft.p2p.utils.StaticUtils;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.dagongsoft.p2p.utils.msg.MsgLetterTemplate;
import com.dagongsoft.p2p.utils.msg.MsgSmsTemplate;
import com.dagongsoft.p2p.utils.msg.MsgUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 融资信息表，包含申请信息Service
 *
 * @author zhengshuo
 * @version 2016-07-11
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class P2pFinancingInformationService extends CrudService<P2pFinancingInformationDao, P2pFinancingInformation> {
    @Autowired
    private P2pFinancingInformationDao p2pFinancingInformationDao;
    @Autowired
    private P2pInvestmentInformationDao p2pInvestmentInformationDao;
    @Autowired
    private P2pFinancingRatingInfoDao p2pFinancingRatingInfoDao;
    @Autowired
    private P2pRateDocumentUploadDao p2pRateDocumentUploadDao;
    @Autowired
    private P2pBeforeMatchDebtStateService p2pBeforeMatchDebtStateService;
    @Autowired
    private P2pRatingServiceInfoDao p2pRatingServiceInfoDao;

    public P2pFinancingInformation get(String id) {
        return super.get(id);
    }

    public List<P2pFinancingInformation> findList(
            P2pFinancingInformation p2pFinancingInformation) {
        return super.findList(p2pFinancingInformation);
    }

    public Page<P2pFinancingInformation> findPage(
            Page<P2pFinancingInformation> page,
            P2pFinancingInformation p2pFinancingInformation) {
        return super.findPage(page, p2pFinancingInformation);
    }

    @Transactional(readOnly = false)
    public void save(P2pFinancingInformation p2pFinancingInformation) {
        super.save(p2pFinancingInformation);
    }

    @Transactional(readOnly = false)
    public void delete(P2pFinancingInformation p2pFinancingInformation) {
        super.delete(p2pFinancingInformation);
    }

    public Page<P2pFinancingInformation> findFinancingRelationInfo(
            Page<P2pFinancingInformation> page,
            P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao
                .findFinancingRelationInfo(p2pFinancingInformation));
        return page;
    }

    @Autowired
    private P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao;

    /**
     * 添加或修改融资申请基本信息(如果修改信息，不需要传入企业名称)
     *
     * @param p2pFinancingInformation
     */
    @Transactional(readOnly = false)
    public void saveOrUpdateP2pFinancingInformation(P2pFinancingInformation p2pFinancingInformation,
                                                    String enterpriseName) {
        if (p2pFinancingInformation.getId() == null || "".equals(p2pFinancingInformation.getId())) {
            Integer count = p2pFinancingInformationDao.loadAllFinancingCountByApplicantsId(p2pFinancingInformation.getApplicantsId());
            p2pFinancingInformation.setId(GenerateUserIdutils.createFinanInformationId("6"));//设置债项编号
            p2pFinancingInformation.setIsHandRateCost(StaticUtils.NO.getStatus());//设置是否缴纳评级费
            p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.FINANCING_APPLICATION_FINISHED));// 设置当前融资状态为已提交融资申请
            p2pFinancingInformation.setFinacingName(enterpriseName + new SimpleDateFormat("yyyy年").format(new Date()) +
                    p2pFinancingInformation.getPurposeName() + "项目借款"
                    + (count + 1) + "期" + p2pFinancingInformation.getId());
            p2pFinancingInformationDao.saveP2pFinancingInformation(p2pFinancingInformation);
            P2pRateDocumentUpload p2pRateDocumentUpload = new P2pRateDocumentUpload(IdGen.uuid());
            p2pRateDocumentUpload.setFinancingInformationId(p2pFinancingInformation.getId());
            p2pRateDocumentUpload.setRateDocumentTempId("26");
            p2pRateDocumentUpload.setUploadTime(new Date());
            p2pRateDocumentUploadDao.insertUploadRecord(p2pRateDocumentUpload);
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
            p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());// 记录当前项目编号
            p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());// 记录当前融资项目阶段
            p2pBeforeMatchDebtState.setStateTime(new Date());// 记录时间
            p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
        } else {
            p2pFinancingInformationDao.updateP2pFinancingInformation(p2pFinancingInformation);
        }
    }

    /**
     * 根据申请人ID查询当前融资项目阶段
     *
     * @param id
     * @return
     */
    public Integer findCurrentStage(String applicantsId) {
        //查询当前用户融资阶段
        String currentStage = p2pFinancingInformationDao.findCurrentStage(applicantsId);
        //判断是否拥有未完成融资项目
        if (currentStage != null) {
            return Integer.valueOf(currentStage);
        } else {
            //判断是否有未完成评级项目
            P2pRatingServiceInfo p2pRatingServiceInfo = p2pRatingServiceInfoDao.findInfoByApplicantsId(applicantsId);
            if (p2pRatingServiceInfo != null && p2pRatingServiceInfo.getCurrentStage() != null) {
                return Integer.valueOf("-" + p2pRatingServiceInfo.getCurrentStage());
            } else {
                return 0;
            }
        }
    }

    /**
     * 根据ID修改当前融资项目阶段
     *
     * @param p2pFinancingInformation
     */
    @Transactional(readOnly = false)
    public void updateCurrentStage(P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformationDao.updateCurrentStage(p2pFinancingInformation);
    }

    /**
     * 根据申请人ID单条查询融资项目信息
     *
     * @param applicantsId
     * @return
     */
    public P2pFinancingInformation findP2pFinancingInformationByApplicantsId(
            String applicantsId, String currentStage) {
        return p2pFinancingInformationDao.findP2pFinancingInformationByApplicantsId(applicantsId, currentStage);
    }

    /**
     * 查询所有的评级信息
     */
    public Page<P2pFinancingInformation> findAllcredit(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao.findAllcreditList(p2pFinancingInformation));
        return page;
    }


    /**
     * 根据输入条件查询所有评级信息
     */
    public Page<P2pFinancingInformation> findTheFinancingList(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao.findTheFinancingList(p2pFinancingInformation));
        return page;
    }


    /**
     * 获取一个P2pFinancingInformation
     */
    public P2pFinancingInformation findOneP2pFinancingInfo(String id) {
        return p2pFinancingInformationDao.findOneById(id);
    }

    /**
     * 查询所有发布的融资项目信息
     */
    public List<P2pFinancingInformation> findAllFinancingList(Map paramMap) {
        return p2pFinancingInformationDao.findAllFinancingList(paramMap);
    }

    /**
     * 根据id查询一条融资项目信息
     *
     * @param id
     * @return
     */
    public P2pFinancingInformation findOneFinancingInfoById(String id) {
        return p2pFinancingInformationDao.findFinancingInfoById(id);
    }

    /**
     * 查询前4条信息，显示在首页
     *
     * @param page
     * @param p2pFinancingInformation
     * @return
     */
    public List<P2pFinancingInformation> findFourFinancingInfo(
            P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.findFourFinancingInfo(p2pFinancingInformation);
    }

    /**
     * 添加撮合前融资申请信息
     *
     * @param p2pFinancingInformation
     */
    @Transactional(readOnly = false)
    public void saveP2pBeforeMatchDebtState(
            P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {

        p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);

    }

    /**
     * 保存一条投资信息
     *
     * @param p2pInvestmentInformation
     */
    @Transactional(readOnly = false)
    public void saveP2pInvestmentInformation(
            P2pInvestmentInformation p2pInvestmentInformation) {

        p2pInvestmentInformationDao.saveP2pInvestmentInformation(p2pInvestmentInformation);
    }

    /**
     * 处理确认债项业务
     *
     * @param p2pFinancingInformation
     * @param newRate
     * @author Quincy
     */
    @Transactional(readOnly = false)
    public void confirmDebt(P2pFinancingInformation p2pFinancingInformation, Double newRate) {
        p2pFinancingInformation.setCurrentStage(Integer.toString(FinancingState.CONFIRM_RESULT));
        p2pFinancingInformationDao.updateCurrentStage(p2pFinancingInformation);
        p2pFinancingInformation.setRetainRate(p2pFinancingInformation.getRecommendedRate());
        p2pFinancingInformation.setRecommendedRate(newRate);
        p2pFinancingInformationDao.updateRetainRate(p2pFinancingInformation);
        P2pFinancingRatingInfo p2pFinancingRatingInfo = new P2pFinancingRatingInfo();
        p2pFinancingRatingInfo.setRecommendedRate(Double.toString(p2pFinancingInformation.getRecommendedRate()));
        p2pFinancingRatingInfo.setFinancingInformationId(p2pFinancingInformation.getId());
        p2pFinancingRatingInfoDao.updateRecommendedRate(p2pFinancingRatingInfo);
        P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
        p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());// 记录当前项目编号
        p2pBeforeMatchDebtState.setProgressStage(p2pFinancingInformation.getCurrentStage());// 记录当前融资项目阶段
        p2pBeforeMatchDebtState.setStateTime(new Date());// 记录时间
        p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
    }

    /**
     * 根据申请人记载融资总金额
     *
     * @param applicantsId
     * @return
     */
    public Integer loadAllFinancingAmountByApplicantsId(String applicantsId) {
        Integer amount = p2pFinancingInformationDao.loadAllFinancingAmountByApplicantsId(applicantsId);
        if (amount != null) {
            return p2pFinancingInformationDao.loadAllFinancingAmountByApplicantsId(applicantsId);
        }
        return 0;
    }

    /**
     * 根据投资人查询投资总金额
     *
     * @param userId
     * @return
     */
    public Integer loadAllInvestAmountByUserId(String userId) {
        return p2pFinancingInformationDao.loadAllInvestAmountByUserId(userId);
    }

    /**
     * 根据投资人ID查询投资总收益
     *
     * @param userId
     * @return
     */
    public Integer loadAllInvestmentIncomeByUserId(String userId) {
        return p2pFinancingInformationDao.loadAllInvestIncomeByUserId(userId);
    }

    /**
     * 根据申请人记载融资总个数
     *
     * @param applicantsId
     * @return
     */
    public Integer loadAllFinancingCountByApplicantsId(String applicantsId) {
        return p2pFinancingInformationDao.loadAllFinancingCountByApplicantsId(applicantsId);
    }


    /**
     * 加载投资推荐列表
     *
     * @param p2pFinancingInformation
     * @return
     */
    public List<P2pFinancingInformation> loadInvestRecommend(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.loadInvestRecommend(p2pFinancingInformation);
    }

    /**
     * 查询融资总金额
     *
     * @param applicantsId
     * @return
     */

    /**
     * 加载募集中的债项个数
     */
    public Integer loadAllInvestmentRaiseNumByUserId(String userId) {
        return p2pFinancingInformationDao.loadAllInvestmentRaiseNumByUserId(userId);
    }

    /**
     * 加载还款中的债项个数
     */
    public Integer loadAllRepaymentNumByUserId(String userId) {
        return p2pFinancingInformationDao.loadAllRepaymentNumByUserId(userId);
    }

    /**
     * 加载已还款的债项个数
     */
    public Integer loadAllRepaymentEndNumByUserId(String userId) {
        return p2pFinancingInformationDao
                .loadAllRepaymentEndNumByUserId(userId);
    }

    /**
     * 加载已流标的债项个数
     */
    public Integer loadAllLoseBidsNumByUserId(String userId) {
        return p2pFinancingInformationDao.loadAllLoseBidsNumByUserId(userId);
    }

    /**
     * 加载逾期的债项个数
     */
    public Integer loadAllOverdueNumByUserId(String userId) {
        return p2pFinancingInformationDao.loadAllOverdueNumByUserId(userId);
    }

    /**
     * 根据投资用户ID加载投资列表
     */
    public List<P2pFinancingInformation> loadInvestmentList(Map<String, Object> paramMap) {
        return p2pFinancingInformationDao.loadInvestmentList(paramMap);
    }

    /**
     * 根据投资用户ID加载未到账投资收益
     */
    public Integer loadAllNotToAccountIncomeByUserId(String userId) {
        return p2pFinancingInformationDao.loadAllNotToAccountIncomeByUserId(userId);
    }

    public Integer selectCountfinancingAmounts() {
        return p2pFinancingInformationDao.selectCountfinancingAmounts();
    }

    /**
     * 根据投资用户ID加载投资收益列表
     */
    public List<P2pFinancingInformation> investmentEarnRecordByUserId(Map<String, Object> paramMap) {
        return p2pFinancingInformationDao.investmentEarnRecordByUserId(paramMap);
    }

    /**
     * 根据投资用户ID查询还款中投资记录
     */
    public List<P2pFinancingInformation> loadRepayingInvestmentList(User user) {
        return p2pFinancingInformationDao.loadRepayingInvestmentList(user);
    }

    /**
     * 根据投资用户ID查询已还完投资记录
     */
    public List<P2pFinancingInformation> loadRepayEndInvestmentList(User user) {
        return p2pFinancingInformationDao.loadRepayEndInvestmentList(user);
    }

    /**
     * 根据投资用户ID查询逾期投资记录
     */
    public List<P2pFinancingInformation> loadOverdueInvestmentList(User user) {
        return p2pFinancingInformationDao.loadOverdueInvestmentList(user);
    }

    /**
     * 查询待还总额
     *
     * @param applicantsId
     * @return
     */
    public Integer selectRepayfinancingAmounts() {
        return p2pFinancingInformationDao.selectRepayfinancingAmounts();
    }

    /**
     * 查询待还总额
     *
     * @param applicantsId
     * @return
     */
    public Integer selectAllFullscaleAmounts() {
        return p2pFinancingInformationDao.selectAllFullscaleAmounts();
    }

    /**
     * 查询所有债项名称
     */
    public Page<P2pFinancingInformation> findAllFinaNameAndID(
            Page<P2pFinancingInformation> page,
            P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao
                .findAllFinaNameAndID(p2pFinancingInformation));
        return page;
    }

    /**
     * 根据输入条件查询所有债项名称
     *
     * @author duan
     */
    public Page<P2pFinancingInformation> findAllAccFinaNameAndID(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao.findAllAccFinaNameAndID(p2pFinancingInformation));
        return page;
    }

    /**
     * 查询前几条债项名称
     */
    public List<P2pFinancingInformation> findFrontFinaNameAndID() {
        return p2pFinancingInformationDao.findFrontFinaNameAndID();

    }

    /**
     * 查询所有处于募集预警的债项
     *
     * @author duan
     */
    public Page<P2pFinancingInformation> findAllRaiseAndWarning(
            Page<P2pFinancingInformation> page,
            P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao
                .findAllRaiseAndWarning(p2pFinancingInformation));
        return page;
    }

    /**
     * 按输入条件查询所有处于募集预警的债项
     *
     * @author duan
     */
    public Page<P2pFinancingInformation> findAllAccRaiseAndWarning(
            Page<P2pFinancingInformation> page,
            P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao
                .findAllAccRaiseAndWarning(p2pFinancingInformation));
        return page;
    }

    /**
     * 查询处于募集预警期内的债项
     *
     * @author duan
     */
    public List<P2pFinancingInformation> findFronRaiseAndWarning() {
        return p2pFinancingInformationDao.findFronRaiseAndWarning();
    }

    /**
     * 查询前几条所有条债项名称等融资信息及放款时间
     *
     * @return
     */
    public List<P2pFinancingInformation> findFinaNameAndGivTime() {
        return p2pFinancingInformationDao.findFinaNameAndGivTime();
    }

    /**
     * 查询所有条债项名称等融资信息及放款时间
     *
     * @return
     */
    public List<P2pFinancingInformation> findAllFinaNameAndGivTime() {
        return p2pFinancingInformationDao.findAllFinaNameAndGivTime();
    }

    /**
     * 根据条件查询所有处于还款期内债项名称等融资信息及放款时间
     *
     * @return
     */
    public List<P2pFinancingInformation> findAllAccFinaNameAndGivTime(
            P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao
                .findAllAccFinaNameAndGivTime(p2pFinancingInformation);
    }

    /**
     * 查询满标债项数量
     */
    public Integer SelectFullscaleNum() {
        return p2pFinancingInformationDao.SelectFullscaleNum();
    }

    /**
     * 查询评级审核数量
     */
    public Integer SelectCreditNum() {
        return p2pFinancingInformationDao.SelectCreditNum();
    }

    /**
     * 查询评级审核状态的公司名称及债项发布时间
     */
    public List<P2pFinancingInformation> selectCreditNameAndTime() {
        return p2pFinancingInformationDao.selectCreditNameAndTime();
    }

    /**
     * 查询流标审核数量
     */
    public Integer SelectCreditFlowNum() {
        return p2pFinancingInformationDao.SelectCreditFlowNum();
    }

    /**
     * 查询流标债项的企业名称及债项发布时间
     */
    public List<P2pFinancingInformation> SelectCreditFlowNameAndTime() {
        return p2pFinancingInformationDao.SelectCreditFlowNameAndTime();
    }


    /**
     * 查询发布债项审核数量
     */
    public Integer selectReleaseCreditNum() {
        return p2pFinancingInformationDao.SelectReleaseCreditNum();
    }


    /**
     * 查询逾期未还款债项数量及名称
     */
    public List<P2pFinancingInformation> findOverdueNorepaySumAndFina() {
        return p2pFinancingInformationDao.findOverdueNorepaySumAndFina();
    }


    /**
     * 查询满标债项公司名称及债项发布时间
     */
    public List<P2pFinancingInformation> selectFullscaleNameAndTime() {
        return p2pFinancingInformationDao.selectFullscaleNameAndTime();
    }

    /**
     * 查询发布债项公司名称及融资申请提交时间
     */
    public List<P2pFinancingInformation> selectReleaseNameAndTime() {
        return p2pFinancingInformationDao.selectReleaseNameAndTime();
    }


    /**
     * 查询处于还款状态的企业名称及融资发放时间
     */
    public List<P2pFinancingInformation> findOverdueNorepayNameAndTime() {
        return p2pFinancingInformationDao.findOverdueNorepayNameAndTime();
    }


    /**
     * 查询投资收益明细
     *
     * @param userId
     * @return
     */
    public List<P2pFinancingInformation> InvestIncomeDetail(String userId) {
        return p2pFinancingInformationDao.InvestIncomeDetail(userId);
    }


    /**
     * 获取当前债项的还款计划
     *
     * @param id
     * @return
     */
    public List<P2pFinancingInformation> getRepaymentRecordById(String id) {
        return p2pFinancingInformationDao.getRepaymentRecordById(id);
    }

    /**
     * 获取融资用户企业认证材料
     *
     * @param id
     * @return
     */
    public P2pFinancingInformation findFinancingCertifyInfo(String id) {
        return p2pFinancingInformationDao.findFinancingCertifyInfo(id);
    }

    /**
     * 每隔一小时检查一次是否有募集到期债项未进入流标状态
     */
    @Scheduled(cron = "0 0/5 * * * ?")
    @Transactional(readOnly = false)
    public void raiseDebtMaturity() {
        //发送站内信和短信
        List<P2pFinancingInformation> list = p2pFinancingInformationDao.findDebtMaturity();
        if (list != null && list.size() != 0) {
            for (P2pFinancingInformation p2p : list) {
                //流标
                p2pFinancingInformationDao.updateCurrentStageById(p2p.getId(), Integer.toString(FinancingState.FINANCING_EXPIRED));
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState(IdGen.uuid());
                p2pBeforeMatchDebtState.setFinacingInformationId(p2p.getId());// 记录当前项目编号
                p2pBeforeMatchDebtState.setProgressStage(Integer.toString(FinancingState.FINANCING_EXPIRED));// 记录当前融资项目阶段
                p2pBeforeMatchDebtState.setStateTime(new Date());// 记录时间
                p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
                String recId = p2p.getApplicantsId();
                String financingName = p2p.getFinacingName();
                //发站内信
                Map<String, String> map = MsgLetterTemplate.getMjdqwmb(financingName);
                MsgUtils.sendLetter(recId, map);
                //发短信
                String content = MsgSmsTemplate.getMjdqwmb();
                try {
                    MsgUtils.sendSMS(recId, content);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 根据编号查实体
     *
     * @param id
     * @return
     */
    public P2pFinancingInformation getById(String id) {
        return p2pFinancingInformationDao.getById(id);
    }

    /**
     * 查询市场确认债项
     *
     * @param page
     * @param p2pFinancingInformation
     * @return
     * @author Sora
     */
    public Page<P2pFinancingInformation> findMarketConfirmation(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao.findMarketConfirmationList(p2pFinancingInformation));
        return page;
    }

    /**
     * 查询市场确认发布债项
     *
     * @param page
     * @param p2pFinancingInformation
     * @return
     * @author Sora
     */
    public Page<P2pFinancingInformation> findMarketConfirmationReleaseDebt(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao.findMarketConfirmationReleaseDebt(p2pFinancingInformation));
        return page;
    }

    /**
     * 查询债项发布
     *
     * @param page
     * @param p2pFinancingInformation
     * @return
     * @author Sora
     */
    public Page<P2pFinancingInformation> findDebtIssued(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao.findDebtIssuedList(p2pFinancingInformation));
        return page;
    }

    /**
     * 修改债项状态
     *
     * @param financingInformationId
     * @param stage
     * @return
     * @Sora
     */
    public int updateCurrentStageById(String financingInformationId, String stage) {
        return p2pFinancingInformationDao.updateCurrentStageById(financingInformationId, stage);
    }

    /**
     * 我的账户:投资收益列表
     *
     * @param p2pFinancingInformation
     * @return p2pFinancingInformation
     * @author Chace
     */
    public List<P2pFinancingInformation> getEarningsList(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.getEarningsList(p2pFinancingInformation);
    }

    /**
     * 根据债项id和userId查询投资收益明细
     *
     * @param p2pFinancingInformation
     * @author Chace
     */
    public List<P2pFinancingInformation> getRepaymentRecordByIdAndUserId(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.getRepaymentRecordByIdAndUserId(p2pFinancingInformation);
    }

    /**
     * 根据id查询债项批复金额
     *
     * @param String id
     * @return Integer
     * @author Chace
     */
    public Integer getAmountById(String financinfId) {
        return p2pFinancingInformationDao.getAmountById(financinfId);
    }

    /**
     * 债项详情
     *
     * @param id(融资信息id)
     * @return
     * @author Zeus
     */
    public P2pFinancingInformation getDebtDetails(String id) {
        return p2pFinancingInformationDao.getDebtDetails(id);
    }

    /**
     * 评级结果查询列表
     *
     * @author Chace
     */
    public Page<P2pFinancingInformation> findLevelResultPage(Page<P2pFinancingInformation> page, P2pFinancingInformation p2pFinancingInformation) {
        p2pFinancingInformation.setPage(page);
        page.setList(p2pFinancingInformationDao.findLevelResultList(p2pFinancingInformation));
        return page;
    }

    /**
     * 评级报告发布页面
     *
     * @author Chace
     */
    public P2pFinancingInformation recordPublishPage(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.recordPublishPage(p2pFinancingInformation);
    }

    /**
     * 撮合前报告发布
     *
     * @author Chace
     */
    @Transactional(readOnly = false)
    public void publishRecord(P2pFinancingInformation p2pFinancingInformation) {
        P2pFinancingRatingInfo p2pFinancingRatingInfo = new P2pFinancingRatingInfo();
        p2pFinancingRatingInfo.setFinancingInformationId(p2pFinancingInformation.getId());
        p2pFinancingRatingInfo.setMarkType(String.valueOf(p2pFinancingInformation.getMarkType()));
        p2pFinancingInformationDao.publishRecord(p2pFinancingInformation);
        p2pFinancingRatingInfoDao.updateMarkType(p2pFinancingRatingInfo);
        //发送站内信和短信
        P2pFinancingInformation p2p = findForMsg(p2pFinancingInformation);
        if (String.valueOf(FinancingState.CREDIT_RATING_SUCCESS).equals(p2pFinancingInformation.getCurrentStage())) {
            Map<String, String> map = MsgLetterTemplate.getJdcpxxqr(p2p.getId());
            MsgUtils.sendLetter(p2p.getApplicantsId(), map);
            String content = MsgSmsTemplate.getJdcpxxqr();
            MsgUtils.sendSMS(p2p.getApplicantsId(), content);
        }
        if (String.valueOf(FinancingState.MARKET_STAFF_CONFIRMED).equals(p2pFinancingInformation.getCurrentStage())) {
            Map<String, String> map = MsgLetterTemplate.getWyyjbA(p2p.getId(), p2p.getFinacingName());
            MsgUtils.sendLetter(p2p.getApplicantsId(), map);
            String content = MsgSmsTemplate.getWyyjbA(p2p.getId());
            MsgUtils.sendSMS(p2p.getApplicantsId(), content);
        }
        if (String.valueOf(FinancingState.SUPPLY_CREDIT).equals(p2pFinancingInformation.getCurrentStage())) {
            Map<String, String> map = MsgLetterTemplate.getWyyjbBB_A(p2p.getId(), p2p.getFinacingName(), p2p.getRatingLevel());
            MsgUtils.sendLetter(p2p.getApplicantsId(), map);
            String content = MsgSmsTemplate.getWyyjbBB_A(p2p.getId(), p2p.getRatingLevel());
            MsgUtils.sendSMS(p2p.getApplicantsId(), content);
        }
    }

    /**
     * 定时器扫描定时发布债项
     *
     * @author Cahce
     */
    @Scheduled(cron = "0 0/5 * * * ?")
    @Transactional(readOnly = false)
    public void timeInterval() {
        List<P2pFinancingInformation> list = p2pFinancingInformationDao.findTimingFinancing();
        Date date = new Date();
        for (P2pFinancingInformation p2pFinancingInformation : list) {
            if (date.getTime() >= p2pFinancingInformation.getPublishTime().getTime()) {
                P2pBeforeMatchDebtState p2pBeforeMatchDebtState = new P2pBeforeMatchDebtState();
                p2pFinancingInformation.setCurrentStage(FinancingState.FINANCING_PUBLISHED + "");//审核通过状态变为募集期
                updateCurrentStage(p2pFinancingInformation);
                p2pBeforeMatchDebtState.setProgressStage(FinancingState.FINANCING_PUBLISHED + "");//审核通过状态变为募集期
                p2pBeforeMatchDebtState.setOperatorId(p2pFinancingInformation.getPublishId());
                p2pBeforeMatchDebtState.setStateTime(p2pFinancingInformation.getPublishTime());
                p2pBeforeMatchDebtState.setFinacingInformationId(p2pFinancingInformation.getId());
                p2pBeforeMatchDebtStateService.save(p2pBeforeMatchDebtState);
                //发送站内信和短信
                P2pFinancingInformation p2p = findForMsg(p2pFinancingInformation);
                Map<String, String> map = MsgLetterTemplate.getJdcpfbtz(p2p.getFinacingName());
                MsgUtils.sendLetter(p2p.getApplicantsId(), map);
                String content = MsgSmsTemplate.getJdcpfbtz();
                MsgUtils.sendSMS(p2p.getApplicantsId(), content);
            }
        }
    }

    /**
     * 获取要批量发布的债项
     *
     * @author Chace
     */
    public List<P2pFinancingInformation> batchReleasePage(List<String> list) {
        return p2pFinancingInformationDao.batchReleasePage(list);
    }

    /**
     * 查询融资金额
     *
     * @author Chace
     */
    public P2pFinancingInformation getFinancingAmount(String id) {
        return p2pFinancingInformationDao.getFinancingAmount(id);
    }

    /**
     * 机构放款审核页
     *
     * @author Chace
     */
    public P2pFinancingInformation givingOutAuditDetails(P2pFinancingInformation p2pFinancingInformation) {
        P2pFinancingInformation info = p2pFinancingInformationDao.givingOutAuditDetails(p2pFinancingInformation);
        info.setGivingOutVoucher(UploadFileUtils.viewUrl(info.getGivingOutVoucher()));
        return info;
    }

    /**
     * 查询发消息所需参数
     *
     * @author Chace
     */
    public P2pFinancingInformation findForMsg(P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.findForMsg(p2pFinancingInformation);
    }

    public List<P2pFinancingInformation> getP2pFinancingInformationList(
            P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.getP2pFinancingInformationList(p2pFinancingInformation);
    }

    public P2pFinancingInformation getApplicantdId(
            P2pFinancingInformation p2pFinancingInformation) {
        return p2pFinancingInformationDao.getApplicantdId(p2pFinancingInformation);
    }
}



