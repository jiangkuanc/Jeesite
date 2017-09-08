/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.msg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dagongsoft.p2p.msg.entity.MsgLetterRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 站内信DAO接口
 *
 * @author zhengshuo
 * @version 2016-09-30
 */
@MyBatisDao
public interface MsgLetterRecordDao extends CrudDao<MsgLetterRecord> {

    public List<MsgLetterRecord> getListByUserId(@Param("userId") String userId);

    /**
     * 未读消息
     */
    public List<MsgLetterRecord> getListUnReadMessage(MsgLetterRecord msgLetterRecord);

    /**
     * 已读消息
     */
    public List<MsgLetterRecord> getListReadMessage(MsgLetterRecord msgLetterRecord);

    /**
     * 未读消息json
     */
    public int getUnReadMessageJson(MsgLetterRecord msgLetterRecord);

    /**
     * 已读消息json
     */
    public int getReadMessageJson(MsgLetterRecord msgLetterRecord);

    /**
     * 查看消息详情
     */
    public MsgLetterRecord getById(MsgLetterRecord msgLetterRecord);

    /**
     * 标记为已读
     */
    public void markRead(MsgLetterRecord msgLetterRecord);

    public MsgLetterRecord get2(String id);
}