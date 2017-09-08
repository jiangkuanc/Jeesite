package com.dagongsoft.p2p.risk.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.risk.entity.P2pRiskQuestion;

/**
 * 风险测评问题表DAO接口
 *
 * @author Zeus
 * @version 2016-11-14
 */
@MyBatisDao
public interface P2pRiskQuestionDao extends CrudDao<P2pRiskQuestion> {

    public List<P2pRiskQuestion> getPaperId(String id);
}