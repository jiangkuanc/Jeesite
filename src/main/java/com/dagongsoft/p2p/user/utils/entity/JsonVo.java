package com.dagongsoft.p2p.user.utils.entity;

import java.io.Serializable;

/**
 * Json传输对象抽象类
 *
 * @author DAGONG
 */
public abstract class JsonVo implements Serializable {

    @Override
    public String toString() {
        return "JsonVo [id=" + id + ", message=" + message + ", status="
                + status + "]";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public JsonVo() {
        super();
    }

    public JsonVo(String id, String message, int status) {
        super();
        this.id = id;
        this.message = message;
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    private static final long serialVersionUID = -9049344034680567877L;

    protected String id;
    protected String message;
    protected int status;
}
