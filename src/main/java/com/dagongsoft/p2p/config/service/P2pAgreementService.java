package com.dagongsoft.p2p.config.service;

import java.util.List;


import com.dagongsoft.p2p.config.entity.P2pAgreement;
import com.thinkgem.jeesite.common.persistence.Page;

/**
 * 协议表Service
 *
 * @author Zeus
 * @version 2016-11-21
 */
public interface P2pAgreementService {

    public P2pAgreement get(String id);

    public List<P2pAgreement> findList(P2pAgreement p2pAgreement);

    public Page<P2pAgreement> findPage(Page<P2pAgreement> page, P2pAgreement p2pAgreement);

    public void save(P2pAgreement p2pAgreement);

    public void delete(P2pAgreement p2pAgreement);


    public void deleteAgreement();

    public P2pAgreement getAgreement(P2pAgreement p2pAgreement);

    /**
     * 验证是否有相同类型协议已经启用
     *
     * @param agreementType
     * @return 1、是  0、否
     * @author Zeus
     */
    public P2pAgreement validateIsEnable(String agreementType);

    //协议启用
    public void qiyong(String id, String agreementType);

    //协议停用
    public void tingyong(String id);

    public P2pAgreement getAgreementEnableByType(String agreementType);

}