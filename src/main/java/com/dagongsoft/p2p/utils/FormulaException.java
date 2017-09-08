package com.dagongsoft.p2p.utils;

public class FormulaException extends BusinessException {
    public FormulaException(String msg) {
        super(msg);
    }

    public FormulaException(Throwable cause) {
        super(cause);
    }

    public FormulaException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public FormulaException() {
        super();
    }
}
