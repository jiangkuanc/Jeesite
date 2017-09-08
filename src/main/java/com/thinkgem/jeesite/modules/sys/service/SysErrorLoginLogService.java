/**
 * Copyright &copy; 2012-2013 <a href="httparamMap://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.sys.dao.SysErrorLoginLogDao;
import com.thinkgem.jeesite.modules.sys.entity.SysErrorLoginLog;

/**
 * 错误日志Service
 *
 * @author 王柄崎
 * @version 2017-5-9
 */
@Service
@Transactional(readOnly = true)
public class SysErrorLoginLogService extends CrudService<SysErrorLoginLogDao, SysErrorLoginLog> {

    public Page<SysErrorLoginLog> findPage(Page<SysErrorLoginLog> page, SysErrorLoginLog sysErrorLoginLog) {

        // 设置默认时间范围，默认当前月
        if (sysErrorLoginLog.getBeginDate() == null) {
            sysErrorLoginLog.setBeginDate(DateUtils.setDays(DateUtils.parseDate(DateUtils.getDate()), 1));
        }
        if (sysErrorLoginLog.getEndDate() == null) {
            sysErrorLoginLog.setEndDate(DateUtils.addMonths(sysErrorLoginLog.getBeginDate(), 1));
        }

        return super.findPage(page, sysErrorLoginLog);

    }

    @Transactional(readOnly = false)
    public void save(SysErrorLoginLog sysErrorLoginLog) {
        super.save(sysErrorLoginLog);
    }

}
