/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.msg.service;

import java.util.List;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.msg.dao.MsgSmsRecordDao;
import com.dagongsoft.p2p.msg.entity.MsgSmsRecord;
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
public class MsgSmsRecordService extends CrudService<MsgSmsRecordDao, MsgSmsRecord> {
    @Autowired
    private MsgSmsRecordDao msgSmsRecordDao;

    public MsgSmsRecord get(String id) {
        return super.get(id);
    }

    public List<MsgSmsRecord> findList(MsgSmsRecord msgSmsRecord) {
        return super.findList(msgSmsRecord);
    }

    public Page<MsgSmsRecord> findPage(Page<MsgSmsRecord> page, MsgSmsRecord msgSmsRecord) {
        return super.findPage(page, msgSmsRecord);
    }

    @Transactional(readOnly = false)
    public void save(MsgSmsRecord msgSmsRecord) {
        super.save(msgSmsRecord);
    }

    @Transactional(readOnly = false)
    public void delete(MsgSmsRecord msgSmsRecord) {
        super.delete(msgSmsRecord);
    }

    public List<MsgSmsRecord> getListByUserId(String userId) {
        return msgSmsRecordDao.getListByUserId(userId);
    }

    /**
     * 前台注册时根据手机号更新短信记录表接收人id
     */
    @Transactional(readOnly = false)
    public void updateRecIdByTelnum(MsgSmsRecord msgSmsRecord) {
        msgSmsRecordDao.updateRecIdByTelnum(msgSmsRecord);
    }

    /**
     * 查询每个手机号当天接收短信条数
     */
    public Integer getCountByOhone(String phone) {
        return msgSmsRecordDao.getCountByOhone(phone);
    }
}