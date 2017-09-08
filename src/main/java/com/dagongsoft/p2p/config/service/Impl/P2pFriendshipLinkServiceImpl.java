package com.dagongsoft.p2p.config.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.config.entity.P2pFriendshipLink;
import com.dagongsoft.p2p.config.dao.P2pFriendshipLinkDao;
import com.dagongsoft.p2p.config.service.P2pFriendshipLinkService;
import com.dagongsoft.p2p.utils.UploadFileUtils;

/**
 * 友情链接ServiceImpl
 *
 * @author Chace
 * @version 2016-12-23
 */
@Transactional(readOnly = true)
@Service("p2pFriendshipLinkService")
public class P2pFriendshipLinkServiceImpl extends CrudService<P2pFriendshipLinkDao, P2pFriendshipLink> implements P2pFriendshipLinkService {

    @Resource
    private P2pFriendshipLinkDao p2pFriendshipLinkDao;

    public P2pFriendshipLink get(String id) {
        return super.get(id);
    }

    public List<P2pFriendshipLink> findList(P2pFriendshipLink p2pFriendshipLink) {
        return super.findList(p2pFriendshipLink);
    }

    public Page<P2pFriendshipLink> findPage(Page<P2pFriendshipLink> page, P2pFriendshipLink p2pFriendshipLink) {
//		p2pFriendshipLink.setLinkIcon(UploadFileUtils.viewUrl(p2pFriendshipLink.getLinkIcon()));
        return super.findPage(page, p2pFriendshipLink);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pFriendshipLink p2pFriendshipLink) {
        super.save(p2pFriendshipLink);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pFriendshipLink p2pFriendshipLink) {
        super.delete(p2pFriendshipLink);
    }

    /**
     * 友情链接发布
     *
     * @param p2pFriendshipLink
     * @author Chace
     */
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void publishLink(P2pFriendshipLink p2pFriendshipLink) {
        p2pFriendshipLinkDao.publishLink(p2pFriendshipLink);
    }

    /**
     * 友情链接取消发布
     *
     * @param p2pFriendshipLink
     * @author Chace
     */
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void stopLink(P2pFriendshipLink p2pFriendshipLink) {
        p2pFriendshipLinkDao.stopLink(p2pFriendshipLink);
    }

    /**
     * 查询已发布友情链接
     *
     * @param p2pFriendshipLink return p2pFriendshipLink
     * @author Chace
     */
    public List<P2pFriendshipLink> findPublish(P2pFriendshipLink p2pFriendshipLink, Integer size) {
        return p2pFriendshipLinkDao.findPublish(p2pFriendshipLink, size);
    }
}