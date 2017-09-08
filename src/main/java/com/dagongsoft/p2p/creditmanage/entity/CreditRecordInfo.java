package com.dagongsoft.p2p.creditmanage.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;

public class CreditRecordInfo extends DataEntity<CreditRecordInfo> {

    private static final long serialVersionUID = 1L;
    private User user;        // 企业账户ID
    private String recordNum;//信用记录条数

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRecordNum() {
        return recordNum;
    }

    public void setRecordNum(String recordNum) {
        this.recordNum = recordNum;
    }


}
