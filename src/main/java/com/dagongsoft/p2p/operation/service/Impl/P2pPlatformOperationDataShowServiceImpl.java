package com.dagongsoft.p2p.operation.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import org.springframework.transaction.annotation.Transactional;
import com.dagongsoft.p2p.operation.entity.P2pPlatformOperationDataShow;
import com.dagongsoft.p2p.operation.dao.P2pPlatformOperationDataShowDao;
import com.dagongsoft.p2p.operation.service.P2pPlatformOperationDataShowService;

/**
 * 平台运营数据披露表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-25
 */
@Transactional(readOnly = true)
@Service("p2pPlatformOperationDataShowService")
public class P2pPlatformOperationDataShowServiceImpl extends CrudService<P2pPlatformOperationDataShowDao, P2pPlatformOperationDataShow> implements P2pPlatformOperationDataShowService {

    @Resource
    private P2pPlatformOperationDataShowDao p2pPlatformOperationDataShowDao;

    public P2pPlatformOperationDataShow get(String id) {
        return super.get(id);
    }

    public List<P2pPlatformOperationDataShow> findList(P2pPlatformOperationDataShow p2pPlatformOperationDataShow) {
        return super.findList(p2pPlatformOperationDataShow);
    }

    public Page<P2pPlatformOperationDataShow> findPage(Page<P2pPlatformOperationDataShow> page, P2pPlatformOperationDataShow p2pPlatformOperationDataShow) {
        return super.findPage(page, p2pPlatformOperationDataShow);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pPlatformOperationDataShow p2pPlatformOperationDataShow) {
        super.save(p2pPlatformOperationDataShow);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pPlatformOperationDataShow p2pPlatformOperationDataShow) {
        super.delete(p2pPlatformOperationDataShow);
    }

    /**
     * 获取运营数据披露信息
     *
     * @return p2pPlatformOperationDataShow
     * @author Chace
     */
    public P2pPlatformOperationDataShow findData(P2pPlatformOperationDataShow p2pPlatformOperationDataShow) {
        return p2pPlatformOperationDataShowDao.findData(p2pPlatformOperationDataShow);
    }

}