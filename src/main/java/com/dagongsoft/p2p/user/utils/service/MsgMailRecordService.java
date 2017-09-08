package com.dagongsoft.p2p.user.utils.service;

import java.util.List;

import com.dagongsoft.p2p.user.utils.entity.MsgMailRecord;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 邮箱记录表Service
 *
 * @author Joe
 * @version 2016-11-10
 */
public interface MsgMailRecordService {

    public MsgMailRecord get(String id);

    public List<MsgMailRecord> findList(MsgMailRecord msgMailRecord);

    public Page<MsgMailRecord> findPage(Page<MsgMailRecord> page, MsgMailRecord msgMailRecord);

    public void save(MsgMailRecord msgMailRecord);

    public void delete(MsgMailRecord msgMailRecord);

}