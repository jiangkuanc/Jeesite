package com.dagongsoft.p2p.user.service.front;

import java.util.List;

import com.dagongsoft.p2p.user.entity.P2pAccount;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 账户表Service
 *
 * @author Joe
 * @version 2016-11-07
 */
public interface P2pAccountService {

    /**
     * 根据id查询一条P2pAccount记录
     *
     * @param id
     * @return P2pAccount
     */
    public P2pAccount get(String id);

    /**
     * 查询数据库所有的P2pAccount记录
     *
     * @param p2pAccount
     * @return 所有P2pAccount记录
     */
    public List<P2pAccount> findList(P2pAccount p2pAccount);

    /**
     * 分页查询P2pAccount记录
     *
     * @param page
     * @param p2pAccount
     * @return
     */
    public Page<P2pAccount> findPage(Page<P2pAccount> page, P2pAccount p2pAccount);

    /**
     * 保存一条P2pAccount记录
     *
     * @param p2pAccount
     */
    public void save(P2pAccount p2pAccount);

    /**
     * 删除一条P2pAccount记录
     *
     * @param p2pAccount
     */
    public void delete(P2pAccount p2pAccount);

}