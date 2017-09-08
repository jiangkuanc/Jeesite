/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import java.util.Date;

/**
 * 融资申请材料Entity
 *
 * @author zhengshuo
 * @version 2016-07-18
 */
public class EnterpriseDataBase extends DataEntity<EnterpriseDataBase> {

    private static final long serialVersionUID = 1L;

    private String filePath;

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}