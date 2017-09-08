package com.dagongsoft.p2p.creditreport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.creditreport.entity.P2pInformationAppeal;
import com.dagongsoft.p2p.creditreport.dao.P2pInformationAppealDao;


/**
 * 企业信息申诉表ServiceImpl
 *
 * @author wangbingqi
 * @version 2016-11-07
 */
@Service
@Transactional(readOnly = true)
@Lazy(false)
public class P2pInformationAppealService extends CrudService<P2pInformationAppealDao, P2pInformationAppeal> {
    @Autowired
    private P2pInformationAppealDao p2pInformationAppealDao;

    public P2pInformationAppeal get(String id) {
        return super.get(id);
    }

    public List<P2pInformationAppeal> findList(P2pInformationAppeal p2pInformationAppeal) {
        return super.findList(p2pInformationAppeal);
    }

    public Page<P2pInformationAppeal> findPage(Page<P2pInformationAppeal> page, P2pInformationAppeal p2pInformationAppeal) {
        return super.findPage(page, p2pInformationAppeal);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pInformationAppeal p2pInformationAppeal) {
        super.save(p2pInformationAppeal);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pInformationAppeal p2pInformationAppeal) {
        super.delete(p2pInformationAppeal);
    }

    //查询当前企业申诉记录
    public List<P2pInformationAppeal> ssList(String userId) {
        List<P2pInformationAppeal> ssList = p2pInformationAppealDao.ssList(userId);
        return ssList;
    }

}