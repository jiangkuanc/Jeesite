package com.dagongsoft.p2p.config.service;

import java.util.List;

import com.dagongsoft.p2p.config.entity.P2pAdvertiserment;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 广告Service
 *
 * @author Chace
 * @version 2016-12-19
 */
public interface P2pAdvertisermentService {

    public P2pAdvertiserment get(String id);

    public List<P2pAdvertiserment> findList(P2pAdvertiserment p2pAdvertiserment);

    public Page<P2pAdvertiserment> findPage(Page<P2pAdvertiserment> page, P2pAdvertiserment p2pAdvertiserment);

    public void save(P2pAdvertiserment p2pAdvertiserment);

    public void delete(P2pAdvertiserment p2pAdvertiserment);

    /**
     * 查询不同位置的广告
     *
     * @param p2pAdvertiserment
     * @return p2pAdvertiserment
     * @author Chace
     */
    public List<P2pAdvertiserment> findByType(P2pAdvertiserment p2pAdvertiserment);

    /**
     * 查询不同位置广告启用条数
     *
     * @param p2pAdvertiserment
     * @author Chace
     */
    public int getCount(P2pAdvertiserment p2pAdvertiserment);

    /**
     * 修改广告启用状态
     *
     * @param p2pAdvertiserment
     * @author Chace
     */
    public void changeStage(P2pAdvertiserment p2pAdvertiserment);

    /**
     * 停用左/右广告
     *
     * @author Chace
     */
    public void stopLeftOrRight(P2pAdvertiserment p2pAdvertiserment);

    //返回size个轮播图
    public List<P2pAdvertiserment> takeTurn(Integer size);
}