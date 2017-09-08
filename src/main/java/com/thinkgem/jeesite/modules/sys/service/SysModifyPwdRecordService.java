package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;
import java.util.Map;


import com.thinkgem.jeesite.modules.sys.entity.SysModifyPwdRecord;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 用户修改密码记录表Service
 *
 * @author thinkgem
 * @version 2017-05-10
 */
public interface SysModifyPwdRecordService {

    public SysModifyPwdRecord get(String id);

    public List<SysModifyPwdRecord> findList(SysModifyPwdRecord sysModifyPwdRecord);

    public Page<SysModifyPwdRecord> findPage(Page<SysModifyPwdRecord> page, SysModifyPwdRecord sysModifyPwdRecord);

    public void save(SysModifyPwdRecord sysModifyPwdRecord);

    public void delete(SysModifyPwdRecord sysModifyPwdRecord);

    public List<SysModifyPwdRecord> getTopUPListByUserId(Map<String, Object> paramsMap);

    public void saveModifyPwd(User user, String entryptPassword);


}