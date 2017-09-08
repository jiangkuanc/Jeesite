package com.dagongsoft.tbar.back.investandfinancing.service;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public interface InvestmentService {
    /**
     * @param key  (钥匙)
     * @param sign (数字签名)
     * @param data (数据)
     * @return
     * @author xsc
     */
    public String synchronization(String key, String sign, String data);

    /**
     * @param userId (用户id)
     * @return
     * @author xsc
     * @see 如果用户的relationId字段不为空的话直接跳转到丝路互金网否则弹出投融资页面
     */
    public String checkUserRelation(String userId);

    /**
     * @param bodyType (主体类型)
     * @param mobile   (电话)
     * @param userId   (用户id)
     * @param password (用户密码)
     * @return
     */
    public String jumpPage(String bodyType, String mobile, String userId, String password);

}
