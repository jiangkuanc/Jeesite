package com.dagongsoft.p2p.user.web.front.register;

/**
 * 系统服务注册管理器
 *
 * @author Joe
 * @since 2016-11-03
 */
public class SystemConfigManager implements SystemConfig {

    private SystemConfigManager() {
    }

    static SystemConfigManager systemConfigManager = null;

    //单例设计模式
    public static SystemConfigManager getInstanceConfigManager() {
        if (systemConfigManager == null) {
            return new SystemConfigManager();
        } else {
            return systemConfigManager;
        }
    }

    @Override
    public boolean registService() {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public void initService(Integer sysId) {

    }


}
