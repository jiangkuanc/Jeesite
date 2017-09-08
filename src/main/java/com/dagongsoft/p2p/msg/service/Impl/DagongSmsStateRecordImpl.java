package com.dagongsoft.p2p.msg.service.Impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;

import com.dagongsoft.p2p.msg.entity.MsgSmsRecord;
import com.dagongsoft.p2p.msg.service.ISmsStateRecord;
import com.dagongsoft.p2p.msg.service.MsgSmsRecordService;
import com.dagongsoft.p2p.msg.web.SmsPhoneCodeConst;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 短信记录相关的实现类
 *
 * @author DAGONG
 */
public class DagongSmsStateRecordImpl implements ISmsStateRecord {

    private MsgSmsRecordService msgSmsRecordService;

    public MsgSmsRecordService getMsgSmsRecordService() {
        return msgSmsRecordService;
    }

    public void setMsgSmsRecordService(MsgSmsRecordService msgSmsRecordService) {
        this.msgSmsRecordService = msgSmsRecordService;
    }

    public DagongSmsStateRecordImpl() {
    }

    public DagongSmsStateRecordImpl(MsgSmsRecordService msgSmsRecordService) {
        this.msgSmsRecordService = msgSmsRecordService;
    }

    /**
     * 短信记录发送成功
     */
    @Override
    public MsgSmsRecord recordSmsSuccessState(MsgSmsRecord msgSmsRecord, User user, HttpSession session) {
        if (msgSmsRecord == null) {
            msgSmsRecord = new MsgSmsRecord();
        }
        msgSmsRecord.setUser(user);
        msgSmsRecord.setMsgId(RandomStringUtils.randomNumeric(10));
        msgSmsRecord.setSmsContent((String) session.getAttribute(SmsPhoneCodeConst.Content));
        msgSmsRecord.setRecId(user.getId());
        msgSmsRecord.setSendDate(new Date());
        msgSmsRecord.setSendState("1");        // 设置发送手机号状态 (1:成功发送,0：发送失败)


        return msgSmsRecord;
    }

    /**
     * 短信记录发送失败
     */
    @Override
    public MsgSmsRecord recordSmsFailureState(MsgSmsRecord msgSmsRecord, User user, HttpSession session) {
        if (msgSmsRecord == null) {
            msgSmsRecord = new MsgSmsRecord();
        }
        msgSmsRecord.setUser(user);
        msgSmsRecord.setMsgId(RandomStringUtils.randomNumeric(10));
        msgSmsRecord.setSmsContent((String) session.getAttribute(SmsPhoneCodeConst.Content));
        msgSmsRecord.setRecId(user.getId());
        msgSmsRecord.setSendDate(new Date());
        msgSmsRecord.setSendState("0");        // 设置发送手机号状态 (1:成功发送,0：发送失败)
        return msgSmsRecord;
    }


    /**
     * 判断该手机号是否已经注册
     */
    @Override
    public boolean isSmsPhoneCertify(String userId, MsgSmsRecordService msgSmsRecordService) {
        Boolean isCertify = Boolean.FALSE;
        List<MsgSmsRecord> msgSmsRecords = msgSmsRecordService.getListByUserId(userId);
        if (msgSmsRecords == null) {
            return isCertify;
        }
        for (MsgSmsRecord msgSmsRecord : msgSmsRecords) {
            if (StringUtils.equalsIgnoreCase(msgSmsRecord.getSendState(), "1")) {
                isCertify = Boolean.TRUE;
            }
        }
        return isCertify;
    }
}
