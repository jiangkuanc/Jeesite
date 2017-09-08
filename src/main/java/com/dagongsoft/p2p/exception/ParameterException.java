/**
 * @(#)ParameterException.java 2011-12-20 Copyright 2011 it.kedacom.com, Inc.
 * All rights reserved.
 */

package com.dagongsoft.p2p.exception;

/**
 * 参数异常
 *
 * @author Zeus
 * @2017-2-9
 */
public class ParameterException extends RuntimeException {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    public ParameterException() {
        super();
    }

    public ParameterException(String message) {
        super(message);
    }

    public ParameterException(Throwable cause) {
        super(cause);
    }

    public ParameterException(String message, Throwable cause) {
        super(message, cause);
    }
}
