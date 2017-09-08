package com.dagongsoft.p2p.config.service;

import java.util.List;


import com.dagongsoft.p2p.config.entity.P2pIndustryclassi;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 行业分类Service
 *
 * @author Quincy
 * @version 2016-11-23
 */
public interface P2pIndustryclassiService {

    public P2pIndustryclassi get(String id);

    public List<P2pIndustryclassi> findList(P2pIndustryclassi p2pIndustryclassi);

    public Page<P2pIndustryclassi> findPage(Page<P2pIndustryclassi> page, P2pIndustryclassi p2pIndustryclassi);

    public void save(P2pIndustryclassi p2pIndustryclassi);

    public void delete(P2pIndustryclassi p2pIndustryclassi);

    public P2pIndustryclassi getByIndustyNum(String industrynum);

    /**
     * 加载一级行业列表
     *
     * @return
     * @author Chace
     */
    public List<P2pIndustryclassi> findTopCategory();

}