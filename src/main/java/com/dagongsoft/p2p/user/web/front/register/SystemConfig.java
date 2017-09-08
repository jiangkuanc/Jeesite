package com.dagongsoft.p2p.user.web.front.register;

import com.dagongsoft.p2p.user.dao.P2pUserInformationDao;
import com.dagongsoft.p2p.user.entity.P2pUserInformation;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 系统服务注册器服务接口
 *
 * @author Joe
 * @since 2016-11-03
 */
public interface SystemConfig {

    /**
     * @return
     */
    public boolean registService();

    /**
     * 初始化系统服务
     */
    public void initService(Integer sysId);
}
