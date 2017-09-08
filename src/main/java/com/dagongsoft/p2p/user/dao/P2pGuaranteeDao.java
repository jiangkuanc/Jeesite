package com.dagongsoft.p2p.user.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.user.entity.P2pGuarantee;

/**
 * 担保公司表DAO接口
 *
 * @author Sora
 * @version 2016-11-15
 */
@MyBatisDao
public interface P2pGuaranteeDao extends CrudDao<P2pGuarantee> {

    /**
     * 加载担保公司列表
     *
     * @return
     * @author Quincy
     */
    public List<P2pGuarantee> loadAllList();
}