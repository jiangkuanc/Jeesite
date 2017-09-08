/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.dagongsoft.p2p.user.dao;

import java.util.List;

import com.dagongsoft.p2p.user.entity.P2pRegUserCertify;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;

/**
 * 注册用户的身份认证状态及材料DAO接口
 *
 * @author zhenghsuo
 * @version 2016-07-06
 */
@MyBatisDao
public interface P2pRegUserCertifyDao extends CrudDao<P2pRegUserCertify> {

    /**
     * 添加用户账号实名认证信息
     *
     * @param p2pRegUserCertifyDao
     */
    public void saveP2pRegUserCertify(P2pRegUserCertify p2pRegUserCertify);

    /**
     * 更改用户账号实名认证信息
     *
     * @param p2pRegUserCertifyDao
     */
    public void updateP2pRegUserCertify(P2pRegUserCertify p2pRegUserCertify);

    /**
     * 通过属性单条查询实名认证基本信息
     *
     * @param p2pRegUserCertify
     * @return
     */
    public P2pRegUserCertify findP2pRegUserCertifyByProperty(P2pRegUserCertify p2pRegUserCertify);

    /**
     * 通过身份证号查询信息
     *
     * @param idNumber
     * @return
     */
    public P2pRegUserCertify getByIdNumber(String idNumber);


    /**
     * 查询实名待认证数量
     *
     * @return
     */
    public Integer getRegUserCertifyNumbers();

    /**
     * 查询实名待认证企业名称和材料提交时间
     *
     * @return
     */
    public List<P2pRegUserCertify> getRegUserCertifyNameAndTime();

    public P2pRegUserCertify getByUserId(String userId);

    /**
     * 根据User_id获取UserCertify信息
     *
     * @param id
     * @return
     */
    public P2pRegUserCertify getCertifyById(String rid);


}