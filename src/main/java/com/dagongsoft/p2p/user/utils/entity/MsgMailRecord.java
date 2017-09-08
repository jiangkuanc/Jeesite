package com.dagongsoft.p2p.user.utils.entity;


import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 邮箱记录表Entity
 *
 * @author Joe
 * @version 2016-11-10
 */
public class MsgMailRecord extends DataEntity<MsgMailRecord> {

    private static final long serialVersionUID = 1L;
    private User user;        // 发送人id
    private String msgId;        // 消息ID(废弃)
    private String title;        // 标题
    private String mailContent;        // 内容
    private String recAddress;        // 接收地址
    private String sendAddress;        // 发送地址
    private Date sendDate;        // 发送时间
    private String sendState;        // 发送状态(success_failure)

    public MsgMailRecord() {
        super();
    }

    public MsgMailRecord(String id) {
        super(id);
    }

    @NotNull(message = "发送人id不能为空")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Length(min = 1, max = 64, message = "消息ID(废弃)长度必须介于 1 和 64 之间")
    public String getMsgId() {
        return msgId;
    }

    public void setMsgId(String msgId) {
        this.msgId = msgId;
    }

    @Length(min = 0, max = 150, message = "标题长度必须介于 0 和 150 之间")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMailContent() {
        return mailContent;
    }

    public void setMailContent(String mailContent) {
        this.mailContent = mailContent;
    }

    @Length(min = 0, max = 64, message = "接收地址长度必须介于 0 和 64 之间")
    public String getRecAddress() {
        return recAddress;
    }

    public void setRecAddress(String recAddress) {
        this.recAddress = recAddress;
    }

    @Length(min = 0, max = 64, message = "发送地址长度必须介于 0 和 64 之间")
    public String getSendAddress() {
        return sendAddress;
    }

    public void setSendAddress(String sendAddress) {
        this.sendAddress = sendAddress;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    @Length(min = 0, max = 11, message = "发送状态(success_failure)长度必须介于 0 和 11 之间")
    public String getSendState() {
        return sendState;
    }

    public void setSendState(String sendState) {
        this.sendState = sendState;
    }

}