/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.msg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.dagongsoft.p2p.msg.entity.MsgSmsRecord;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 短信发送记录DAO接口
 *
 * @author zhengshuo
 * @version 2016-09-30
 */
@MyBatisDao
public interface MsgSmsRecordDao extends CrudDao<MsgSmsRecord> {

    public List<MsgSmsRecord> getListByUserId(@Param("userId") String userId);

    /**
     * 前台注册时根据手机号更新短信记录表接收人id
     */
    public void updateRecIdByTelnum(MsgSmsRecord msgSmsRecord);

    /**
     * 查询每个手机号当天接收短信条数
     */
    public Integer getCountByOhone(String phone);
}