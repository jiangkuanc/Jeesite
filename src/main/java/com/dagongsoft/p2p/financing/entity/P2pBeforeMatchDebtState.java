/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 撮合前债项状态进展表Entity
 *
 * @author zhengshuo
 * @version 2016-07-11
 */
public class P2pBeforeMatchDebtState extends DataEntity<P2pBeforeMatchDebtState> {

    private static final long serialVersionUID = 1L;
    private String finacingInformationId;        // 融资申请id
    private String progressStage;        // 进展阶段
    private Date stateTime;        // 状态时间
    private String operatorId;        // 操作人
    private String handleResult;        // 处理结果
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public P2pBeforeMatchDebtState() {
        super();
    }

    public P2pBeforeMatchDebtState(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "融资申请id长度必须介于 0 和 64 之间")
    public String getFinacingInformationId() {
        return finacingInformationId;
    }

    public void setFinacingInformationId(String finacingInformationId) {
        this.finacingInformationId = finacingInformationId;
    }

    @Length(min = 0, max = 16, message = "进展阶段长度必须介于 0 和 16 之间")
    public String getProgressStage() {
        return progressStage;
    }

    public void setProgressStage(String progressStage) {
        this.progressStage = progressStage;
    }

    public Date getStateTime() {
        return stateTime;
    }

    public void setStateTime(Date stateTime) {
        this.stateTime = stateTime;
    }

    @Length(min = 0, max = 64, message = "操作人长度必须介于 0 和 64 之间")
    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }

    @Length(min = 0, max = 255, message = "处理结果长度必须介于 0 和 255 之间")
    public String getHandleResult() {
        return handleResult;
    }

    public void setHandleResult(String handleResult) {
        this.handleResult = handleResult;
    }

}