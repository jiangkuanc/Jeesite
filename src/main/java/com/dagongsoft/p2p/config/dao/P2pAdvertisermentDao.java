package com.dagongsoft.p2p.config.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dagongsoft.p2p.config.entity.P2pAdvertiserment;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 广告DAO接口
 *
 * @author Chace
 * @version 2016-12-19
 */
@MyBatisDao
public interface P2pAdvertisermentDao extends CrudDao<P2pAdvertiserment> {
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
    public List<P2pAdvertiserment> takeTurn(@Param("size") Integer size);
}