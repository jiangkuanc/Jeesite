/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.msg.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.msg.dao.MsgLetterRecordDao;
import com.dagongsoft.p2p.msg.entity.MsgLetterRecord;
import com.dagongsoft.p2p.user.dao.P2pEnterpriseCertifyDao;
import com.dagongsoft.p2p.user.dao.P2pUserInformationDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 站内信Service
 *
 * @author zhengshuo
 * @version 2016-09-30
 */
@Service
@Transactional(readOnly = true)
public class MsgLetterRecordService extends CrudService<MsgLetterRecordDao, MsgLetterRecord> {
    @Autowired
    private MsgLetterRecordDao msgLetterRecordDao;
    @Autowired
    private P2pEnterpriseCertifyDao p2pEnterpriseCertifyDao;
    @Autowired
    private P2pUserInformationDao p2pUserInformationDao;

    public MsgLetterRecord get(String id) {
        return super.get(id);
    }


    public List<MsgLetterRecord> findList(MsgLetterRecord msgLetterRecord) {
        return super.findList(msgLetterRecord);
    }

    public Page<MsgLetterRecord> findPage(Page<MsgLetterRecord> page, MsgLetterRecord msgLetterRecord) {
        return super.findPage(page, msgLetterRecord);
    }

    @Transactional(readOnly = false)
    public void save(MsgLetterRecord msgLetterRecord) {
        super.save(msgLetterRecord);
    }

    @Transactional(readOnly = false)
    public void delete(MsgLetterRecord msgLetterRecord) {
        super.delete(msgLetterRecord);
    }

    public List<MsgLetterRecord> getListByUserId(String userId) {
        return msgLetterRecordDao.getListByUserId(userId);
    }

    /**
     * 未读消息
     *
     * @return
     */
    public List<MsgLetterRecord> getListUnReadMessage(MsgLetterRecord msgLetterRecord) {
        return msgLetterRecordDao.getListUnReadMessage(msgLetterRecord);
    }

    /**
     * 已读消息
     *
     * @return
     */
    public List<MsgLetterRecord> getListReadMessage(MsgLetterRecord msgLetterRecord) {
        return msgLetterRecordDao.getListReadMessage(msgLetterRecord);
    }

    /**
     * 未读消息json
     *
     * @return
     */
    public int getUnReadMessageJson(MsgLetterRecord msgLetterRecord) {
        return msgLetterRecordDao.getUnReadMessageJson(msgLetterRecord);
    }

    /**
     * 已读消息json
     *
     * @return
     */
    public int getReadMessageJson(MsgLetterRecord msgLetterRecord) {
        return msgLetterRecordDao.getReadMessageJson(msgLetterRecord);
    }

    /**
     * 查看消息详情
     */
    public MsgLetterRecord getById(MsgLetterRecord msgLetterRecord) {
        return msgLetterRecordDao.getById(msgLetterRecord);
    }

    /**
     * 标记为已读
     */
    @Transactional(readOnly = false)
    public void markRead(MsgLetterRecord msgLetterRecord) {
        msgLetterRecordDao.markRead(msgLetterRecord);
    }

    public MsgLetterRecord get2(String id) {
        return msgLetterRecordDao.get2(id);
    }

    /**
     * 发送站内信
     */
    @Transactional(readOnly = false)
    public void sendLetter(MsgLetterRecord m) {
        m.setSendDate(new Date());
        m.setReadState("0");
        save(m);
    }

}