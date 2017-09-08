package com.dagongsoft.p2p.risk.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 风险测评记录表Entity
 *
 * @author Zeus
 * @version 2016-11-14
 */
public class P2pRiskRecord extends DataEntity<P2pRiskRecord> {

    private static final long serialVersionUID = 1L;
    private User user;        // user_id
    private String paperId;        // 问卷ID
    private String totalScore;        // 得分

    public P2pRiskRecord() {
        super();
    }

    public P2pRiskRecord(String id) {
        super(id);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 0, max = 64, message = "问卷ID长度必须介于 0 和 64 之间")
    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    @Length(min = 0, max = 11, message = "得分长度必须介于 0 和 11 之间")
    public String getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(String totalScore) {
        this.totalScore = totalScore;
    }

}