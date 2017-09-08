package com.dagongsoft.p2p.creditmanage.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.creditmanage.entity.CreditOverdueInfo;

/**
 * 信用记录维护DAO接口
 *
 * @author Zazh
 * @version 2017-02-20
 */
@MyBatisDao
public interface CreditOverdueInfoDao extends CrudDao<CreditOverdueInfo> {

    /**
     * 根据用户id查询逾期记录
     *
     * @author Chace
     */
    public List<CreditOverdueInfo> findByUserId(String userId);
}