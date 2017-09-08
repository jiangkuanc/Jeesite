package com.dagongsoft.p2p.user.web.front.util;


/**
 * Session中具体常量的设置
 *
 * @author Joe
 */
public enum SessionConstEnum implements BaseSessionEnum {
    /**
     * 用户的session
     */
    PEOPLE_SESSION("people_session"),

    /**
     * 用户取回密码的session
     */
    PEOPLE_GET_PASSWORD_SESSION("people_get_password_session"),

    /**
     * 用户验证手机号、用名称、邮箱的session
     */
    PEOPLE_EXISTS_SESSION("people_exists_session"),


    /**
     * 重置密码session
     */
    PEOPLE_RESET_PASSWORD_SESSION("people_reset_password_session"),

    /**
     * 用户更改手机号码的session
     */
    PEOPEL_SET_PHONE_SESSION("people_set_phone_seesion"),

    /**
     * 用户发送验证码
     */
    SEND_CODE_SESSION("send_code_seesion");

    /**
     * 设置session常量
     *
     * @param attr 常量
     */
    SessionConstEnum(String attr) {
        this.attr = attr;
    }

    private String attr;

    /**
     * 返回SessionConst常量的字符串表示
     *
     * @return 字符串
     */
    @Override
    public String toString() {
        return attr;
    }

}