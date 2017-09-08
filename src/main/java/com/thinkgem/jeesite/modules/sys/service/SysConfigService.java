package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import com.thinkgem.jeesite.modules.sys.entity.SysConfig;

/**
 * 系统配置信息Service
 *
 * @author Summer
 * @version 2016-12-05
 */
public interface SysConfigService {

    public SysConfig get(String id);

    public void save(SysConfig sysConfig);

    //根据系统编号，查询所有符合条件的配置集合
    public List getListBySysId(String sysId);

    //根据系统编号和K，查询所有符合条件的配置值
    public String getValueBySysIdAndKey(String sysId, String key);


}