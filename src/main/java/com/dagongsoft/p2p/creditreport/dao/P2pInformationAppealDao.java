package com.dagongsoft.p2p.creditreport.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.creditreport.entity.P2pInformationAppeal;

/**
 * 企业信息申诉表DAO接口
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@MyBatisDao
public interface P2pInformationAppealDao extends CrudDao<P2pInformationAppeal> {

    //申诉初审列表
    public List<P2pInformationAppeal> getAppealFirstAuditList(P2pInformationAppeal p2pInformationAppeal);

    //申诉复审列表
    public List<P2pInformationAppeal> getAppealReviewAuditList(P2pInformationAppeal p2pInformationAppeal);

    //查询当前企业申诉记录
    public List<P2pInformationAppeal> ssList(String userId);

}