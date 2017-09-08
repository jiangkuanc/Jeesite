package com.dagongsoft.p2p.user.web.front.util;

/**
 * 中金网关调用接口
 *
 * @author Joe
 * @since 2016-11-03
 */
public interface ZJVerifyGateway {

    /**
     * 验证身份证和姓名是否一致
     *
     * @param idCard
     * @param name
     * @return 网关调用一致则返回true, 否则其他返回false
     * @throws ZJException
     */
    public boolean verifyIdCardAndName(String idCard, String name) throws ZJException;

    /**
     * 中金网关是否连接成功
     *
     * @param zjUrl
     * @return 连接成功返回true, 否则返回false
     * @throws ZJException
     */
    public boolean isCanConnecting(String zjUrl) throws ZJException;

}
