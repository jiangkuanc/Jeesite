package com.dagongsoft.p2p.risk.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 风险测评问卷表Entity
 *
 * @author Zeus
 * @version 2016-11-14
 */
public class P2pRiskPaper extends DataEntity<P2pRiskPaper> {

    private static final long serialVersionUID = 1L;
    private String paperTitle;        // 问卷标题
    private User user;        // 编制人
    private Date drawTime;        // 编制时间
    private String paperVersion;        // 版本号
    private String paperState;        // 问卷状态（paper_state 编辑中、待审核、审核完成、已发布）//4:已经发布，1：编辑中，2：审核中，3：已审核
    private String auditId;        // 审核人
    private Date auditTime;        // 审核时间
    private String auditOpinion;        // 审核意见
    private String auditTime2;
    private String publishId;        // 发布人
    private Date publishTime;        // 发布时间
    private String publishTime2;

    private String paperExplain;        // 问卷说明

    private String paperId;        // 问卷id
    private String questionType;        // 题目分类（question_type）
    private String questionContent;        // 题目内容
    private String selectWay;        // 选择方式(select_way单选，多选)
    private Integer sort;        // 顺序


    private String riskQuestionId;        // 问题ID
    private String riskOption;        // 选项(risk_option)
    private String optionContent;        // 选项内容
    private Integer score;        // 分值


    public P2pRiskPaper() {
        super();
    }

    public P2pRiskPaper(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "问卷标题长度必须介于 0 和 64 之间")
    public String getPaperTitle() {
        return paperTitle;
    }

    public void setPaperTitle(String paperTitle) {
        this.paperTitle = paperTitle;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getDrawTime() {
        return drawTime;
    }

    public void setDrawTime(Date drawTime) {
        this.drawTime = drawTime;
    }

    @Length(min = 0, max = 64, message = "版本号长度必须介于 0 和 64 之间")
    public String getPaperVersion() {
        return paperVersion;
    }

    public void setPaperVersion(String paperVersion) {
        this.paperVersion = paperVersion;
    }

    @Length(min = 0, max = 64, message = "问卷状态（paper_state 编辑中、待审核、审核完成、已发布）长度必须介于 0 和 64 之间")
    public String getPaperState() {
        return paperState;
    }

    public void setPaperState(String paperState) {
        this.paperState = paperState;
    }

    @Length(min = 0, max = 64, message = "审核人长度必须介于 0 和 64 之间")
    public String getAuditId() {
        return auditId;
    }

    public void setAuditId(String auditId) {
        this.auditId = auditId;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    @Length(min = 0, max = 64, message = "发布人长度必须介于 0 和 64 之间")
    public String getPublishId() {
        return publishId;
    }

    public void setPublishId(String publishId) {
        this.publishId = publishId;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getPaperExplain() {
        return paperExplain;
    }

    public void setPaperExplain(String paperExplain) {
        this.paperExplain = paperExplain;
    }

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getSelectWay() {
        return selectWay;
    }

    public void setSelectWay(String selectWay) {
        this.selectWay = selectWay;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getRiskQuestionId() {
        return riskQuestionId;
    }

    public void setRiskQuestionId(String riskQuestionId) {
        this.riskQuestionId = riskQuestionId;
    }

    public String getRiskOption() {
        return riskOption;
    }

    public void setRiskOption(String riskOption) {
        this.riskOption = riskOption;
    }

    public String getOptionContent() {
        return optionContent;
    }

    public void setOptionContent(String optionContent) {
        this.optionContent = optionContent;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getAuditTime2() {
        return auditTime2;
    }

    public void setAuditTime2(String auditTime2) {
        this.auditTime2 = auditTime2;
    }

    public String getPublishTime2() {
        return publishTime2;
    }

    public void setPublishTime2(String publishTime2) {
        this.publishTime2 = publishTime2;
    }

    public String getAuditOpinion() {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion) {
        this.auditOpinion = auditOpinion;
    }


}