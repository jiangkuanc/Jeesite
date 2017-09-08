package com.dagongsoft.p2p.user.utils.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.user.utils.dao.MsgMailRecordDao;
import com.dagongsoft.p2p.user.utils.entity.MsgMailRecord;
import com.dagongsoft.p2p.user.utils.service.MsgMailRecordService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 邮箱记录表ServiceImpl
 *
 * @author Joe
 * @version 2016-11-10
 */
@Transactional(readOnly = true)
@Service("msgMailRecordService")
public class MsgMailRecordServiceImpl extends CrudService<MsgMailRecordDao, MsgMailRecord> implements MsgMailRecordService {

    public MsgMailRecord get(String id) {
        return super.get(id);
    }

    public List<MsgMailRecord> findList(MsgMailRecord msgMailRecord) {
        return super.findList(msgMailRecord);
    }

    public Page<MsgMailRecord> findPage(Page<MsgMailRecord> page, MsgMailRecord msgMailRecord) {
        return super.findPage(page, msgMailRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(MsgMailRecord msgMailRecord) {
        super.save(msgMailRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(MsgMailRecord msgMailRecord) {
        super.delete(msgMailRecord);
    }

}