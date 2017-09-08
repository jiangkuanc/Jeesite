package com.thinkgem.jeesite.modules.sys.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.SysModifyPwdRecord;

/**
 * 用户修改密码记录表DAO接口
 *
 * @author thinkgem
 * @version 2017-05-10
 */
@MyBatisDao
public interface SysModifyPwdRecordDao extends CrudDao<SysModifyPwdRecord> {

    public List<SysModifyPwdRecord> getTopUPListByUserId(Map<String, Object> paramsMap);

    public void saveModifyRed(SysModifyPwdRecord sysModifyPwdRecord);

}