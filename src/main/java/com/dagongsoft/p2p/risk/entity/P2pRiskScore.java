package com.dagongsoft.p2p.risk.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 测评分数表Entity
 *
 * @author Zeus
 * @version 2016-11-14
 */
public class P2pRiskScore extends DataEntity<P2pRiskScore> {

    private static final long serialVersionUID = 1L;
    private String riskRecordId;        // 测评记录id
    private String riskAnswerId;        // 答案ID

    public P2pRiskScore() {
        super();
    }

    public P2pRiskScore(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "测评记录id长度必须介于 0 和 64 之间")
    public String getRiskRecordId() {
        return riskRecordId;
    }

    public void setRiskRecordId(String riskRecordId) {
        this.riskRecordId = riskRecordId;
    }

    @Length(min = 0, max = 64, message = "答案ID长度必须介于 0 和 64 之间")
    public String getRiskAnswerId() {
        return riskAnswerId;
    }

    public void setRiskAnswerId(String riskAnswerId) {
        this.riskAnswerId = riskAnswerId;
    }

}