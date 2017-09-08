package com.dagongsoft.p2p.user.web.front.util;

import java.io.Serializable;

/**
 * 中金返回数据包装
 *
 * @author Joe
 * @since 2016-11-03
 */
public class ZJRetData implements Serializable {

    public long getZjRetId() {
        return zjRetId;
    }

    public void setZjRetId(long zjRetId) {
        this.zjRetId = zjRetId;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private static final long serialVersionUID = -575773234067446485L;
    private long zjRetId;//id
    private String idCard;//身份证号
    private String name;//姓名

}
