/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.document.dao;

import java.util.List;

import com.dagongsoft.p2p.document.entity.P2pRateDocumentTemplate;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 评级材料模板DAO接口
 *
 * @author qichao
 * @version 2016-09-27
 */
@MyBatisDao
public interface P2pRateDocumentTemplateDao extends CrudDao<P2pRateDocumentTemplate> {

    public String findNameById(String id);

    public P2pRateDocumentTemplate findByName(String name);

    public List<P2pRateDocumentTemplate> findAll();

    /**
     * 根据id查询tempName
     *
     * @param p2pRateDocumentTemplate
     * @return tempName
     * @author Chace
     */
    public String getTempNameById(P2pRateDocumentTemplate p2pRateDocumentTemplate);

    /**
     * 根据材料类型和行业查询材料模板
     *
     * @param p2pRateDocumentTemplate
     * @return
     * @author Quincy
     */
    public List<P2pRateDocumentTemplate> findListByTypeAndIndustry(P2pRateDocumentTemplate p2pRateDocumentTemplate);

    /**
     * 根据行业查询补充材料模板
     *
     * @param p2pRateDocumentTemplate
     * @return
     */
    public List<P2pRateDocumentTemplate> findSupplyListByIndustry(P2pRateDocumentTemplate p2pRateDocumentTemplate);

    /**
     * 根据项目Id查询补充材料对应行业
     *
     * @param financingInformationId
     * @return
     */
    public String findSupplyIndustryByProjectId(String projectBasicId);

    public String findEnterpriseShareholders(String industryNum, String tempName);

}