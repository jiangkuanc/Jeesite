package com.dagongsoft.p2p.config.service;

import java.util.List;


import com.dagongsoft.p2p.config.entity.P2pFriendshipLink;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 友情链接Service
 *
 * @author Chace
 * @version 2016-12-23
 */
public interface P2pFriendshipLinkService {

    public P2pFriendshipLink get(String id);

    public List<P2pFriendshipLink> findList(P2pFriendshipLink p2pFriendshipLink);

    public Page<P2pFriendshipLink> findPage(Page<P2pFriendshipLink> page, P2pFriendshipLink p2pFriendshipLink);

    public void save(P2pFriendshipLink p2pFriendshipLink);

    public void delete(P2pFriendshipLink p2pFriendshipLink);

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
    public List<P2pFriendshipLink> findPublish(P2pFriendshipLink p2pFriendshipLink, Integer size);
}