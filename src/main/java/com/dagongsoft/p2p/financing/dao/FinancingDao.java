package com.dagongsoft.p2p.financing.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dagongsoft.p2p.financing.entity.P2pFinancingInformation;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 投资信息DAO接口
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@MyBatisDao
public interface FinancingDao {

    public List<P2pEnterpriseCertify> findDocumentAuditList(P2pEnterpriseCertify p2pEnterpriseCertify);

    public List<P2pFinancingInformation> fupingDebtList(P2pFinancingInformation p2pFinancingInformation);

    public List<P2pEnterpriseCertify> findDocumentAuditList2();

    public P2pEnterpriseCertify getEnterpriseBaseInfo(String userId);

    public List<P2pFinancingInformation> findDebtReleaseList(P2pFinancingInformation p2pFinancingInformation);

    public List<P2pFinancingInformation> findMiddleMatchList(P2pFinancingInformation p2pFinancingInformation);

    public P2pFinancingInformation getMiddleMatchForm(String id);

    public List<P2pFinancingInformation> findAfterMatchList(P2pFinancingInformation p2pFinancingInformation);

    public Date getDebtStageTime(@Param("fiId") String fiId, @Param("stage") String stage);

    public String getEnterpriseNature(String userId);
}
