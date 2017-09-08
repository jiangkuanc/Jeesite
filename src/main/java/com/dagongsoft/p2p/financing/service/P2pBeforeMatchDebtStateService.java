/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.financing.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.financing.dao.P2pBeforeMatchDebtStateDao;
import com.dagongsoft.p2p.financing.entity.P2pBeforeMatchDebtState;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 撮合前债项状态进展表Service
 *
 * @author zhengshuo
 * @version 2016-07-11
 */
@Service
@Transactional(readOnly = true)
public class P2pBeforeMatchDebtStateService extends CrudService<P2pBeforeMatchDebtStateDao, P2pBeforeMatchDebtState> {

    @Autowired
    private P2pBeforeMatchDebtStateDao p2pBeforeMatchDebtStateDao;

    public P2pBeforeMatchDebtState get(String id) {
        return super.get(id);
    }

    public List<P2pBeforeMatchDebtState> findList(P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        return super.findList(p2pBeforeMatchDebtState);
    }

    public Page<P2pBeforeMatchDebtState> findPage(Page<P2pBeforeMatchDebtState> page, P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        return super.findPage(page, p2pBeforeMatchDebtState);
    }

    @Transactional(readOnly = false)
    public void save(P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        super.save(p2pBeforeMatchDebtState);
    }

    @Transactional(readOnly = false)
    public void delete(P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        super.delete(p2pBeforeMatchDebtState);
    }

    public Page<P2pBeforeMatchDebtState> findListByFid(Page<P2pBeforeMatchDebtState> page, P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        p2pBeforeMatchDebtState.setPage(page);
        page.setList(p2pBeforeMatchDebtStateDao.findListByFid(p2pBeforeMatchDebtState));
        return page;
    }

    /**
     * 添加撮合前债项进展信息
     *
     * @param p2pBeforeMatchDebtState
     */
    @Transactional(readOnly = false)
    public void saveP2pBeforeMatchDebtState(P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        p2pBeforeMatchDebtStateDao.saveP2pBeforeMatchDebtState(p2pBeforeMatchDebtState);
    }

    public List<P2pBeforeMatchDebtState> getDebtReleaseRecord(P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        return p2pBeforeMatchDebtStateDao.getDebtReleaseRecord(p2pBeforeMatchDebtState);

    }

    /**
     * 根据融资信息id和融资状态查询单条记录
     *
     * @param fiId
     * @param state
     */
    public P2pBeforeMatchDebtState getRecordByFiIdAndState(String fiId, String stage) {
        return p2pBeforeMatchDebtStateDao.getRecordByFiIdAndState(fiId, stage);
    }

    public List<P2pBeforeMatchDebtState> findById(String finacingInformationId, String progressStage) {
        return p2pBeforeMatchDebtStateDao.findById(finacingInformationId, progressStage);
    }

    public List<P2pBeforeMatchDebtState> findById2(String finacingInformationId) {
        return p2pBeforeMatchDebtStateDao.findById2(finacingInformationId);
    }

    public List<P2pBeforeMatchDebtState> findById3(String finacingInformationId) {
        return p2pBeforeMatchDebtStateDao.findById3(finacingInformationId);
    }

    public P2pBeforeMatchDebtState findByIdOne(String finacingInformationId, String progressStage) {
        return p2pBeforeMatchDebtStateDao.findByIdOne(finacingInformationId, progressStage);
    }

    /**
     * 根据债项ID和债项状态查询轨迹信息
     *
     * @param
     * @return
     * @author Chace
     */
    public P2pBeforeMatchDebtState findByIds(P2pBeforeMatchDebtState p2pBeforeMatchDebtState) {
        return p2pBeforeMatchDebtStateDao.findByIds(p2pBeforeMatchDebtState);
    }
}