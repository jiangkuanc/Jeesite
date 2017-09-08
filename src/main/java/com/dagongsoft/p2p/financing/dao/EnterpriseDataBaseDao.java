package com.dagongsoft.p2p.financing.dao;

import com.dagongsoft.p2p.financing.entity.*;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 投资信息DAO接口
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@MyBatisDao
public interface EnterpriseDataBaseDao {

    public List<EnterpriseDataBase> findEnterpriseDataBaseByProjectId(@Param("projectId") String projectId, @Param("industryNum") String industryNum);

    public Map<String, Object> getIndustryAndAreaAnalysisByRateProjectId(
            String rateProjectId);

    public List<RateEnterpriseFinancialData> findFinancalTime(String projectId, String companyId);

    public List<RateFinancialIndicator> findIndicatorList(String projectId, String companyId, String indicatorId);

    public RateDataWriteTime findByProjectId(String projectId);

    //根据项目编号去查询操作系统选择
    public String getOperatingSystemSelection(String projectId);

    public String findP2pEnterpriseCertify(String userId);

    public P2pFinancingRatingInfo findP2pFinancingRatingInfoByFinancingInformationId(String financingInformationId);

    public Map<String, Object> getIndustryAreaAnalysisByProjectId(
            String rateProjectId);

    public String findP2pEnterpriseCertifyById(String id);
}
