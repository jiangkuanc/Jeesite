package com.dagongsoft.p2p.config.entity;

import java.math.BigDecimal;
import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 广告Entity
 *
 * @author Chace
 * @version 2016-12-19
 */
public class P2pAdvertiserment extends DataEntity<P2pAdvertiserment> {

    private static final long serialVersionUID = 1L;
    private String adPicture;        // 图片上传路径
    private String isEnableLink;        // 是否启用链接
    private String linkAddress;        // 链接地址
    private String openWay;        // 打开方式
    private String position;        // 所在位置
    private String isEnable;        // 是否启用
    private BigDecimal serialNumber;        // 序号
    private String operationPerson;        // 操作人
    private Date operateTime;        // 操作时间

    public P2pAdvertiserment() {
        super();
    }

    public P2pAdvertiserment(String id) {
        super(id);
    }

    public String getAdPicture() {
        return adPicture;
    }

    public void setAdPicture(String adPicture) {
        this.adPicture = adPicture;
    }

    public String getIsEnableLink() {
        return isEnableLink;
    }

    public void setIsEnableLink(String isEnableLink) {
        this.isEnableLink = isEnableLink;
    }

    public String getLinkAddress() {
        return linkAddress;
    }

    public void setLinkAddress(String linkAddress) {
        this.linkAddress = linkAddress;
    }

    public String getOpenWay() {
        return openWay;
    }

    public void setOpenWay(String openWay) {
        this.openWay = openWay;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getIsEnable() {
        return isEnable;
    }

    public void setIsEnable(String isEnable) {
        this.isEnable = isEnable;
    }

    public BigDecimal getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(BigDecimal serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getOperationPerson() {
        return operationPerson;
    }

    public void setOperationPerson(String operationPerson) {
        this.operationPerson = operationPerson;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

}