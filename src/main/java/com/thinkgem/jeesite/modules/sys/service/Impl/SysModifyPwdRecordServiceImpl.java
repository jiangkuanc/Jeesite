package com.thinkgem.jeesite.modules.sys.service.Impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.IdGen;
import com.thinkgem.jeesite.modules.sys.dao.SysModifyPwdRecordDao;
import com.thinkgem.jeesite.modules.sys.entity.SysModifyPwdRecord;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SysModifyPwdRecordService;

/**
 * 用户修改密码记录表ServiceImpl
 *
 * @author thinkgem
 * @version 2017-05-10
 */
@Transactional(readOnly = true)
@Service("sysModifyPwdRecordService")
public class SysModifyPwdRecordServiceImpl extends CrudService<SysModifyPwdRecordDao, SysModifyPwdRecord> implements SysModifyPwdRecordService {

    @Resource
    private SysModifyPwdRecordDao sysModifyPwdRecordDao;

    public SysModifyPwdRecord get(String id) {
        return super.get(id);
    }

    public List<SysModifyPwdRecord> findList(SysModifyPwdRecord sysModifyPwdRecord) {
        return super.findList(sysModifyPwdRecord);
    }

    public Page<SysModifyPwdRecord> findPage(Page<SysModifyPwdRecord> page, SysModifyPwdRecord sysModifyPwdRecord) {
        return super.findPage(page, sysModifyPwdRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(SysModifyPwdRecord sysModifyPwdRecord) {
        super.save(sysModifyPwdRecord);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(SysModifyPwdRecord sysModifyPwdRecord) {
        super.delete(sysModifyPwdRecord);
    }

    //通过用户编号，查询用户最近的N次修改密码的记录
    public List<SysModifyPwdRecord> getTopUPListByUserId(Map<String, Object> paramsMap) {
        List<SysModifyPwdRecord> list = Lists.newArrayList();
        list = sysModifyPwdRecordDao.getTopUPListByUserId(paramsMap);
        return list;
    }

    //修改密码后，把记录存入到修改密码记录表中
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void saveModifyPwd(User user, String entryptPassword) {
        SysModifyPwdRecord sysModifyPwdRecord = new SysModifyPwdRecord();
        sysModifyPwdRecord.setId(IdGen.uuid());
        sysModifyPwdRecord.setUser(user);
        sysModifyPwdRecord.setPassword(entryptPassword);
        sysModifyPwdRecord.setModifyTime(new Date());
        sysModifyPwdRecordDao.saveModifyRed(sysModifyPwdRecord);
    }

}