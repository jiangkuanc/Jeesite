package com.dagongsoft.p2p.user.service.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.user.dao.P2pEnterpriseCertifyDao;
import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;

/**
 * 用户详情Service
 *
 * @author Quincy
 */
@Service
@Transactional(readOnly = true)
public class ViewUserDetailsService {

    @Autowired
    private P2pEnterpriseCertifyDao p2pEnterpriseCertifyDao;

    /**
     * 根据用户ID查询用户认证信息详情
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public P2pEnterpriseCertify findUserDetailsByUid(String userId) {
        return p2pEnterpriseCertifyDao.findUserDetailsByUid(userId);
    }
}
