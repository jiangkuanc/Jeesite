package com.dagongsoft.p2p.user.web.front.util;

/**
 * XSS运行时异常
 *
 * @author Joe
 */
public class XSSException extends RuntimeException {

    @Override
    public String toString() {
        return "XSSException [message=" + message + "]";
    }

    private static final long serialVersionUID = 1027575018371234139L;
    private String message;

    public XSSException() {
        super();
    }

    public XSSException(String message) {
        super(message);
    }


}
