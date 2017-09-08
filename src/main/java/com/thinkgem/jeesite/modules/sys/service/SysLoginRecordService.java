package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.sys.entity.SysLoginRecord;
import com.thinkgem.jeesite.modules.sys.entity.User;

/**
 * 用户登录记录表Service
 *
 * @author thinkgem
 * @version 2017-05-09
 */
public interface SysLoginRecordService {

    public SysLoginRecord get(String id);

    public List<SysLoginRecord> findList(SysLoginRecord sysLoginRecord);

    public Page<SysLoginRecord> findPage(Page<SysLoginRecord> page, SysLoginRecord sysLoginRecord);

    public void save(SysLoginRecord sysLoginRecord);

    public void delete(SysLoginRecord sysLoginRecord);

    public SysLoginRecord getRecordByUserId(String userId);

    public void updateRecord(SysLoginRecord sysLoginRecord);

    public void updateFrozenState(SysLoginRecord sysLoginRecord);

    public void saveRecord(SysLoginRecord sysLoginRecord);

    public void deleteRecored(SysLoginRecord sysLoginRecord);

}