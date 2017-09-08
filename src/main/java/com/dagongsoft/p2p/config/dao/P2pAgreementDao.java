package com.dagongsoft.p2p.config.dao;


import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.dagongsoft.p2p.config.entity.P2pAgreement;

/**
 * 协议表DAO接口
 *
 * @author Zeus
 * @version 2016-11-21
 */
@MyBatisDao
public interface P2pAgreementDao extends CrudDao<P2pAgreement> {
    //删除原有记录
    public void deleteAgreement();

    //获取协议内容
    public P2pAgreement getAgreement(P2pAgreement p2pAgreement);

    /**
     * 查找是否有相同类型协议已经启用
     *
     * @param agreementType
     * @return
     * @author Zeus
     */
    public P2pAgreement validateIsEnable(@Param("agreementType") String agreementType);

    //协议启用
    public void qiyong(String id);

    //协议停用
    public void tingyong(String id);

    //协议展示（根据协议类型查询正在启用的协议）
    public P2pAgreement getAgreementEnableByType(String agreementType);
}