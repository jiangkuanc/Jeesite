package com.dagongsoft.p2p.utils;

public class ExpParseException extends BusinessException {
    public ExpParseException(String msg) {
        super(msg);
    }

    public ExpParseException(Throwable cause) {
        super(cause);
    }

    public ExpParseException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public ExpParseException() {
        super();
    }
}
