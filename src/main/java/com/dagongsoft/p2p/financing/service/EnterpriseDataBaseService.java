package com.dagongsoft.p2p.financing.service;

import com.dagongsoft.p2p.financing.entity.P2pFinancingRatingInfo;
import com.dagongsoft.p2p.financing.entity.RateDataWriteTime;
import com.dagongsoft.p2p.financing.entity.RateEnterpriseFinancialData;
import com.dagongsoft.p2p.financing.entity.RateFinancialIndicator;

import java.util.List;
import java.util.Map;

/**
 * Created by xiashucheng on 2017/6/28.
 */
public interface EnterpriseDataBaseService {
    //通过项目编号和分类查询所有上传的图片
    public abstract Map<String, String[]> findEnterpriseDataBaseByProjectId(String projectId, String industryNum);

    //根据债项编号/评级项目编号查询该债项项目下企业的行业分析
    public abstract Map<String, Object> getIndustryAndAreaAnalysisByRateProjectId(
            String rateProjectId);

    public List<RateEnterpriseFinancialData> findFinancalTime(String projectId, String companyId);

    /**
     * @param projectId   项目编号
     * @param companyId   企业编号
     * @param indicatorId
     * @param view
     * @return
     */
    public List<RateFinancialIndicator> findIndicatorList(String projectId, String companyId, String indicatorId, String view);

    public List<RateFinancialIndicator> check(String method, List<RateFinancialIndicator> rateFinancialIndicator);

    public RateDataWriteTime findByProjectId(String projectId);

    //根据项目编号去查询操作系统选择
    public String getOperatingSystemSelection(String projectId);

    public String findP2pEnterpriseCertify(String id);

    public P2pFinancingRatingInfo findP2pFinancingRatingInfoByFinancingInformationId(String financingInformationId);

    public abstract Map<String, Object> getIndustryAreaAnalysisByProjectId(
            String rateProjectId);

    public String findP2pEnterpriseCertifyById(String id);
}
