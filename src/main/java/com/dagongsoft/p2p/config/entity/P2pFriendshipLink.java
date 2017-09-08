package com.dagongsoft.p2p.config.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 友情链接Entity
 *
 * @author Chace
 * @version 2016-12-23
 */
public class P2pFriendshipLink extends DataEntity<P2pFriendshipLink> {

    private static final long serialVersionUID = 1L;
    private String linkUnit;        // 友情链接单位
    private String linkState;        // 连接状态
    private String linkIcon;        // 图标地址
    private String linkAddress;        // 链接地址
    private String sort;        // sort
    private String operationPerson;        // 操作人
    private Date operateTime;        // 操作时间

    public P2pFriendshipLink() {
        super();
    }

    public P2pFriendshipLink(String id) {
        super(id);
    }

    @Length(min = 0, max = 64, message = "友情链接单位长度必须介于 0 和 64 之间")
    public String getLinkUnit() {
        return linkUnit;
    }

    public void setLinkUnit(String linkUnit) {
        this.linkUnit = linkUnit;
    }

    @Length(min = 0, max = 100, message = "link_state长度必须介于 0 和 100 之间")
    public String getLinkState() {
        return linkState;
    }

    public void setLinkState(String linkState) {
        this.linkState = linkState;
    }

    @Length(min = 0, max = 200, message = "link_icon长度必须介于 0 和 200 之间")
    public String getLinkIcon() {
        return linkIcon;
    }

    public void setLinkIcon(String linkIcon) {
        this.linkIcon = linkIcon;
    }

    @Length(min = 0, max = 200, message = "link_address长度必须介于 0 和 200 之间")
    public String getLinkAddress() {
        return linkAddress;
    }

    public void setLinkAddress(String linkAddress) {
        this.linkAddress = linkAddress;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    @Length(min = 0, max = 64, message = "操作人长度必须介于 0 和 64 之间")
    public String getOperationPerson() {
        return operationPerson;
    }

    public void setOperationPerson(String operationPerson) {
        this.operationPerson = operationPerson;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

}