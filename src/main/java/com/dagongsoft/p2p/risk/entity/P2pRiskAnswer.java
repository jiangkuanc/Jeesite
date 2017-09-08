package com.dagongsoft.p2p.risk.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 风险测评答案表Entity
 *
 * @author Zeus
 * @version 2016-11-14
 */
public class P2pRiskAnswer extends DataEntity<P2pRiskAnswer> {

    private static final long serialVersionUID = 1L;
    private String riskQuestionId;        // 问题ID
    private String riskOption;        // 选项(risk_option)
    private String optionContent;        // 选项内容
    private Integer score;        // 分值

    public P2pRiskAnswer() {
        super();
    }

    public P2pRiskAnswer(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "问题ID长度必须介于 0 和 64 之间")
    public String getRiskQuestionId() {
        return riskQuestionId;
    }

    public void setRiskQuestionId(String riskQuestionId) {
        this.riskQuestionId = riskQuestionId;
    }

    @Length(min = 0, max = 64, message = "选项(risk_option)长度必须介于 0 和 64 之间")
    public String getRiskOption() {
        return riskOption;
    }

    public void setRiskOption(String riskOption) {
        this.riskOption = riskOption;
    }

    @Length(min = 0, max = 200, message = "选项内容长度必须介于 0 和 200 之间")
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

}