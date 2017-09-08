/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.dao;

import java.util.List;

import com.dagongsoft.p2p.user.entity.P2pEnterpriseCertify;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 注册用户绑定企业，需进行企业认证DAO接口
 *
 * @author zhengshuo
 * @version 2016-07-06
 */
@MyBatisDao
public interface P2pEnterpriseCertifyDao extends CrudDao<P2pEnterpriseCertify> {

    //查询企业列表
    public List<P2pEnterpriseCertify> findEnterpriseList(P2pEnterpriseCertify p2pEnterpriseCertify);

    /**
     * 添加企业基本认证信息
     *
     * @param p2pEnterpriseCertify
     */
    public void saveP2pEnterpriseCertify(P2pEnterpriseCertify p2pEnterpriseCertify);

    /**
     * 通过属性单条查询企业基本认证信息（动态SQL）
     *
     * @param p2pEnterpriseCertify
     * @return
     */
    public P2pEnterpriseCertify findP2pEnterpriseCertifyByProperty(P2pEnterpriseCertify p2pEnterpriseCertify);

    /**
     * 通过企业ID修改企业认证状态信息
     *
     * @param p2pEnterpriseCertify
     */
    public void updateP2pEnterpriseCertifyById(P2pEnterpriseCertify p2pEnterpriseCertify);

    /**
     * 企业名称唯一性校验
     *
     * @param p2pEnterpriseCertify
     * @return
     */
    public String getByEnterpriseName(String enterpriseName);

    /**
     * 获取企业基本信息
     *
     * @param userid
     * @return
     * @author Zeus
     */
    public P2pEnterpriseCertify getEnterpriseBaseInfo(String userid);


    /**
     * 融资申请时添加企业其他信息
     *
     * @param p2pEnterpriseCertify
     * @author Quincy
     */
    public void updateEnterpriseOtherInfo(P2pEnterpriseCertify p2pEnterpriseCertify);

    /**
     * 根据用户ID查询用户认证信息详情
     *
     * @param userId
     * @return
     * @author Quincy
     */
    public P2pEnterpriseCertify findUserDetailsByUid(String userId);

    public P2pEnterpriseCertify getByUserId(String userId);

    /**
     * 根据债项id查询企业联系信息
     *
     * @param financingId
     * @return p2pEnterpriseCertify
     * @author Chace
     */
    public P2pEnterpriseCertify getContactByFinancingId(String financingId);

    /**
     * 根据债项id查询企业基本信息
     *
     * @param financingInformationId
     * @return p2pEnterpriseCertify
     * @author zeus
     */
    public P2pEnterpriseCertify getDebtBaseInfoModal(String financingInformationId);

    /**
     * 根据评级id查询企业基本信息
     *
     * @param financingInformationId
     * @return p2pEnterpriseCertify
     * @author zeus
     */
    public P2pEnterpriseCertify getDebtBaseInfoModal2(String financingInformationId);

    /**
     * 查询信用记录列表
     *
     * @author Chace
     */
    public List<P2pEnterpriseCertify> findCreditList(P2pEnterpriseCertify p2pEnterpriseCertify);


    /**
     * 根据用户id查询信用记录详情
     *
     * @author Chace
     */
    public P2pEnterpriseCertify findCreditByUserId(P2pEnterpriseCertify p2pEnterpriseCertify);

    public String findindustryNumByFid(String financingInformationId);
}