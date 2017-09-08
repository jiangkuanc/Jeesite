/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.msg.entity;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 短信发送信息Entity
 *
 * @author zhengshuo
 * @version 2016-09-30
 */
public class MsgSmsRecord extends DataEntity<MsgSmsRecord> {

    private static final long serialVersionUID = 1L;
    private User user;                // 发送人ID
    private String recId;            // 接收人ID
    private String msgId;            // 消息ID（废弃）
    private String telnum;            // 手机号码
    private String smsContent;        // 内容
    private String sendState;        // 发送状态
    private Date sendDate;            // 发送时间
    private Date beginSendDate;
    private Date endSendDate;
    private String recIdStr;       //查询时多选传参

    public MsgSmsRecord() {
        super();
    }

    public MsgSmsRecord(String id) {
        super(id);
    }


    public String getRecIdStr() {
        return recIdStr;
    }

    public void setRecIdStr(String recIdStr) {
        this.recIdStr = recIdStr;
    }

    @NotNull(message = "发送人ID不能为空")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 1, max = 11, message = "消息ID长度必须介于 1 和 11 之间")
    public String getMsgId() {
        return msgId;
    }

    public void setMsgId(String msgId) {
        this.msgId = msgId;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }


    public Date getBeginSendDate() {
        return beginSendDate;
    }

    public void setBeginSendDate(Date beginSendDate) {
        this.beginSendDate = beginSendDate;
    }

    public Date getEndSendDate() {
        return endSendDate;
    }

    public void setEndSendDate(Date endSendDate) {
        this.endSendDate = endSendDate;
    }

    public String getTelnum() {
        return telnum;
    }

    public void setTelnum(String telnum) {
        this.telnum = telnum;
    }

    public String getSmsContent() {
        return smsContent;
    }

    public void setSmsContent(String smsContent) {
        this.smsContent = smsContent;
    }

    public String getSendState() {
        return sendState;
    }

    public void setSendState(String sendState) {
        this.sendState = sendState;
    }

    public String getRecId() {
        return recId;
    }

    public void setRecId(String recId) {
        this.recId = recId;
    }


}