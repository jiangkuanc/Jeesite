package com.dagongsoft.p2p.user.utils.consts;

public final class EmailConsts {

    /**
     * codeVaid  :  0 :	服务端异常
     * codeValid :  1 :  通过
     * codeValid： 2：验证失效
     * codeValid： 3：验证失败
     * codeValid	:  4 :  验证失败,验证码未超时
     */
    public static final int server_error = 0;

    public static final int valid_pass = 1;

    public static final int valid_timeout = 2;

    public static final int valid_unpass = 3;

    public static final int valid_unpass_untimeout = 4;

    public static final String valid_server_error_message = "服务端异常";

    public static final String valid_pass_message = "邮箱验证通过";

    public static final String valid_unpass_message = "邮箱验证未通过";

    public static final String valid_unpass_timeout_message = "邮箱验证超时";

    public static final String valid_unpass_untimeout_message = "邮箱验证未通过,验证码未超时";


}
