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
 * 站内信Entity
 *
 * @author zhengshuo
 * @version 2016-09-30
 */
public class MsgLetterRecord extends DataEntity<MsgLetterRecord> {

    private static final long serialVersionUID = 1L;
    private User user;        // 发送人ID
    private String recId;        // 接收人ID
    private String msgId;        // 消息ID
    private String title;        //标题
    private String content;        //内容
    private Date sendDate;        // 发送时间
    private String readState;        // 阅读状态
    private Date beginSendDate;
    private Date endSendDate;

    public MsgLetterRecord() {
        super();
    }

    public MsgLetterRecord(String id) {
        super(id);
    }

    /*	@NotNull(message="发送人ID不能为空")*/
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public String getRecId() {
        return recId;
    }

    public void setRecId(String recId) {
        this.recId = recId;
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

    @Length(min = 0, max = 64, message = "阅读状态长度必须介于 0 和 64 之间")
    public String getReadState() {
        return readState;
    }

    public void setReadState(String readState) {
        this.readState = readState;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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


}