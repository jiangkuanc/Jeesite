package com.dagongsoft.p2p.config.dao;

import java.util.List;

import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 行业分类DAO接口
 *
 * @author Quincy
 * @version 2016-11-23
 */
@MyBatisDao
public interface P2pIndustryclassiDao extends CrudDao<P2pIndustryclassi> {

    /**
     * 加载一级行业列表
     *
     * @return
     * @author Quincy
     */
    public List<P2pIndustryclassi> findTopCategory();

    /**
     * 加载二级行业列表
     *
     * @param industryNum
     * @return
     * @author Quincy
     */
    public List<P2pIndustryclassi> findSecondCategory(String industryNum);

    public P2pIndustryclassi getByIndustyNum(String industrynum);//industrynum

    public P2pIndustryclassi get(String industrynum);
}