package com.dagongsoft.p2p.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.user.dao.P2pAssetValuationDao;
import com.dagongsoft.p2p.user.entity.P2pAssetValuation;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 资产评估表ServiceImpl
 *
 * @author Sora
 * @version 2016-11-15
 */
@Transactional(readOnly = true)
@Service("p2pAssetValuationService")
public class P2pAssetValuationService extends CrudService<P2pAssetValuationDao, P2pAssetValuation> {

    @Autowired
    private P2pAssetValuationDao p2pAssetValuationDao;

    public P2pAssetValuation get(String id) {
        return super.get(id);
    }

    public List<P2pAssetValuation> findList(P2pAssetValuation p2pAssetValuation) {
        return super.findList(p2pAssetValuation);
    }

    public Page<P2pAssetValuation> findPage(Page<P2pAssetValuation> page, P2pAssetValuation p2pAssetValuation) {
        return super.findPage(page, p2pAssetValuation);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pAssetValuation p2pAssetValuation) {
        super.save(p2pAssetValuation);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pAssetValuation p2pAssetValuation) {
        super.delete(p2pAssetValuation);
    }

    /**
     * 加载资产评估公司列表
     *
     * @return
     * @author Quincy
     */
    public List<P2pAssetValuation> loadAllList() {
        return p2pAssetValuationDao.loadAllList();
    }
}