package com.dagongsoft.p2p.risk.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.risk.entity.P2pRiskPaper;

/**
 * 风险测评问卷表DAO接口
 *
 * @author Zeus
 * @version 2016-11-14
 */
@MyBatisDao
public interface P2pRiskPaperDao extends CrudDao<P2pRiskPaper> {

    public P2pRiskPaper getByUserId(String id);

    public void updateXg(P2pRiskPaper p2pRiskPaper);

    public void updatePaperState(P2pRiskPaper p2pRiskPaper);
}
