package com.dagongsoft.p2p.utils;

/**
 * 业务异常不记日志
 *
 * @author MJ
 */
public class BusinessException extends RuntimeException {
    public BusinessException(String msg) {
        super(msg);//业务异常
    }

    public BusinessException(Throwable cause) {
        super(cause);
    }

    public BusinessException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public BusinessException() {
        super();
    }
}
