package com.dagongsoft.webSiteService;

import javax.jws.WebService;

@WebService
public interface WebSiteService {
    /**
     * @param key  (钥匙)
     * @param sign (数字签名)
     * @param data (数据)
     * @return
     * @author xsc
     */
    public String synchronization(String key, String sign, String data);
}
