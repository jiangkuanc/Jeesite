package com.dagongsoft.p2p.config.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dagongsoft.p2p.config.dao.P2pAgreementDao;
import com.dagongsoft.p2p.config.entity.P2pAgreement;
import com.dagongsoft.p2p.config.service.P2pAgreementService;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;

/**
 * 协议表ServiceImpl
 *
 * @author Zeus
 * @version 2016-11-21
 */
@Transactional(readOnly = true)
@Service("p2pAgreementService")
public class P2pAgreementServiceImpl extends CrudService<P2pAgreementDao, P2pAgreement> implements P2pAgreementService {

    @Resource
    private P2pAgreementDao p2pAgreementDao;

    public P2pAgreement get(String id) {
        return super.get(id);
    }

    public List<P2pAgreement> findList(P2pAgreement p2pAgreement) {
        return super.findList(p2pAgreement);
    }

    public Page<P2pAgreement> findPage(Page<P2pAgreement> page, P2pAgreement p2pAgreement) {
        return super.findPage(page, p2pAgreement);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void save(P2pAgreement p2pAgreement) {
        super.save(p2pAgreement);
    }

    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete(P2pAgreement p2pAgreement) {
        super.delete(p2pAgreement);
    }

    @Transactional(readOnly = false)
    public void deleteAgreement() {
        p2pAgreementDao.deleteAgreement();
    }

    public P2pAgreement getAgreement(P2pAgreement p2pAgreement) {
        return p2pAgreementDao.getAgreement(p2pAgreement);
    }

    /**
     * 查找是否有相同类型协议已经启用
     *
     * @param agreementType
     * @return
     * @author Zeus
     */
    @Override
    @Transactional(readOnly = false)
    public P2pAgreement validateIsEnable(String agreementType) {
        // TODO Auto-generated method stub
        return p2pAgreementDao.validateIsEnable(agreementType);
    }

    //协议启用
    @Override
    @Transactional(readOnly = false)
    public void qiyong(String id, String agreementType) {
        // TODO Auto-generated method stub
        try {
            P2pAgreement p2pAgreement = p2pAgreementDao.validateIsEnable(agreementType);
            if (p2pAgreement != null) {
                p2pAgreementDao.tingyong(p2pAgreement.getId());
            }
            p2pAgreementDao.qiyong(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    //协议停用
    @Override
    @Transactional(readOnly = false)
    public void tingyong(String id) {
        // TODO Auto-generated method stub
        p2pAgreementDao.tingyong(id);
    }

    //协议展示（根据协议类型查询正在启用的协议）
    @Override
    public P2pAgreement getAgreementEnableByType(String agreementType) {
        // TODO Auto-generated method stub
        return p2pAgreementDao.getAgreementEnableByType(agreementType);
    }

}