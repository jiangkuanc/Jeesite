/**
 *
 */
package com.dagongsoft.p2p.exception;

/**
 * 系统业务异常
 *
 * @author Zeus
 * @2017-2-9
 */
public class BusinessException extends RuntimeException {


    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String code;

    public BusinessException() {
        super();
    }

    public BusinessException(String message) {
        super(message);
    }

    public BusinessException(String code, String message) {
        super(message);
        this.code = code;
    }

    public BusinessException(Throwable cause) {
        super(cause);
    }

    public BusinessException(String message, Throwable cause) {
        super(message, cause);
    }

    public BusinessException(String code, String message, Throwable cause) {
        super(message, cause);
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
