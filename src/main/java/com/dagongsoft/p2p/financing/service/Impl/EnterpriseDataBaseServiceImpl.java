package com.dagongsoft.p2p.financing.service.Impl;

import com.dagongsoft.p2p.financing.dao.EnterpriseDataBaseDao;
import com.dagongsoft.p2p.financing.dao.P2pDebtorOverdueRecordDao;
import com.dagongsoft.p2p.financing.entity.*;
import com.dagongsoft.p2p.financing.service.EnterpriseDataBaseService;
import com.dagongsoft.p2p.financing.service.P2pDebtorOverdueRecordService;
import com.dagongsoft.p2p.utils.FormulaUtil;
import com.dagongsoft.p2p.utils.UploadFileUtils;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 债务人逾期记录表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-11
 */
@Transactional(readOnly = true)
@Service("enterpriseDataBaseService")
public class EnterpriseDataBaseServiceImpl extends CrudService<P2pDebtorOverdueRecordDao, P2pDebtorOverdueRecord> implements EnterpriseDataBaseService {

    @Resource
    private EnterpriseDataBaseDao enterpriseDataBaseDao;


    @Transactional(readOnly = false, rollbackFor = Exception.class)
    @Override
    public Map<String, String[]> findEnterpriseDataBaseByProjectId(String projectId, String industryNum) {
        List<EnterpriseDataBase> list = enterpriseDataBaseDao.findEnterpriseDataBaseByProjectId(projectId, industryNum);
        Map<String, String[]> m = new ConcurrentHashMap(16);
        for (EnterpriseDataBase e : list) {
            if (e.getFilePath() != null) {
                String filePath[] = e.getFilePath().split(",");
                for (int i = 0; i < filePath.length; i++) {
                    filePath[i] = UploadFileUtils.viewUrl(filePath[i]);
                }
                m.put(e.getId(), filePath);
            } else {
                m.put(e.getId(), new String[0]);
            }
        }
        return m;
    }


    //根据债项编号/评级项目编号查询该债项项目下企业的行业分析和区域分析
    public Map<String, Object> getIndustryAndAreaAnalysisByRateProjectId(
            String rateProjectId) {
        return enterpriseDataBaseDao.getIndustryAndAreaAnalysisByRateProjectId(rateProjectId);
    }

    @Override
    public List<RateEnterpriseFinancialData> findFinancalTime(String projectId, String companyId) {
        return enterpriseDataBaseDao.findFinancalTime(projectId, companyId);
    }

    @Override
    public List<RateFinancialIndicator> findIndicatorList(String projectId, String companyId, String num, String view) {
        List<RateFinancialIndicator> l = enterpriseDataBaseDao.findIndicatorList(projectId, companyId, num);
        DecimalFormat df = new DecimalFormat(",###,##0.00"); //保留一位小数
        if ("yes".equals(view)) {
            for (int i = 0; i < l.size(); i++) {
                l.get(i).setFirstYearValue(l.get(i).getFirstYearValue() == null ? null : df.format(new BigDecimal(l.get(i).getFirstYearValue())));
                l.get(i).setSecondYearValue(l.get(i).getSecondYearValue() == null ? null : df.format(new BigDecimal(l.get(i).getSecondYearValue())));
                l.get(i).setThirdYearValue(l.get(i).getThirdYearValue() == null ? null : df.format(new BigDecimal(l.get(i).getThirdYearValue())));
                l.get(i).setLastYearValue(l.get(i).getLastYearValue() == null ? null : df.format(new BigDecimal(l.get(i).getLastYearValue())));
                l.get(i).setPeriodValue(l.get(i).getPeriodValue() == null ? null : df.format(new BigDecimal(l.get(i).getPeriodValue())));
            }
        } else {
            for (int i = 0; i < l.size(); i++) {
                l.get(i).setFirstYearValue(l.get(i).getFirstYearValue());
                l.get(i).setSecondYearValue(l.get(i).getSecondYearValue());
                l.get(i).setThirdYearValue(l.get(i).getThirdYearValue());
                l.get(i).setLastYearValue(l.get(i).getLastYearValue());
                l.get(i).setPeriodValue(l.get(i).getPeriodValue());
            }
        }

        return l;
    }

    @Override
    public List<RateFinancialIndicator> check(String method, List<RateFinancialIndicator> rateFinancialIndicator) {
        if (!"".equals(method) && method != null) {
            Map<String, Object> map0 = new HashMap<String, Object>();//期
            Map<String, Object> map1 = new HashMap<String, Object>();//第一年
            Map<String, Object> map2 = new HashMap<String, Object>();//第二年
            Map<String, Object> map3 = new HashMap<String, Object>();//第三年
            Map<String, Object> map4 = new HashMap<String, Object>();//第四年
            List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
            List<Map<String, Object>> mapList2 = new ArrayList<Map<String, Object>>();
            List<RateFinancialIndicator> list2 = new ArrayList<RateFinancialIndicator>();
            for (int i = 0; i < rateFinancialIndicator.size(); i++) {
                map0.put(rateFinancialIndicator.get(i).getFinancialIndicatorId(), rateFinancialIndicator.get(i).getPeriodValue());
                map1.put(rateFinancialIndicator.get(i).getFinancialIndicatorId(), rateFinancialIndicator.get(i).getFirstYearValue());
                map2.put(rateFinancialIndicator.get(i).getFinancialIndicatorId(), rateFinancialIndicator.get(i).getSecondYearValue());
                map3.put(rateFinancialIndicator.get(i).getFinancialIndicatorId(), rateFinancialIndicator.get(i).getThirdYearValue());
                map4.put(rateFinancialIndicator.get(i).getFinancialIndicatorId(), rateFinancialIndicator.get(i).getLastYearValue());
                if (rateFinancialIndicator.get(i).getFinancialIndicatorId().contains("CHE") && "tableCheck".equals(method)) {//是表间检查指标
                    list2.add(rateFinancialIndicator.get(i));
                }
//				else if(rateFinancialIndicator.get(i).getFinancialIndicatorId().contains("CRO")&&"tableCheck".equals(method)){//表内勾稽
//					list2.add(rateFinancialIndicator.get(i));
//				}
            }
            mapList.add(map0);
            mapList.add(map1);
            mapList.add(map2);
            mapList.add(map3);
            mapList.add(map4);
            rateFinancialIndicator = list2;
            if ("tableCheck".equals(method)) {//检查指标
                //有两年的   将4个map 存成3个并放入集合中
                Map<String, Object> map5 = changeMap(map0, map1);//map0 +Y map1 +L 一组
                Map<String, Object> map6 = changeMap(map1, map2);//map1 +Y map2 +L 一组
                Map<String, Object> map7 = changeMap(map2, map3);//map2 +Y map3 +L 一组
                Map<String, Object> map8 = changeMap(map3, map4);
                mapList2.add(map5);
                mapList2.add(map6);
                mapList2.add(map7);
                mapList2.add(map8);
            }

            for (int i = 0; i < rateFinancialIndicator.size(); i++) {
                String[] check = {"wrong", "wrong", "wrong", "wrong", "wrong"};
                if (!"".equals(rateFinancialIndicator.get(i).getFormula()) && rateFinancialIndicator.get(i).getFormula() != null) {
                    if (rateFinancialIndicator.get(i).getFormula().contains("L_") && rateFinancialIndicator.get(i).getFormula().contains("Y_")) {//公式跨年需要处理
                        compareMethod(mapList2, method, rateFinancialIndicator, i, check);
                    } else {
                        compareMethod(mapList, method, rateFinancialIndicator, i, check);
                    }
                    rateFinancialIndicator.get(i).setResult(check);
                }
            }
        }
        return rateFinancialIndicator;
    }

    @Override
    public RateDataWriteTime findByProjectId(String projectId) {
        return enterpriseDataBaseDao.findByProjectId(projectId);
    }

    @Override
    public String getOperatingSystemSelection(String projectId) {
        return enterpriseDataBaseDao.getOperatingSystemSelection(projectId);
    }

    @Override
    public String findP2pEnterpriseCertify(String id) {
        return enterpriseDataBaseDao.findP2pEnterpriseCertify(id);
    }

    @Override
    public P2pFinancingRatingInfo findP2pFinancingRatingInfoByFinancingInformationId(String financingInformationId) {
        return enterpriseDataBaseDao.findP2pFinancingRatingInfoByFinancingInformationId(financingInformationId);
    }

    private Map<String, Object> changeMap(Map<String, Object> map1, Map<String, Object> map2) {
        Map<String, Object> map = new HashMap<String, Object>();
        //遍历map1 key + Y_
        Set<Map.Entry<String, Object>> set = map1.entrySet();
        Iterator<Map.Entry<String, Object>> iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, Object> e = iterator.next();
            String newKey = "Y_" + e.getKey();
            map.put(newKey, e.getValue());
        }
        //遍历map2 key + L_
        set = map2.entrySet();
        iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, Object> e = iterator.next();
            String newKey = "L_" + e.getKey();
            map.put(newKey, e.getValue());
        }
        return map;
    }


    private String[] compareMethod(List<Map<String, Object>> mapList, String method, List<RateFinancialIndicator> rateFinancialIndicator, int i, String[] check) {
        Double d = null;
        for (int j = 0; j < mapList.size(); j++) {
            try {
                //指标编号带Y是年带L是上一年
                d = FormulaUtil.assay_IncloudZero(mapList.get(j), rateFinancialIndicator.get(i).getFormula());
                if (d == 0.0) {//表间检验
                    check[j] = "right";
                }
                DecimalFormat decimalFormat = new DecimalFormat("#,###.##");//格式化设置
                check[j] = check[j] + ":" + decimalFormat.format(d);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return check;
    }


    //根据根据债项编号/评级项目编号查询该项目的行业分析和区域分析数据
    public Map<String, Object> getIndustryAreaAnalysisByProjectId(
            String rateProjectId) {
        return enterpriseDataBaseDao.getIndustryAreaAnalysisByProjectId(rateProjectId);
    }

    @Override
    public String findP2pEnterpriseCertifyById(String id) {
        return UploadFileUtils.viewUrl(enterpriseDataBaseDao.findP2pEnterpriseCertifyById(id));
    }
}