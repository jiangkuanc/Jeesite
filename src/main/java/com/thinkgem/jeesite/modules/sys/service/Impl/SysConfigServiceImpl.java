package com.thinkgem.jeesite.modules.sys.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.dao.SysConfigDao;
import com.thinkgem.jeesite.modules.sys.entity.SysConfig;
import com.thinkgem.jeesite.modules.sys.service.SysConfigService;

/**
 * 系统配置信息ServiceImpl
 *
 * @author Summer
 * @version 2016-12-05
 */
@Transactional(readOnly = true)
@Service("sysConfigService")
public class SysConfigServiceImpl extends CrudService<SysConfigDao, SysConfig> implements SysConfigService {

    @Autowired
    private SysConfigDao SysConfigDao;

    public SysConfig get(String id) {
        return super.get(id);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(SysConfig sysConfig) {
        super.save(sysConfig);
    }

    //根据系统编号，查询所有符合条件的配置集合
    @Override
    public List getListBySysId(String sysId) {
        return SysConfigDao.getListBySysId(sysId);
    }

    //根据系统编号和Key，查询所有符合条件的配置值
    @Override
    public String getValueBySysIdAndKey(String sysId, String key) {
        return SysConfigDao.getValueBySysIdAndKey(sysId, key);
    }

}