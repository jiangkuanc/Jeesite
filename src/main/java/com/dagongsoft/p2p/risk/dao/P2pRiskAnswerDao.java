package com.dagongsoft.p2p.risk.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.risk.entity.P2pRiskAnswer;

/**
 * 风险测评答案表DAO接口
 *
 * @author Zeus
 * @version 2016-11-14
 */
@MyBatisDao
public interface P2pRiskAnswerDao extends CrudDao<P2pRiskAnswer> {

    public List<P2pRiskAnswer> getRiskQuestionId(String id);

}