package com.dagongsoft.p2p.utils;

public enum StaticUtils {
    YES(1, "是"),
    NO(0, "否");

    int status;
    String descs;

    private StaticUtils(int status, String descs) {
        this.status = status;
        this.descs = descs;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


}
