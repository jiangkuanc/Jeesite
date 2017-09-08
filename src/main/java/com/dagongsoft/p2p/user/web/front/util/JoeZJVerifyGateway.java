package com.dagongsoft.p2p.user.web.front.util;

/**
 * 中金网关调用的实现
 *
 * @author Joe
 * @since 2-16-11-03
 */
public class JoeZJVerifyGateway implements ZJVerifyGateway {

    /**
     * 中金网关接口身份证和姓名验证实现
     */
    @Override
    public boolean verifyIdCardAndName(String idCard, String name) throws ZJException {
        Boolean zjRet = Boolean.FALSE;
        try {
            //需要中金接口的逻辑实现
            if (1 == 1) {
                zjRet = Boolean.TRUE;
                return zjRet;
            }
        } catch (Exception e) {
            return zjRet;
        }
        return zjRet;
    }

    @Override
    public boolean isCanConnecting(String zjUrl) throws ZJException {
        //默认返回true
        return Boolean.TRUE;
    }


}
