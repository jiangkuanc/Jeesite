package com.dagongsoft.p2p.user.web.front.interceptor;

/**
 * 实名认证过程中发送的异常
 *
 * @author DAGONG
 */
public class AuthException extends Exception {

    private static final long serialVersionUID = -8863654345887821692L;

    public AuthException() {
    }

    public AuthException(String message) {
        super(message);
    }

}
