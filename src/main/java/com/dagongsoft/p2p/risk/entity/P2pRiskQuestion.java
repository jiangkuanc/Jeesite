package com.dagongsoft.p2p.risk.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 风险测评问题表Entity
 *
 * @author Zeus
 * @version 2016-11-14
 */
public class P2pRiskQuestion extends DataEntity<P2pRiskQuestion> {

    private static final long serialVersionUID = 1L;
    private String paperId;        // 问卷id
    private String questionType;        // 题目分类（question_type）
    private String questionContent;        // 题目内容
    private String selectWay;        // 选择方式(select_way单选，多选)
    private Integer sort;        // 顺序
    private List<P2pRiskAnswer> p2pRiskAnswers;

    public P2pRiskQuestion() {
        super();
    }

    public P2pRiskQuestion(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "问卷id长度必须介于 0 和 64 之间")
    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    @Length(min = 0, max = 300, message = "题目分类（question_type）长度必须介于 0 和 100 之间")
    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    @Length(min = 0, max = 200, message = "题目内容长度必须介于 0 和 200 之间")
    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    @Length(min = 0, max = 100, message = "选择方式(select_way单选，多选)长度必须介于 0 和 100 之间")
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

    public List<P2pRiskAnswer> getP2pRiskAnswers() {
        return p2pRiskAnswers;
    }

    public void setP2pRiskAnswers(List<P2pRiskAnswer> p2pRiskAnswers) {
        this.p2pRiskAnswers = p2pRiskAnswers;
    }


}