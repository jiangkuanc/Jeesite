package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.SysLoginRecord;

/**
 * 用户登录记录表DAO接口
 *
 * @author thinkgem
 * @version 2017-05-09
 */
@MyBatisDao
public interface SysLoginRecordDao extends CrudDao<SysLoginRecord> {

    public SysLoginRecord getRecordByUserId(String userId);

    public void updateRecord(SysLoginRecord sysLoginRecord);

    public void updateFrozenState(SysLoginRecord sysLoginRecord);

    public void saveRecord(SysLoginRecord sysLoginRecord);

    public void deleteRecored(SysLoginRecord sysLoginRecord);

}