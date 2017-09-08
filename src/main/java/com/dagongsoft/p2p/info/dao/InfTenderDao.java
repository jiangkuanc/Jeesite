/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.info.dao;

import java.util.List;

import com.dagongsoft.p2p.info.entity.InfTender;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 用户招商DAO接口
 *
 * @author dagong
 * @version 2016-09-23
 */
@MyBatisDao
public interface InfTenderDao extends CrudDao<InfTender> {
    public List<InfTender> findTenderinfoList(InfTender infTender);

    public void updateInfoStage(InfTender infTender);

}