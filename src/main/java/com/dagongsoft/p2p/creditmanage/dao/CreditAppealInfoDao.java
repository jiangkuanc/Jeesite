package com.dagongsoft.p2p.creditmanage.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.creditmanage.entity.CreditAppealInfo;

/**
 * 信用记录申诉管理DAO接口
 *
 * @author Zazh
 * @version 2017-02-20
 */
@MyBatisDao
public interface CreditAppealInfoDao extends CrudDao<CreditAppealInfo> {

    public void appealAudit(CreditAppealInfo creditAppealInfo);
}