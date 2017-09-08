package com.dagongsoft.p2p.user.utils.test;

import java.io.Serializable;
import java.util.Date;

/**
 * 对发送邮箱验证码和时间的封装类
 *
 * @author DAGONG
 */
public class MailCodeATime implements Serializable {

    private static final long serialVersionUID = 6819811308852757119L;
    private String code;
    private Date date;

    public String getCode() {
        return code;
    }

    public MailCodeATime() {
        super();
    }

    public MailCodeATime(String code, Date date) {
        super();
        this.code = code;
        this.date = date;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "MailCodeATime [code=" + code + ", date=" + date + "]";
    }
}
