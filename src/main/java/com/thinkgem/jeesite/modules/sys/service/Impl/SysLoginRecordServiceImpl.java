package com.thinkgem.jeesite.modules.sys.service.Impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.common.web.Servlets;
import com.thinkgem.jeesite.modules.sys.dao.SysLoginRecordDao;
import com.thinkgem.jeesite.modules.sys.entity.SysLoginRecord;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SysLoginRecordService;

/**
 * 用户登录记录表ServiceImpl
 *
 * @author thinkgem
 * @version 2017-05-09
 */
@Transactional(readOnly = true)
@Service("sysLoginRecordService")
public class SysLoginRecordServiceImpl extends CrudService<SysLoginRecordDao, SysLoginRecord> implements SysLoginRecordService {

    @Resource
    private SysLoginRecordDao sysLoginRecordDao;

    public SysLoginRecord get(String id) {
        return super.get(id);
    }

    public List<SysLoginRecord> findList(SysLoginRecord sysLoginRecord) {
        return super.findList(sysLoginRecord);
    }

    public Page<SysLoginRecord> findPage(Page<SysLoginRecord> page, SysLoginRecord sysLoginRecord) {
        return super.findPage(page, sysLoginRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(SysLoginRecord sysLoginRecord) {
        super.save(sysLoginRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(SysLoginRecord sysLoginRecord) {
        super.delete(sysLoginRecord);
    }

    //通过用户编号获取用户登录记录
    public SysLoginRecord getRecordByUserId(String userId) {
        return sysLoginRecordDao.getRecordByUserId(userId);
    }

    //更新用户登录记录
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void updateRecord(SysLoginRecord sysLoginRecord) {
        sysLoginRecordDao.updateRecord(sysLoginRecord);
    }

    //更新用户冻结状态
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void updateFrozenState(SysLoginRecord sysLoginRecord) {
        sysLoginRecordDao.updateFrozenState(sysLoginRecord);

    }

    //保存用户登录记录
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void saveRecord(SysLoginRecord sysLoginRecord) {
        sysLoginRecordDao.saveRecord(sysLoginRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void deleteRecored(SysLoginRecord sysLoginRecord) {
        sysLoginRecordDao.deleteRecored(sysLoginRecord);

    }

}







