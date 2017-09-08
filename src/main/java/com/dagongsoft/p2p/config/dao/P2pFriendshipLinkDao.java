package com.dagongsoft.p2p.config.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.config.entity.P2pFriendshipLink;

/**
 * 友情链接DAO接口
 *
 * @author Chace
 * @version 2016-12-23
 */
@MyBatisDao
public interface P2pFriendshipLinkDao extends CrudDao<P2pFriendshipLink> {

    /**
     * 友情链接发布
     *
     * @param p2pFriendshipLink
     * @author Chace
     */
    public void publishLink(P2pFriendshipLink p2pFriendshipLink);

    /**
     * 友情链接取消发布
     *
     * @param p2pFriendshipLink
     * @author Chace
     */
    public void stopLink(P2pFriendshipLink p2pFriendshipLink);

    /**
     * 查询已发布友情链接
     *
     * @param p2pFriendshipLink return p2pFriendshipLink
     * @author Chace
     */
    public List<P2pFriendshipLink> findPublish(P2pFriendshipLink p2pFriendshipLink, @Param("size") Integer size);
}