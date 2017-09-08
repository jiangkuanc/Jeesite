package com.dagongsoft.p2p.user.utils.entity;

public class EmailJsonVo extends JsonVo {

    @Override
    public String toString() {
        return "EmailJsonVo [id=" + id + ", message=" + message + ", status="
                + status + ", toString()=" + super.toString() + ", getId()="
                + getId() + ", getMessage()=" + getMessage() + ", getStatus()="
                + getStatus() + ", getClass()=" + getClass() + ", hashCode()="
                + hashCode() + "]";
    }

    private static final long serialVersionUID = 1L;

    public EmailJsonVo() {
        super();
    }

    public EmailJsonVo(String id, String message, int status) {
        super(id, message, status);
    }

}
