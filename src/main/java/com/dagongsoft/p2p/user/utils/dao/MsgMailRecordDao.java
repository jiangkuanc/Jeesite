package com.dagongsoft.p2p.user.utils.dao;

import com.dagongsoft.p2p.user.utils.entity.MsgMailRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;


/**
 * 邮箱记录表DAO接口
 *
 * @author Joe
 * @version 2016-11-10
 */
@MyBatisDao
public interface MsgMailRecordDao extends CrudDao<MsgMailRecord> {

}