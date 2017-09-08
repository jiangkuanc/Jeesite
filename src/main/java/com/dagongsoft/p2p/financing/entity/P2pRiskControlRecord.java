package com.dagongsoft.p2p.financing.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 募集期风控记录表Entity
 *
 * @author Zeus
 * @version 2016-11-14
 */
public class P2pRiskControlRecord extends DataEntity<P2pRiskControlRecord> {

    private static final long serialVersionUID = 1L;
    private String financingInformationId;        // 融资信息id
    private String inRaiseState;        // 募集期风控状态（in_raise_state）
    private User user;        // 操作人
    private Date operateTime;        // 操作时间
    private String operateExplain;        // 说明

    public P2pRiskControlRecord() {
        super();
    }

    public P2pRiskControlRecord(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "融资信息id长度必须介于 0 和 64 之间")
    public String getFinancingInformationId() {
        return financingInformationId;
    }

    public void setFinancingInformationId(String financingInformationId) {
        this.financingInformationId = financingInformationId;
    }

    @Length(min = 0, max = 64, message = "募集期风控状态（in_raise_state）长度必须介于 0 和 64 之间")
    public String getInRaiseState() {
        return inRaiseState;
    }

    public void setInRaiseState(String inRaiseState) {
        this.inRaiseState = inRaiseState;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    @Length(min = 0, max = 200, message = "说明长度必须介于 0 和 200 之间")
    public String getOperateExplain() {
        return operateExplain;
    }

    public void setOperateExplain(String operateExplain) {
        this.operateExplain = operateExplain;
    }

}